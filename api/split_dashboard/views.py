from django.views import View
from django.shortcuts import render, redirect

from split_dashboard.forms import UserUpdateForm


class ProfileView(View):
    """
    """

    template_name = "dashboard/user_update_profile.html"

    def get(self, request, *args, **kwargs):
        """
        """
        form = UserUpdateForm(instance=request.user)
        return render(request, self.template_name, {'form': form})

    def post(self, request, *args, **kwargs):
        """
        """
        form = UserUpdateForm(data=request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            return redirect('admin:index')
        return render(request, self.template_name, {'form': form})
