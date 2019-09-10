from django.views import View
from django.contrib.auth import authenticate
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator

import time
import json

from api.classviews import SingleObjectAPIView, MultipleObjectsAPIView, APIView
from api.models import User, Group
from api.responses import APIResponse
from api.token import Token

# Create your views here.

@method_decorator(csrf_exempt, name='dispatch')
class LoginView(View):

    def post(self, request, *args, **kwargs):
        """
        """
        data = request.body.decode('utf-8')
        json_data = json.loads(data)
        user = authenticate(username=json_data['email'], password=json_data['password'])
        if user is not None:
            return APIResponse(200, "User logged in", {'token': str(Token({'time': int(time.time())}))})
        else:
            return APIResponse(401, "Wrong user credentials")

class UserView(SingleObjectAPIView):
    model = User

class UsersView(MultipleObjectsAPIView):
    model = User


class GroupView(SingleObjectAPIView):
    model = Group

class GroupsView(MultipleObjectsAPIView):
    model = Group
