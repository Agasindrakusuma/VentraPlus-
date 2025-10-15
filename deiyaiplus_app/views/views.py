from django.shortcuts import render
from django.conf.urls import url
from django.views import View
from deiyaiplus_app.service import SliderService, ProfileService, PatnerService, BeritaService
# home
class IndexView(View):
    def get(self, request):
        data_profile = ProfileService.get_profile()
        data_slider = SliderService.get_slider_all()
        data_patner = PatnerService.get_patner()
        data_berita = BeritaService.get_berita(jenis_kategori='berita')
        data_infografis = BeritaService.get_infografis(jenis_kategori='infografis')
        data_fitur = BeritaService.get_fitur(jenis_kategori='fitur')
        
        data = {
            'dt_profile': data_profile,
            'dt_slider': data_slider,
            'dt_patner': data_patner,
            'dt_berita': data_berita,
            'dt_infografis': data_infografis,
            'dt_fitur': data_fitur,
        }
        return render(request, 'app/home/home.html', data)