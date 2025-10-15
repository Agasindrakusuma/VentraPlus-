from django.shortcuts import render
from django.db.models import Count
from django.utils import timezone
from datetime import timedelta, datetime
from django.http import HttpResponse
import csv
from deiyaiplus_admin.models import ecerpen, ebook, karya
from django.views import View

class LaporanView(View):
    def get(self, request):
        # Ambil parameter tanggal dari request atau gunakan default (bulan ini)
        start_date_str = request.GET.get('start_date')
        end_date_str = request.GET.get('end_date')
        
        try:
            start_date = datetime.strptime(start_date_str, '%Y-%m-%d').date() if start_date_str else None
            end_date = datetime.strptime(end_date_str, '%Y-%m-%d').date() if end_date_str else None
        except (ValueError, TypeError):
            start_date = None
            end_date = None
        
        # Jika tidak ada tanggal, gunakan rentang bulan ini
        if not start_date or not end_date:
            today = timezone.now().date()
            start_date = today.replace(day=1)
            end_date = today
        
        # Data untuk ecerpen
        ecerpen_data = self.get_upload_data(ecerpen.objects, start_date, end_date, 'ecerpen')
        # Data untuk ebook
        ebook_data = self.get_upload_data(ebook.objects, start_date, end_date, 'ebook')
        # Data untuk karya
        karya_data = self.get_upload_data(karya.objects, start_date, end_date, 'karya')
        
        # Gabungkan semua data
        all_data = []
        dates = sorted({**ecerpen_data, **ebook_data, **karya_data}.keys())
        
        for date in dates:
            all_data.append({
                'tanggal': date.strftime('%Y-%m-%d'),
                'ecerpen': ecerpen_data.get(date, 0),
                'ebook': ebook_data.get(date, 0),
                'karya': karya_data.get(date, 0),
                'total': ecerpen_data.get(date, 0) + ebook_data.get(date, 0) + karya_data.get(date, 0)
            })
        
        # Hitung total keseluruhan
        total_ecerpen = sum(ecerpen_data.values())
        total_ebook = sum(ebook_data.values())
        total_karya = sum(karya_data.values())
        grand_total = total_ecerpen + total_ebook + total_karya
        
        context = {
            'data': all_data,
            'total_ecerpen': total_ecerpen,
            'total_ebook': total_ebook,
            'total_karya': total_karya,
            'grand_total': grand_total,
            'start_date': start_date.strftime('%Y-%m-%d'),
            'end_date': end_date.strftime('%Y-%m-%d'),
        }
        
        return render(request, 'admin/laporan/index.html', context)
    
    def get_upload_data(self, model, start_date, end_date, model_name):
        # Query untuk menghitung upload per hari
        result = model.filter(
            created_at__date__gte=start_date,
            created_at__date__lte=end_date
        ).extra({'upload_date': "date(created_at)"}).values('upload_date').annotate(
            count=Count(model_name + '_id')
        ).order_by('upload_date')
        
        # Format data ke dictionary {date: count}
        data = {}
        for item in result:
            data[item['upload_date']] = item['count']
        
        # Isi tanggal yang tidak ada data dengan 0
        current_date = start_date
        while current_date <= end_date:
            if current_date not in data:
                data[current_date] = 0
            current_date += timedelta(days=1)
            
        return data

class DownloadLaporanView(View):
    def get(self, request):
        # Ambil parameter dari request
        start_date = request.GET.get('start_date')
        end_date = request.GET.get('end_date')
        
        # Validasi tanggal
        try:
            start_date = datetime.strptime(start_date, '%Y-%m-%d').date()
            end_date = datetime.strptime(end_date, '%Y-%m-%d').date()
        except (ValueError, TypeError):
            return HttpResponse("Format tanggal tidak valid", status=400)
        
        # Data untuk ecerpen
        ecerpen_data = self.get_upload_data(ecerpen.objects, start_date, end_date, 'ecerpen')
        # Data untuk ebook
        ebook_data = self.get_upload_data(ebook.objects, start_date, end_date, 'ebook')
        # Data untuk karya
        karya_data = self.get_upload_data(karya.objects, start_date, end_date, 'karya')
        
        # Gabungkan semua data
        all_data = []
        dates = sorted({**ecerpen_data, **ebook_data, **karya_data}.keys())
        
        for date in dates:
            all_data.append({
                'tanggal': date.strftime('%Y-%m-%d'),
                'ecerpen': ecerpen_data.get(date, 0),
                'ebook': ebook_data.get(date, 0),
                'karya': karya_data.get(date, 0),
                'total': ecerpen_data.get(date, 0) + ebook_data.get(date, 0) + karya_data.get(date, 0)
            })
        
        # Buat response CSV
        response = HttpResponse(content_type='text/csv')
        response['Content-Disposition'] = 'attachment; filename="laporan_upload_{}_to_{}.csv"'.format(
            start_date.strftime('%Y%m%d'), 
            end_date.strftime('%Y%m%d')
        )
        
        writer = csv.writer(response)
        # Header
        writer.writerow(['Laporan Upload Konten', start_date.strftime('%Y-%m-%d'), 's/d', end_date.strftime('%Y-%m-%d')])
        writer.writerow([])
        writer.writerow(['Tanggal', 'E-Cerpen', 'E-Book', 'Karya', 'Total'])
        
        # Data
        for row in all_data:
            writer.writerow([row['tanggal'], row['ecerpen'], row['ebook'], row['karya'], row['total']])
        
        return response
    
    def get_upload_data(self, model, start_date, end_date, model_name):
        # Sama seperti di LaporanView
        result = model.filter(
            created_at__date__gte=start_date,
            created_at__date__lte=end_date
        ).extra({'upload_date': "date(created_at)"}).values('upload_date').annotate(
            count=Count(model_name + '_id')
        ).order_by('upload_date')
        
        data = {}
        for item in result:
            data[item['upload_date']] = item['count']
        
        current_date = start_date
        while current_date <= end_date:
            if current_date not in data:
                data[current_date] = 0
            current_date += timedelta(days=1)
            
        return data