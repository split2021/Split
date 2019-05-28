from django.db import models
from django.conf import settings
from django.core.exceptions import ValidationError

# Create your models here.

def get_pld_path(instance, filename):
        return f"eip/pld/%Y/%m/%d/{filename}"

class ProjectLogDocument(models.Model):
    """
    """

    PLD_TYPE_CHOICES = [
        ('KO', 'Kick off'),
        ('FU', 'Follow up'),
        ('D', 'Delviery'),
    ]

    type = models.CharField(max_length=2, choices=PLD_TYPE_CHOICES)
    file = models.FielField(upload_to=get_pld_path)
    meeting = models.ForeignKey('Meeting', on_delete=models.SET_NULL, null=True)

    def clean(self):
        if not file.filename.endswith(".pdf"):
            raise ValidationError("The file must be of pdf type")


class Meeting(models.Model):
    """
    """

    name = models.CharField(max_length=50)
    date = models.DateTimeField()
    members = models.ManyToManyField(settings.AUTH_USER_MODEL)
