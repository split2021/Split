from django.contrib import admin

from eip.models import ProjectLogDocument, Meeting

# Register your models here.

@admin.register(ProjectLogDocument)
class ProjectLogDocumentAdmin(admin.ModelAdmin):
    """
    """

@admin.register(Meeting)
class MeetingAdmin(admin.ModelAdmin):
    """
    """
