from django.shortcuts import render, redirect
from django.conf.urls import url
from django.views import View
from django.utils import timezone
from deiyaiplus_admin.models import pengaduan
from django.contrib import messages
from django.shortcuts import get_object_or_404
from django.db import transaction
from deiyaiplus_admin.models import JENIS_PELAPOR_CHOICES, KAT_PENGADUAN_CHOICES
from django.http import JsonResponse
import json

# pengaduan
class PengaduanViewIndex(View):
    def get(self, request):
        search_query = request.GET.get('search', '').strip()
        
        if search_query:
            data_pengaduan = pengaduan.objects.filter(
                archived_at__isnull=True,
                kategori_pengaduan__icontains=search_query
            ).order_by('-created_at')
        else:
            data_pengaduan = pengaduan.objects.filter(
                archived_at__isnull=True
            ).order_by('-created_at')
        
        dt_pelapor = JENIS_PELAPOR_CHOICES
        kat_pengaduan = KAT_PENGADUAN_CHOICES

        data = {
            'kat_pengaduan': kat_pengaduan,
            'dt_pelapor': dt_pelapor,
            'data_pengaduan': data_pengaduan
        }
        return render(request, 'admin/pengaduan/index.html', data)


class ArsipDataPengaduanView(View):
    def get(self, request):
        search_query = request.GET.get('search', '').strip()
        
        if search_query:
            data_pengaduan = pengaduan.objects.filter(
                archived_at__isnull=False,
                kategori_pengaduan__icontains=search_query
            ).order_by('-archived_at')  
        else:
            data_pengaduan = pengaduan.objects.filter(
                archived_at__isnull=False
            ).order_by('-archived_at')  

        data = {
            'data_pengaduan': data_pengaduan,
            'search_query': search_query,
        }
        return render(request, 'admin/pengaduan/arsip.html', data)

class ArchivePengaduanView(View):
    def post(self, request, pengaduan_id):
        table = get_object_or_404(pengaduan, pengaduan_id=pengaduan_id)
        
        try:
            with transaction.atomic():
                table.archived_at =  timezone.now()
                table.save()
                messages.success(request, 'Data berhasil diarsipkan.')
                return redirect('admin:index_pengaduan')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal mengarsipkan data.')
            return redirect('admin:index_pengaduan')

class RestorePengaduanView(View):
    def post(self, request, pengaduan_id):
        # Menggunakan all_objects untuk mengakses data terarsip
        table = get_object_or_404(pengaduan.objects, pengaduan_id=pengaduan_id)
        try:
            with transaction.atomic():
                table.archived_at = None
                table.save()  # Mengembalikan data dari arsip
                messages.success(request, 'Data berhasil dikembalikan dari arsip.')
                return redirect('admin:index_pengaduan')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal mengembalikan data dari arsip.')
            return redirect('admin:index_pengaduan')

class HapusPengaduanView(View):
    def get(self, request, pengaduan_id):
        table = get_object_or_404(pengaduan.objects, pengaduan_id=pengaduan_id)
        try:
            with transaction.atomic():
                table.delete()
                messages.success(request, 'Data Berhasil Dihapus')
                return redirect('admin:index_pengaduan')
        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Dihapus.')
            return redirect('admin:index_pengaduan')
        

class DetailsPengaduanView(View):
    def get(self, request, pengaduan_id):
        pengaduan_obj = get_object_or_404(pengaduan, pengaduan_id=pengaduan_id)
        
        # Update read status jika belum dibaca
        if not pengaduan_obj.read_status:
            pengaduan_obj.read_status = True
            pengaduan_obj.save()
        
        # Tentukan waktu untuk greeting
        hour = timezone.now().hour
        if hour < 10:
            waktu = 'pagi'
        elif hour < 15:
            waktu = 'siang'
        elif hour < 18:
            waktu = 'sore'
        else:
            waktu = 'malam'
        
        data = {
            'pengaduan': pengaduan_obj,
            'waktu': waktu
        }
        return render(request, 'admin/pengaduan/details.html', data)

# Tambahkan ini dalam pengaduan.py
class BalasViaWAView(View):
    def post(self, request, pengaduan_id):
        obj = get_object_or_404(pengaduan, pengaduan_id=pengaduan_id)
        try:
            with transaction.atomic():
                obj.replay_status = 'sudah dibalas'
                obj.save()
                return JsonResponse({'status': 'success'})
        except Exception as e:
            return JsonResponse({'status': 'error'}, status=500)

# class DetailsPengaduanView(View):
#     def get(self, request, pengaduan_id):
#         table = get_object_or_404(pengaduan, pengaduan_id=pengaduan_id)
#         data = {
#             'details': table,
#         }
#         return render(request, 'admin/pengaduan/details.html', data)