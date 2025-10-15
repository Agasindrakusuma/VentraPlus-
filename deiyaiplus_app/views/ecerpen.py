from django.shortcuts import render
from django.conf.urls import url
from django.views import View
from deiyaiplus_app.service import EcerpenService
from deiyaiplus_admin.models import ecerpen
from django.shortcuts import get_object_or_404

# ebook details
class AllCerpenView(View):
    def get(self, request):
        query = request.GET.get("q", "")
        queryset = EcerpenService.get_ecerpen()

        if query:
            queryset = queryset.filter(judul__icontains=query)

        data = {
            'dt_ecerpen': queryset,
            'query': query,
        }
        return render(request, 'app/ecerpen_details/allcerpen.html', data)
    
class CerpenDetailsView(View):
    def get(self, request, slug):
        data_ecerpen = EcerpenService.get_ecerpen()
        table = get_object_or_404(ecerpen, slug=slug)
        
        data = {
            'dt_ecerpen' : data_ecerpen,
            'details_ecerpen' : table,
        }
        return render(request, 'app/ecerpen_details/details.html', data)