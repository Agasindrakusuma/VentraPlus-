from django.shortcuts import render, redirect
from django.contrib import messages
from django.views import View
from django.contrib.auth.hashers import check_password, make_password
from deiyaiplus_admin.models import creator
import uuid
from django.utils import timezone
from functools import wraps

class LoginView(View):
    def get(self, request):
        return render(request, 'app/auth_creator/login.html')

    def post(self, request):
        email = request.POST.get('email')
        password = request.POST.get('password')

        try:
            user = creator.objects.get(email=email)
            if check_password(password, user.password):
                request.session['creator_id'] = str(user.creator_id)
                return redirect('app:dashboard_creator')
            else:
                messages.error(request, "Password salah")
        except creator.DoesNotExist:
            messages.error(request, "Email tidak terdaftar")

        return render(request, 'app/auth_creator/login.html')


class RegisterView(View):
    def get(self, request):
        return render(request, 'app/auth_creator/register.html')

    def post(self, request):
        nama_creator = request.POST.get('nama_creator')
        email = request.POST.get('email')
        password = request.POST.get('password')
        tanggal_lahir = request.POST.get('tanggal_lahir')

        if creator.objects.filter(email=email).exists():
            messages.error(request, "Email sudah terdaftar.")
            return render(request, 'app/auth_creator/register.html')

        try:
            creator.objects.create(
                creator_id=str(uuid.uuid4()),
                nama_creator=nama_creator,
                email=email,
                password=make_password(password),
                tanggal_lahir=tanggal_lahir,
                tanggal_regestrasi=timezone.now(),
                status='active'
            )
            messages.success(request, "Registrasi berhasil. Silakan login.")
            return redirect('app:login_creator')
        except Exception as e:
            messages.error(request, f"Terjadi kesalahan: {e}")
            return render(request, 'app/auth_creator/register.html')


class LogoutCreatorView(View):
    def post(self, request):
        if 'creator_id' in request.session:
            del request.session['creator_id']
            messages.success(request, "Anda berhasil logout.")
        return redirect('app:login_creator')

