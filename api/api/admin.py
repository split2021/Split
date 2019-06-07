from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as DjangoUserAdmin

from api.models import User
from api.models import Group
from api.models import Friend
from api.models import Payment_user

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
        ('Personal info', {'fields': ('first_name', 'last_name')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser',
                                       'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2'),
        }),
    )
    list_display = ('email', 'first_name', 'last_name', 'is_staff')
    search_fields = ('email', 'first_name', 'last_name')
    ordering = ('email',)

class PaymentUserAdmin(admin.ModelAdmin):
	model = Payment_user
	list_display = ['payment_name']

class GroupsAdmin(admin.ModelAdmin):
	model = Group
	list_display = ['group_name']

class FriendsAdmin(admin.ModelAdmin):
	model = Friend
	list_display = ['friend_name']

admin.site.register(Group, GroupsAdmin)
admin.site.register(Friend, FriendsAdmin)
admin.site.register(Payment_user, PaymentUserAdmin)
