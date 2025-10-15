from django.shortcuts import render, redirect
from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.contrib import messages
from django.db import transaction
from django.shortcuts import get_object_or_404
from deiyaiplus_admin.models import ebook, creator
from deiyaiplus_admin.models import kategori
from django.http import JsonResponse
import json
from django.views import View
from django.utils import timezone
from django.utils.timezone import make_aware, get_current_timezone, now
from datetime import datetime

# Decorator untuk cek session creator login
def creator_login_required(view_func):
    def wrapper(request, *args, **kwargs):
        if not request.session.get('creator_id'):
            return redirect('app:creator_login')  # sesuaikan URL login creator
        return view_func(request, *args, **kwargs)
    return wrapper

# Versi method decorator untuk class-based view
def class_creator_login_required(cls):
    cls.dispatch = method_decorator(creator_login_required)(cls.dispatch)
    return cls

@class_creator_login_required
class Creator_ebook(View):
    def get(self, request):
        creator_id = request.session.get('creator_id')
        search_query = request.GET.get('search', '').strip()

        if search_query:
            data_ebook = ebook.objects.filter(
                archived_at__isnull=True,
                judul__icontains=search_query,
                creator_id=creator_id
            ).order_by('-created_at')
        else:
            data_ebook = ebook.objects.filter(
                archived_at__isnull=True,
                creator_id=creator_id
                ).order_by('-created_at')
        
        creator_obj = creator.objects.filter(creator_id=creator_id).first()

        data = {
            'dt_ebook' : data_ebook,
            'search_query': search_query,
            'creator': creator_obj,
        }
        return render(request, 'app/creator_ebook/index.html', data)

@class_creator_login_required
class CreatorDetailEbookView(View):
    def get(self, request, ebook_id):
        creator_id = request.session.get('creator_id')
        ebook_detail = get_object_or_404(ebook, ebook_id=ebook_id, creator_id=creator_id)
        
        data = {
            'ebook': ebook_detail,
        }
        return render(request, 'app/creator_ebook/detail.html', data)

@class_creator_login_required
class CreatorTambahEbookView(View):
    def get(self, request):
        data_kategori = kategori.objects.filter(
            archived_at__isnull=True,
            jenis_kategori='ebook'
        ).order_by('nama_kategori')        
        data = {
            'edit': False,
            'dt_kategori': data_kategori
        }
        return render(request, 'app/creator_ebook/form.html', data)

    def post(self, request):
        creator_id = request.session.get('creator_id')
        current_creator = get_object_or_404(creator, pk=creator_id)
        
        frm_judul = request.POST.get('frm_judul')
        frm_sinopsis = request.POST.get('frm_sinopsis')
        frm_cover = request.FILES.get('frm_cover')
        frm_path = request.FILES.get('frm_path')
        frm_penulis = request.POST.get('frm_penulis')
        frm_batas_usia = request.POST.get('frm_batas_usia')
        frm_tahun_terbit = request.POST.get('frm_tahun_terbit')
        frm_tanggal_verifikasi = request.POST.get('frm_tanggal_verifikasi')
        frm_tanggal_publikasi = request.POST.get('frm_tanggal_publikasi')
        frm_alasan_penolakan = request.POST.get('frm_alasan_penolakan')
        frm_like = request.POST.get('frm_like')
        frm_share = request.POST.get('frm_share')
        frm_jumlah_baca = request.POST.get('frm_jumlah_baca')
        frm_views = request.POST.get('frm_views')
        frm_durasi_baca = request.POST.get('frm_durasi_baca')
        frm_bahasa = request.POST.get('frm_bahasa')
        frm_status = request.POST.get('frm_status')
        frm_kategori = request.POST.get('frm_kategori')

        try:
            with transaction.atomic():
                table = ebook(
                    judul = frm_judul,
                    sinopsis_ebook = frm_sinopsis,
                    cover = frm_cover,
                    path_ebook = frm_path,
                    penulis = frm_penulis,
                    batas_usia = frm_batas_usia,
                    tahun_terbit = frm_tahun_terbit,
                    tanggal_verifikasi = frm_tanggal_verifikasi,
                    alasan_penolakan = frm_alasan_penolakan,
                    jumlah_like = frm_like or 0,
                    jumlah_share = frm_share or 0,
                    jumlah_baca = frm_jumlah_baca or 0,
                    jumlah_views = frm_views or 0,
                    durasi_baca = frm_durasi_baca or 0,
                    bahasa = frm_bahasa or 'id',
                    status = frm_status or 'draft',
                    creator=current_creator,
                )
                

                # Parsing datetime with time
                try:
                    dt_format = "%Y-%m-%dT%H:%M"  # format input dari datetime-local
                    parsed_datetime = datetime.strptime(frm_tanggal_publikasi, dt_format)
                    table.tanggal_publikasi = make_aware(parsed_datetime, timezone=get_current_timezone())
                except Exception as parse_err:
                    print("Tanggal publikasi parse error:", parse_err)
                    table.tanggal_publikasi = timezone.now ()  # atau bisa pakai timezone.now()

                if frm_kategori:
                    table.kategori_id = kategori.objects.get(pk=frm_kategori)

                table.save()
                messages.success(request, 'Data Berhasil Ditambahkan')
                return redirect('app:creator_index_ebook')

        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Ditambahkan.')
            return redirect('app:creator_index_ebook')

