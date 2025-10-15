from django.urls import path
from django.conf.urls import include  # optional, tergantung penggunaan
from django.conf.urls import url
from .views import views
from .views import master_user
from .views import admin
from .views import login
from .views import master_profile
from .views import master_settings
from .views import master_partner
from .views import master_kategori
from .views import master_slider
from .views import ecerpen
from .views import ebook
from .views import karya
from .views import berita, pengaduan,laporan
from django.conf import settings
from django.conf.urls.static import static


app_name = 'admin'

urlpatterns = [

    path('admin_pemda/', admin.admin_pemda.as_view(), name='index_admin_pemda'),

    path('admin/', include([
        path('', admin.admin_dashboard.as_view(), name='index_admin_dashboard'),
    ])),

    path('master-user/', include([
        path('', master_user.master_user.as_view(), name='index_master_user'),
        path('profile/', master_user.profile.as_view(), name='index_profile'),
        path('tambah/', master_user.TambahMasterUserView.as_view(), name='tambah_master_user'),
        path('edit/<str:user_id>/', master_user.EditMasterUserView.as_view(), name='edit_master_user'),
        path('profile/edit/<str:user_id>/', master_user.EditProfileUserView.as_view(), name='edit_profile'),
        path('hapus/<str:user_id>/', master_user.ArchivedMasterUserView.as_view(), name='archive_master_user'),
        path('restore/<str:user_id>/', master_user.RestoreMasterUserView.as_view(), name='restore_master_user'),
    ])),     

    path('master-settings', include([
        path('', master_settings.Master_Settings.as_view(), name='index_master_settings'),
        path('tambah/', master_settings.TambahMasterSettingsView.as_view(), name='tambah_master_settings'),
        path('edit/<str:settings_id>/', master_settings.EditMasterSettingsView.as_view(), name='edit_master_settings'),
        path('arsip/', master_settings.ArsipDataMasterSettingsView.as_view(), name='arsip_master_settings'),
        path('arsip/<str:settings_id>/', master_settings.ArchiveMasterSettingsView.as_view(), name='archive_master_settings'),
        path('restore/<str:settings_id>/', master_settings.RestoreMasterSettingsView.as_view(), name='restore_master_settings'),
        path('hapus/<str:settings_id>/', master_settings.HapusMasterSettingsView.as_view(), name='hapus_master_settings'),
    ])),   
     
    path('master-partner/', include([
        path('', master_partner.master_partner.as_view(), name='index_master_partner'),
        path('tambah/', master_partner.TambahMasterPartnerView.as_view(), name='tambah_master_partner'),
        path('edit/<str:partner_id>/', master_partner.EditMasterPartnerView.as_view(), name='edit_master_partner'),
        path('arsip/', master_partner.ArsipDataMasterPartnerView.as_view(), name='arsip_master_partner'),
        path('arsip/<str:partner_id>/', master_partner.ArchiveMasterPartnerView.as_view(), name='archive_master_partner'),
        path('restore/<str:partner_id>/', master_partner.RestoreMasterPartnerView.as_view(), name='restore_master_partner'),
        path('hapus/<str:partner_id>/', master_partner.HapusMasterPartnerView.as_view(), name='hapus_master_partner'),
    ])),   
    path('master-profile/', include([
        path('', master_profile.master_profile.as_view(), name='index_master_profile'),
        path('tambah/', master_profile.TambahMasterProfileView.as_view(), name='tambah_master_profile'),
        path('edit/<str:profile_id>/', master_profile.EditMasterProfileView.as_view(), name='edit_master_profile'),
        path('arsip/', master_profile.ArsipDataMasterProfileView.as_view(), name='arsip_master_profile'),
        path('arsip/<str:profile_id>/', master_profile.ArchiveMasterProfileView.as_view(), name='archive_master_profile'),
        path('restore/<str:profile_id>/', master_profile.RestoreMasterProfileView.as_view(), name='restore_master_profile'),
        path('hapus/<str:profile_id>/', master_profile.HapusMasterProfileView.as_view(), name='hapus_master_profile'),

        # path('hapus/<str:user_id>/', master_profile.HapusMasterProfileView.as_view(), name='hapus_master_profile'),
    ])),   

    path('master-kategori/', include([
        path('', master_kategori.master_kategori.as_view(), name='index_master_kategori'),
        path('tambah/', master_kategori.TambahMasterKategoriView.as_view(), name='tambah_master_kategori'),
        path('edit/<str:kategori_id>/', master_kategori.EditMasterKategoriView.as_view(), name='edit_master_kategori'),
        path('arsip-data/', master_kategori.ArsipDataMasterkategoriView.as_view(), name='arsip_master_kategori'),
        path('arsip/<str:kategori_id>/', master_kategori.ArchiveMasterkategoriView.as_view(), name='archive_master_kategori'),
        path('restore/<str:kategori_id>/', master_kategori.RestoreMasterkategoriView.as_view(), name='restore_master_kategori'),
        path('hapus/<str:kategori_id>/', master_kategori.HapusMasterkategoriView.as_view(), name='hapus_master_kategori'),
    ])),   



    path('master-slider/', include([
        path('', master_slider.Slider.as_view(), name='index_master_slider'),
        path('tambah/', master_slider.TambahMasterSliderView.as_view(), name='tambah_master_slider'),
        path('edit/<str:slider_id>/', master_slider.EditMasterSliderView.as_view(), name='edit_master_slider'),
        path('arsip/', master_slider.ArsipDataMasterSliderView.as_view(), name='arsip_master_slider'),
        path('arsipkan/<str:slider_id>/', master_slider.ArchiveMasterSliderView.as_view(), name='archive_master_slider'),
        path('pulihkan/<str:slider_id>/', master_slider.RestoreMasterSliderView.as_view(), name='restore_master_slider'),
        path('hapus/<str:slider_id>/', master_slider.HapusMasterSliderView.as_view(), name='hapus_master_slider'),
    
    ])), 

        path('publikasi/', include([
        path('berita/', berita.BeritaView.as_view(), name='index_berita'),
        path('tambah/', berita.TambahBeritaView.as_view(), name='tambah_berita'),
        path('edit/<str:berita_id>/', berita.EditBeritaView.as_view(), name='edit_berita'),
        path('arsip/', berita.ArsipBeritaView.as_view(), name='arsip_berita'),
        path('arsipkan/<str:berita_id>', berita.ArchiveBeritaView.as_view(), name='archive_berita'),
        path('restore/<str:berita_id>', berita.RestoreBeritaView.as_view(), name='restore_berita'),
        path('hapus/<str:berita_id>', berita.HapusBeritaView.as_view(), name='hapus_berita'),

    ])), 


    path('e-cerpen/', include([
        path('', ecerpen.e_cerpen.as_view(), name='index_e_cerpen'),
        path('tambah-cerpen/', ecerpen.TambahEcerpenView.as_view(), name='tambah_e_cerpen'),
        path('detail/<str:ecerpen_id>/', ecerpen.DetailEcerpenView.as_view(), name='detail_e_cerpen'),  
        path('edit/<str:ecerpen_id>/', ecerpen.EditMasterEcerpenView.as_view(), name='edit_e_cerpen'),  
        path('arsip/', ecerpen.ArsipEcerpenView.as_view(), name='arsip_e_cerpen'),
        path('arsip/<str:ecerpen_id>/', ecerpen.ArchiveEcerpeniView.as_view(), name='archive_e_cerpen'),
        path('restore/<str:ecerpen_id>/', ecerpen.RestoreEcerpeniView.as_view(), name='restore_e_cerpen'),
        path('hapus/<str:ecerpen_id>/', ecerpen.HapusEcerpenView.as_view(), name='hapus_e_cerpen'),
        path('tolak/', ecerpen.TolakECerpenView.as_view(), name='tolak_e_cerpen'),
        path('terverifikasi/', ecerpen.VerifikasiECerpenView.as_view(), name='verifikasi_e_cerpen'),
        path('batalkan-penolakan/', ecerpen.BatalTolakECerpenView.as_view(), name='batal_tolak_e_cerpen'),
        path('batalkan-verifikasi/', ecerpen.BatalVerifikasiECerpenView.as_view(), name='batal_verifikasi_e_cerpen'),
        ])),

    path('e-book/', include([
        path('', ebook.e_book.as_view(), name='index_e_book'),
        path('tambah-book/', ebook.TambahEbookView.as_view(), name='tambah_e_book'),
        path('detail/<str:ebook_id>/', ebook.DetailEbookView.as_view(), name='detail_e_book'),
        path('edit/<str:ebook_id>/', ebook.EditEbookView.as_view(), name='edit_e_book'),  
        path('arsip/', ebook.ArsipEbookView.as_view(), name='arsip_e_book'),
        path('arsip/<str:ebook_id>/', ebook.ArchiveEbookView.as_view(), name='archive_e_book'),
        path('restore/<str:ebook_id>/', ebook.RestoreEbookiView.as_view(), name='restore_e_book'),
        path('hapus/<str:ebook_id>/', ebook.HapusEbookView.as_view(), name='hapus_e_book'),
        path('tolak/', ebook.TolakEbookView.as_view(), name='tolak_e_book'),
        path('terverifikasi/', ebook.VerifikasiEbookView.as_view(), name='verifikasi_e_book'),
        path('batalkan-penolakan/', ebook.BatalTolakEbookView.as_view(), name='batal_tolak_e_book'),
        path('batalkan-verifikasi/', ebook.BatalVerifikasiEbookView.as_view(), name='batal_verifikasi_e_book'),

    ])),

    path('karya/', include([
        path('', karya.KaryaView.as_view(), name='index_karya'),
        path('tambah-karya/', karya.TambahKaryaView.as_view(), name='tambah_karya'),
        path('edit/<str:karya_id>/', karya.EditKaryaView.as_view(), name='edit_karya'),  
        path('detail/<str:karya_id>/', karya.DetailKaryaView.as_view(), name='detail_karya'),
        path('arsip/', karya.ArsipKaryaView.as_view(), name='arsip_karya'),
        path('arsip/<str:karya_id>/', karya.ArchiveKaryaView.as_view(), name='archive_karya'),
        path('restore/<str:karya_id>/', karya.RestoreKaryaiView.as_view(), name='restore_karya'),
        path('hapus/<str:karya_id>/', karya.HapusKaryaView.as_view(), name='hapus_karya'),
        path('change/<str:konten_karya_id>', karya.ChangeGalleryFileView.as_view(), name='change_gallery_file'),
        path('delete/<str:konten_karya_id>', karya.DeleteGalleryFileView.as_view(), name='delete_gallery_file'),


    ])),

    path('pengaduan/', include([
        path('', pengaduan.PengaduanViewIndex.as_view(), name = 'index_pengaduan'),
        path('arsip/', pengaduan.ArsipDataPengaduanView.as_view(), name = 'arsip_index_pengaduan'),
        path('arsip/<str:pengaduan_id>/', pengaduan.ArchivePengaduanView.as_view(), name = 'archive_index_pengaduan'),
        path('restore/<str:pengaduan_id>/', pengaduan.RestorePengaduanView.as_view(), name = 'restore_index_pengaduan'),
        path('hapus/<str:pengaduan_id>/', pengaduan.HapusPengaduanView.as_view(), name = 'hapus_index_pengaduan'),
        path('details/<str:pengaduan_id>/', pengaduan.DetailsPengaduanView.as_view(), name = 'details_index_pengaduan'),
        path('balas/<str:pengaduan_id>/', pengaduan.BalasViaWAView.as_view(), name='balas_index_pengaduan'),
        # path('balas/<str:pengaduan_id>/', pengaduan.BalasPengaduanView.as_view(), name='balas_index_pengaduan'),

    ])),

    path('laporan/', include([
    path('', laporan.LaporanView.as_view(), name = 'laporan'),
    ])),

    path('login/', login.IndexView.as_view(), name = 'index_login'),
    path('logout/', login.LogoutViews.as_view(), name = 'logout'),

]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)