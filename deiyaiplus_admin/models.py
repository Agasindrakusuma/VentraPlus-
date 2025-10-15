# Create your models here.
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.utils.text import slugify
from taggit.managers import TaggableManager
from taggit.models import GenericUUIDTaggedItemBase, TaggedItemBase
from django.utils.translation import gettext_lazy as _
from django.utils import timezone
from django.core.validators import FileExtensionValidator
import random
import string

ROLE_CHOICES = [
    ('super_admin', 'super admin'),
    ('admin_pemda', 'admin Pemda'),
    ('admin_dinas', 'admin dinas'),
    ('admin_sekolah', 'admin sekolah'),
    ('operator', 'operator'),
]
TIPE_CHOICES= [
    ('visi', 'Visi'),
    ('misi', 'Misi'),
    ('sejarah', 'Sejarah'),
    ('sambutan', 'Sambutan'),
    ('pejabat', 'Pejabat'),
    ('kontak', 'Kontak'),
    ]

KATEGORI_CHOICES= [
    ('ecerpen', 'E-Cerpen'),
    ('ebook', 'E-Book'),
    ('karya', 'Karya'),
    ('berita', 'Berita'),
    ('pengaduan', 'Pengaduan'),
    ('infografis', 'Infografis'),
    ('alur pengaduan', 'Alur Pengaduan'),
    ('fitur', 'Fitur'),
    ('survey', 'Survey'),
]

JENJANG_CHOICES= [
    ('sd', 'SD'),
    ('smp', 'SMP'),
    ('sma', 'SMA/SEDERAJAT'),
]

JENIS_PELAPOR_CHOICES= [
    ('perorangan', 'Perorangan'),
    ('instansi', 'Instansi'),
]

KAT_PENGADUAN_CHOICES= [
    ('pelayanan', 'Pelayanan'),
    ('informasi', 'Informasi'),
    ('instansi', 'Instansi'),
    ('masukan_saran', 'Masukan dan Saran'),
]
BATAS_USIA_CHOICES = [
    ('Semua Umur', 'Semua Umur'),
    ('13+', '13 Tahun ke Atas'),
    ('17+', '17 Tahun ke Atas'),
    ('18+', '18 Tahun ke Atas'),
]

class TaggedItem(GenericUUIDTaggedItemBase, TaggedItemBase):
    class Meta:
        verbose_name = _("Tag")
        verbose_name_plural = _("Tags")


#slug berita
def rand_slug():
    return ''.join(random.choice('abcdefghijklmnopqrstuvwxyz0123456789') for _ in range(6))



#uuid ini berfungsi untuk membuat randon id untuk primary key di setiap table
import uuid

class AccountManager(BaseUserManager):
    use_in_migrations = True

    def _create_user(self, email, username, password, **extra_fields):
        values = [email, username,]
        field_value_map = dict(zip(self.model.REQUIRED_FIELDS, values))
        for field_name, value in field_value_map.items():
            if not value:
                raise ValueError('The {} value must be set'.format(field_name))

        email = self.normalize_email(email)
        user = self.model(
            email=email,
            username=username,            
            **extra_fields
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email, username, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', False)
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(email, username, password, **extra_fields)

    def create_superuser(self, email, username, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_verified', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')
        if extra_fields.get('is_verified') is not True:
            raise ValueError('Superuser must have is_verified=True.')

        return self._create_user(email, username, password, **extra_fields)

class Master_User(AbstractBaseUser):
    user_id = models.TextField(primary_key=True, default=uuid.uuid4, editable=False, unique=True)
    email = models.EmailField(unique=True)
    username = models.CharField(unique=True, max_length=100)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_verified = models.BooleanField(default=False)
    date_joined = models.DateTimeField(default=timezone.now)
    date_of_birth = models.DateField(blank=True, null=True)
    images = models.ImageField(blank=True, null=True, upload_to='images/avatar/')
    role = models.CharField(max_length=50, choices=ROLE_CHOICES)
    objects = AccountManager()

    #username_field dan required_fields ini untuk menentukan field yang akan di isi saat kita ingin menginputkan user melalui cmd. 
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'role', 'is_superuser']



