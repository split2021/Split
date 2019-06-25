from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.db import models
from django.contrib.postgres import fields as postgres

# Create your models here.

class JsonizableMixin(object):
    json_fields = []

    def json(self, request=None):
        dump = {'id': self.id}
        for fieldname in self.json_fields:
            field = getattr(self, fieldname)
            if issubclass(field.__class__, models.manager.BaseManager):
                value = [{'id': related.id, 'url': related.url(request)} for related in field.all()]
            else:
                value = field
            dump[fieldname] = value
        if request is not None:
            dump['url'] = self.url(request)
        return dump

    def url(self, request):
        return f"http://{request.get_host()}/api/{self._meta.verbose_name_plural}/{self.id}"

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
    friends = models.ManyToManyField("self")
    payment_methods = models.ManyToManyField("PaymentMethod")

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['password']

    json_fields = ['email', 'last_name', 'first_name', 'phone', 'username', 'friends', 'payment_methods', 'group_set']

    objects = UserManager()


class PaymentMethod(models.Model):
    """
    A generic class which is derived in specific payment methods
    """

    name = models.CharField(max_length=42)
    mastercard = models.CharField(max_length=40)
    expirancy = models.CharField(max_length=10, default='None')
    cvc = models.CharField(max_length=4, default='None')

    json_fields = ['name', 'user_set']

    class Meta:
        pass


class Group(models.Model, JsonizableMixin):
    """
    Store a list of users than can make payments together
    """

    name = models.CharField(max_length=42)
    users = models.ManyToManyField("User", blank=True)

    json_fields = ['name', 'users']

    class Meta:
        pass


class LogManager(models.Manager):
    """
    """
    def create(self, **kwargs):
        post = kwargs['post']
        kwargs['post'] = {x: post[key] for key in post.keys() if key != "password"}
        return super().create(**kwargs)

class Log(models.Model):
    """
    Store requests made against the API for easier debugging
    """

    date = models.DateTimeField(auto_now_add=True)
    path = models.CharField(max_length=100)
    method = models.CharField(max_length=10)
    headers = postgres.JSONField()
    body = models.TextField(default="")
    get = postgres.JSONField()
    post = postgres.JSONField()

    objects = LogManager()
