from django.shortcuts import render, redirect
from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator

from django.views import View
from django.db.models import Count
from django.utils import timezone
from datetime import timedelta
from django.db.models.functions import TruncDay
from deiyaiplus_admin.models import ebook, ecerpen, karya


@method_decorator(login_required(), name='dispatch')
class admin_dashboard(View):
    def get(self, request):
        # Data untuk card statistik
        total_ebook = ebook.objects.filter(archived_at__isnull=True).count()
        total_ecerpen = ecerpen.objects.filter(archived_at__isnull=True).count()
        total_karya = karya.objects.filter(archived_at__isnull=True).count()
        
        # Data untuk chart (30 hari terakhir)
        end_date = timezone.now()
        start_date = end_date - timedelta(days=7)
        
        # Data ebook per hari
        ebooks_data = (
            ebook.objects
            .filter(created_at__range=(start_date, end_date), archived_at__isnull=True)
            .annotate(day=TruncDay('created_at'))
            .values('day')
            .annotate(count=Count('ebook_id'))
            .order_by('day')
        )
        
        # Data ecerpen per hari
        ecerpens_data = (
            ecerpen.objects
            .filter(created_at__range=(start_date, end_date), archived_at__isnull=True)
            .annotate(day=TruncDay('created_at'))
            .values('day')
            .annotate(count=Count('ecerpen_id'))
            .order_by('day')
        )
        
        # Data karya per hari
        karyas_data = (
            karya.objects
            .filter(created_at__range=(start_date, end_date), archived_at__isnull=True)
            .annotate(day=TruncDay('created_at'))
            .values('day')
            .annotate(count=Count('karya_id'))
            .order_by('day')
        )
        
        # Format data untuk chart
        labels = [(start_date + timedelta(days=x)).strftime('%d %b') for x in range(8)]
        
        ebook_counts = [0] * 31
        for item in ebooks_data:
            day_index = (item['day'].date() - start_date.date()).days
            if 0 <= day_index < 31:
                ebook_counts[day_index] = item['count']
        
        ecerpen_counts = [0] * 31
        for item in ecerpens_data:
            day_index = (item['day'].date() - start_date.date()).days
            if 0 <= day_index < 31:
                ecerpen_counts[day_index] = item['count']
        
        karya_counts = [0] * 31
        for item in karyas_data:
            day_index = (item['day'].date() - start_date.date()).days
            if 0 <= day_index < 31:
                karya_counts[day_index] = item['count']
        
        context = {
            'total_ebook': total_ebook,
            'total_ecerpen': total_ecerpen,
            'total_karya': total_karya,
            'chart_labels': labels,
            'ebook_data': ebook_counts,
            'ecerpen_data': ecerpen_counts,
            'karya_data': karya_counts,
        }
        
        return render(request, 'admin/master/admin/admin_dashboard.html', context)
        
@method_decorator(login_required(), name='dispatch')
class super_admin(View):
    def get(self, request):
        return render(request, 'admin/master/admin/super_admin.html')

@method_decorator(login_required(), name='dispatch')  
class admin_pemda(View):
    def get(self, request):
        return render(request, 'admin/master/admin/admin_pemda.html')

@method_decorator(login_required(), name='dispatch')
class admin_dinas(View):
    def get(self, request):
        return render(request, 'admin/master/admin/admin_dinas.html')

@method_decorator(login_required(), name='dispatch')
class admin_sekolah(View):
    def get(self, request):
        return render(request, 'admin/master/admin/admin_sekolah.html')

@method_decorator(login_required(), name='dispatch')
class operator(View):
    def get(self, request):
        return render(request, 'admin/master/admin/operator.html')

@method_decorator(login_required(), name='dispatch')
class profile(View):
    def get(self, request):
        return render(request, 'admin/master/admin/profile.html')


