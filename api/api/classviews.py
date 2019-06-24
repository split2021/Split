from django.core.exceptions import ObjectDoesNotExist
from django.utils.decorators import method_decorator
from django.views import View
from django.views.decorators.csrf import csrf_exempt

import json

from api.responses import APIResponse, NotImplemented, ExceptionCaught, NotAllowed
from api.models import Log


class APIView(View):
    """
     Describes how all API views are implemented by default
    """

    model = None
    safe_methods = ('head', 'options', 'get')
    implemented_methods = ()

    @csrf_exempt
    def dispatch(self, request, *args, **kwargs):
        Log.objects.create(
            path=request.path,
            method=request.method,
            headers=request.headers,
            body=request.body,
            cookies=request.COOKIES
        )
        return super(GenerateReportView, self).dispatch(*args, **kwargs)

    def head(self, request, *args, **kwargs):
        """
         Return header for this endpoint
        """
        response = self.get(request, *args, **kwargs)
        response.content = ""
        return response

    def options(self, request, *args, **kwargs):
        """
         Return possible verbs for this endpoint
        """
        response = APIResponse(204, f"Possible options")
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
    implemented_methods = ('get', 'post', 'put', 'delete')

    def get(self, request, *args, **kwargs):
        try:
            object_ = self.model.objects.get(id=kwargs['id'])
            return APIResponse(200, f"{self.model._meta.verbose_name} retrieved successfully", object_.json(request))
        except ObjectDoesNotExist:
            return APIResponse(404, f"{self.model._meta.verbose_name} not found")
        except Exception as e:
            return ExceptionCaught(e)

    def patch(self, request, *args, **kwargs):
        if not request.META['CONTENT_LENGTH']:
            return APIResponse(204, f"A content is required to update {self.model._meta.verbose_name}")
        data = request.body.decode('utf-8')
        try:
            json_data = json.loads(data)
            object_ = self.model.objects.filter(id=kwargs['id'])
            if object_.count():
                object_.update(**json_data)
                return APIResponse(200, f"{self.model._meta.verbose_name} updated successfully", object_.first().json(request))
            else:
                return APIResponse(404, f"{self.model._meta.verbose_name} not found")
        except Exception as e:
            return ExceptionCaught(e)

    def post(self, request, *args, **kwargs):
        if not request.META['CONTENT_LENGTH']:
            return APIResponse(204, f"A content is required to create {self.model._meta.verbose_name}")
        data = request.body.decode('utf-8')
        try:
            json_data = json.loads(data)
            object_, created = self.model.objects.get_or_create(**json_data)
            if created:
                return APIResponse(201, f"{self.model._meta.verbose_name} created successfully", object_.json(request))
            else:
                return APIResponse(409, f"{self.model._meta.verbose_name} already exist", object_.json(request))
        except Exception as e:
            return ExceptionCaught(e)

    def put(self, request, *args, **kwargs):
        if not request.META['CONTENT_LENGTH']:
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
        except Exception as e:
            return ExceptionCaught(e)

    def delete(self, request, *args, **kwargs):
        try:
            object_ = self.model.objects.get(id=kwargs['id'])
            object_.delete()
            return APIResponse(200, f"{self.model._meta.verbose_name} deleted successfully", object_.json(request))
        except ObjectDoesNotExist:
            return APIResponse(404, f"{self.model._meta.verbose_name} not found")
        except Exception as e:
            return ExceptionCaught(e)


class MultipleObjectsAPIView(APIView):
    """
     API view helper class to access single object
    """
    implemented_methods = ('get', 'post', 'delete')

    def get(self, request, *args, **kwargs):
        try:
            objects = self.model.objects.all()
            return APIResponse(200, f"{self.model._meta.verbose_name_plural} retrieved successfully", [object_.json(request) for object_ in objects])
        except Exception as e:
            return ExceptionCaught(e)

    def patch(self, request, *args, **kwargs):
        return NotAllowed()

    def post(self, request, *args, **kwargs):
        if not request.META['CONTENT_LENGTH']:
            return APIResponse(204, f"A content is required to create {self.model._meta.verbose_name}")
        data = request.body.decode('utf-8')
        try:
            json_data = json.loads(data)
            object_ = self.model.objects.create(**json_data)
            return APIResponse(201, f"{self.model._meta.verbose_name} created successfully", object_.json(request))
        except Exception as e:
            return ExceptionCaught(e)

    def put(self, request, *args, **kwargs):
        return NotAllowed()

    def delete(self, request, *args, **kwargs):
        return NotAllowed()
