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

    class Media:
        js = ("https://www.gstatic.com/charts/loader.js", "split/modules/js/logs_ratio.js")

split = SplitAdminSite(name="Split")
