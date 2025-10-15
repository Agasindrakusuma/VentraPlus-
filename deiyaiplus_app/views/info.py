from django.shortcuts import render
from django.conf.urls import url
from django.shortcuts import get_object_or_404
from django.core.paginator import Paginator
from deiyaiplus_admin.models import berita
from django.views import View
from deiyaiplus_app.service import BeritaService

# info
class BeritaView(View):
    def get(self, request):
        data_berita = BeritaService.get_berita(jenis_kategori='berita')
        paginator = Paginator(data_berita, 2)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
        
        data = {
            'dt_berita': data_berita,
            'page_obj': page_obj,
        }
        return render(request, 'app/info/berita.html', data)

    
class BeritaDetailsView(View):
    def get(self, request, slug):
        dt_berita = BeritaService.get_beritadetails(jenis_kategori='berita')
        table = get_object_or_404(berita, slug=slug)
        
        data = {
            'data_berita_details': table,
            'dt_berita': dt_berita,
        }
        return render(request, 'app/info/beritadetails.html', data)
    
class InfografisView(View):
    def get(self, request):
        data_infografis = BeritaService.get_infografis(jenis_kategori='infografis')
        
        data = {
            'dt_infografis': data_infografis,
        }
        return render(request, 'app/info/infografis.html', data)
