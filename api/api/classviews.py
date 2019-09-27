from django.core.exceptions import ObjectDoesNotExist
from django.utils.decorators import method_decorator
from django.views import View
from django.views.decorators.csrf import csrf_exempt
from django.conf import settings

import json
import base64
import time
import hmac

from api.responses import APIResponse, NotImplemented, ExceptionCaught, NotAllowed, TokenExpired, InvalidToken
from api.models import Log
from api.token import Token, generate_signature

class APIView(View):
    """
     Describes how all API views are implemented by default
    """

    model = None
    authentification = True
    safe_methods = ('head', 'options', 'get')
    implemented_methods = ()

    @csrf_exempt
    def dispatch(self, request, *args, **kwargs):
        """
         Parse incoming request
         Generate a Log record
         Verify authentification token
         Dispatch the request to the appropriate method
        """

        try:

            headers = dict(request.headers)
            Log.objects.create(
                path=request.path,
                method=request.method,
                headers=headers,
                body=request.body,
                get=request.GET,
                post=request.POST
            )

            if not self.authentification:
                return super(APIView, self).dispatch(request, *args, **kwargs)

            if not 'Authorization' in headers:
                return InvalidToken("Missing token")
            header, payload, signature = bytes(headers['Authorization'].split(" ")[-1], 'utf-8').split(b".")

            if signature != generate_signature(header + payload):
                return InvalidToken("Invalid signature")

            decoded_payload = base64.b64decode(payload + b"====")
            json_payload = json.loads(decoded_payload)

            if not 'time' in json_payload:
                return InvalidToken("Invalid payload")
            token_time = json_payload['time']
            now = time.time()

            if now - token_time < 3600:
                return super(APIView, self).dispatch(request, *args, **kwargs)
            else:
                return TokenExpired()

        except Exception as e:
            return ExceptionCaught(e)

    def head(self, request, *args, **kwargs):
        """
         Return header for this endpoint
        """
        return APIResponse(200, "")

    def options(self, request, *args, **kwargs):
        """
         Return possible verbs for this endpoint
        """
        response = APIResponse(204, "Possible options")
        response['Allow'] = ", ".join(self.implemented_methods)
        return response

    def get(self, request, *args, **kwargs):
        """
         Return object(s) information with status code:
         - 200 if id or collection
         - 404 if id and not found
        """
        return NotImplemented()

    def patch(self, request, *args, **kwargs):
        """
         Return updated object with status code:
         - 405 if collection
         - 200 if id and updated
         - 204 if id and no content
         - 404 if id and not found
        """
        return NotImplemented()

    def post(self, request, *args, **kwargs):
        """
         Return created object with status code:
         - 201 if created
         - 404 if id and not found
         - 409 if id and already exist
        """
        return NotImplemented()

    def put(self, request, *args, **kwargs):
        """
         Return created / updated object with status code:
         - 405 if collection
         - 200 if id and created
         - 205 if id and no content
         - 404 if id and not found
        """
        return NotImplemented()

    def delete(self, request, *args, **kwargs):
        """
         Return deleted object with status code:
         - 405 if collection
         - 200 if id and deleted
         - 404 if id and not found
        """
        return NotImplemented()


class SingleObjectAPIView(APIView):
    """
     API view helper class to access single object
    """
    implemented_methods = ('get', 'patch', 'post', 'put', 'delete')

    def get(self, request, *args, **kwargs):
        try:
            object_ = self.model.objects.get(id=kwargs['id'])
            return APIResponse(200, f"{self.model._meta.verbose_name} retrieved successfully", object_.json(request))
        except ObjectDoesNotExist:
            return APIResponse(404, f"{self.model._meta.verbose_name} not found")

    def patch(self, request, *args, **kwargs):
        if request.META['CONTENT_LENGTH'] == "0":
            return APIResponse(204, f"A content is required to update {self.model._meta.verbose_name}")
        data = request.body.decode('utf-8')
        json_data = json.loads(data)
        object_ = self.model.objects.filter(id=kwargs['id'])
        if object_.count():
            object_.update(**json_data)
            return APIResponse(200, f"{self.model._meta.verbose_name} updated successfully", object_.first().json(request))
        else:
            return APIResponse(404, f"{self.model._meta.verbose_name} not found")

    def post(self, request, *args, **kwargs):
        if request.META['CONTENT_LENGTH'] == "0":
            return APIResponse(204, f"A content is required to create {self.model._meta.verbose_name}")
        data = request.body.decode('utf-8')
        json_data = json.loads(data)
        object_, created = self.model.objects.get_or_create(**json_data)
        if created:
            return APIResponse(201, f"{self.model._meta.verbose_name} created successfully", object_.json(request))
        else:
            return APIResponse(409, f"{self.model._meta.verbose_name} already exist", object_.json(request))

    def put(self, request, *args, **kwargs):
        if request.META['CONTENT_LENGTH'] == "0":
            return APIResponse(204, f"A content is required to emplace {self.model._meta.verbose_name}")
        data = request.body.decode('utf-8')
        try:
            json_data = json.loads(data)
            object_ = self.model.objects.get(id=kwargs['id'])
            json_data.pop('id', None)
            for key, value in json_data.items():
                setattr(object_, key, value)
            object_.save()
            return APIResponse(200, f"{self.model._meta.verbose_name} updated successfully", object_.json(request))
        except ObjectDoesNotExist:
            object_ = self.model(**json_data)
            object_.id = kwargs['id']
            object_.save()
            return APIResponse(200, f"{self.model._meta.verbose_name} created successfully", object_.json(request))

    def delete(self, request, *args, **kwargs):
        try:
            object_ = self.model.objects.get(id=kwargs['id'])
            object_.delete()
            return APIResponse(200, f"{self.model._meta.verbose_name} deleted successfully", object_.json(request))
        except ObjectDoesNotExist:
            return APIResponse(404, f"{self.model._meta.verbose_name} not found")


class MultipleObjectsAPIView(APIView):
    """
     API view helper class to access single object
    """
    implemented_methods = ('get', 'post')

    def get(self, request, *args, **kwargs):
        objects = self.model.objects.all()
        return APIResponse(200, f"{self.model._meta.verbose_name_plural} retrieved successfully", [object_.json(request) for object_ in objects])

    def patch(self, request, *args, **kwargs):
        return NotAllowed()

    def post(self, request, *args, **kwargs):
        if request.META['CONTENT_LENGTH'] == "0":
            return APIResponse(204, f"A content is required to create {self.model._meta.verbose_name}")
        data = request.body.decode('utf-8')
        json_data = json.loads(data)
        object_ = self.model.objects.create(**json_data)
        return APIResponse(201, f"{self.model._meta.verbose_name} created successfully", object_.json(request))

    def put(self, request, *args, **kwargs):
        return NotAllowed()

    def delete(self, request, *args, **kwargs):
        return NotAllowed()
