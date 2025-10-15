from django.shortcuts import render, redirect
from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.contrib import messages
from django.db import transaction
from django.shortcuts import get_object_or_404
from deiyaiplus_admin.models import ebook
from deiyaiplus_admin.models import kategori
from django.http import JsonResponse
import json
from django.views import View
from django.utils import timezone
from django.utils.timezone import make_aware, get_current_timezone, now
from datetime import datetime

class e_book(View):
    def get(self, request):
        search_query = request.GET.get('search', '').strip()

        if search_query:
            data_ebook = ebook.objects.filter(
                archived_at__isnull=True,
                judul__icontains=search_query
            ).order_by('-created_at')
        else:
            data_ebook = ebook.objects.filter(archived_at__isnull=True).order_by('-created_at')


        data = {
            'dt_ebook' : data_ebook,
            'search_query': search_query,
        }
        return render(request, 'admin/layanan/e-book/index.html', data)

class DetailEbookView(View):
    def get(self, request, ebook_id):
        ebook_detail = get_object_or_404(ebook, ebook_id=ebook_id)
        
        data = {
            'ebook': ebook_detail,
        }
        return render(request, 'admin/layanan/e-book/detail.html', data)


class TambahEbookView(View):
    def get(self, request):
        data_kategori = kategori.objects.filter(
            archived_at__isnull=True,
            jenis_kategori='ebook'
        ).order_by('nama_kategori')        
        data = {
            'edit': False,
            'dt_kategori': data_kategori
        }
        return render(request, 'admin/layanan/e-book/form.html', data)

    def post(self, request):
        frm_judul = request.POST.get('frm_judul')
        frm_sinopsis = request.POST.get('frm_sinopsis')
        frm_cover = request.FILES.get('frm_cover')
        frm_path = request.FILES.get('frm_path')
        frm_penulis = request.POST.get('frm_penulis')
        frm_durasi_baca = request.POST.get('frm_durasi_baca')
        frm_batas_usia = request.POST.get('frm_batas_usia')
        frm_tahun_terbit = request.POST.get('frm_tahun_terbit')
        frm_tanggal_verifikasi = request.POST.get('frm_tanggal_verifikasi')
        frm_tanggal_publikasi = request.POST.get('frm_tanggal_publikasi')
        frm_alasan_penolakan = request.POST.get('frm_alasan_penolakan')
        frm_durasi_baca = request.POST.get('frm_durasi_baca')
        frm_bahasa = request.POST.get('frm_bahasa')
        frm_status = request.POST.get('frm_status')
        frm_kategori = request.POST.get('frm_kategori')

        try:
            with transaction.atomic():
                table = ebook()
                table.judul = frm_judul
                table.sinopsis_ebook = frm_sinopsis
                table.cover = frm_cover
                table.path_ebook = frm_path
                table.penulis = frm_penulis
                table.durasi_baca = frm_durasi_baca
                table.batas_usia = frm_batas_usia
                table.tahun_terbit = frm_tahun_terbit
                table.tanggal_verifikasi = frm_tanggal_verifikasi

                # Parsing datetime with time
                try:
                    dt_format = "%Y-%m-%dT%H:%M"  # format input dari datetime-local
                    parsed_datetime = datetime.strptime(frm_tanggal_publikasi, dt_format)
                    table.tanggal_publikasi = make_aware(parsed_datetime, timezone=get_current_timezone())
                except Exception as parse_err:
                    print("Tanggal publikasi parse error:", parse_err)
                    table.tanggal_publikasi = timezone.now ()  # atau bisa pakai timezone.now()

                table.alasan_penolakan = frm_alasan_penolakan
                table.bahasa = frm_bahasa or 'id'
                table.status = frm_status or 'draft'

                if frm_kategori:
                    table.kategori_id = kategori.objects.get(pk=frm_kategori)

                if request.user.is_authenticated:
                    table.user_id = request.user

                table.save()
                messages.success(request, 'Data Berhasil Ditambahkan')
                return redirect('admin:index_e_book')

        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Ditambahkan.')
            return redirect('admin:index_e_book')

