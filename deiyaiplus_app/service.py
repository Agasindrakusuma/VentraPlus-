from deiyaiplus_admin.models import slider, ecerpen, ebook, karya
from deiyaiplus_admin.models import profile, partner, kategori, berita, settings
from django.db.models import Count

# slider
class SliderService:
    model = slider

    @classmethod
    def get_slider_all(cls):
        return cls.model.objects.filter(archived_at__isnull=True)

    # @classmethod
    # def get_porto_kategori(cls, kategori):
    #     return cls.model.objects.filter(kategori__nama=kategori)

# profile
class ProfileService:
    model = profile

    @classmethod
    def get_profile(cls):
        return cls.model.objects.filter(archived_at__isnull=True, tipe='sambutan')
    @classmethod
    def get_sejarah(cls):
        return cls.model.objects.filter(archived_at__isnull=True, tipe='sejarah')
    @classmethod
    def get_visi(cls):
        return cls.model.objects.filter(archived_at__isnull=True, tipe='visi')
    @classmethod
    def get_misi(cls):
        return cls.model.objects.filter(archived_at__isnull=True, tipe='misi')
    @classmethod
    def get_pejabat(cls):
        return cls.model.objects.filter(archived_at__isnull=True, tipe='pejabat')

# patner
class PatnerService:
    model = partner

    @classmethod
    def get_patner(cls):
        return cls.model.objects.filter(archived_at__isnull=True)

# kategori
class KategoriPengaduan:
    model = kategori

    @classmethod
    def get_KategoriPengaduan(cls):
        return cls.model.objects.filter(archived_at__isnull=True, jenis_kategori='pengaduan')
    
    @classmethod
    def get_ListKategori(cls):
        return cls.model.objects.filter(archived_at__isnull=True, jenis_kategori='ecerpen')

# berita
class BeritaService:
    model = berita
    
    @classmethod
    def get_fitur(cls, jenis_kategori=None):
        queryset = cls.model.objects.filter(archived_at__isnull=True)

        if jenis_kategori:
            queryset = queryset.filter(kategori_id__jenis_kategori=jenis_kategori)

        return queryset

    @classmethod
    def get_berita(cls, jenis_kategori=None):
        queryset = cls.model.objects.filter(
            archived_at__isnull=True
        ).order_by('-created_at')

        if jenis_kategori:
            queryset = queryset.filter(kategori_id__jenis_kategori=jenis_kategori)

        return queryset
    
    @classmethod
    def get_beritadetails(cls, jenis_kategori=None):
        queryset = cls.model.objects.filter(
            archived_at__isnull=True
        ).order_by('-created_at')

        if jenis_kategori:
            queryset = queryset.filter(kategori_id__jenis_kategori=jenis_kategori)

        return queryset
    
    @classmethod
    def get_infografis(cls, jenis_kategori=None):
        queryset = cls.model.objects.filter(
            archived_at__isnull=True
        ).order_by('-created_at')

        if jenis_kategori:
            queryset = queryset.filter(kategori_id__jenis_kategori=jenis_kategori)

        return queryset
    
    @classmethod
    def get_survey(cls, jenis_kategori=None):
        queryset = cls.model.objects.filter(archived_at__isnull=True)

        if jenis_kategori:
            queryset = queryset.filter(kategori_id__jenis_kategori=jenis_kategori)

        return queryset

# settings
class KontakKami:
    model = settings

    @classmethod
    def get_KontakKami(cls):
        return cls.model.objects.filter(archived_at__isnull=True)

class AlurPengaduanService:
    model = berita
    
    @classmethod
    def get_alurpengaduan(cls, jenis_kategori=None):
        queryset = cls.model.objects.filter(archived_at__isnull=True)

        if jenis_kategori:
            queryset = queryset.filter(kategori_id__jenis_kategori=jenis_kategori)

        return queryset

