from django.shortcuts import redirect
from functools import wraps
from django.utils.decorators import method_decorator

def creator_login_required(view_func):
    @wraps(view_func)
    def wrapper(request, *args, **kwargs):
        if 'creator_id' not in request.session:
            return redirect('app:login_creator')  # ganti dengan URL login creator kamu
        return view_func(request, *args, **kwargs)
    return wrapper

# Untuk class-based views agar bisa dipakai langsung sebagai decorator
def class_creator_login_required(cls):
    cls.dispatch = method_decorator(creator_login_required)(cls.dispatch)
    return cls
