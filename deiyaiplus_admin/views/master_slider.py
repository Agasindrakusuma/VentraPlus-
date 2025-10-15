from django.shortcuts import render, redirect
from django.conf.urls import url
from django.contrib import messages
from django.db import transaction
from django.shortcuts import get_object_or_404
from deiyaiplus_admin.models import slider
from django.db.models import Q
from django.core.paginator import Paginator
from deiyaiplus_admin.models import JENJANG_CHOICES


from django.views import View
from django.utils import timezone


class Slider(View):
    def get(self, request):
        data_slider = slider.objects.filter(archived_at__isnull=True)

        data = {
            'dt_slider': data_slider
        }
        return render(request, 'admin/master/master_slider/index.html', data)
    
class TambahMasterSliderView(View):
    def get(self, request):
        data = {
            'edit': False,
        }
        return render(request, 'admin/master/master_slider/form.html', data)
    
    def post(self,request):
        frm_judul_slider = request.POST.get('frm_judul_slider')
        frm_sub_judul_slider = request.POST.get('frm_sub_judul_slider')
        frm_tampilan_judul = request.POST.get('frm_tampilan_judul')
        is_video_background = request.POST.get('is_video_background') == 'true'
        frm_link = request.POST.get('frm_link')
        
        # Cek jenis file yang diupload berdasarkan pilihan user
        if is_video_background:
            frm_background = request.FILES.get('frm_background_video')
        else:
            frm_background = request.FILES.get('frm_background_slider')
            
        frm_elemen_gambar = request.FILES.get('frm_elemen_gambar')

        try:
            with transaction.atomic():
                table = slider()
                table.judul_slider = frm_judul_slider
                table.sub_judul_slider = frm_sub_judul_slider
                table.tampilan_judul = frm_tampilan_judul
                table.is_video_background = is_video_background
                
                if frm_background:
                    table.background_slider = frm_background
                if frm_elemen_gambar:
                    table.elemen_gambar = frm_elemen_gambar
                table.link = frm_link

                table.save()
                messages.success(request, 'Data Berhasil Ditambahkan')
                return redirect('admin:index_master_slider')
            
        except Exception as e:
            print('Error = ', e)
            messages.error(request, f'Data Gagal Ditambahkan: {str(e)}')
            return redirect('admin:tambah_master_slider')

class EditMasterSliderView(View):
    def get(self, request, slider_id):
        slider_obj = get_object_or_404(slider, slider_id=slider_id)
        
        data = {
            'edit': True,
            'slider': slider_obj,
        }
        return render(request, 'admin/master/master_slider/form.html', data)

    def post(self, request, slider_id):
        slider_obj = get_object_or_404(slider, slider_id=slider_id)
        
        frm_judul_slider = request.POST.get('frm_judul_slider')
        frm_sub_judul_slider = request.POST.get('frm_sub_judul_slider')
        frm_tampilan_judul = request.POST.get('frm_tampilan_judul')
        is_video_background = request.POST.get('is_video_background') == 'true'
        frm_link = request.POST.get('frm_link')
        
        # Cek jenis file yang diupload berdasarkan pilihan user
        if is_video_background:
            frm_background = request.FILES.get('frm_background_video')
        else:
            frm_background = request.FILES.get('frm_background_slider')
            
        frm_elemen_gambar = request.FILES.get('frm_elemen_gambar')

        try:
            with transaction.atomic():
                slider_obj.judul_slider = frm_judul_slider
                slider_obj.sub_judul_slider = frm_sub_judul_slider
                slider_obj.tampilan_judul = frm_tampilan_judul
                slider_obj.is_video_background = is_video_background
                
                # Hanya update file jika ada file baru diupload
                if frm_background:
                    slider_obj.background_slider = frm_background
                if frm_elemen_gambar:
                    slider_obj.elemen_gambar = frm_elemen_gambar
                    
                slider_obj.link = frm_link
                slider_obj.save()
                
                messages.success(request, 'Data berhasil diperbarui.')
                return redirect('admin:index_master_slider')
                
        except Exception as e:
            print('Error:', e)
            messages.error(request, f'Gagal memperbarui slider: {str(e)}')
            return redirect('admin:edit_master_slider', slider_id=slider_id)

class ArsipDataMasterSliderView(View):
    def get(self, request):
        data_arsip = slider.objects.filter(archived_at__isnull=False)

        data = {
            'dt_arsip': data_arsip,
        }
        return render(request, 'admin/master/master_slider/arsip.html', data)


class ArchiveMasterSliderView(View):
    def post(self, request, slider_id):
        table = get_object_or_404(slider, slider_id=slider_id)
 
        try:
            with transaction.atomic():
                table.archived_at =  timezone.now()
                table.save()
                messages.success(request, 'Data berhasil diarsipkan.')
                return redirect('admin:index_master_slider')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal mengarsipkan data.')
            return redirect('admin:index_master_slider')

class RestoreMasterSliderView(View):
    def post(self, request, slider_id):
        # Menggunakan objects untuk mengakses data terarsip
        table = get_object_or_404(slider.objects, slider_id=slider_id)
        try:
            with transaction.atomic():
                table.archived_at = None
                table.save()
                messages.success(request, 'Data berhasil dipulihkan dari arsip.')
                return redirect('admin:index_master_slider')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memulihkan data dari arsip.')
            return redirect('admin:index_master_slider')

class HapusMasterSliderView(View):
    def get(self, request, slider_id):
        table = get_object_or_404(slider.objects, slider_id=slider_id)
        try:
            with transaction.atomic():
                table.delete()
                messages.success(request, 'Data Berhasil Dihapus')
                return redirect('admin:index_master_slider')
        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Dihapus.')
            return redirect('admin:index_master_slider')