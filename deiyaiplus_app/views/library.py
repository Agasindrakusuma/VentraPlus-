from django.shortcuts import render
from django.conf.urls import url
from django.views import View
from deiyaiplus_app.service import SliderService, BeritaService, EbookService, EcerpenService, KaryaService

# Library
class LibraryView(View):
    def get(self, request):
        data_slider = SliderService.get_slider_all()
        data_ebook = EbookService.get_ebook()
        data_ecerpen = EcerpenService.get_ecerpen()
        data_karya = KaryaService.get_karya()
        data_berita = BeritaService.get_berita(jenis_kategori='berita')
        
        data = {
            'dt_slider': data_slider,
            'dt_ebook' : data_ebook,
            'dt_berita' : data_berita,
            'dt_ecerpen' : data_ecerpen, 
            'dt_karya' : data_karya,  
        }
        
        return render(request, 'app/library/library.html', data)