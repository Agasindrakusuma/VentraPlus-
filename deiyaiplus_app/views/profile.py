from django.shortcuts import render
from django.conf.urls import url
from django.views import View
from deiyaiplus_app.service import ProfileService, PatnerService

# profile
class SejarahView(View):
    def get(self, request):
        data_profile = ProfileService.get_sejarah()

        data = {
            'dt_profile': data_profile,
        }
        
        return render(request, 'app/profile/sejarah.html', data)

class VisimisiView(View):
    def get(self, request):
        visi = ProfileService.get_visi()
        misi = ProfileService.get_misi()
        data = {
            'dt_visi': visi,
            'dt_misi': misi,
        }
        return render(request, 'app/profile/visimisi.html', data)
    
class ProfilePetjabaView(View):
    def get(self, request):
        data_pejabat = ProfileService.get_pejabat()
        data_patner = PatnerService.get_patner()
        data = {
            'dt_pejabat': data_pejabat,
            'dt_patner': data_patner,
        }
        return render(request, 'app/profile/profile_pejabat.html', data)