class EditEbookView(View):
    def get(self, request, ebook_id):
        table = get_object_or_404(ebook.objects, ebook_id=ebook_id)
        data_kategori = kategori.objects.filter(
            archived_at__isnull=True,
            jenis_kategori='ebook'
        ).order_by('nama_kategori') 
        data = {
            'edit': True,
            'ebook': table,
            'data_ebook': table,
            'dt_kategori': data_kategori,
        }

        return render(request, 'admin/layanan/e-book/form.html', data)

    def post(self, request, ebook_id):
        table = get_object_or_404(ebook.objects, ebook_id=ebook_id)
        # Ambil data dari form
        frm_judul = request.POST.get('frm_judul')
        frm_sinopsis = request.POST.get('frm_sinopsis')
        frm_cover = request.FILES.get('frm_cover')
        frm_path = request.FILES.get('frm_path')
        frm_penulis = request.POST.get('frm_penulis')
        frm_durasi_baca = request.POST.get('frm_durasi_baca')
        frm_batas_usia = request.POST.get('frm_batas_usia')
        frm_tahun_terbit = request.POST.get('frm_tahun_terbit')
        frm_tanggal_verifikasi = request.POST.get('frm_tanggal_verifikasi')
        frm_alasan_penolakan = request.POST.get('frm_alasan_penolakan')
        frm_tanggal_publikasi = request.POST.get('frm_tanggal_publikasi')
        frm_bahasa = request.POST.get('frm_bahasa') or 'id'
        frm_status = request.POST.get('frm_status') or table.status
        frm_kategori = request.POST.get('frm_kategori')

        try:
            with transaction.atomic():
                table.judul = frm_judul
                table.sinopsis_ebook = frm_sinopsis
                if frm_cover:
                    table.cover = frm_cover
                table.penulis = frm_penulis
                table.batas_usia = frm_batas_usia

                try:
                    if frm_tahun_terbit:
                        table.tahun_terbit = datetime.strptime(frm_tahun_terbit, '%Y-%m-%d').date()
                    else:
                        table.tahun_terbit = None
                except ValueError:
                    table.tahun_terbit = None

                try:
                    if frm_tanggal_verifikasi:
                        table.tanggal_verifikasi = make_aware(datetime.strptime(frm_tanggal_verifikasi, "%Y-%m-%dT%H:%M"))
                    else:
                        table.tanggal_verifikasi = None
                except Exception:
                    table.tanggal_verifikasi = None

                # Update alasan_penolakan hanya jika formnya diisi (tidak kosong atau None)
                if frm_alasan_penolakan is not None and frm_alasan_penolakan.strip() != '':
                    table.alasan_penolakan = frm_alasan_penolakan.strip()
                # Jika tidak diisi, biarkan alasan_penolakan tetap seperti sebelumnya

                table.durasi_baca = frm_durasi_baca
                table.bahasa = frm_bahasa
                table.status = frm_status

                try:
                    dt_format = "%Y-%m-%dT%H:%M"
                    parsed_datetime = datetime.strptime(frm_tanggal_publikasi, dt_format)
                    table.tanggal_publikasi = make_aware(parsed_datetime, timezone=get_current_timezone())
                except Exception:
                    table.tanggal_publikasi = now()

                if frm_kategori:
                    try:
                        table.kategori_id = kategori.objects.get(pk=frm_kategori)
                    except kategori.DoesNotExist:
                        table.kategori_id = None
                else:
                    table.kategori_id = None

                if request.user.is_authenticated:
                    table.user_id = request.user
                    
                table.save()
                messages.success(request, 'ebook berhasil diperbarui.')
                return redirect('admin:index_e_book')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memperbarui ebook.')
            return redirect('admin:edit_e_book', ebook_id=ebook_id)

class ArsipEbookView(View):
    def get(self, request):
        search_query = request.GET.get('search', '').strip()

        if search_query:
            data_arsip = ebook.objects.filter(
                archived_at__isnull=False,
                judul__icontains=search_query
            )
        else:
            data_arsip = ebook.objects.filter(archived_at__isnull=False)

        data = {
            'dt_arsip': data_arsip,
            'search_query': search_query,
        }
        return render(request, 'admin/layanan/e-book/arsip.html', data)


