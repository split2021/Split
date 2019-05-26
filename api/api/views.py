from django.utils.decorators import method_decorator
from django.core.exceptions import ObjectDoesNotExist
from django.views import View
from django.views.decorators.csrf import csrf_exempt
from django.conf import settings
from django.http import JsonResponse, Http404

import json

from api.models import User

# Create your views here.

class Index(View):
    model = settings.AUTH_USER_MODEL

    def get(self, request, *args, **kwargs):
        return JsonResponse({
            'statuscode': 200,
            'reason': "Reason",
            'data': {}
        })


class CORSResponse(JsonResponse):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self['Access-Control-Allow-Origin'] = '*'


class APIResponse(CORSResponse):

    def __init__(self, code, reason, data={}, *args, **kwargs):
        super().__init__({
            'statuscode': code,
            'reason': reason,
            'data': data
        }, *args, **kwargs)


@method_decorator(csrf_exempt, name='dispatch')
class APISingleView(View):
    model = None

    def get(self, request, *args, **kwargs):
        try:
            object_ = self.model.objects.get(id=kwargs['id'])
            return APIResponse(200, f"{self.model.Meta.verbose_name} retrieved successfully", object_.json())
        except ObjectDoesNotExist:
            return APIResponse(404, f"{self.model.Meta.verbose_name} not found")
        except Exception as e:
            return JsonResponse(500, str(e))

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

    def patch(self, request, *args, **kwargs):
        pass

    def delete(self, request, *args, **kwargs):
        try:
            object_ = self.model.objects.get(id=kwargs['id'])
            object_.delete()
            return APIResponse(200, f"{self.model.Meta.verbose_name} deleted successfully", object_.json())
        except ObjectDoesNotExist:
            return APIResponse(404, f"{self.model.Meta.verbose_name} not found")


@method_decorator(csrf_exempt, name='dispatch')
class APIMultipleView(View):
    model = None

    def get(self, request, *args, **kwargs):
        try:
            objects = self.model.objects.all()
            return APIResponse(200, f"{self.model.Meta.verbose_name_plural} retrieved successfully", [object_.json() for object_ in objects])
        except Exception as e:
            return JsonResponse(500, str(e))

    def post(self, request, *args, **kwargs):
        data = request.body.decode('utf-8')
        json_data = json.loads(data)
        try:
            object_ = self.model.objects.create(**json_data)
            return APIResponse(201, f"{self.model.Meta.verbose_name} created successfully", object_.json())
        except Exception as e:
            return APIResponse(500, str(e))

    def put(self, request, *args, **kwargs):
        pass

    def patch(self, request, *args, **kwargs):
        pass

    def delete(self, request, *args, **kwargs):
        try:
            objects = self.model.objects.all()
            objects.delete()
            return APIResponse(200, f"{self.model.Meta.verbose_name} deleted successfully", [object_.json() for object_ in objects])
        except Exception as e:
            return APIResponse(500, str(e))


class UserView(APISingleView):
    model = User


class UsersView(APIMultipleView):
    model = User
