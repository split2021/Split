from django.urls import include, path

from api.views import UserView, UsersView#, GroupView, GroupsView


urlpatterns = [
    path('user/<int:id>', UserView.as_view()),
    path('user/', UsersView.as_view()),
#    path('group/<int:id>', GroupView.as_view()),
#    path('group/', GroupsView.as_view()),
]
