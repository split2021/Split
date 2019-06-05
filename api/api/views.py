from api.models import User, Group
from api.responses import APIResponse, NotImplemented, ExceptionCaught, NotAllowed

# Create your views here.

class UserView(SingleObjectAPIView):
    model = User

class UsersView(MultipleObjectsAPIView):
    model = User


class GroupView(SingleObjectAPIView):
    model = Group

class GroupsView(MultipleObjectsAPIView):
    model = Group
