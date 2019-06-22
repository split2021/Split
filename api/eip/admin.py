from django.contrib import admin

from api.models import User
from eip.models import ProjectLogDocument, Meeting

# Register your models here.

@admin.register(ProjectLogDocument)
class ProjectLogDocumentAdmin(admin.ModelAdmin):
    """
    """
    list_display = ('type', 'file', 'meeting')

@admin.register(Meeting)
class MeetingAdmin(admin.ModelAdmin):
    """
    """
    filter_horizontal = ('members',)

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == "members":
            kwargs["queryset"] = User.objects.filter(groups__name="EIP")
        return super().formfield_for_manytomany(db_field, request, **kwargs)
