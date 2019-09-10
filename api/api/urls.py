from django.urls import include, path

from api.views import LoginView, UserView, UsersView, GroupView, GroupsView


urlpatterns = [
    path('login', LoginView.as_view()),
    path('users/<int:id>', UserView.as_view()),
    path('users/', UsersView.as_view()),
    path('groups/<int:id>', GroupView.as_view()),
    path('groups/', GroupsView.as_view()),
]
