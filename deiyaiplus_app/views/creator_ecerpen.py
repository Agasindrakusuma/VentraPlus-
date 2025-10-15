from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.db import transaction
from django.views import View
from deiyaiplus_admin.models import ecerpen, kategori, creator
from django.utils.decorators import method_decorator
from django.http import JsonResponse
import json

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
class creator_ecerpen(View):
    def get(self, request):
        creator_id = request.session.get('creator_id')
        search_query = request.GET.get('search', '').strip()

        if search_query:
            data_ecerpen = ecerpen.objects.filter(
                archived_at__isnull=True,
                judul__icontains=search_query,
                creator_id=creator_id
            )
        else:
            data_ecerpen = ecerpen.objects.filter(
                archived_at__isnull=True,
                creator_id=creator_id
            )
        
        creator_obj = creator.objects.filter(creator_id=creator_id).first()

        data = {
            'dt_ecerpen': data_ecerpen,
            'search_query': search_query,
            'creator': creator_obj,
        }
        return render(request, 'app/creator_ecerpen/index.html', data)


@class_creator_login_required
class DetailEcerpenView(View):
    def get(self, request, slug):
        creator_id = request.session.get('creator_id')
        ecerpen_detail = get_object_or_404(ecerpen, slug=slug, creator_id=creator_id)
        
        data = {
            'ecerpen': ecerpen_detail,
        }
        return render(request, 'app/creator_ecerpen/detail.html', data)


@class_creator_login_required
class TambahEcerpenCreator(View):
    def get(self, request):
        data_kategori = kategori.objects.filter(
            archived_at__isnull=True,
            jenis_kategori='ecerpen'
        ).order_by('nama_kategori')
        data = {
            'edit': False,
            'dt_kategori': data_kategori
        }
        return render(request, 'app/creator_ecerpen/form.html', data)

    def post(self, request):
        creator_id = request.session.get('creator_id')
        current_creator = get_object_or_404(creator, pk=creator_id)

        frm_judul = request.POST.get('frm_judul')
        frm_sinopsis = request.POST.get('frm_sinopsis')
        frm_cover = request.FILES.get('frm_cover')
        frm_path = request.FILES.get('frm_path')
        frm_penulis = request.POST.get('frm_penulis')
        frm_tanggal_verifikasi = request.POST.get('frm_tanggal_verifikasi')
        frm_batas_usia = request.POST.get('frm_batas_usia')
        frm_alasan_penolakan = request.POST.get('frm_alasan_penolakan')
        frm_tanggal_publikasi = request.POST.get('frm_tanggal_publikasi')
        frm_like = request.POST.get('frm_like') or 0
        frm_share = request.POST.get('frm_share') or 0
        frm_kategori = request.POST.get('frm_kategori')

        try:
            with transaction.atomic():
                table = ecerpen(
                    judul=frm_judul,
                    sinopsis=frm_sinopsis,
                    cover=frm_cover,
                    path_ecerpen=frm_path,
                    penulis=frm_penulis,
                    tanggal_verifikasi=frm_tanggal_verifikasi or None,
                    batas_usia=frm_batas_usia,
                    alasan_penolakan=frm_alasan_penolakan,
                    tanggal_publikasi=frm_tanggal_publikasi or None,
                    jumlah_like=frm_like,
                    jumlah_share=frm_share,
                    creator=current_creator,
                )

                if frm_kategori:
                    table.kategori_id = kategori.objects.get(pk=frm_kategori)

                table.save()
                messages.success(request, 'Data Berhasil Ditambahkan')
                return redirect('app:creator_index_ecerpen')  # sesuaikan URL

        except Exception as e:
            print('Error = ', e)
            messages.error(request, f'Data Gagal Ditambahkan: {str(e)}')
            return redirect('app:creator_index_ecerpen')


@class_creator_login_required
class EditMasterEcerpenView(View):
    def get(self, request, slug):
        creator_id = request.session.get('creator_id')
        table = get_object_or_404(ecerpen, slug=slug, creator_id=creator_id)
        data_kategori = kategori.objects.filter(
            archived_at__isnull=True,
            jenis_kategori='ecerpen'
        ).order_by('nama_kategori')

        data = {
            'edit': True,
            'ecerpen': table,
            'data_ecerpen': table,
            'dt_kategori': data_kategori,
        }
        return render(request, 'app/creator_ecerpen/form.html', data)

    def post(self, request, slug):
        creator_id = request.session.get('creator_id')
        table = get_object_or_404(ecerpen, slug=slug, creator_id=creator_id)

        frm_judul = request.POST.get('frm_judul')
        frm_sinopsis = request.POST.get('frm_sinopsis')
        frm_cover = request.FILES.get('frm_cover')
        frm_path = request.FILES.get('frm_path')
        frm_penulis = request.POST.get('frm_penulis')
        frm_tanggal_verifikasi = request.POST.get('frm_tanggal_verifikasi')
        frm_batas_usia = request.POST.get('frm_batas_usia')
        frm_alasan_penolakan = request.POST.get('frm_alasan_penolakan')
        frm_tanggal_publikasi = request.POST.get('frm_tanggal_publikasi')
        frm_like = request.POST.get('frm_like') or 0
        frm_share = request.POST.get('frm_share') or 0
        frm_kategori = request.POST.get('frm_kategori')

        try:
            with transaction.atomic():
                table.judul = frm_judul
                table.sinopsis = frm_sinopsis
                if frm_cover:
                    table.cover = frm_cover
                if frm_path:
                    table.path_ecerpen = frm_path
                table.penulis = frm_penulis
                table.tanggal_verifikasi = frm_tanggal_verifikasi or None
                table.batas_usia = frm_batas_usia
                table.tanggal_publikasi = frm_tanggal_publikasi or None
                table.jumlah_like = frm_like
                table.jumlah_share = frm_share

                if frm_kategori:
                    table.kategori_id = kategori.objects.get(pk=frm_kategori)
                    
                # Update alasan_penolakan hanya jika formnya diisi (tidak kosong atau None)
                if frm_alasan_penolakan is not None and frm_alasan_penolakan.strip() != '':
                    table.alasan_penolakan = frm_alasan_penolakan.strip()
                # Jika tidak diisi, biarkan alasan_penolakan tetap seperti sebelumnya   

                table.save()
                messages.success(request, 'Ecerpen berhasil diperbarui.')
                return redirect('app:creator_index_ecerpen')

        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memperbarui ecerpen.')
            return redirect('app:creator_edit_ecerpen', slug=slug)


@class_creator_login_required
class HapusEcerpenView(View):
    def post(self, request, ecerpen_id):
        creator_id = request.session.get('creator_id')
        table = get_object_or_404(ecerpen, ecerpen_id=ecerpen_id, creator_id=creator_id)
        try:
            with transaction.atomic():
                table.delete()
                messages.success(request, 'Data Berhasil Dihapus')
                return redirect('app:creator_index_ecerpen')
        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Dihapus.')
            return redirect('app:creator_index_ecerpen')

class AjukanUlangECerpenView(View):
    def post(self, request):
        data = json.loads(request.body)
        cerpen_id = data.get('id')
        try:
            cerpen = ecerpen.objects.get(pk=cerpen_id)
            if cerpen.status == 'ditolak':
                cerpen.status = 'revisi'
                cerpen.save()
                return JsonResponse({'message': 'Cerpen berhasil diajukan ulang.'})
            else:
                return JsonResponse({'message': 'Cerpen tidak dalam status ditolak.'}, status=400)
        except ecerpen.DoesNotExist:
            return JsonResponse({'message': 'Cerpen tidak ditemukan.'}, status=404)        

