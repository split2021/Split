from django.utils.translation import ugettext_lazy as _

from jet.dashboard import modules
from jet.dashboard.dashboard import Dashboard, AppIndexDashboard

from split.modules import Calendar, Documentation, RequestsMethods, RequestsEndpoints


class SplitIndexDashboard(Dashboard):
    columns = 3

    def init_with_context(self, context):
        self.available_children.append(modules.LinkList)
        self.children.append(modules.LinkList(
            _('Links'),
            children=[
                {
                    'title': _('SVN'),
                    'url': 'https://labeip.epitech.eu/svn/2021/split/',
                    'external': True,
                }
            ],
            column=0,
            order=0
        ))

        self.available_children.append(Calendar)
        self.available_children.append(Documentation)
        self.available_children.append(RequestsEndpoints)
        self.available_children.append(RequestsMethods)
