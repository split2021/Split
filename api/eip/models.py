from django.db import models
from django.conf import settings
from django.core.exceptions import ValidationError

# Create your models here.

def get_pld_path(instance, filename):
    return f"eip/pld/%Y/%m/%d/2021_PLD_Split_%Y%m{instance.type}.pdf"

class ProjectLogDocument(models.Model):
    """
    """

    PLD_TYPE_CHOICES = [
        ('KO', 'Kick off'),
        ('FU', 'Follow up'),
        ('D', 'Delviery'),
    ]

    type = models.CharField(max_length=2, choices=PLD_TYPE_CHOICES)
    file = models.FileField(upload_to=get_pld_path)
    meeting = models.ForeignKey('Meeting', on_delete=models.SET_NULL, null=True)

    def clean(self):
        if not file.filename.endswith(".pdf"):
            raise ValidationError("The file must be of pdf type")

    def save(self, *args, **kwargs):
        try:
            this = ProjectLogDocument.objects.get(id=self.id)
            if this.file != self.file:
                this.file.delete()
        except:
            pass
        super(MyModelName, self).save(*args, **kwargs)


class Meeting(models.Model):
    """
    """

    name = models.CharField(max_length=50)
    date = models.DateTimeField()
    members = models.ManyToManyField(settings.AUTH_USER_MODEL)
