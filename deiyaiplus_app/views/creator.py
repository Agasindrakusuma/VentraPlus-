from django.shortcuts import render, redirect
from django.views import View
from django.urls import reverse
from deiyaiplus_admin.models import creator, ebook, ecerpen
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import make_password
from django.utils.decorators import method_decorator
from django.shortcuts import get_object_or_404
from django.contrib import messages
from django.db import transaction

class CreatorDashboardView(View):
    def get(self, request):
        creator_id = request.session.get('creator_id')
        if not creator_id:
            return redirect('app:login_creator')

        try:
            user = creator.objects.get(creator_id=creator_id)
        except creator.DoesNotExist:
            return redirect('app:login_creator')

        jumlah_ebook = ebook.objects.filter(creator_id=creator_id, archived_at__isnull=True).count()
        jumlah_ecerpen = ecerpen.objects.filter(creator_id=creator_id, archived_at__isnull=True).count()
        jumlah_konten = jumlah_ebook + jumlah_ecerpen

        list_ebook = ebook.objects.filter(creator_id=creator_id, archived_at__isnull=True).order_by('-created_at')[:5]
        list_ecerpen = ecerpen.objects.filter(creator_id=creator_id, archived_at__isnull=True).order_by('-created_at')[:5]

        # Tambahkan atribut 'tipe' dan 'id' agar bisa dipakai di template
        for e in list_ebook:
            e.tipe = 'ebook'
            e.id = e.ebook_id

        for c in list_ecerpen:
            c.tipe = 'ecerpen'
            c.id = c.ecerpen_id

        list_konten = list(list_ebook) + list(list_ecerpen)
        list_konten = sorted(list_konten, key=lambda x: x.created_at, reverse=True)[:5]

        data = {
            'creator': user,
            'jumlah_ebook': jumlah_ebook,
            'jumlah_ecerpen': jumlah_ecerpen,
            'jumlah_konten': jumlah_konten,
            'list_konten': list_konten,
        }
        return render(request, 'app/creator/index.html', data)


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
class ProfileView(View):
    def get(self, request):
        creator_id = request.session.get('creator_id')
        creator_obj = creator.objects.filter(creator_id=creator_id).first()
        user = get_object_or_404(creator, creator_id=creator_id)
        
        data = {
            'user' : user,
            'creator': creator_obj,
        }
        
        return render(request, 'app/creator/profile.html', data)


@class_creator_login_required
class CreatorEditProfileView(View):
    def get(self, request):
        creator_id = request.session.get('creator_id')
        user = get_object_or_404(creator, creator_id=creator_id)
        creator_obj = creator.objects.filter(creator_id=creator_id).first()
        
        data = {
            'user' : user,
            'creator': creator_obj,
        }
        return render(request, 'app/creator/edit_profile.html', data)

    def post(self, request):
        creator_id = request.session.get('creator_id')
        user = get_object_or_404(creator, creator_id=creator_id)

        try:
            with transaction.atomic():
                user.nama_creator = request.POST.get('nama_creator')
                user.email = request.POST.get('email')
                user.tanggal_lahir = request.POST.get('tanggal_lahir') or None

                if request.FILES.get('user_image'):
                    user.images = request.FILES['user_image']

                password = request.POST.get('user_password')
                if password:
                    user.password = make_password(password)

                user.save()
                messages.success(request, 'Profil berhasil diperbarui.')
                return redirect('app:creator_profile')
        except Exception as e:
            print("Update error:", e)
            messages.error(request, 'Terjadi kesalahan saat memperbarui profil.')
            return redirect('app:creator_edit_profile')
