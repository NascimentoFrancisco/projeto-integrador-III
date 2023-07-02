from django.shortcuts import render
from django.views.generic import View
from django.contrib.auth.views import LogoutView
from django.contrib import messages
# Create your views here.


class HomeView(View):

    def get(self, request):
        return render(request, "home.html")

class LogoutUser(LogoutView):
    
    template_name = 'home.html'

    def get_success_url_allowed_hosts(self):
        messages.info(self.request,'Até breve!')
        return super().get_success_url_allowed_hosts()