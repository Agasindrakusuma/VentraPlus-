from django.shortcuts import render, redirect
from django.conf.urls import url
from django.contrib import messages
from django.db import transaction
from django.shortcuts import get_object_or_404
from deiyaiplus_admin.models import settings
from django.views import View
from django.utils import timezone
import os

class Master_Settings(View):
    def get(self, request):
        daata_settings = settings.objects.filter(archived_at__isnull=True)
        
        data = {
            'dt_settings': daata_settings 
        }
        return render(request, 'admin/master/master_settings/index.html', data)

class TambahMasterSettingsView(View):
    def get(self, request):
        data = {
            'edit': False,
        }
        return render(request, 'admin/master/master_settings/form.html', data)

    def post(self, request):
        frm_nama = request.POST.get('frm_nama')
        frm_deskripsi = request.POST.get('frm_deskripsi')
        frm_barcode = request.FILES.get('frm_barcode')
        frm_logo = request.FILES.get('frm_logo')
        frm_alamat = request.POST.get('frm_alamat')
        frm_kontak = request.POST.get('frm_kontak')
        frm_email = request.POST.get('frm_email')
        
        try:
            with transaction.atomic():
                table = settings()
                table.nama_aplikasi = frm_nama
                table.deskripsi_aplikasi = frm_deskripsi
                
                if frm_barcode:
                    table.barcode = frm_barcode
                if frm_logo:
                    table.logo = frm_logo
                    
                table.alamat = frm_alamat
                table.kontak = frm_kontak
                table.email = frm_email

                table.save()
                messages.success(request, 'Data Berhasil Ditambahkan')
                return redirect('admin:index_master_settings')

        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Ditambahkan.')
            return redirect('admin:index_master_settings')

class EditMasterSettingsView(View):
    def get(self, request, settings_id):
        table = get_object_or_404(settings, settings_id=settings_id)
        
        data = {
            'edit': True,
            'settings': table,
            'dt_arsip': table,
        }
        return render(request, 'admin/master/master_settings/form.html', data)

    def post(self, request, settings_id):
        table = get_object_or_404(settings, settings_id=settings_id)
        
        frm_nama = request.POST.get('frm_nama')
        frm_deskripsi = request.POST.get('frm_deskripsi')
        frm_barcode = request.FILES.get('frm_barcode')
        frm_logo = request.FILES.get('frm_logo')
        frm_alamat = request.POST.get('frm_alamat')
        frm_kontak = request.POST.get('frm_kontak')
        frm_email = request.POST.get('frm_email')

        try:
            with transaction.atomic():
                table.nama_aplikasi = frm_nama
                table.deskripsi_aplikasi = frm_deskripsi
                
                # Hanya update gambar jika ada file baru diupload
                if frm_barcode:
                    # Hapus file lama jika ada
                    if table.barcode:
                        if os.path.isfile(table.barcode.path):
                            os.remove(table.barcode.path)
                    table.barcode = frm_barcode
                
                if frm_logo:
                    # Hapus file lama jika ada
                    if table.logo:
                        if os.path.isfile(table.logo.path):
                            os.remove(table.logo.path)
                    table.logo = frm_logo
                
                table.alamat = frm_alamat
                table.kontak = frm_kontak
                table.email = frm_email
                
                table.save()
                messages.success(request, 'settings berhasil diperbarui.')
                return redirect('admin:index_master_settings')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memperbarui settings.')
            return redirect('admin:index_master_settings')

class ArsipDataMasterSettingsView(View):
    def get(self, request):
        data_arsip = settings.objects.filter(archived_at__isnull=False)

        data = {
            'dt_arsip': data_arsip,
            
        }
        return render(request, 'admin/master/master_settings/arsip.html', data)

class ArchiveMasterSettingsView(View):
    def post(self, request, settings_id):
        table = get_object_or_404(settings, settings_id=settings_id)
        
        try:
            with transaction.atomic():
                table.archived_at = timezone.now()
                table.save()
                messages.success(request, 'Data berhasil diarsipkan.')
                return redirect('admin:index_master_settings')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal mengarsipkan data.')
            return redirect('admin:index_master_settings')

class RestoreMasterSettingsView(View):
    def post(self, request, settings_id):
        table = get_object_or_404(settings, settings_id=settings_id)
        try:
            with transaction.atomic():
                table.archived_at = None
                table.save()
                messages.success(request, 'Data berhasil dipulihkan dari arsip.')
                return redirect('admin:index_master_settings')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memulihkan data dari arsip.')
            return redirect('admin:index_master_settings')

class HapusMasterSettingsView(View):
    def get(self, request, settings_id):
        table = get_object_or_404(settings, settings_id=settings_id)
        try:
            with transaction.atomic():
                # Hapus file gambar jika ada
                if table.barcode:
                    if os.path.isfile(table.barcode.path):
                        os.remove(table.barcode.path)
                if table.logo:
                    if os.path.isfile(table.logo.path):
                        os.remove(table.logo.path)
                
                table.delete()
                messages.success(request, 'Data Berhasil Dihapus')
                return redirect('admin:index_master_settings')
        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Dihapus.')
            return redirect('admin:index_master_settings')