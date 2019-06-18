# Generated by Django 2.2.1 on 2019-06-13 12:59

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0009_payment_user'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='friends',
            field=models.ManyToManyField(related_name='_user_friends_+', to=settings.AUTH_USER_MODEL),
        ),
    ]
