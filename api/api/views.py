from django.utils.decorators import method_decorator
from django.shortcuts import render, get_object_or_404, get_list_or_404
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


@method_decorator(csrf_exempt, name='dispatch')
class APIView(View):
    model = None

    def get(self, request, *args, **kwargs):
        try:
            object_ = get_object_or_404(self.model, id=kwargs['id'])
            return JsonResponse({
                'statuscode': 200,
                'reason': f"{object_.Meta.verbose_name} retrieved successfully",
                'data': object_.json()
                })
        except Http404:
            return JsonResponse({
                'statuscode': 404,
                'reason': f"{self.model.Meta.verbose_name} not found",
                'data': {}
                })
        except Exception as e:
            return JsonResponse({
                'statuscode': 500,
                'reason': str(e),
                'data': {}
                })

    def post(self, request, *args, **kwargs):
        data = request.body.decode('utf-8')
        json_data = json.loads(data)
        try:
            object_ = self.model.objects.create(**json_data)
            return JsonResponse({
                'statuscode': 200,
                'reason': f"{object_.Meta.verbose_name} created successfully",
                'data': object_.json()
                })
        except Exception as e:
            return JsonResponse({
                'statuscode': 500,
                'reason': str(e),
                'data': {}
                })

    def put(self, request, *args, **kwargs):
        pass

    def patch(self, request, *args, **kwargs):
        pass

    def delete(self, request, *args, **kwargs):
        pass


class UserView(APIView):
    model = User
