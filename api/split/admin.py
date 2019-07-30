from django.contrib import admin
from django.urls import path

from split.views import ProfileView


class SplitAdminSite(admin.AdminSite):
    """
    """
    site_header = "Split administration"
    site_title = "Split site admin"
    site_url = "https://split-pay.fr"

    def get_urls(self):
        urls = super(SplitAdminSite, self).get_urls()
        return urls + [
            path('profile/', self.admin_view(ProfileView.as_view()), name="profile"),
        ]

split = SplitAdminSite(name="Split")
