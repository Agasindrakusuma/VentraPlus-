from django.shortcuts import render, redirect
from django.conf.urls import url
from django.contrib import messages
from django.db import transaction
from django.shortcuts import get_object_or_404
from deiyaiplus_admin.models import kategori as tb_kategori, KATEGORI_CHOICES

from django.views import View
from django.utils import timezone


class master_kategori(View):
    def get(self, request):
        data_kategori = tb_kategori.objects.filter(archived_at__isnull=True)

        data = {
            'dt_kategori': data_kategori,
        }
        return render(request, 'admin/master/master_kategori/index.html', data)

class ArsipDataMasterkategoriView(View):
    def get(self, request):
        data_arsip = tb_kategori.objects.filter(archived_at__isnull=False)

        data = {
            'dt_arsip': data_arsip,
        }
        return render(request, 'admin/master/master_kategori/arsip.html', data)

class TambahMasterKategoriView(View):
    def get(self, request):
        tb_kategori = KATEGORI_CHOICES        
        data = {
            'edit': False,
            'tb_kategori': tb_kategori,
        }
        return render(request, 'admin/master/master_kategori/form.html', data)

    def post(self, request):
        frm_nama_kategori = request.POST.get('frm_nama_kategori')
        frm_sub_kategori = request.POST.get('frm_sub_kategori')
        frm_jenis_kategori = request.POST.get('frm_jenis_kategori')
        try:
            # transaction.atomic ini berfungi untuk mencegah data masuk jika masih ada kesalahan dalam pengisian form
            with transaction.atomic():
                table = tb_kategori()
                table.nama_kategori = frm_nama_kategori
                table.sub_kategori = frm_sub_kategori
                table.jenis_kategori = frm_jenis_kategori

                table.save()
                messages.success(request, 'Data Berhasil Ditambahkan')
                return redirect('admin:index_master_kategori')

        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Ditambahkan.')
            return redirect('admin:index_master_kategori')

class EditMasterKategoriView(View):
    def get(self, request, kategori_id):
        table = get_object_or_404(tb_kategori.objects, kategori_id=kategori_id)
        kategori_choices = KATEGORI_CHOICES       
        data = {
            'edit': True,
            'kategori': table,
            'tb_kategori': kategori_choices,
        }
        return render(request, 'admin/master/master_kategori/form.html', data)

    def post(self, request, kategori_id):
        table = get_object_or_404(tb_kategori.objects, kategori_id=kategori_id)
        frm_nama_kategori = request.POST.get('frm_nama_kategori')
        frm_sub_kategori = request.POST.get('frm_sub_kategori')
        frm_jenis_kategori = request.POST.get('frm_jenis_kategori')

        try:
            # transaction.atomic ini berfungi untuk mencegah data masuk jika masih ada kesalahan dalam pengisian form
            with transaction.atomic():
                table.nama_kategori = frm_nama_kategori
                table.sub_kategori = frm_sub_kategori
                table.jenis_kategori = frm_jenis_kategori
                
                table.save()
                messages.success(request, 'kategori berhasil diperbarui.')
                return redirect('admin:index_master_kategori')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memperbarui kategori.')
            return redirect('admin:index_master_kategori')

class ArchiveMasterkategoriView(View):
    def post(self, request, kategori_id):
        table = get_object_or_404(tb_kategori, kategori_id=kategori_id)

        try:
            with transaction.atomic():
                table.archived_at =  timezone.now()
                table.save()
                messages.success(request, 'Data berhasil diarsipkan.')
                return redirect('admin:index_master_kategori')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal mengarsipkan data.')
            return redirect('admin:index_master_kategori')

class RestoreMasterkategoriView(View):
    def post(self, request, kategori_id):
        # Menggunakan objects untuk mengakses data terarsip
        table = get_object_or_404(tb_kategori.objects, kategori_id=kategori_id)
        try:
            with transaction.atomic():
                table.archived_at = None
                table.save()
                messages.success(request, 'Data berhasil dipulihkan dari arsip.')
                return redirect('admin:index_master_kategori')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memulihkan data dari arsip.')
            return redirect('admin:index_master_kategori')

class HapusMasterkategoriView(View):
    def get(self, request, kategori_id):
        table = get_object_or_404(tb_kategori.objects, kategori_id=kategori_id)
        try:
            with transaction.atomic():
                table.delete()
                messages.success(request, 'Data Berhasil Dihapus')
                return redirect('admin:index_master_kategori')
        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Dihapus.')
            return redirect('admin:index_master_kategori')

