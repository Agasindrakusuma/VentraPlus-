from django.shortcuts import render
from django.conf.urls import url
from django.views import View
from deiyaiplus_app.service import EbookService
from deiyaiplus_admin.models import ebook
from django.shortcuts import get_object_or_404

# ebook details
class AllbookView(View):
    def get(self, request):
        query = request.GET.get("q", "")
        queryset = EbookService.get_ebook()

        if query:
            queryset = queryset.filter(judul__icontains=query)


        data = {
            'dt_ebook' : queryset,
            'query' : query,
        }
        return render(request, 'app/ebook_details/allbook.html', data)
    
class BookDetailsView(View):
    def get(self, request,slug):
        data_ebook = EbookService.get_ebook()
        table = get_object_or_404(ebook, slug=slug)

        data = {
            'dt_ebook' : data_ebook,
            'details_ebook' : table,
        }
        
        return render(request, 'app/ebook_details/details.html', data)