@class_creator_login_required
class CreatorEditEbookView(View):
    def get(self, request, ebook_id):
        creator_id = request.session.get('creator_id')
        table = get_object_or_404(ebook.objects, ebook_id=ebook_id, creator_id=creator_id)
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
        return render(request, 'app/creator_ebook/form.html', data)

    def post(self, request, ebook_id):
        creator_id = request.session.get('creator_id')
        table = get_object_or_404(ebook.objects, ebook_id=ebook_id, creator_id=creator_id)

        # Ambil data dari form
        frm_judul = request.POST.get('frm_judul')
        frm_sinopsis = request.POST.get('frm_sinopsis')
        frm_cover = request.FILES.get('frm_cover')
        frm_penulis = request.POST.get('frm_penulis')
        frm_batas_usia = request.POST.get('frm_batas_usia')
        frm_tahun_terbit = request.POST.get('frm_tahun_terbit')
        frm_tanggal_verifikasi = request.POST.get('frm_tanggal_verifikasi')
        frm_alasan_penolakan = request.POST.get('frm_alasan_penolakan')
        frm_tanggal_publikasi = request.POST.get('frm_tanggal_publikasi')
        frm_like = request.POST.get('frm_like') or 0
        frm_share = request.POST.get('frm_share') or 0
        frm_baca = request.POST.get('frm_jumlah_baca') or 0
        frm_views = request.POST.get('frm_views') or 0
        frm_durasi = request.POST.get('frm_durasi_baca') or 0
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

                table.jumlah_like = int(frm_like)
                table.jumlah_share = int(frm_share)
                table.jumlah_baca = int(frm_baca)
                table.jumlah_views = int(frm_views)
                table.durasi_baca = int(frm_durasi)
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

                table.save()
                messages.success(request, 'Ebook berhasil diperbarui.')
                # Redirect ke halaman index ebook setelah update
                return redirect('app:creator_index_ebook')

        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memperbarui ebook.')
            # Tetap redirect ke halaman edit jika error
            return redirect('app:creator_edit_ebook', ebook_id=ebook_id)

@class_creator_login_required
class CreatorHapusEbookView(View):
    def post(self, request, ebook_id):
        creator_id = request.session.get('creator_id')
        table = get_object_or_404(ebook, ebook_id=ebook_id, creator_id=creator_id)  # Fixed typo: `ebook.objects` → `ebook`
        try:
            with transaction.atomic():
                table.delete()
                messages.success(request, 'Data Berhasil Dihapus')
                return redirect('app:creator_index_ebook')
        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Dihapus.')
            return redirect('app:creator_index_ebook')

class AjukanUlangEbookView(View):
    def post(self, request):
        data = json.loads(request.body)
        book_id = data.get('id')
        try:
            book = ebook.objects.get(pk=book_id)
            if book.status == 'ditolak':
                book.status = 'revisi'
                book.save()
                return JsonResponse({'message': 'Ebook berhasil diajukan ulang.'})
            else:
                return JsonResponse({'message': 'Ebook tidak dalam status ditolak.'}, status=400)
        except ebook.DoesNotExist:
            return JsonResponse({'message': 'Ebook tidak ditemukan.'}, status=404)
