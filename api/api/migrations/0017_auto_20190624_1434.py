# Generated by Django 2.2.2 on 2019-06-24 14:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0016_log'),
    ]

    operations = [
        migrations.AlterField(
            model_name='log',
            name='path',
            field=models.CharField(max_length=100),
        ),
    ]