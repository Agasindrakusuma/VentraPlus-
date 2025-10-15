from django.shortcuts import render, redirect
from django.conf.urls import url
from django.contrib import messages
from django.db import transaction
from django.shortcuts import get_object_or_404
from deiyaiplus_admin.models import partner

from django.views import View
from django.utils import timezone


class master_partner(View):
    def get(self, request):
        data_partner = partner.objects.filter(archived_at__isnull=True)

        data ={
            'dt_partner' : data_partner,
        }
        return render(request, 'admin/master/master_partner/index.html', data)

class TambahMasterPartnerView(View):
    def get(self, request):
        
        data = {
            'edit': False,
            
        }
        return render(request, 'admin/master/master_partner/form.html', data)

    def post(self, request):
        frm_images = request.FILES.get('frm_images')
        frm_nama = request.POST.get('frm_nama')
        frm_judul = request.POST.get('frm_judul')
        frm_link = request.POST.get('frm_link')
        try:
            # transaction.atomic ini berfungi untuk mencegah data masuk jika masih ada kesalahan dalam pengisian form
            with transaction.atomic():
                table = partner()
                table.images = request.FILES.get('frm_images')
                table.nama = frm_nama
                table.judul_patner = frm_judul
                table.link = frm_link

                table.save()
                messages.success(request, 'Data Berhasil Ditambahkan')
                return redirect('admin:index_master_partner')

        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Ditambahkan.')
            return redirect('admin:index_master_partner')

class EditMasterPartnerView(View):
    def get(self, request, partner_id):
        table = get_object_or_404(partner.objects, partner_id=partner_id)
        
        data = {
            'edit': True,
            'partner': table,
            'dt_arsip': table,
        }
        return render(request, 'admin/master/master_partner/form.html', data)

    def post(self, request, partner_id):
        table = get_object_or_404(partner.objects, partner_id=partner_id)
        
        frm_images = request.FILES.get('frm_images')
        frm_nama = request.POST.get('frm_nama')
        frm_judul = request.POST.get('frm_judul')
        frm_link = request.POST.get('frm_link')

        try:
            with transaction.atomic():
                if request.FILES.get('frm_images'):
                    table.images = request.FILES.get('frm_images')              
                table.nama = frm_nama
                table.judul_patner = frm_judul
                table.link = frm_link
                
                table.save()
                messages.success(request, 'partner berhasil diperbarui.')
                return redirect('admin:index_master_partner')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memperbarui partner.')
            return redirect('admin:index_master_partner')

class ArsipDataMasterPartnerView(View):
    def get(self, request):
        data_arsip = partner.objects.filter(archived_at__isnull=False)

        data = {
            'dt_arsip': data_arsip,
        }
        return render(request, 'admin/master/master_partner/arsip.html', data)


class ArchiveMasterPartnerView(View):
    def post(self, request, partner_id):
        table = get_object_or_404(partner, partner_id=partner_id)
        
        try:
            with transaction.atomic():
                table.archived_at =  timezone.now()
                table.save()  # Mengarsipkan data
                messages.success(request, 'Data berhasil diarsipkan.')
                return redirect('admin:index_master_partner')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal mengarsipkan data.')
            return redirect('admin:index_master_partner')

class RestoreMasterPartnerView(View):
    def post(self, request, partner_id):
        # Menggunakan objects untuk mengakses data terarsip
        table = get_object_or_404(partner.objects, partner_id=partner_id)
        try:
            with transaction.atomic():
                table.archived_at = None
                table.save()  # Mengembalikan data dari arsip
                messages.success(request, 'Data berhasil dipulihkan dari arsip.')
                return redirect('admin:index_master_partner')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memulihkan data dari arsip.')
            return redirect('admin:index_master_partner')

class HapusMasterPartnerView(View):
    def get(self, request, partner_id):
        table = get_object_or_404(partner.objects, partner_id=partner_id)
        try:
            with transaction.atomic():
                table.delete()
                messages.success(request, 'Data Berhasil Dihapus')
                return redirect('admin:index_master_partner')
        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Dihapus.')
            return redirect('admin:index_master_partner')