class StampIdentify(models.Model):
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(auto_now=True)
    deleted_at = models.DateTimeField(null=True, blank=True)
    archived_at = models.DateTimeField(null=True, blank=True, default=None)
    status_at = models.CharField(max_length=255, null=True, blank=True)
    created_by = models.ForeignKey('Master_User', on_delete=models.RESTRICT, null=True, blank=True, related_name='created_%(class)s')
    updated_by = models.ForeignKey('Master_User', on_delete=models.RESTRICT, null=True, blank=True, related_name='updated_%(class)s')
    deleted_by = models.ForeignKey('Master_User', on_delete=models.RESTRICT, null=True, blank=True, related_name='deleted_%(class)s')
    archived_by = models.ForeignKey('Master_User', on_delete=models.RESTRICT, null=True, blank=True, related_name='archived_%(class)s')
    status_by = models.ForeignKey('Master_User', on_delete=models.RESTRICT, null=True, blank=True, related_name='status_%(class)s')

    class Meta:
        abstract = True


class profile(StampIdentify):
    profile_id = models.TextField(primary_key=True, default=uuid.uuid4, editable=False, unique=True)
    tipe = models.CharField(max_length=50, choices=TIPE_CHOICES)
    deskripsi = models.TextField(max_length=255)
    images = models.ImageField(blank=True, null=True, upload_to='images/Profile/')


class partner(StampIdentify):
    partner_id = models.TextField(primary_key=True, default=uuid.uuid4, editable=False, unique=True)
    nama = models.CharField(max_length=255)
    images = models.ImageField(blank=True, null=True, upload_to='images/partner/')
    judul_patner = models.CharField(max_length=255)
    link = models.CharField(max_length=255)

class settings(StampIdentify):
    settings_id = models.TextField(primary_key=True, default=uuid.uuid4, editable=False, unique=True)
    nama_aplikasi  = models.CharField(max_length=255)
    deskripsi_aplikasi  = models.TextField(max_length=255)
    barcode = models.ImageField(blank=True, null=True, upload_to='images/settings/barcode/')
    logo = models.ImageField(blank=True, null=True, upload_to='images/settings/logo/')
    alamat = models.TextField(max_length=255)
    kontak = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    link_maps = models.CharField(max_length=1024, null=True, blank=True)


class kategori(StampIdentify):
    kategori_id = models.TextField(primary_key=True, default=uuid.uuid4, editable=False, unique=True)
    nama_kategori = models.CharField(max_length=255)
    sub_kategori = models.TextField(max_length=255)
    jenis_kategori = models.TextField(max_length=255, choices=KATEGORI_CHOICES)

class berita(StampIdentify):
    berita_id = models.TextField(primary_key=True, default=uuid.uuid4, editable=False, unique=True)
    judul = models.CharField(max_length=255)
    images = models.ImageField(blank=True, null=True, upload_to='berita/')
    tag = TaggableManager(through=TaggedItem)   
    slug = models.SlugField(max_length=255, unique=True)
    deskripsi_berita = models.TextField(max_length=255)
    kategori_id = models.ForeignKey(kategori, on_delete=models.RESTRICT, null=True, blank=True)

    def __init__(self, *args, **kwargs):
        super(berita, self).__init__(*args, **kwargs)
        self.old_title = getattr(self, 'judul', '')
        
    def save(self, *args, **kwargs):
        if not self.berita_id or self.old_title != self.judul:
            slug = slugify(self.judul)
            counter = 1
            original_slug = slug
            
            while True:
                try:
                    # Check if slug exists for other records
                    if self.berita_id:
                        exists = berita.objects.filter(slug=slug).exclude(berita_id=self.berita_id).exists()
                    else:
                        exists = berita.objects.filter(slug=slug).exists()
                        
                    if not exists:
                        break
                        
                    slug = f"{original_slug}-{counter}"
                    counter += 1
                except Exception:
                    break
                    
            self.slug = slug
            
        super(berita, self).save(*args, **kwargs)

