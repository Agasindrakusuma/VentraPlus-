from django.shortcuts import render, get_object_or_404
from django.views import View
from deiyaiplus_app.service import KaryaService
from deiyaiplus_admin.models import karya, konten_karya

class KaryaDetailsView(View):
    def get(self, request, slug):
        data_karya = KaryaService.get_karya()
        table = get_object_or_404(karya, slug=slug)
        
        
        konten = konten_karya.objects.filter(karya_id=table, file__iendswith='.pdf').first()
        video = konten_karya.objects.filter(karya_id=table, file__iendswith='.mp4').first()
        
        gallery = [file for file in table.gallery_files if not file.file.name.lower().endswith('.mp4')]

        data = {
            'dt_karya': data_karya,
            'details_karya': table,
            'konten': konten,
            'videos': video,
            'gallery': gallery,
        }

        return render(request, 'app/karya_details/details.html', data)
