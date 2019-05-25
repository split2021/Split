from django.urls import include, path

from api.views import Index, UserView

urlpatterns = [
    path('', Index.as_view()),
    path('user/<int:id>', UserView.as_view()),
]
