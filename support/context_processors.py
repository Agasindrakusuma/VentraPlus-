from deiyaiplus_admin.models import settings

def footer(request):
    try:
        data = settings.objects.filter(archived_at__isnull=True).first()
    except settings.DoesNotExist:
        data = None
        
    return {
        'alamat': data.alamat if data else '',
        'kontak': data.kontak if data else '',
        'email': data.email if data else '',
    }