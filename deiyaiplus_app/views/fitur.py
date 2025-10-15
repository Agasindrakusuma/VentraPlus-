from django.shortcuts import render
from django.conf.urls import url
from django.views import View
from deiyaiplus_app.service import EcerpenService, EbookService, KaryaService, BeritaService
from deiyaiplus_app.service import KategoriPengaduan

# home
class EbookView(View):
    def get(self, request):
        data_ebook = EbookService.get_ebook()
        data_ebook_sejarah = EbookService.get_ebooksejarah(nama_kategori='Sejarah')
        data_ebook_budaya = EbookService.get_ebookbudaya(nama_kategori='Budaya')
        data_ebook_kerohanian = EbookService.get_ebookkerohanian(nama_kategori='Kerohanian')
        data_berita = BeritaService.get_berita(jenis_kategori='berita')
        data_kategori = EbookService.get_ebook_per_kategori()

        data = {
            'dt_ebook' : data_ebook,
            'dt_ebook_sejarah' : data_ebook_sejarah,
            'dt_ebook_budaya' : data_ebook_budaya,
            'dt_ebook_kerohanian' : data_ebook_kerohanian,
            'dt_berita' : data_berita,
            'dt_kategori' : data_kategori,
            
        }
        return render(request, 'app/fitur/ebook.html', data)
    
class EcerpenView(View):
    def get(self, request):
        data_ecerpen = EcerpenService.get_ecerpen()
        data_ecerpenanak = EcerpenService.get_ecerpenanak(nama_kategori='Anak-Anak')
        data_ecerpenmoral = EcerpenService.get_ecerpenmoral(nama_kategori='Moral')
        data_ecerpenbudaya = EcerpenService.get_ecerpenbudaya(nama_kategori='Budaya')
        data_kategori = EcerpenService.get_ecerpen_per_kategori()
        data_berita = BeritaService.get_berita(jenis_kategori='berita')
        
        data = {
            'dt_ecerpen' : data_ecerpen,
            'dt_ecerpenanak' : data_ecerpenanak,
            'dt_ecerpenmoral' : data_ecerpenmoral,
            'dt_ecerpenbudaya' : data_ecerpenbudaya,
            'dt_kategori' : data_kategori,
            'dt_berita' : data_berita,
            
        }
        return render(request, 'app/fitur/ecerpen.html', data)
    
class KaryaView(View):
    def get(self, request):
        karya_popular = KaryaService.get_karya_populer()
        data_kategori = KaryaService.get_karya_per_kategori()

        data_karya = KaryaService.get_karya()
        
        query = request.GET.get("q", "")
        queryset = EbookService.get_ebook()

        if query:
            queryset = queryset.filter(judul__icontains=query)

        data = {
            'dt_karya' : data_karya,
            'dt_karya_populer' : karya_popular,
            'dt_kategori' : data_kategori,
            'query' : query
        }

         
        return render(request, 'app/fitur/karya.html', data)


class KlinikView(View):
    def get(self, request):
        return render(request, 'app/fitur/klinik.html')