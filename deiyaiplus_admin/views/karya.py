from django.shortcuts import render, redirect
from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.contrib import messages
from django.db import transaction
from django.shortcuts import get_object_or_404
from deiyaiplus_admin.models import karya
from deiyaiplus_admin.models import konten_karya
from deiyaiplus_admin.models import kategori

from django.views import View
from django.utils import timezone


class KaryaView(View):
    def get(self, request):
        search_query = request.GET.get('search', '').strip()

        if search_query:
            data_karya = karya.objects.filter(
                archived_at__isnull=True,
                judul_karya__icontains=search_query
            ).prefetch_related('konten_karya_set')
        else:
            data_karya = karya.objects.filter(
                archived_at__isnull=True
            ).prefetch_related('konten_karya_set')

        data = {
            'dt_karya': data_karya,
            'search_query': search_query,
        }
        return render(request, 'admin/layanan/karya/index.html', data)

class DetailKaryaView(View):
    def get(self, request, karya_id):
        karya_detail = get_object_or_404(karya, karya_id=karya_id)
        konten_files = konten_karya.objects.filter(karya_id=karya_id)
        
        data = {
            'karya': karya_detail,
            'konten_files': konten_files,
        }
        return render(request, 'admin/layanan/karya/detail.html', data)

class TambahKaryaView(View):
    def get(self, request):
        data_kategori = kategori.objects.filter(
            archived_at__isnull=True,
            jenis_kategori='karya'
        ).order_by('nama_kategori')
        data = {
            'edit': False,
            'dt_kategori': data_kategori
        }
        return render(request, 'admin/layanan/karya/form.html', data)

    def post(self, request):
        frm_judul = request.POST.get('frm_judul')
        frm_deskripsi = request.POST.get('frm_deskripsi')
        frm_kategori = request.POST.get('frm_kategori')
        
        frm_cover = request.FILES.get('frm_cover')  # File tunggal
        frm_path = request.FILES.get('frm_path')    # File tunggal
        frm_gallery = request.FILES.getlist('frm_gallery')  # Banyak file

        try:
            with transaction.atomic():
                # Simpan data utama karya
                karya_obj = karya.objects.create(
                    judul_karya=frm_judul,
                    deskripsi_karya=frm_deskripsi,
                    kategori_id=kategori.objects.get(pk=frm_kategori) if frm_kategori else None,
                    user_id=request.user if request.user.is_authenticated else None
                )

                # Simpan Cover
                if frm_cover:
                    ext = frm_cover.name.split('.')[-1].lower()
                    konten_karya.objects.create(
                        nama_file=f'cover_{frm_cover.name}',
                        jenis_file=ext,
                        link=f'karya/{karya_obj.karya_id}/{frm_cover.name}',
                        karya_id=karya_obj,
                        file=frm_cover
                    )

                # Simpan File PDF
                if frm_path:
                    ext = frm_path.name.split('.')[-1].lower()
                    konten_karya.objects.create(
                        nama_file=f'file_{frm_path.name}',
                        jenis_file=ext,
                        link=f'karya/{karya_obj.karya_id}/{frm_path.name}',
                        karya_id=karya_obj,
                        file=frm_path
                    )

                # Simpan file gallery
                for index, file in enumerate(frm_gallery, start=1):
                    ext = file.name.split('.')[-1].lower()
                    konten_karya.objects.create(
                        nama_file=f'gallery_{index}_{file.name}',
                        jenis_file=ext,
                        link=f'karya/{karya_obj.karya_id}/gallery/{file.name}',
                        karya_id=karya_obj,
                        file=file
                    )

                messages.success(request, 'Data Karya dan Konten berhasil ditambahkan.')
                return redirect('admin:index_karya')

        except Exception as e:
            print("Upload Error:", e)
            messages.error(request, f'Gagal menyimpan data: {str(e)}')
            return redirect('admin:index_karya')


