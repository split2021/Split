from api.classviews import SingleObjectAPIView, MultipleObjectsAPIView
from api.models import User, Group

# Create your views here.

class UserView(SingleObjectAPIView):
    model = User

class UsersView(MultipleObjectsAPIView):
    model = User


class GroupView(SingleObjectAPIView):
    model = Group

class GroupsView(MultipleObjectsAPIView):
    model = Group
