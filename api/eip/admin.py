from django.contrib import admin

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
