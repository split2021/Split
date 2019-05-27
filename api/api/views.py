from django.utils.decorators import method_decorator
from django.core.exceptions import ObjectDoesNotExist
from django.views import View
from django.views.decorators.csrf import csrf_exempt
from django.conf import settings

import json

from api.models import User
from api.responses import APIResponse, NotImplemented

# Create your views here.

@method_decorator(csrf_exempt, name='dispatch')
class APIView(View):
    """
     Describes how all API views are implemented by default
    """

    model = None
    safe_methods = ['head', 'options', 'get']
    implemented_methods = []

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
        response = APIResponse(200, f"Possible options")
        response['Allow'] = ", ".join(implemented_methods)
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

    def get(self, request, *args, **kwargs):
        try:
            object_ = self.model.objects.get(id=kwargs['id'])
            return APIResponse(200, f"{self.model.Meta.verbose_name} retrieved successfully", object_.json())
        except ObjectDoesNotExist:
            return APIResponse(404, f"{self.model.Meta.verbose_name} not found")
        except Exception as e:
            return APIResponse(500, str(e))

    def post(self, request, *args, **kwargs):
        data = request.body.decode('utf-8')
        json_data = json.loads(data)
        try:
            object_ = self.model.objects.create(**json_data)
            return APIResponse(201, f"{self.model.Meta.verbose_name} created successfully", object_.json())
        except Exception as e:
            return APIResponse(500, str(e))

    def put(self, request, *args, **kwargs):
        data = request.body.decode('utf-8')
        json_data = json.loads(data)
        try:
            object_ = self.model.objects.get(id=kwargs['id'])
            json_data.pop('id', None)
            for key, value in json_data.items():
                setattr(object_, key, value)
            object_.save()
            return APIResponse(200, f"{self.model.Meta.verbose_name} updated successfully", object_.json())
        except ObjectDoesNotExist:
            object_ = self.model(**json_data)
            object_.id = kwargs['id']
            object_.save()
            return APIResponse(200, f"{self.model.Meta.verbose_name} created successfully", object_.json())

    def delete(self, request, *args, **kwargs):
        try:
            object_ = self.model.objects.get(id=kwargs['id'])
            object_.delete()
            return APIResponse(200, f"{self.model.Meta.verbose_name} deleted successfully", object_.json())
        except ObjectDoesNotExist:
            return APIResponse(404, f"{self.model.Meta.verbose_name} not found")


class MultipleObjectsAPIView(APIView):
    """
     API view helper class to access single object
    """

    def get(self, request, *args, **kwargs):
        try:
            objects = self.model.objects.all()
            return APIResponse(200, f"{self.model.Meta.verbose_name_plural} retrieved successfully", [object_.json() for object_ in objects])
        except Exception as e:
            return APIResponse(500, str(e))

    def post(self, request, *args, **kwargs):
        data = request.body.decode('utf-8')
        json_data = json.loads(data)
        try:
            object_ = self.model.objects.create(**json_data)
            return APIResponse(201, f"{self.model.Meta.verbose_name} created successfully", object_.json())
        except Exception as e:
            return APIResponse(500, str(e))

    def delete(self, request, *args, **kwargs):
        try:
            objects = self.model.objects.all()
            objects.delete()
            return APIResponse(200, f"{self.model.Meta.verbose_name} deleted successfully", [object_.json() for object_ in objects])
        except Exception as e:
            return APIResponse(500, str(e))


class UserView(SingleObjectAPIView):
    model = User


class UsersView(MultipleObjectsAPIView):
    model = User
