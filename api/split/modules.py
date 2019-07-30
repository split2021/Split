from django.utils.translation import ugettext_lazy as _
from django.db.models import Count

from jet.dashboard.modules import DashboardModule, LinkList

from api.models import Log


class Calendar(DashboardModule):
    title = "Split calendar"
    title_url = "https://calendar.google.com/calendar/embed?src=0q3rugurp4nqr8s2e2tlsqu9jc%40group.calendar.google.com&ctz=Europe%2FBrussels"
    template = 'split/modules/calendar.html'


class Documentation(LinkList):
    title = "Documentation"

    def init_with_context(self, context):
        self.children = [
            {
                'title': _("Django"),
                'url': "https://docs.djangoproject.com/en/dev/",
                'external': True,
            },
            {
                'title': _("Bulma"),
                'url': "https://bulma.io/documentation/",
                'external': True,
            },
            {
                'title': _("API"),
                'url': "https://split2021.postman.co/collections/6975668-bede7db7-aa15-4f0a-afd2-ff562c6a2e86?version=latest&workspace=4a5d98f4-d78c-46c2-8285-56f173abf468",
                'external': True,
            },
        ]


class RequestsMethods(DashboardModule):
    title = "Requests methods"
    template = 'split/modules/requests_methods.html'
    context = { Log.objects.all() }

    def __init__(self, *args, **kwargs):
        return super().__init__(*args, **kwargs)

    def init_with_context(self, context):
        methods = [['Methods', 'Count']]
        for method in Log.METHODS:
            methods.append([method, Log.objects.filter(method=method).count()])
        context['methods'] = methods

class RequestsEndpoints(DashboardModule):
    title = "Requests endpoints"
    template = 'split/modules/requests_endpoints.html'
    context = { Log.objects.all() }

    def init_with_context(self, context):
        endpoints = [['Endpoints', 'Count']]
        for log in Log.objects.values('path').annotate(Count('path')):
            if (log['path'].endswith('/')):
                endpoints.append([log['path'], log['path__count']])
            else:
                endpoints.append([f"{log['path'][:log['path'].rindex('/') + 1]}{{id}}", log['path__count']])
        context['endpoints'] = endpoints
