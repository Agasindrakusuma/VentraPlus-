from django.shortcuts import render, redirect
from django.conf.urls import url
from django.contrib import messages
from django.db import transaction
from django.shortcuts import get_object_or_404
from django.views import View
from django.utils import timezone
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from deiyaiplus_admin.models import Master_User, ROLE_CHOICES


@method_decorator(login_required(), name='dispatch')
class profile(View):
    def get(self, request):
        return render(request, 'admin/master/master_user/profile.html')
        
class master_user(View):
    def get(self, request):
        data_user = Master_User.objects.all()
        data ={
            'dt_user' : data_user
        }
        return render(request, 'admin/master/master_user/index.html', data)
       
# class TambahMasterUserView(View):
#     def get(self, request):
#         return render(request, 'admin/master/master_user/form.html')

@method_decorator(login_required(), name='dispatch')
class TambahMasterUserView(View):
    def get(self, request):
        
        dt_role = ROLE_CHOICES
        
        data = {
            'edit': False,
            'dt_role': dt_role
        }
        return render(request, 'admin/master/master_user/form.html', data)

    def post(self, request):
        frm_email = request.POST.get('user_email')
        frm_username = request.POST.get('user_name')
        frm_password = request.POST.get('user_password')
        frm_role = request.POST.get('frm_role')
        frm_tgl_lahir = request.POST.get('tanggal_lahir')
        images = request.FILES.get('user_image')
        
        print(request.POST)
        
        # messages.success(request, 'User berhasil ditambahkan.')
        # return redirect('admin:index_master_user')

        try:
            with transaction.atomic():
                user = Master_User.objects.create_user(
                    email=frm_email,
                    username=frm_username,
                    password=frm_password,
                    role=frm_role,
                    date_of_birth=frm_tgl_lahir,
                    images= request.FILES.get('user_image')
                )
                user.save()
                messages.success(request, 'User berhasil ditambahkan.')
                return redirect('admin:index_master_user')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal menambahkan user.')
            return redirect('admin:index_master_user')

@method_decorator(login_required(), name='dispatch')
class EditMasterUserView(View):
    def get(self, request, user_id):
        user = get_object_or_404(Master_User, user_id=user_id)
        dt_role = ROLE_CHOICES
        
        data = {
            'edit': True,
            'user': user,
            'dt_role': dt_role
        }
        return render(request, 'admin/master/master_user/form.html', data)

    def post(self, request, user_id):
        user = get_object_or_404(Master_User, user_id=user_id)
        
        frm_email = request.POST.get('user_email')
        frm_username = request.POST.get('user_name')
        # frm_role = request.POST.get('frm_role')
        frm_tgl_lahir = request.POST.get('tanggal_lahir')
        # frm_joined = request.POST.get('tanggal_joined')
        images = request.FILES.get('user_image')

        try:
            with transaction.atomic():
                user.email = frm_email
                user.username = frm_username
                # user.role = frm_role
                user.date_of_birth = frm_tgl_lahir
                # user.date_joined = frm_joined
                
                if images:  # Only update image if new one was provided
                    user.images = images
                
                user.save()
                messages.success(request, 'User berhasil diperbarui.')
                return redirect('admin:index_master_user')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memperbarui user.')
            return redirect('admin:index_master_user')

class EditProfileUserView(View):
    def get(self, request, user_id):
        user = get_object_or_404(Master_User, user_id=user_id)
        dt_role = ROLE_CHOICES
        
        data = {
            'edit': True,
            'user': user,
            'dt_role': dt_role
        }
        return render(request, 'admin/master/master_user/profile.html', data)

    def post(self, request, user_id):
        user = get_object_or_404(Master_User, user_id=user_id)
        
        frm_email = request.POST.get('user_email')
        frm_username = request.POST.get('user_name')
        # frm_role = request.POST.get('frm_role')
        frm_tgl_lahir = request.POST.get('tanggal_lahir')
        # frm_joined = request.POST.get('tanggal_joined')
        images = request.FILES.get('user_image')

        try:
            with transaction.atomic():
                user.email = frm_email
                user.username = frm_username
                # user.role = frm_role
                user.date_of_birth = frm_tgl_lahir
                # user.date_joined = frm_joined
                
                if images:  # Only update image if new one was provided
                    user.images = images
                
                user.save()
                messages.success(request, 'User berhasil diperbarui.')
                return redirect('admin:index_admin_dashboard')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memperbarui user.')
            return redirect('admin:index_admin_dashboard')

            
class ArchivedMasterUserView(View):
    def get(self, request, user_id):
        try:
            with transaction.atomic():
                user = Master_User.objects.get(user_id=user_id)
                user.is_active = False
                user.save()
                messages.success(request, 'User berhasil dihapus.')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal menghapus user.')
        return redirect('admin:index_master_user')

class RestoreMasterUserView(View):
    def get(self, request, user_id):
        try:
            with transaction.atomic():
                user = Master_User.objects.get(user_id=user_id)
                user.is_active = True
                user.save()
                messages.success(request, 'User berhasil dipulihkan.')
        except Exception as e:
            print('Error:', e)
            messages.error(request, 'Gagal memulihkan user.')
        return redirect('admin:index_master_user')