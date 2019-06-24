from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as DjangoUserAdmin
from django.utils.translation import gettext_lazy as _
from django.utils.safestring import mark_safe

from pygments import highlight
from pygments.lexers import JsonLexer
from pygments.formatters import HtmlFormatter

import json

from api.models import User, Group, PaymentMethod, Log

# Register your models here.

admin.site.site_header = "Split administration"
admin.site.site_title = "Split site admin"

@admin.register(User)
class UserAdmin(DjangoUserAdmin):
    """
    Define admin model for custom User model with no email field.
    """

    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Personal info', {'fields': ('first_name', 'last_name', 'friends', 'payment_methods')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser',
                                       'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2', 'phone', 'username', 'first_name', 'last_name'),
        }),
    )
    list_display = ('email', 'first_name', 'last_name', 'is_staff')
    search_fields = ('email', 'first_name', 'last_name')
    ordering = ('email',)


@admin.register(PaymentMethod)
class PaymentMethodAdmin(admin.ModelAdmin):
    """
    """
    list_display = ('mastercard',)


class IsGroupEmptyListFilter(admin.SimpleListFilter):
    # Human-readable title which will be displayed in the
    # right admin sidebar just above the filter options.
    title = _('empty')

    # Parameter for the filter that will be used in the URL query.
    parameter_name = 'isempty'

    def lookups(self, request, model_admin):
        """
        Returns a list of tuples. The first element in each
        tuple is the coded value for the option that will
        appear in the URL query. The second element is the
        human-readable name for the option that will appear
        in the right sidebar.
        """
        return (
            ("True", _("True")),
            ("False", _("False")),
        )

    def queryset(self, request, queryset):
        """
        Returns the filtered queryset based on the value
        provided in the query string and retrievable via
        `self.value()`.
        """
        if self.value() == "True":
            return queryset.filter(users=None)
        elif self.value() == "False":
            return queryset.all().exclude(users=None)

@admin.register(Group)
class GroupAdmin(admin.ModelAdmin):
    """
    """
    list_display = ('name', 'users_count')
    filter_horizontal = ('users',)
    list_filter = (IsGroupEmptyListFilter,)
    search_fields = ('name',)

    def users_count(self, instance):
        return instance.users.count()


def beautifyJSON(json_dump):
    # Truncate the data. Alter as needed
    json_dump = json_dump[:5000]

    # Get the Pygments formatter
    formatter = HtmlFormatter(style='colorful')

    # Highlight the data
    response = highlight(json_dump, JsonLexer(), formatter)

    # Get the stylesheet
    style = "<style>" + formatter.get_style_defs() + "</style><br>"

    # Safe the output
    return mark_safe(style + response)

@admin.register(Log)
class LogAdmin(admin.ModelAdmin):
    """
    """
    readonly_fields = ('path', 'method', 'body', '_headers', '_get', '_post', '_data_prettified')
    exclude = ('headers', 'get', 'post')

    def _headers(self, instance):
        dump = json.dumps(instance.headers, sort_keys=True, indent=2)
        return beautifyJSON(dump)

    def _get(self, instance):
        return beautifyJSON(instance.get)

    def _post(self, instance):
        return beautifyJSON(instance.post)

    def _data_prettified(self, instance):
        """Function to display pretty version of our data"""

        # Convert the data to sorted, indented JSON
        response = json.dumps(instance.headers, sort_keys=True, indent=2)

        # Truncate the data. Alter as needed
        response = response[:5000]

        # Get the Pygments formatter
        formatter = HtmlFormatter(style='colorful')

        # Highlight the data
        response = highlight(response, JsonLexer(), formatter)

        # Get the stylesheet
        style = "<style>" + formatter.get_style_defs() + "</style><br>"

        # Safe the output
        response =  mark_safe(style + response)
        print(response)
        return response