class ArchiveEbookView(View):
    def post(self, request, ebook_id):
        table = get_object_or_404(ebook, ebook_id=ebook_id)
        
        try:
            with transaction.atomic():
                table.archived_at =  timezone.now()
                table.save()  # Mengarsipkan data
                messages.success(request, 'Data berhasil diarsipkan.')
                return redirect('admin:index_e_book')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal mengarsipkan data.')
            return redirect('admin:index_e_book')

class RestoreEbookiView(View):
    def post(self, request, ebook_id):
        # Menggunakan objects untuk mengakses data terarsip
        table = get_object_or_404(ebook.objects, ebook_id=ebook_id)
        try:
            with transaction.atomic():
                table.archived_at = None
                table.save()  # Mengembalikan data dari arsip
                messages.success(request, 'Data berhasil dipulihkan dari arsip.')
                return redirect('admin:index_e_book')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memulihkan data dari arsip.')
            return redirect('admin:index_e_book')

class HapusEbookView(View):
    def post(self, request, ebook_id):  # Changed from GET to POST
        table = get_object_or_404(ebook, ebook_id=ebook_id)  # Fixed typo: `ebook.objects` → `ebook`
        try:
            with transaction.atomic():
                table.delete()
                messages.success(request, 'Data Berhasil Dihapus')
                return redirect('admin:index_e_book')
        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Dihapus.')
            return redirect('admin:index_e_book')

class TolakEbookView(View):
    def post(self, request):
        try:
            data = json.loads(request.body)
            book_id = data.get("id")
            alasan = data.get("alasan")

            if not book_id or not alasan:
                return JsonResponse({"message": "ID book dan alasan harus diisi."}, status=400)

            book = ebook.objects.get(pk=book_id)
            book.alasan_penolakan = alasan
            book.tanggal_verifikasi = None  # Reset verifikasi
            book.status = "ditolak" 
            book.save()

            return JsonResponse({"message": "Ebook berhasil ditolak."})
        except ebook.DoesNotExist:
            return JsonResponse({"message": "Ebook tidak ditemukan."}, status=404)
        except json.JSONDecodeError:
            return JsonResponse({"message": "Data tidak valid."}, status=400)
        except Exception as e:
            return JsonResponse({"message": f"Terjadi kesalahan: {str(e)}"}, status=500)

class VerifikasiEbookView(View):
    def post(self, request):
        data = json.loads(request.body)
        book_id = data.get("id")

        try:
            book = ebook.objects.get(pk=book_id)
            book.tanggal_verifikasi = timezone.now()
            book.alasan_penolakan = None
            book.status = "terverifikasi"  
            book.save()

            return JsonResponse({"message": "Ebook berhasil diverifikasi."})
        except ebook.DoesNotExist:
            return JsonResponse({"message": "Ebook tidak ditemukan."}, status=404)

class BatalTolakEbookView(View):
    def post(self, request):
        data = json.loads(request.body)
        book_id = data.get("id")

        try:
            book = ebook.objects.get(pk=book_id)
            book.status = "menunggu"  
            book.alasan_penolakan = None  
            book.save()

            return JsonResponse({"message": "Penolakan Ebook berhasil dibatalkan."})
        except ebook.DoesNotExist:
            return JsonResponse({"message": "Ebook tidak ditemukan."}, status=404)

class BatalVerifikasiEbookView(View):
    def post(self, request):
        data = json.loads(request.body)
        book_id = data.get("id")
        try:
            book = ebook.objects.get(pk=book_id)
            book.status = "menunggu"  
            book.tanggal_verifikasi = None
            book.save()
            return JsonResponse({"message": "Verifikasi Ebook berhasil dibatalkan."})
        except ebook.DoesNotExist:
            return JsonResponse({"message": "Ebook tidak ditemukan."}, status=404)