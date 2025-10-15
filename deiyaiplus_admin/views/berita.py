from django.shortcuts import render, get_object_or_404, redirect
from django.views import View
from django.contrib import messages
from django.utils import timezone
from django.db import transaction
from deiyaiplus_admin.models import berita, kategori
from django.utils.text import slugify
import json
import uuid
import random
import os



def rand_slug():
    return ''.join(random.choice('abcdefghijklmnopqrstuvwxyz0123456789') for _ in range(6))

class BeritaView(View):
    def get(self, request):
        data_berita = berita.objects.filter(archived_at__isnull=True).order_by('-created_at')

        for tag in data_berita:
            for tag in berita.tag.all():
                print('tag berita', tag.name)
        
        data = {
            'dt_berita': data_berita,  # Changed from 'dt_berita' to match template
        }
        return render(request, 'admin/publikasi/index.html', data)

class TambahBeritaView(View):
    def get(self, request):
        data_kategori = kategori.objects.filter(
            archived_at__isnull=True, 
            jenis_kategori__in=['berita', 'infografis', 'alur pengaduan', 'fitur', 'survey']
            ).distinct('jenis_kategori')
        data = {
            'edit': False,
            'dt_kategori': data_kategori
        }
        return render(request, 'admin/publikasi/form.html', data)

    def post(self, request):
        frm_judul = request.POST.get('frm_judul')
        frm_sinopsis = request.POST.get('frm_sinopsis')
        frm_images = request.FILES.get('frm_images')
        frm_deskripsi_berita = request.POST.get('frm_deskripsi_berita')
        tags = request.POST.get('tag', '[]')  # Default to empty JSON array if None
        kategori_id = request.POST.get('kategori_id')

        try:
            with transaction.atomic():
                table = berita()
                table.judul = frm_judul
                if frm_images:
                    table.images = frm_images
                table.deskripsi_berita = frm_deskripsi_berita

                if kategori_id:
                    table.kategori_id = get_object_or_404(kategori, kategori_id=kategori_id)
                
                table.save()
                
                try:
                    tag_data = json.loads(tags)
                    print('tag_data')
                    for tag_obj in tag_data:
                        value = tag_obj.get('value', '').strip()
                        print('value')
                        if value:  # Only add non-empty tags
                            table.tag.add(value)
                except Exception as e:
                    print(f'Gagal parsing tag: {e}')
                
                messages.success(request, 'Data Berhasil Ditambahkan')
                return redirect('admin:index_berita')

        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Data Gagal Ditambahkan.')
            return redirect('admin:index_berita')

class EditBeritaView(View):
    def get(self, request, berita_id):
        table = get_object_or_404(berita, berita_id=berita_id)
        data_kategori = kategori.objects.all()
        data = {
            'edit': True,
            'berita': table,
            'dt_kategori': data_kategori,
            'dt_arsip': table
        }
        return render(request, 'admin/publikasi/form.html', data)

    def post(self, request, berita_id):
        table = get_object_or_404(berita, berita_id=berita_id)

        frm_judul = request.POST.get('frm_judul')
        frm_images = request.FILES.get('frm_images')
        frm_deskripsi_berita = request.POST.get('frm_deskripsi_berita')
        kategori_id = request.POST.get('kategori_id')
        tags = request.POST.get('tag', '[]')  # Default to empty JSON array if None

        try:
            with transaction.atomic():
                table.judul = frm_judul
                
                # Handle image update
                if frm_images:
                    # Delete old image if exists
                    if table.images:
                        if os.path.isfile(table.images.path):
                            os.remove(table.images.path)
                    table.images = frm_images

                table.deskripsi_berita = frm_deskripsi_berita

                if kategori_id:
                    table.kategori_id = get_object_or_404(kategori, kategori_id=kategori_id)
                else:
                    table.kategori_id = None

                table.save()
                
                try:
                    tag_data = json.loads(tags)
                    print('tag_data')

                    table.tag.clear()
                    
                    for tag_obj in tag_data:
                        value = tag_obj.get('value', '').strip()
                        print('value')
                        if value:  # Only add non-empty tags
                            table.tag.add(value)
                except Exception as e:
                    print(f'Gagal parsing tag: {e}')
                
                table.save()
                messages.success(request, 'Berita berhasil diperbarui.')
                return redirect('admin:index_berita')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memperbarui berita.')
            
            return redirect('admin:index_berita')

class ArsipBeritaView(View):
    def get(self, request):
        data_arsip = berita.objects.filter(archived_at__isnull=False)

        data = {
            'dt_arsip': data_arsip,
        }
        return render(request, 'admin/publikasi/arsip.html', data)

class ArchiveBeritaView(View):
    def post(self, request, berita_id):
        table = get_object_or_404(berita, berita_id=berita_id)

        try:
            with transaction.atomic():
                table.archived_at = timezone.now()
                table.save()
                messages.success(request, 'Berita berhasil diarsipkan.')
                return redirect('admin:index_berita')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal mengarsipkan berita')
            return redirect('admin:index_berita')

class RestoreBeritaView(View):
    def post(self, request, berita_id):
        table = get_object_or_404(berita, berita_id=berita_id)

        try:
            with transaction.atomic():
                table.archived_at = None
                table.save()
                messages.success(request, 'Berita berhasil dipulihkan.')
                return redirect('admin:index_berita')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memulihkan berita')
            return redirect('admin:index_berita')

class HapusBeritaView(View):
    def get(self, request, berita_id):
        table = get_object_or_404(berita, berita_id=berita_id)
        
        try:
            with transaction.atomic():
                # Delete associated image file if exists
                if table.images:
                    if os.path.isfile(table.images.path):
                        os.remove(table.images.path)
                
                table.delete()
                messages.success(request, 'Berita berhasil dihapus permanen.')
                return redirect('admin:index_berita')
        except Exception as e:
            print('Error = ', e)
            messages.error(request, 'Gagal menghapus berita.')
            return redirect('admin:index_berita')