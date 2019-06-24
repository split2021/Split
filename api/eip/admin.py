from django.contrib import admin
from django.utils.translation import gettext_lazy as _

from datetime import datetime

from api.models import User
from eip.models import ProjectLogDocument, Meeting

# Register your models here.

@admin.register(ProjectLogDocument)
class ProjectLogDocumentAdmin(admin.ModelAdmin):
    """
    """
    list_display = ('type', 'file', 'meeting')
    list_filter = ('type',)


class IsMeetingEndedListFilter(admin.SimpleListFilter):
    # Human-readable title which will be displayed in the
    # right admin sidebar just above the filter options.
    title = _('time')

    # Parameter for the filter that will be used in the URL query.
    parameter_name = 'ispasttime'

    def lookups(self, request, model_admin):
        """
        Returns a list of tuples. The first element in each
        tuple is the coded value for the option that will
        appear in the URL query. The second element is the
        human-readable name for the option that will appear
        in the right sidebar.
        """
        return (
            ("futur", _("To come")),
            ("past", _("Ended")),
        )

    def queryset(self, request, queryset):
        """
        Returns the filtered queryset based on the value
        provided in the query string and retrievable via
        `self.value()`.
        """
        now = datetime.now()
        if self.value() == "futur":
            return queryset.filter(date__gte=now)
        elif self.value() == "past":
            return queryset.filter(date__lte=now)

@admin.register(Meeting)
class MeetingAdmin(admin.ModelAdmin):
    """
    """
    list_display = ('name', 'date')
    filter_horizontal = ('members',)
    search_fields = ('name', 'date')
    list_filter = ('date', IsMeetingEndedListFilter)

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == "members":
            kwargs["queryset"] = User.objects.filter(groups__name="EIP")
        return super().formfield_for_manytomany(db_field, request, **kwargs)
