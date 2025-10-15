from django.shortcuts import render
from django.http import JsonResponse
from django.views import View
from django.conf import settings
from django.db import transaction
import requests 
from deiyaiplus_admin.models import berita
from deiyaiplus_app.service import AlurPengaduanService, BeritaService
from deiyaiplus_admin.models import pengaduan
from deiyaiplus_admin.models import JENIS_PELAPOR_CHOICES, KAT_PENGADUAN_CHOICES

class PengaduanView(View):
    def get(self, request):
        data_berita = BeritaService.get_berita(jenis_kategori='berita')
        dt_pelapor = JENIS_PELAPOR_CHOICES
        kat_pengaduan = KAT_PENGADUAN_CHOICES
        
        data = {
            'dt_pelapor' : dt_pelapor,
            'kat_pengaduan' : kat_pengaduan,
            'dt_berita' : data_berita,
        }
        
        return render(request, 'app/pengaduan/pengaduan.html', data)

    def post(self, request):
        # Ambil token CAPTCHA dari form
        turnstile_token = request.POST.get("cf-turnstile-response")
        if not turnstile_token:
            return JsonResponse({'success': False, 'message': 'Token CAPTCHA tidak ditemukan.'})

        # Verifikasi token ke server Cloudflare
        try:
            response = requests.post(
                "https://challenges.cloudflare.com/turnstile/v0/siteverify",
                data={
                    "secret": settings.TURNSTILE_SECRET_KEY,
                    "response": turnstile_token,
                    "remoteip": request.META.get("REMOTE_ADDR"),
                }
            ).json()

            if not response.get("success"):
                return JsonResponse({'success': False, 'message': 'Verifikasi CAPTCHA gagal.'})
        except Exception as e:
            return JsonResponse({'success': False, 'message': f'Gagal verifikasi CAPTCHA: {str(e)}'})

        # Ambil data form
        try:
            with transaction.atomic():
                obj = pengaduan(
                    nama_pengadu=request.POST.get('frm_nama_pengadu'),
                    email=request.POST.get('frm_email'),
                    nik=request.POST.get('frm_nik'),
                    no_whatsapp=request.POST.get('frm_no_whatsapp'),
                    deskripsi_pengaduan=request.POST.get('frm_deskripsi_pengaduan'),
                    jenis_pelapor=request.POST.get('frm_jenis_pelapor'),
                    kategori_pengaduan=request.POST.get('frm_kategori'),
                    read_status=False,
                    replay_status=False,
                )
                obj.save()
                return JsonResponse({'success': True, 'message': 'Data berhasil disimpan.'})
        except Exception as e:
            return JsonResponse({'success': False, 'message': f'Gagal menyimpan data: {str(e)}'})

class AlurpengaduanView(View):
    def get(self, request):
        data_alurpengaduan = AlurPengaduanService.get_alurpengaduan(jenis_kategori='alur pengaduan')
        
        data = {
            'dt_alurpengaduan': data_alurpengaduan,
        }
        return render(request, 'app/pengaduan/alurpengaduan.html', data)

class SurveyView(View):
    def get(self, request):
        data_survey = BeritaService.get_survey(jenis_kategori='survey')
        data_berita = BeritaService.get_berita(jenis_kategori='berita')

        data = {
            'dt_survey': data_survey,
            'dt_berita' : data_berita,
        }
        
        return render(request, 'app/pengaduan/survey.html', data)