class creator(StampIdentify):
    creator_id = models.TextField(primary_key=True, default=uuid.uuid4, editable=False, unique=True)
    nama_creator = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    images = models.ImageField(blank=True, null=True, upload_to='creator/')
    password = models.CharField(max_length=255)
    tanggal_lahir = models.DateTimeField(blank=True, null=True)
    tanggal_regestrasi = models.DateTimeField(blank=True, null=True)
    status = models.CharField(max_length=50, default='draft')
    images = models.ImageField(blank=True, null=True, upload_to='images/Profile/')

class ecerpen(StampIdentify):
    ecerpen_id = models.TextField(primary_key=True, default=uuid.uuid4, editable=False, unique=True)
    judul = models.TextField(max_length=255)
    sinopsis = models.TextField(max_length=255)
    cover = models.ImageField(blank=True, null=True, upload_to='ecerpen')
    path_ecerpen = models.FileField (upload_to='images/ecerpen/', default='ecerpen/default.pdf')
    penulis = models.TextField(max_length=255)
    tanggal_verifikasi = models.DateTimeField(blank=True, null=True)
    batas_usia = models.CharField(max_length=10, choices=BATAS_USIA_CHOICES, default='Semua Umur')
    alasan_penolakan = models.TextField(max_length=255, null=True, blank=True)
    tanggal_publikasi = models.DateTimeField(default=timezone.now)
    slug = models.SlugField(max_length=255, unique=True, null=True, blank=True)
    durasi_baca = models.CharField(max_length=255)
    status = models.CharField(max_length=50, default='draft')
    kategori_id = models.ForeignKey(kategori, on_delete=models.RESTRICT, null=True, blank=True)
    user_id = models.ForeignKey(Master_User, on_delete=models.RESTRICT, null=True, blank=True)
    creator = models.ForeignKey(creator, on_delete=models.RESTRICT, null=True, blank=True)
    
    def __str__(self):
        return self.judul

    def __init__(self, *args, **kwargs):
        super(ecerpen, self).__init__(*args, **kwargs)
        self.old_judul = getattr(self, 'judul', None)

    def save(self, *args, **kwargs):
        if not self.slug or self.old_judul != self.judul:
            base_slug = slugify(self.judul)
            slug = base_slug
            counter = 1

            while ecerpen.objects.filter(slug=slug).exclude(pk=self.pk).exists():
                slug = f"{base_slug}-{counter}"
                counter += 1

            self.slug = slug

        super(ecerpen, self).save(*args, **kwargs)
        self.old_judul = self.judul  

class ebook(StampIdentify):
    ebook_id = models.TextField(primary_key=True, default=uuid.uuid4, editable=False, unique=True)
    judul = models.TextField(max_length=255)
    sinopsis_ebook = models.TextField(max_length=255)
    cover = models.ImageField(blank=True, null=True, upload_to='ebook')
    path_ebook = models.FileField (upload_to='images/ebook', default='ebook/default.pdf')
    penulis = models.TextField(max_length=255)
    batas_usia = models.CharField(max_length=10, choices=BATAS_USIA_CHOICES, default='Semua Umur')
    tahun_terbit = models.DateField(blank=True, null=True)
    tanggal_verifikasi = models.DateTimeField(blank=True, null=True)
    tanggal_publikasi = models.DateTimeField(default=timezone.now)
    alasan_penolakan = models.TextField(max_length=255, null=True, blank=True)
    slug = models.SlugField(max_length=255, unique=True, null=True, blank=True)
    durasi_baca = models.CharField(max_length=255)
    bahasa = models.CharField(max_length=225, default='id')
    status = models.CharField(max_length=50, default='draft')
    kategori_id = models.ForeignKey(kategori, on_delete=models.RESTRICT, null=True, blank=True)
    user_id = models.ForeignKey(Master_User, on_delete=models.RESTRICT, null=True, blank=True)
    creator = models.ForeignKey(creator, on_delete=models.RESTRICT, null=True, blank=True)
    
    def __str__(self):
        return self.judul

    def __init__(self, *args, **kwargs):
        super(ebook, self).__init__(*args, **kwargs)
        self.old_judul = getattr(self, 'judul', None)

    def save(self, *args, **kwargs):
        if not self.slug or self.old_judul != self.judul:
            base_slug = slugify(self.judul)
            slug = base_slug
            counter = 1

            while ebook.objects.filter(slug=slug).exclude(pk=self.pk).exists():
                slug = f"{base_slug}-{counter}"
                counter += 1

            self.slug = slug

        super(ebook, self).save(*args, **kwargs)
        self.old_judul = self.judul  

