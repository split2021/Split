from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.db import models
from django.contrib.postgres import fields as postgres

import json

# Create your models here.

class JsonizableMixin(object):
    json_fields = []

    def json(self, request=None):
        dump = {'id': self.id}
        for fieldname in self.json_fields:
            field = getattr(self, fieldname)
            if issubclass(field.__class__, models.manager.BaseManager):
                value = [{'id': related.id, 'url': related.url(request)} for related in field.all()]
            elif callable(field):
                value = field()
            else:
                value = field
            dump[fieldname] = value
        if request is not None:
            dump['url'] = self.url(request)
        return dump

    def url(self, request):
        if request is not None:
            return f"http://{request.get_host()}/api/{self._meta.verbose_name_plural}/{self.id}"
        else:
            return f"/api/{self._meta.verbose_name_plural}/{self.id}"

class UserManager(BaseUserManager):
    """
    Define a model manager for User model with no username field
    """

    use_in_migrations = True

    def _create_user(self, email, password, **extra_fields):
        """
        Create and save a User with the given email and password
        """
        if not email:
            raise ValueError('The given email must be set')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email, password, **extra_fields):
        """
        Create and save a regular User with the given email and password
        """
        extra_fields.setdefault('is_staff', False)
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(email, password, **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        """
        Create and save a SuperUser with the given email and password
        """
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')

        return self._create_user(email, password, **extra_fields)


class User(AbstractUser, JsonizableMixin):
    """
    User model
    """

    email = models.EmailField('email address', unique=True)
    phone = models.CharField(max_length=20, unique=True)
    username = models.CharField(max_length=20, blank=True)
    friends = models.ManyToManyField("self", blank=True, related_name="users")
    payment_methods = models.ManyToManyField("PaymentMethod", blank=True, related_name="users")

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['password']

    json_fields = ['email', 'last_name', 'first_name', 'phone', 'username', 'friends', 'payment_methods', 'groups']

    objects = UserManager()


class PaymentMethod(models.Model):
    """
    A generic class which is derived in specific payment methods
    """

    name = models.CharField(max_length=42)

    json_fields = ['name', 'users']

    class Meta:
        pass


class Group(models.Model, JsonizableMixin):
    """
    Store a list of users than can make payments together
    """

    name = models.CharField(max_length=42)
    users = models.ManyToManyField("User", blank=True, related_name="groups")

    json_fields = ['name', 'users']

    class Meta:
        pass


class LogManager(models.Manager):
    """
    """
    def create(self, **kwargs):
        if kwargs['post']:
            if 'password' in kwargs['post']:
                kwargs['post']['password'] = "**********"
        if 'Content-Type' in kwargs['headers'] and kwargs['headers']['Content-Type'] == "application/json":
            try:
                json_body = json.loads(kwargs['body'].decode())
            except:
                pass
            else:
                if 'password' in json_body:
                    json_body['password'] = "**********"
                kwargs['body'] = json.dumps(json_body)
        return super().create(**kwargs)

class Log(models.Model):
    """
    Store requests made against the API for easier debugging
    """
    METHODS = ('HEAD', 'OPTIONS', 'GET', 'PATCH', 'POST', 'PUT', 'DELETE')

    date = models.DateTimeField(auto_now_add=True)
    path = models.CharField(max_length=100)
    method = models.CharField(max_length=10)
    headers = postgres.JSONField()
    body = models.TextField(default="")
    get = postgres.JSONField()
    post = postgres.JSONField()

    objects = LogManager()
