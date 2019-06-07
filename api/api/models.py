from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.db import models

# Create your models here.

class JsonizableMixin(object):
    json_fields = []

    def json(self):
        dump = {}
        for field in self.json_fields:
            value = getattr(self, field)
            dump[field] = value
        dump['url'] = f"http://api/{self.Meta.verbose_name_plural.lower()}/{self.id}"
        return dump


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
    payment = models.ForeignKey('Payment_user', on_delete=models.CASCADE, null=True)
    friend = models.ForeignKey('Friend', on_delete=models.CASCADE, null=True)
    group = models.ForeignKey('Group', on_delete=models.CASCADE, null=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['password']

    json_fields = ['email', 'last_name', 'first_name', 'phone', 'username']

    objects = UserManager()

class Payment_user(models.Model):

	name = models.CharField(max_length=40)

class Friend(models.Model):

	name = models.CharField(max_length=40)
	payment_friend = models.ForeignKey('Friend', on_delete=models.CASCADE, null=True)

class Group(models.Model):

	name = models.CharField(max_length=40)
	friend_group = models.ForeignKey('Friend', on_delete=models.CASCADE, null=True)