class karya(StampIdentify):
    karya_id = models.TextField(primary_key=True, default=uuid.uuid4, editable=False, unique=True)
    judul_karya = models.CharField(max_length=255)
    deskripsi_karya = models.TextField(max_length=255)
    status = models.CharField(max_length=50, default='draft', null=True, blank=True)
    kategori_id = models.ForeignKey(kategori, on_delete=models.RESTRICT, null=True, blank=True)
    user_id = models.ForeignKey(Master_User, on_delete=models.RESTRICT, null=True, blank=True)
    slug = models.SlugField(max_length=255, unique=True, null=True, blank=True)
    
    def __str__(self):
        return self.judul_karya

    def __init__(self, *args, **kwargs):
        super(karya, self).__init__(*args, **kwargs)
        self.old_judul_karya = getattr(self, 'judul_karya', None)

    def save(self, *args, **kwargs):
        if not self.slug or self.old_judul_karya != self.judul_karya:
            base_slug = slugify(self.judul_karya)
            slug = base_slug
            counter = 1

            while karya.objects.filter(slug=slug).exclude(pk=self.pk).exists():
                slug = f"{base_slug}-{counter}"
                counter += 1

            self.slug = slug

        super(karya, self).save(*args, **kwargs)
        self.old_judul_karya = self.judul_karya

    @property
    def cover(self):
        """Mengambil file cover (file dengan nama diawali 'cover_')"""
        return self.konten_karya_set.filter(nama_file__startswith='cover_').first()
    
    @property
    def gallery_files(self):
        """Mengambil semua file gallery (file dengan nama diawali 'gallery_')"""
        return self.konten_karya_set.filter(nama_file__startswith='gallery_')
    
class konten_karya(models.Model):
    konten_karya_id = models.TextField(primary_key=True, default=uuid.uuid4, editable=False, unique=True)
    nama_file = models.CharField(max_length=255)
    jenis_file = models.TextField(max_length=255)
    link = models.CharField(max_length=255)
    karya_id = models.ForeignKey(karya, on_delete=models.CASCADE, null=True, blank=True)  
    file = models.FileField(
        upload_to='karya',
        validators=[FileExtensionValidator(allowed_extensions=[
            'jpg', 'jpeg', 'png', 'gif', 'mp4', 'pdf', 'doc', 'docx'
        ])]
    )

class pengaduan(StampIdentify):
    pengaduan_id = models.TextField(primary_key=True, default=uuid.uuid4, editable=False, unique=True)
    nama_pengadu = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    nik = models.CharField(max_length=20, blank=True)
    no_whatsapp = models.CharField(max_length=20, blank=True)
    deskripsi_pengaduan = models.TextField(max_length=255)
    jenis_pelapor = models.CharField(max_length=255, choices=JENIS_PELAPOR_CHOICES, null=True, blank=True)
    read_status = models.BooleanField(default=False)
    replay_status = models.CharField(max_length=255, default='pending')
    kategori_pengaduan = models.CharField(max_length=255, choices=KAT_PENGADUAN_CHOICES, null=True, blank=True)


class slider(StampIdentify):
    slider_id = models.TextField(primary_key=True, default=uuid.uuid4, editable=False, unique=True)
    judul_slider = models.CharField(max_length=255)
    sub_judul_slider = models.CharField(max_length=255)
    tampilan_judul = models.CharField(max_length=255)
    background_slider = models.ImageField(blank=True, null=True, upload_to='images/slider/background/')
    elemen_gambar = models.ImageField(blank=True, null=True, upload_to='images/slider/elemen/')
    is_video_background = models.BooleanField(default=False)  # Field baru untuk menandai apakah background adalah video
    link = models.CharField(max_length=255)

