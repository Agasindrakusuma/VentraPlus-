from django.shortcuts import render, redirect
from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.contrib import messages
from django.db import transaction
from django.shortcuts import get_object_or_404
from deiyaiplus_admin.models import ecerpen
from deiyaiplus_admin.models import kategori
from django.http import JsonResponse
import json
from django.views import View
from django.utils import timezone


class e_cerpen(View):
    def get(self, request):
        search_query = request.GET.get('search', '').strip()

        if search_query:
            data_ecerpen = ecerpen.objects.filter(
                archived_at__isnull=True,
                judul__icontains=search_query
            ).order_by('-created_at')
        else:
            data_ecerpen = ecerpen.objects.filter(archived_at__isnull=True).order_by('-created_at')

        data = {
            'dt_ecerpen' : data_ecerpen,
            'search_query': search_query,
        }
        return render(request, 'admin/layanan/e-cerpen/index.html', data)

class DetailEcerpenView(View):
    def get(self, request, ecerpen_id):
        ecerpen_detail = get_object_or_404(ecerpen, ecerpen_id=ecerpen_id)
        
        data = {
            'ecerpen': ecerpen_detail,
        }
        return render(request, 'admin/layanan/e-cerpen/detail.html', data)

class TambahEcerpenView(View):
    def get(self, request):
        data_kategori = kategori.objects.filter(
            archived_at__isnull=True,
            jenis_kategori='ecerpen'
        ).order_by('nama_kategori') 
        data = {
            'edit': False,
            'dt_kategori': data_kategori 
        }
        return render(request, 'admin/layanan/e-cerpen/form.html', data)

    def post(self, request):
        frm_judul = request.POST.get('frm_judul')
        frm_sinopsis = request.POST.get('frm_sinopsis')
        frm_cover = request.FILES.get('frm_cover')  # This will now contain the cropped image
        frm_path = request.FILES.get('frm_path')
        frm_penulis = request.POST.get('frm_penulis')
        frm_durasi_baca = request.POST.get('frm_durasi_baca')
        frm_tanggal_verifikasi = request.POST.get('frm_tanggal_verifikasi')
        frm_batas_usia = request.POST.get('frm_batas_usia')
        frm_alasan_penolakan = request.POST.get('frm_alasan_penolakan')
        frm_tanggal_publikasi = request.POST.get('frm_tanggal_publikasi')
        frm_kategori = request.POST.get('frm_kategori')

        try:
            with transaction.atomic():
                table = ecerpen(
                    judul=frm_judul,
                    sinopsis=frm_sinopsis,
                    cover=frm_cover,  # The cropped image will be saved here
                    path_ecerpen=frm_path,
                    penulis=frm_penulis,
                    durasi_baca=frm_durasi_baca,
                    tanggal_verifikasi=frm_tanggal_verifikasi,
                    batas_usia=frm_batas_usia,
                    alasan_penolakan=frm_alasan_penolakan,
                    tanggal_publikasi=frm_tanggal_publikasi,
                )

                if frm_kategori:
                    table.kategori_id = kategori.objects.get(pk=frm_kategori)
                
                if request.user.is_authenticated:
                    table.user_id = request.user
                
                table.save()
                messages.success(request, 'Data Berhasil Ditambahkan')
                return redirect('admin:index_e_cerpen')

        except Exception as e:
            print('Error = ', e)
            messages.error(request, f'Data Gagal Ditambahkan: {str(e)}')
            return redirect('admin:index_e_cerpen')
class EditMasterEcerpenView(View):
    def get(self, request, ecerpen_id):
        table = get_object_or_404(ecerpen.objects, ecerpen_id=ecerpen_id)
        data_kategori = kategori.objects.filter(
            archived_at__isnull=True,
            jenis_kategori='ecerpen'
        ).order_by('nama_kategori') 

        data = {
            'edit': True,
            'ecerpen': table,
            'data_ecerpen': table,  # ganti ini
            'dt_kategori': data_kategori,
        }

        return render(request, 'admin/layanan/e-cerpen/form.html', data)

    def post(self, request, ecerpen_id):
        table = get_object_or_404(ecerpen.objects, ecerpen_id=ecerpen_id)
        # Ambil data dari form
        frm_judul = request.POST.get('frm_judul')
        frm_sinopsis = request.POST.get('frm_sinopsis')
        frm_cover = request.FILES.get('frm_cover')  # File upload
        frm_path = request.FILES.get('frm_path')
        frm_penulis = request.POST.get('frm_penulis')
        frm_durasi_baca = request.POST.get('frm_durasi_baca')
        frm_tanggal_verifikasi = request.POST.get('frm_tanggal_verifikasi')
        frm_batas_usia = request.POST.get('frm_batas_usia')
        frm_alasan_penolakan = request.POST.get('frm_alasan_penolakan')
        frm_tanggal_publikasi = request.POST.get('frm_tanggal_publikasi')
        frm_kategori = request.POST.get('frm_kategori')  # Changed to match template


        try:
            with transaction.atomic():
                table.judul = frm_judul
                table.sinopsis = frm_sinopsis
                if frm_cover:
                    table.cover = frm_cover
                if frm_path:
                    table.path_ecerpen = frm_path
                table.penulis = frm_penulis
                table.durasi_baca = frm_durasi_baca
                table.tanggal_verifikasi = frm_tanggal_verifikasi
                table.batas_usia = frm_batas_usia
                table.alasan_penolakan = frm_alasan_penolakan
                table.tanggal_publikasi = frm_tanggal_publikasi

                if frm_kategori:
                    table.kategori_id = kategori.objects.get(pk=frm_kategori)
                
                if request.user.is_authenticated:
                    table.user_id = request.user

                    
                table.save()
                messages.success(request, 'Ecerpen berhasil diperbarui.')
                return redirect('admin:index_e_cerpen')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memperbarui ecerpen.')
            return redirect('admin:edit_e_cerpen', ecerpen_id=ecerpen_id)