# ecerpen
class EcerpenService:
    model = ecerpen

    @classmethod
    def get_ecerpen(cls):
        return cls.model.objects.filter(
            archived_at__isnull=True,
            tanggal_verifikasi__isnull=False
        ).order_by('-created_at')
        
    @classmethod
    def get_ecerpen_per_kategori(cls):
        return cls.model.objects.filter(
            archived_at__isnull=True,
            tanggal_verifikasi__isnull=False,
            kategori_id__isnull=False
        ).values('kategori_id__nama_kategori').annotate(total=Count('ecerpen_id'))
    
    @classmethod
    def get_ecerpenanak(cls, nama_kategori=None):
        queryset = cls.model.objects.filter(
            archived_at__isnull=True,
            tanggal_verifikasi__isnull=False
            ).order_by('-created_at')

        if nama_kategori:
            queryset = queryset.filter(kategori_id__nama_kategori=nama_kategori)

        return queryset
    
    @classmethod
    def get_ecerpenmoral(cls, nama_kategori=None):
        queryset = cls.model.objects.filter(
            archived_at__isnull=True,
            tanggal_verifikasi__isnull=False
            ).order_by('-created_at')

        if nama_kategori:
            queryset = queryset.filter(kategori_id__nama_kategori=nama_kategori)

        return queryset
    
    @classmethod
    def get_ecerpenbudaya(cls, nama_kategori=None):
        queryset = cls.model.objects.filter(
            archived_at__isnull=True,
            tanggal_verifikasi__isnull=False
            ).order_by('-created_at')

        if nama_kategori:
            queryset = queryset.filter(kategori_id__nama_kategori=nama_kategori)

        return queryset
    

#ebook
class EbookService:
    model = ebook

    @classmethod
    def get_ebook(cls):
        return cls.model.objects.filter(
            archived_at__isnull=True,
            tanggal_verifikasi__isnull=False
        ).order_by('-created_at')
    
    
    @classmethod
    def get_ebook_per_kategori(cls):
        return cls.model.objects.filter(
            archived_at__isnull=True,
            tanggal_verifikasi__isnull=False,
            kategori_id__isnull=False
        ).values('kategori_id__nama_kategori').annotate(total=Count('ebook_id'))
    

    @classmethod
    def get_ebooksejarah(cls, nama_kategori=None):
        queryset = cls.model.objects.filter(
            archived_at__isnull=True,
            tanggal_verifikasi__isnull=False
            ).order_by('-created_at')

        if nama_kategori:
            queryset = queryset.filter(kategori_id__nama_kategori=nama_kategori)

        return queryset
    

    @classmethod
    def get_ebookbudaya(cls, nama_kategori=None):
        queryset = cls.model.objects.filter(
            archived_at__isnull=True,
            tanggal_verifikasi__isnull=False
            ).order_by('-created_at')

        if nama_kategori:
            queryset = queryset.filter(kategori_id__nama_kategori=nama_kategori)

        return queryset
    

    @classmethod
    def get_ebookkerohanian(cls, nama_kategori=None):
        queryset = cls.model.objects.filter(
            archived_at__isnull=True,
            tanggal_verifikasi__isnull=False
            ).order_by('-created_at')

        if nama_kategori:
            queryset = queryset.filter(kategori_id__nama_kategori=nama_kategori)

        return queryset
    

class KaryaService:
    model = karya

    @classmethod
    def get_karya_per_kategori(cls):
        return cls.model.objects.filter(
            archived_at__isnull=True,
            kategori_id__isnull=False
        ).values('kategori_id__nama_kategori').annotate(total=Count('karya_id'))

    @classmethod
    def get_karya(cls):
        return cls.model.objects.filter(
            archived_at__isnull=True,
        ).order_by('-created_at')
    
    @classmethod
    def get_karya_populer(cls):
        return cls.model.objects.filter(archived_at__isnull=True).order_by('-created_at')[:2]
    

    
