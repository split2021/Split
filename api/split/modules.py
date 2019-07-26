from jet.dashboard.modules import DashboardModule


class Calendar(DashboardModule):
    title = 'Split calendar'
    title_url = "https://calendar.google.com/calendar/embed?src=0q3rugurp4nqr8s2e2tlsqu9jc%40group.calendar.google.com&ctz=Europe%2FBrussels"
    template = 'split/modules/calendar.html'
    limit = 1
