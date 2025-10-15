from django.shortcuts import render, redirect
from django.views import View
from deiyaiplus_admin.models import Master_User
from django.contrib import messages
from django.contrib.auth import login, authenticate, logout
from support.support_function import check_is_email
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator


class IndexView(View):
    def get(self, request):
        return render(request, 'admin/auth/form.html')
    
    def post(self, request):
        if not request.user.is_authenticated:
            email = request.POST.get('email')
            pwd = request.POST.get('password')

            is_email = check_is_email(email)
            if is_email:
                user = authenticate(request, email=email, password=pwd)
            else:
                try:
                    user = Master_User.objects.get(username = email, is_active = True)
                    if not user.check_password(pwd):
                        user = None
                except Exception as e:
                    user = None
            
            if user is not None:
                login(request, user)
                messages.success(request, f"Selamat datang {user.username}")
                print('login success')

                if request.GET.get('next') is not None:
                    print('login agas')
                    messages.success(request, f"Sealamat datanggggggg {user.username}")
                    return redirect(request.GET.get('next'))

                else:
                    messages.success(request, f"Login Berhasil")
                    return redirect('admin:index_admin_dashboard')
            else:
                messages.error(request, f"Login Gagal, masukkan data dengan benar!!")
                return redirect('admin:index_login')
        else:
            messages.success(request, f"Anda sudah login")
            return redirect('admin:index_admin_dashboard')

@method_decorator(login_required(), name='dispatch')
class LogoutViews(View):
    def post(self, request):
        logout_message = request.GET.get('logout_message', None)
        if logout_message is not None:
            messages.info(request, logout_message)

        logout(request)
        return redirect(request.META['HTTP_REFERER'])


