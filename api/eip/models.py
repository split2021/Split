from django.db import models

# Create your models here.

def get_pld_path(instance, filename):
    return f"eip/pld/%Y/%m/%d/{}"


class ProjectLogDocument(models.Model):
    """
    """

    PLD_TYPE_CHOICES = [
        ('KO', 'Kick off'),
        ('FU', 'Follow up'),
        ('D', 'Delviery'),
    ]

    type = models.CharField(max_length=2, choices=PLD_TYPE_CHOICES)
    file = models.FielField(upload_to=)
