from django.urls import path, include
from django.conf.urls import url
from django.conf.urls.static import static
from django.conf import settings
from .views import views
from .views import profile
from .views import library
from .views import fitur
from .views import pengaduan
from .views import info
from .views import kontak
from deiyaiplus_app.views import ebook, ecerpen, karya
from deiyaiplus_app.views import login, creator
from deiyaiplus_app.views import creator_ecerpen, creator_ebook


# app_name ini berguna untuk memanggilan url jika kita butuhkan nanti di html
app_name = 'app'

urlpatterns = [
    
    path('login_creator/', login.LoginView.as_view(), name='login_creator'),
    path('register_creator/', login.RegisterView.as_view(), name='register_creator'),
    path('logout_creator/', login.LogoutCreatorView.as_view(), name='logout_creator'),
    path('dashboard_creator/', creator.CreatorDashboardView.as_view(), name='dashboard_creator'),
    path('creator/profile/', creator.ProfileView.as_view(), name='creator_profile'),
    path('creator/edit_profile/', creator.CreatorEditProfileView.as_view(), name='creator_edit_profile'),
    
    path('', views.IndexView.as_view(), name='index_app'),
    
    path('library/', library.LibraryView.as_view(), name='library_app'),
    
    path('profile/', include([
        path('sejarah/', profile.SejarahView.as_view(), name='sejarah_app'),
        path('visimisi/', profile.VisimisiView.as_view(), name='visimisi_app'),
        path('profile_pejabat/', profile.ProfilePetjabaView.as_view(), name='profile_pejabat_app'),
        path('kontak/', kontak.KontakView.as_view(), name='kontak_app'),
    ])),
    
    path('fitur/', include([
        path('ebook/', fitur.EbookView.as_view(), name='ebook_app'),
        path('ecerpen/', fitur.EcerpenView.as_view(), name='ecerpen_app'),
        path('karya/', fitur.KaryaView.as_view(), name='karya_app'),
        path('klinik/', fitur.KlinikView.as_view(), name='klinik_app'),
    ])),
    
    path('pengaduan/', include([
        path('alur/', pengaduan.AlurpengaduanView.as_view(), name='alurpengaduan_app'),
        path('form/', pengaduan.PengaduanView.as_view(), name='pengaduan_app'),
        path('survey/', pengaduan.SurveyView.as_view(), name='survey_app'),
    ])),
    
    path('info/', include([
        path('berita/', info.BeritaView.as_view(), name='berita_app'),
        path('berita_details/<slug:slug>/', info.BeritaDetailsView.as_view(), name='berita_details_app'),
        path('infografis/', info.InfografisView.as_view(), name='infografis_app'),
    ])),
    
    path('E-book/', include([
        path('AllBook/', ebook.AllbookView.as_view(), name='allbook_app'),
        path('Book-Details/<slug:slug>/', ebook.BookDetailsView.as_view(), name='book_details_app'),
    ])),
    
    path('E-cerpen/', include([
        path('AllCerpen/', ecerpen.AllCerpenView.as_view(), name='allcerpen_app'),
        path('Cerpen-Details/<slug:slug>/', ecerpen.CerpenDetailsView.as_view(), name='cerpen_details_app'),
    ])),
    
    path('Karya/Karya-Details/<slug:slug>/', karya.KaryaDetailsView.as_view(), name='karya_details_app'),
    
    path('Creator/E-Cerpen/', include([
        path('', creator_ecerpen.creator_ecerpen.as_view(), name='creator_index_ecerpen'),
        path('tambah-cerpen/', creator_ecerpen.TambahEcerpenCreator.as_view(), name='creator_tambah_ecerpen'),
        path('detail/<slug:slug>/', creator_ecerpen.DetailEcerpenView.as_view(), name='creator_detail_ecerpen'),
        path('edit/<slug:slug>/', creator_ecerpen.EditMasterEcerpenView.as_view(), name='creator_edit_ecerpen'),  
        path('hapus/<str:ecerpen_id>/', creator_ecerpen.HapusEcerpenView.as_view(), name='creator_hapus_ecerpen'),
        path('ajukan-ulang/', creator_ecerpen.AjukanUlangECerpenView.as_view(), name='ajukan_ulang_ecerpen'),

        ])),
    path('Creator/E-book/', include([
        path('', creator_ebook.Creator_ebook.as_view(), name='creator_index_ebook'),
        path('tambah-book/', creator_ebook.CreatorTambahEbookView.as_view(), name='creator_tambah_ebook'),
        path('detail/<str:ebook_id>/', creator_ebook.CreatorDetailEbookView.as_view(), name='creator_detail_ebook'),
        path('edit/<str:ebook_id>/', creator_ebook.CreatorEditEbookView.as_view(), name='creator_edit_ebook'),  
        path('hapus/<str:ebook_id>/', creator_ebook.CreatorHapusEbookView.as_view(), name='creator_hapus_ebook'),
        path('ajukan-ulang/', creator_ebook.AjukanUlangEbookView.as_view(), name='ajukan_ulang_ebook'),

        ])),
]