class EditKaryaView(View):
    def get(self, request, karya_id):
        karya_obj = get_object_or_404(karya, karya_id=karya_id)
        data_kategori = kategori.objects.filter(
            archived_at__isnull=True,
            jenis_kategori='karya'
        ).order_by('nama_kategori')
        
        # Ambil semua konten terkait
        cover = karya_obj.konten_karya_set.filter(nama_file__startswith='cover_').first()
        pdf_file = karya_obj.konten_karya_set.filter(nama_file__startswith='file_').first()
        gallery_files = karya_obj.konten_karya_set.filter(nama_file__startswith='gallery_')
        
        data = {
            'edit': True,
            'karya': karya_obj,
            'dt_kategori': data_kategori,
            'cover': cover,
            'pdf_file': pdf_file,
            'gallery_files': gallery_files,
        }
        return render(request, 'admin/layanan/karya/form.html', data)

    def post(self, request, karya_id):
        karya_obj = get_object_or_404(karya, karya_id=karya_id)
        
        # Ambil data dari form
        frm_judul = request.POST.get('frm_judul')
        frm_deskripsi = request.POST.get('frm_deskripsi')
        frm_kategori = request.POST.get('frm_kategori')
        
        frm_cover = request.FILES.get('frm_cover')  # File tunggal
        frm_path = request.FILES.get('frm_path')    # File tunggal
        frm_gallery = request.FILES.getlist('frm_gallery')  # Banyak file
        delete_cover = request.POST.get('delete_cover') == 'on'
        delete_pdf = request.POST.get('delete_pdf') == 'on'
        delete_gallery = request.POST.getlist('delete_gallery')
        new_gallery_files = request.FILES.getlist('frm_gallery')
        existing_ids = request.POST.getlist('existing_gallery_ids')

        print(frm_cover)


        

        try:
            with transaction.atomic():
                # Update data utama karya
                karya_obj.judul_karya = frm_judul
                karya_obj.deskripsi_karya = frm_deskripsi
                
                if frm_kategori:
                    karya_obj.kategori_id = kategori.objects.get(pk=frm_kategori)
                else:
                    karya_obj.kategori_id = None
                    
                if request.user.is_authenticated:
                    karya_obj.user_id = request.user
                    
                karya_obj.save()

                # Handle Cover
                existing_cover = karya_obj.konten_karya_set.filter(nama_file__startswith='cover_').first()
                existing_pdf = karya_obj.konten_karya_set.filter(nama_file__startswith='file_').first()
                existing_ids = request.POST.getlist('existing_gallery_ids')

                # Ambil semua file yang terhubung dengan karya ini
                all_files = konten_karya.objects.filter(karya_id__karya_id=karya_obj.karya_id)

                # Buat list ID yang harus dipertahankan (existing_ids + ID dari cover)
                ids_to_keep = existing_ids.copy()  # salin biar aman jika existing_ids adalah QueryDict
                if existing_cover:
                    ids_to_keep.append(str(existing_cover.konten_karya_id))
                if existing_pdf:
                    ids_to_keep.append(str(existing_pdf.konten_karya_id))

                # Hapus file yang tidak ada dalam daftar ids_to_keep
                files_to_delete = all_files.exclude(konten_karya_id__in=ids_to_keep)

                # Hapus file-nya
                files_to_delete.delete()


                files_to_delete.delete()
                
                if delete_cover and existing_cover:
                    existing_cover.delete()
                
                if frm_cover:
                    if existing_cover:
                        existing_cover.delete()
                    
                    ext = frm_cover.name.split('.')[-1].lower()
                    konten_karya.objects.create(
                        nama_file=f'cover_{frm_cover.name}',
                        jenis_file=ext,
                        link=f'karya/{karya_obj.karya_id}/{frm_cover.name}',
                        karya_id=karya_obj,
                        file=frm_cover
                    )

                # Handle PDF File
                existing_pdf = karya_obj.konten_karya_set.filter(nama_file__startswith='file_').first()
                
                if delete_pdf and existing_pdf:
                    existing_pdf.delete()
                
                if frm_path:
                    if existing_pdf:
                        existing_pdf.delete()
                    
                    ext = frm_path.name.split('.')[-1].lower()
                    konten_karya.objects.create(
                        nama_file=f'file_{frm_path.name}',
                        jenis_file=ext,
                        link=f'karya/{karya_obj.karya_id}/{frm_path.name}',
                        karya_id=karya_obj,
                        file=frm_path
                    )

                # Handle Gallery Files
                # Hapus file gallery yang dipilih untuk dihapus
                for file_id in delete_gallery:
                    file_to_delete = karya_obj.konten_karya_set.filter(pk=file_id).first()
                    if file_to_delete:
                        file_to_delete.delete()
                
                # Handle perubahan file gallery yang sudah ada

                
                # Tambahkan file gallery baru
                for file in new_gallery_files:
                    ext = file.name.split('.')[-1].lower()
                    konten_karya.objects.create(
                        nama_file=f'gallery_{file.name}',
                        jenis_file=ext,
                        link=f'karya/{karya_obj.karya_id}/{file.name}',
                        karya_id=karya_obj,
                        file=file
                    )

                messages.success(request, 'Data Karya berhasil diperbarui.')
                return redirect('admin:index_karya')

        except Exception as e:
            print("Update Error:", e)
            messages.error(request, f'Gagal memperbarui data: {str(e)}')
            return redirect('admin:edit_karya', karya_id=karya_id)


