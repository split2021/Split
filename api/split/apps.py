from django.contrib.admin.apps import AdminConfig


class SplitAdminConfig(AdminConfig):
    default_site = 'split.admin.SplitAdminSite'
