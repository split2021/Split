from django.urls import include, path

from api.views import UserView, UsersView

urlpatterns = [
    path('user/<int:id>', UserView.as_view()),
    path('user/', UsersView.as_view()),
]