class ArsipEcerpenView(View):
    def get(self, request):
        search_query = request.GET.get('search', '').strip()

        if search_query:
            data_arsip = ecerpen.objects.filter(
                archived_at__isnull=False,
                judul__icontains=search_query
            )
        else:
            data_arsip = ecerpen.objects.filter(archived_at__isnull=False)

        data = {
            'dt_arsip': data_arsip,
            'search_query': search_query,
        }
        return render(request, 'admin/layanan/e-cerpen/arsip.html', data)



class ArchiveEcerpeniView(View):
    def post(self, request, ecerpen_id):
        table = get_object_or_404(ecerpen, ecerpen_id=ecerpen_id)
        
        try:
            with transaction.atomic():
                table.archived_at =  timezone.now()
                table.save()  # Mengarsipkan data
                messages.success(request, 'Data berhasil diarsipkan.')
                return redirect('admin:index_e_cerpen')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal mengarsipkan data.')
            return redirect('admin:index_e_cerpen')

class RestoreEcerpeniView(View):
    def post(self, request, ecerpen_id):
        # Menggunakan objects untuk mengakses data terarsip
        table = get_object_or_404(ecerpen.objects, ecerpen_id=ecerpen_id)
        try:
            with transaction.atomic():
                table.archived_at = None
                table.save()  # Mengembalikan data dari arsip
                messages.success(request, 'Data berhasil dipulihkan dari arsip.')
                return redirect('admin:index_e_cerpen')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memulihkan data dari arsip.')
            return redirect('admin:index_e_cerpen')

class HapusEcerpenView(View):
    def post(self, request, ecerpen_id):  # Changed from GET to POST
        table = get_object_or_404(ecerpen, ecerpen_id=ecerpen_id)  # Fixed typo: `ecerpen.objects` → `ecerpen`
        try:
            with transaction.atomic():
                table.delete()
                messages.success(request, 'Data Berhasil Dihapus')
                return redirect('admin:index_e_cerpen')
        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Dihapus.')
            return redirect('admin:index_e_cerpen')

class TolakECerpenView(View):
    def post(self, request):
        try:
            data = json.loads(request.body)
            cerpen_id = data.get("id")
            alasan = data.get("alasan")

            if not cerpen_id or not alasan:
                return JsonResponse({"message": "ID cerpen dan alasan harus diisi."}, status=400)

            cerpen = ecerpen.objects.get(pk=cerpen_id)
            cerpen.alasan_penolakan = alasan
            cerpen.tanggal_verifikasi = None  # Reset verifikasi
            cerpen.status = "ditolak" 
            cerpen.save()

            return JsonResponse({"message": "Cerpen berhasil ditolak."})
        except ecerpen.DoesNotExist:
            return JsonResponse({"message": "Cerpen tidak ditemukan."}, status=404)
        except json.JSONDecodeError:
            return JsonResponse({"message": "Data tidak valid."}, status=400)
        except Exception as e:
            return JsonResponse({"message": f"Terjadi kesalahan: {str(e)}"}, status=500)

class VerifikasiECerpenView(View):
    def post(self, request):
        data = json.loads(request.body)
        cerpen_id = data.get("id")

        try:
            cerpen = ecerpen.objects.get(pk=cerpen_id)
            cerpen.tanggal_verifikasi = timezone.now()
            cerpen.alasan_penolakan = None
            cerpen.status = "terverifikasi"  
            cerpen.save()

            return JsonResponse({"message": "Cerpen berhasil diverifikasi."})
        except ecerpen.DoesNotExist:
            return JsonResponse({"message": "Cerpen tidak ditemukan."}, status=404)

class BatalTolakECerpenView(View):
    def post(self, request):
        data = json.loads(request.body)
        cerpen_id = data.get("id")

        try:
            cerpen = ecerpen.objects.get(pk=cerpen_id)
            cerpen.status = "menunggu"  
            cerpen.alasan_penolakan = None  
            cerpen.save()

            return JsonResponse({"message": "Penolakan cerpen berhasil dibatalkan."})
        except ecerpen.DoesNotExist:
            return JsonResponse({"message": "Cerpen tidak ditemukan."}, status=404)

class BatalVerifikasiECerpenView(View):
    def post(self, request):
        data = json.loads(request.body)
        cerpen_id = data.get("id")
        try:
            cerpen = ecerpen.objects.get(pk=cerpen_id)
            cerpen.status = "menunggu"  
            cerpen.tanggal_verifikasi = None
            cerpen.save()
            return JsonResponse({"message": "Verifikasi cerpen berhasil dibatalkan."})
        except ecerpen.DoesNotExist:
            return JsonResponse({"message": "Cerpen tidak ditemukan."}, status=404)