from django.shortcuts import render
from django.conf.urls import url
from django.views import View
from deiyaiplus_app.service import KontakKami

# home
class KontakView(View):
    def get(self, request):
        data_kontak = KontakKami.get_KontakKami()
        data = {
            'dt_kontak': data_kontak,
        }        
        return render(request, 'app/profile/kontak.html', data)
    

    