class ArsipKaryaView(View):
    def get(self, request):
        search_query = request.GET.get('search', '').strip()

        if search_query:
            data_arsip = karya.objects.filter(
                archived_at__isnull=False,
                judul__icontains=search_query
            )
        else:
            data_arsip = karya.objects.filter(archived_at__isnull=False)

        data = {
            'dt_arsip': data_arsip,
            'search_query': search_query,
        }
        return render(request, 'admin/layanan/karya/arsip.html', data)


class ArchiveKaryaView(View):
    def post(self, request, karya_id):
        table = get_object_or_404(karya, karya_id=karya_id)
        
        try:
            with transaction.atomic():
                table.archived_at =  timezone.now()
                table.save()  # Mengarsipkan data
                messages.success(request, 'Data berhasil diarsipkan.')
                return redirect('admin:index_karya')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal mengarsipkan data.')
            return redirect('admin:index_karya')

class RestoreKaryaiView(View):
    def post(self, request, karya_id):
        # Menggunakan objects untuk mengakses data terarsip
        table = get_object_or_404(karya.objects, karya_id=karya_id)
        try:
            with transaction.atomic():
                table.archived_at = None
                table.save()  # Mengembalikan data dari arsip
                messages.success(request, 'Data berhasil dipulihkan dari arsip.')
                return redirect('admin:index_karya')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memulihkan data dari arsip.')
            return redirect('admin:index_karya')

class HapusKaryaView(View):
    def post(self, request, karya_id):  # Changed from GET to POST
        table = get_object_or_404(karya, karya_id=karya_id)  # Fixed typo: `karya.objects` → `karya`
        try:
            with transaction.atomic():
                table.delete()
                messages.success(request, 'Data Berhasil Dihapus')
                return redirect('admin:index_karya')
        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Dihapus.')
            return redirect('admin:index_karya')

class ChangeGalleryFileView(View):
    def post(self, request, file_id):
        konten = get_object_or_404(konten_karya, pk=file_id)
        new_file = request.FILES.get('new_file')

        if not new_file:
            messages.error(request, 'Tidak ada file yang dipilih.')
            return redirect('admin:edit_karya', karya_id=konten.karya_id.karya_id)

        try:
            ext = new_file.name.split('.')[-1].lower()
            konten.nama_file = f'gallery_{new_file.name}'
            konten.jenis_file = ext
            konten.file = new_file
            konten.link = f'karya/{konten.karya_id.karya_id}/gallery/{new_file.name}'
            konten.save()

            messages.success(request, 'File galeri berhasil diperbarui.')
        except Exception as e:
            print("Change Error:", e)
            messages.error(request, 'Gagal memperbarui file.')

        return redirect('admin:edit_karya', karya_id=konten.karya_id.karya_id)



# class ChangeGalleryFileView(View):
#     def post(self, request, file_id):
#         konten = get_object_or_404(konten_karya, pk=file_id)
        
#         # Cek apakah ini permintaan hapus
#         if 'delete' in request.POST:
#             try:
#                 konten.delete()
#                 messages.success(request, 'File galeri berhasil dihapus.')
#             except Exception as e:
#                 print("Delete Error:", e)
#                 messages.error(request, 'Gagal menghapus file.')
#             return redirect('admin:edit_karya', karya_id=konten.karya_id.karya_id)

#         # Jika bukan hapus, maka proses perubahan file
#         new_file = request.FILES.get('new_file')

#         if not new_file:
#             messages.error(request, 'Tidak ada file yang dipilih.')
#             return redirect('admin:edit_karya', karya_id=konten.karya_id.karya_id)

#         try:
#             ext = new_file.name.split('.')[-1].lower()
#             konten.nama_file = f'gallery_{new_file.name}'
#             konten.jenis_file = ext
#             konten.file = new_file
#             konten.link = f'karya/{konten.karya_id.karya_id}/gallery/{new_file.name}'
#             konten.save()

#             messages.success(request, 'File galeri berhasil diperbarui.')
#         except Exception as e:
#             print("Change Error:", e)
#             messages.error(request, 'Gagal memperbarui file.')

#         return redirect('admin:edit_karya', karya_id=konten.karya_id.karya_id)


class DeleteGalleryFileView(View):
    def post(self, request, file_id):
        konten = get_object_or_404(konten_karya, pk=file_id)
        karya_id = konten.karya_id.karya_id
        try:
            konten.delete()
            messages.success(request, 'File galeri berhasil dihapus.')
        except Exception as e:
            print("Delete Error:", e)
            messages.error(request, 'Gagal menghapus file.')

        return redirect('admin:edit_karya', karya_id=karya_id)