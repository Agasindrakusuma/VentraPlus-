from django.shortcuts import render, redirect
from django.conf.urls import url
from django.contrib import messages
from django.db import transaction
from django.shortcuts import get_object_or_404
from deiyaiplus_admin.models import profile, TIPE_CHOICES
from django.db.models import Q
from django.core.paginator import Paginator


from django.views import View
from django.utils import timezone


class master_profile(View):
    def get(self, request):
        dt_tipe = TIPE_CHOICES


        data_profile = profile.objects.filter(archived_at__isnull=True)
        
        

        data = {
            'dt_profile': data_profile,
            'dt_tipe': dt_tipe,
            
        }
        return render(request, 'admin/master/master_profile/index.html', data)
        

class TambahMasterProfileView(View):
    def get(self, request):
        dt_tipe = TIPE_CHOICES
        
        data = {
            'edit': False,
            'dt_tipe': dt_tipe
        }
        return render(request, 'admin/master/master_profile/form.html', data)

    def post(self, request):
        frm_tipe = request.POST.get('frm_tipe')
        frm_deskripsi = request.POST.get('frm_deskripsi')
        frm_images = request.FILES.get('frm_images')
        
        # Validasi sederhana
        if not frm_tipe or not frm_deskripsi or frm_deskripsi.strip() in ['<p><br></p>', '']:
            messages.error(request, 'Tipe dan Deskripsi harus diisi')
            return redirect('admin:tambah_master_profile')
        
        try:
            with transaction.atomic():
                table = profile()
                table.tipe = frm_tipe
                table.deskripsi = frm_deskripsi
                table.images = request.FILES.get('frm_images')

                table.save()
                messages.success(request, 'Data Berhasil Ditambahkan')
                return redirect('admin:index_master_profile')

        except Exception as e:
            print('Error = ', e)
            messages.error(request, f'Data Gagal Ditambahkan: {str(e)}')
            return redirect('admin:tambah_master_profile')

class EditMasterProfileView(View):
    def get(self, request, profile_id):
        # table = get_object_or_404(profile, profile_id=profile_id)
        table = get_object_or_404(profile.objects, profile_id=profile_id)
        dt_tipe = TIPE_CHOICES
        
        data = {
            'edit': True,
            'profile': table,
            'dt_arsip': table,
            'dt_tipe': dt_tipe,
            
        }
        return render(request, 'admin/master/master_profile/form.html', data)

    def post(self, request, profile_id):
        # table = get_object_or_404(profile, profile_id=profile_id)
        table = get_object_or_404(profile.objects, profile_id=profile_id)
        
        frm_tipe = request.POST.get('frm_tipe')
        frm_deskripsi = request.POST.get('frm_deskripsi')
        frm_images = request.FILES.get('frm_images')

        print('== DEBUG ==')
        print('Tipe:', frm_tipe)
        print('Deskripsi:', frm_deskripsi)

        try:
            with transaction.atomic():
                table.tipe = frm_tipe
                table.deskripsi = frm_deskripsi
                if request.FILES.get('frm_images'):
                    table.images = request.FILES.get('frm_images')
                
                table.save()
                messages.success(request, 'Data berhasil diperbarui.')
                return redirect('admin:index_master_profile')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memperbarui profile.')
            return redirect('admin:index_master_profile')

class ArsipDataMasterProfileView(View):
    def get(self, request):
        data_arsip = profile.objects.filter(archived_at__isnull=False)

        data = {
            'dt_arsip': data_arsip,
        }
        return render(request, 'admin/master/master_profile/arsip.html', data)


class ArchiveMasterProfileView(View):
    def post(self, request, profile_id):
        table = get_object_or_404(profile, profile_id=profile_id)
        
        try:
            with transaction.atomic():
                table.archived_at =  timezone.now()
                table.save()
                messages.success(request, 'Data berhasil diarsipkan.')
                return redirect('admin:index_master_profile')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal mengarsipkan data.')
            return redirect('admin:index_master_profile')

class RestoreMasterProfileView(View):
    def post(self, request, profile_id):
        # Menggunakan all_objects untuk mengakses data terarsip
        table = get_object_or_404(profile.objects, profile_id=profile_id)
        try:
            with transaction.atomic():
                table.archived_at = None
                table.save()  # Mengembalikan data dari arsip
                messages.success(request, 'Data berhasil dikembalikan dari arsip.')
                return redirect('admin:index_master_profile')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal mengembalikan data dari arsip.')
            return redirect('admin:index_master_profile')

class HapusMasterProfileView(View):
    def get(self, request, profile_id):
        table = get_object_or_404(profile.objects, profile_id=profile_id)
        try:
            with transaction.atomic():
                table.delete()
                messages.success(request, 'Data Berhasil Dihapus')
                return redirect('admin:index_master_profile')
        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Dihapus.')
            return redirect('admin:index_master_profile')
