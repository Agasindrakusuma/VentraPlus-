--
-- PostgreSQL database dump
--

-- Dumped from database version 13.20
-- Dumped by pg_dump version 13.20

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: deiyaiplus_admin_berita; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_berita (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    archived_at timestamp with time zone,
    status_at character varying(255),
    berita_id text NOT NULL,
    judul character varying(255) NOT NULL,
    images character varying(100),
    slug character varying(255) NOT NULL,
    deskripsi_berita text NOT NULL,
    archived_by_id text,
    created_by_id text,
    deleted_by_id text,
    kategori_id_id text,
    status_by_id text,
    updated_by_id text
);


ALTER TABLE public.deiyaiplus_admin_berita OWNER TO postgres;

--
-- Name: deiyaiplus_admin_creator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_creator (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    archived_at timestamp with time zone,
    status_at character varying(255),
    creator_id text NOT NULL,
    nama_creator character varying(255) NOT NULL,
    email character varying(254) NOT NULL,
    password character varying(255) NOT NULL,
    tanggal_lahir timestamp with time zone,
    tanggal_regestrasi timestamp with time zone,
    status character varying(50) NOT NULL,
    images character varying(100),
    archived_by_id text,
    created_by_id text,
    deleted_by_id text,
    status_by_id text,
    updated_by_id text
);


ALTER TABLE public.deiyaiplus_admin_creator OWNER TO postgres;

--
-- Name: deiyaiplus_admin_ebook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_ebook (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    archived_at timestamp with time zone,
    status_at character varying(255),
    ebook_id text NOT NULL,
    judul text NOT NULL,
    sinopsis_ebook text NOT NULL,
    cover character varying(100),
    path_ebook character varying(100) NOT NULL,
    penulis text NOT NULL,
    batas_usia character varying(10) NOT NULL,
    tahun_terbit date,
    tanggal_verifikasi timestamp with time zone,
    tanggal_publikasi timestamp with time zone NOT NULL,
    alasan_penolakan text,
    slug character varying(255),
    durasi_baca character varying(255) NOT NULL,
    bahasa character varying(225) NOT NULL,
    status character varying(50) NOT NULL,
    archived_by_id text,
    created_by_id text,
    creator_id text,
    deleted_by_id text,
    kategori_id_id text,
    status_by_id text,
    updated_by_id text,
    user_id_id text
);


ALTER TABLE public.deiyaiplus_admin_ebook OWNER TO postgres;

--
-- Name: deiyaiplus_admin_ecerpen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_ecerpen (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    archived_at timestamp with time zone,
    status_at character varying(255),
    ecerpen_id text NOT NULL,
    judul text NOT NULL,
    sinopsis text NOT NULL,
    cover character varying(100),
    path_ecerpen character varying(100) NOT NULL,
    penulis text NOT NULL,
    tanggal_verifikasi timestamp with time zone,
    batas_usia character varying(10) NOT NULL,
    alasan_penolakan text,
    tanggal_publikasi timestamp with time zone NOT NULL,
    slug character varying(255),
    durasi_baca character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    archived_by_id text,
    created_by_id text,
    creator_id text,
    deleted_by_id text,
    kategori_id_id text,
    status_by_id text,
    updated_by_id text,
    user_id_id text
);


ALTER TABLE public.deiyaiplus_admin_ecerpen OWNER TO postgres;

--
-- Name: deiyaiplus_admin_karya; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_karya (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    archived_at timestamp with time zone,
    status_at character varying(255),
    karya_id text NOT NULL,
    judul_karya character varying(255) NOT NULL,
    deskripsi_karya text NOT NULL,
    status character varying(50),
    archived_by_id text,
    created_by_id text,
    deleted_by_id text,
    kategori_id_id text,
    status_by_id text,
    updated_by_id text,
    user_id_id text,
    slug character varying(255)
);


ALTER TABLE public.deiyaiplus_admin_karya OWNER TO postgres;

--
-- Name: deiyaiplus_admin_katalog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_katalog (
    created_at character varying(255),
    updated_at character varying(255),
    deleted_at character varying(255),
    archived_at character varying(255),
    status_at character varying(255),
    katalog_id character varying(255),
    judul_katalog character varying(255),
    deskripsi_katalog character varying(255),
    images character varying(255),
    link character varying(255),
    archived_by_id character varying(255),
    created_by_id character varying(255),
    deleted_by_id character varying(255),
    status_by_id character varying(255),
    updated_by_id character varying(255)
);


ALTER TABLE public.deiyaiplus_admin_katalog OWNER TO postgres;

--
-- Name: deiyaiplus_admin_kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_kategori (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    archived_at timestamp with time zone,
    status_at character varying(255),
    kategori_id text NOT NULL,
    nama_kategori character varying(255) NOT NULL,
    sub_kategori text NOT NULL,
    jenis_kategori text NOT NULL,
    archived_by_id text,
    created_by_id text,
    deleted_by_id text,
    status_by_id text,
    updated_by_id text
);


ALTER TABLE public.deiyaiplus_admin_kategori OWNER TO postgres;

--
-- Name: deiyaiplus_admin_konten_karya; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_konten_karya (
    konten_karya_id text NOT NULL,
    nama_file character varying(255) NOT NULL,
    jenis_file text NOT NULL,
    link character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    karya_id_id text
);


ALTER TABLE public.deiyaiplus_admin_konten_karya OWNER TO postgres;

--
-- Name: deiyaiplus_admin_master_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_master_user (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    user_id text NOT NULL,
    email character varying(254) NOT NULL,
    username character varying(100) NOT NULL,
    is_staff boolean NOT NULL,
    is_superuser boolean NOT NULL,
    is_active boolean NOT NULL,
    is_verified boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    date_of_birth date,
    images character varying(100),
    role character varying(50) NOT NULL
);


ALTER TABLE public.deiyaiplus_admin_master_user OWNER TO postgres;

--
-- Name: deiyaiplus_admin_partner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_partner (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    archived_at timestamp with time zone,
    status_at character varying(255),
    partner_id text NOT NULL,
    nama character varying(255) NOT NULL,
    images character varying(100),
    judul_patner character varying(255) NOT NULL,
    link character varying(255) NOT NULL,
    archived_by_id text,
    created_by_id text,
    deleted_by_id text,
    status_by_id text,
    updated_by_id text
);


ALTER TABLE public.deiyaiplus_admin_partner OWNER TO postgres;

--
-- Name: deiyaiplus_admin_pejabat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_pejabat (
    created_at character varying(255),
    updated_at character varying(255),
    deleted_at character varying(255),
    archived_at character varying(255),
    status_at character varying(255),
    pejabat_id character varying(255),
    images character varying(255),
    nama_pejabat character varying(255),
    jabatan character varying(255),
    deskripsi character varying(255),
    archived_by_id character varying(255),
    created_by_id character varying(255),
    deleted_by_id character varying(255),
    status_by_id character varying(255),
    updated_by_id character varying(255)
);


ALTER TABLE public.deiyaiplus_admin_pejabat OWNER TO postgres;

--
-- Name: deiyaiplus_admin_pengaduan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_pengaduan (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    archived_at timestamp with time zone,
    status_at character varying(255),
    pengaduan_id text NOT NULL,
    nama_pengadu character varying(255) NOT NULL,
    email character varying(254) NOT NULL,
    nik character varying(20) NOT NULL,
    no_whatsapp character varying(20) NOT NULL,
    deskripsi_pengaduan text NOT NULL,
    jenis_pelapor character varying(255),
    read_status boolean NOT NULL,
    replay_status character varying(255) NOT NULL,
    kategori_pengaduan character varying(255),
    archived_by_id text,
    created_by_id text,
    deleted_by_id text,
    status_by_id text,
    updated_by_id text
);


ALTER TABLE public.deiyaiplus_admin_pengaduan OWNER TO postgres;

--
-- Name: deiyaiplus_admin_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_profile (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    archived_at timestamp with time zone,
    status_at character varying(255),
    profile_id text NOT NULL,
    tipe character varying(50) NOT NULL,
    deskripsi text NOT NULL,
    images character varying(100),
    archived_by_id text,
    created_by_id text,
    deleted_by_id text,
    status_by_id text,
    updated_by_id text
);


ALTER TABLE public.deiyaiplus_admin_profile OWNER TO postgres;

--
-- Name: deiyaiplus_admin_sekolah; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_sekolah (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    archived_at timestamp with time zone,
    status_at character varying(255),
    sekolah_id text NOT NULL,
    nama_sekolah character varying(255) NOT NULL,
    alamat_sekolah text NOT NULL,
    jenjang character varying(255) NOT NULL,
    archived_by_id text,
    created_by_id text,
    deleted_by_id text,
    status_by_id text,
    updated_by_id text
);


ALTER TABLE public.deiyaiplus_admin_sekolah OWNER TO postgres;

--
-- Name: deiyaiplus_admin_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_settings (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    archived_at timestamp with time zone,
    status_at character varying(255),
    settings_id text NOT NULL,
    nama_aplikasi character varying(255) NOT NULL,
    deskripsi_aplikasi text NOT NULL,
    barcode character varying(100),
    logo character varying(100),
    alamat text NOT NULL,
    kontak character varying(255) NOT NULL,
    email character varying(254) NOT NULL,
    link_maps character varying(1024),
    archived_by_id text,
    created_by_id text,
    deleted_by_id text,
    status_by_id text,
    updated_by_id text
);


ALTER TABLE public.deiyaiplus_admin_settings OWNER TO postgres;

--
-- Name: deiyaiplus_admin_slider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_slider (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    archived_at timestamp with time zone,
    status_at character varying(255),
    slider_id text NOT NULL,
    judul_slider character varying(255) NOT NULL,
    sub_judul_slider character varying(255) NOT NULL,
    tampilan_judul character varying(255) NOT NULL,
    background_slider character varying(100),
    elemen_gambar character varying(100),
    is_video_background boolean NOT NULL,
    link character varying(255) NOT NULL,
    archived_by_id text,
    created_by_id text,
    deleted_by_id text,
    status_by_id text,
    updated_by_id text
);


ALTER TABLE public.deiyaiplus_admin_slider OWNER TO postgres;

--
-- Name: deiyaiplus_admin_taggeditem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deiyaiplus_admin_taggeditem (
    id bigint NOT NULL,
    object_id uuid NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.deiyaiplus_admin_taggeditem OWNER TO postgres;

--
-- Name: deiyaiplus_admin_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deiyaiplus_admin_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deiyaiplus_admin_taggeditem_id_seq OWNER TO postgres;

--
-- Name: deiyaiplus_admin_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deiyaiplus_admin_taggeditem_id_seq OWNED BY public.deiyaiplus_admin_taggeditem.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO postgres;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO postgres;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO postgres;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO postgres;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: deiyaiplus_admin_taggeditem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.deiyaiplus_admin_taggeditem_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add master_ user	6	add_master_user
22	Can change master_ user	6	change_master_user
23	Can delete master_ user	6	delete_master_user
24	Can view master_ user	6	view_master_user
25	Can add creator	7	add_creator
26	Can change creator	7	change_creator
27	Can delete creator	7	delete_creator
28	Can view creator	7	view_creator
29	Can add karya	8	add_karya
30	Can change karya	8	change_karya
31	Can delete karya	8	delete_karya
32	Can view karya	8	view_karya
33	Can add Tag	9	add_taggeditem
34	Can change Tag	9	change_taggeditem
35	Can delete Tag	9	delete_taggeditem
36	Can view Tag	9	view_taggeditem
37	Can add slider	10	add_slider
38	Can change slider	10	change_slider
39	Can delete slider	10	delete_slider
40	Can view slider	10	view_slider
41	Can add settings	11	add_settings
42	Can change settings	11	change_settings
43	Can delete settings	11	delete_settings
44	Can view settings	11	view_settings
45	Can add sekolah	12	add_sekolah
46	Can change sekolah	12	change_sekolah
47	Can delete sekolah	12	delete_sekolah
48	Can view sekolah	12	view_sekolah
49	Can add profile	13	add_profile
50	Can change profile	13	change_profile
51	Can delete profile	13	delete_profile
52	Can view profile	13	view_profile
53	Can add pengaduan	14	add_pengaduan
54	Can change pengaduan	14	change_pengaduan
55	Can delete pengaduan	14	delete_pengaduan
56	Can view pengaduan	14	view_pengaduan
57	Can add partner	15	add_partner
58	Can change partner	15	change_partner
59	Can delete partner	15	delete_partner
60	Can view partner	15	view_partner
61	Can add konten_karya	16	add_konten_karya
62	Can change konten_karya	16	change_konten_karya
63	Can delete konten_karya	16	delete_konten_karya
64	Can view konten_karya	16	view_konten_karya
65	Can add kategori	17	add_kategori
66	Can change kategori	17	change_kategori
67	Can delete kategori	17	delete_kategori
68	Can view kategori	17	view_kategori
69	Can add ecerpen	18	add_ecerpen
70	Can change ecerpen	18	change_ecerpen
71	Can delete ecerpen	18	delete_ecerpen
72	Can view ecerpen	18	view_ecerpen
73	Can add ebook	19	add_ebook
74	Can change ebook	19	change_ebook
75	Can delete ebook	19	delete_ebook
76	Can view ebook	19	view_ebook
77	Can add berita	20	add_berita
78	Can change berita	20	change_berita
79	Can delete berita	20	delete_berita
80	Can view berita	20	view_berita
81	Can add tag	21	add_tag
82	Can change tag	21	change_tag
83	Can delete tag	21	delete_tag
84	Can view tag	21	view_tag
85	Can add tagged item	22	add_taggeditem
86	Can change tagged item	22	change_taggeditem
87	Can delete tagged item	22	delete_taggeditem
88	Can view tagged item	22	view_taggeditem
\.


--
-- Data for Name: deiyaiplus_admin_berita; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_berita (created_at, updated_at, deleted_at, archived_at, status_at, berita_id, judul, images, slug, deskripsi_berita, archived_by_id, created_by_id, deleted_by_id, kategori_id_id, status_by_id, updated_by_id) FROM stdin;
2025-05-27 19:00:29+07	2025-05-27 19:18:57+07	\N	2025-05-27 19:18:57+07	\N	16c2169f-75ad-4ae8-968e-92a91ab53a39	Respon Pengaduan	berita/respon_alur.png	respon-pengaduan	<p>Kami akan merespon informasi pengaduan maupun permohonan informasi anda pada jam kerja. jika anda ingin respon yang lebih cepat silahkan chat kami melalui fitur chat yang telah disediakan di website ini.</p>	\N	\N	\N	ba6ec3e2-cbe6-41ff-b369-926fec4629d7	\N	\N
2025-05-27 20:16:40+07	2025-06-17 22:37:28+07	\N	\N	\N	a24ccbd0-f4d3-40aa-9156-63c63cdb0000	Respon Pengaduan	berita/respon_alur.png	respon-pengaduan-1	<p>Kami akan merespon informasi pengaduan maupun permohonan informasi anda pada jam kerja. jika anda ingin respon yang lebih cepat silahkan chat kami melalui fitur chat yang telah disediakan di website ini.</p>	\N	\N	\N	ba6ec3e2-cbe6-41ff-b369-926fec4629d7	\N	\N
2025-05-27 17:25:48+07	2025-06-17 22:35:40+07	\N	\N	\N	83065c50-9071-44b5-aedd-645a28cd673e	KARYA	berita/icon_karya.png	karya	<p>Mari dukung generasi mendatang! Lihatlah Karya Anak Negeri, sebuah koleksi istimewa yang menunjukkan dedikasi dan kreativitas anak-anak kita. Apresiasikan Karya Anak Negeri ini</p>	\N	\N	\N	a7b86cfe-0148-4473-8f6d-ec07d3563b29	\N	\N
2025-05-27 17:23:17+07	2025-06-17 22:30:52+07	\N	\N	\N	1d4cd11f-610b-401b-8d20-b5abc7d9b4ad	E-BOOK	berita/icon_buku.png	e-book	<p>Nikmati petualangan membaca tanpa batas dengan E-book! Ini adalah versi digital dari buku favorit Anda. Akses dan baca di perangkat apa pun, kapan pun, tanpa repot membawa buku fisik.&nbsp;</p>	\N	\N	\N	a7b86cfe-0148-4473-8f6d-ec07d3563b29	\N	\N
2025-05-27 17:21:03+07	2025-06-17 22:31:12+07	\N	\N	\N	b30a4450-d917-4d68-a350-186334c97dce	E-CERPEN	berita/icon_e-cerpen.png	e-cerpen-1	<p>Temukan beragam kisah dalam genggaman Anda melalui <strong>E-cerpen</strong>. Nikmati cerita-cerita pendek yang ringkas namun penuh makna, mudah diakses, dan selalu siap sedia untuk dibaca kapan saja.</p>	\N	\N	\N	a7b86cfe-0148-4473-8f6d-ec07d3563b29	\N	\N
2025-05-27 17:28:07+07	2025-06-17 22:36:35+07	\N	\N	\N	f79ebc69-2ef9-442c-9567-a282b640d323	Klinik Literasi	berita/icon_klinik.png	klinik-literasi	<p>Yuk, mari membuat aplikasi ini lebih baik! Jika Anda memiliki kendala dan pertanyaan, jangan ragu untuk menyampaikannya di sini. Kami dengan senang hati membantu dan memberikan arahan.</p>	\N	\N	\N	a7b86cfe-0148-4473-8f6d-ec07d3563b29	\N	\N
2025-05-27 18:59:01+07	2025-06-17 22:37:44+07	\N	\N	\N	893d6a49-363f-4889-9f0b-be737eecaa59	Isi Form Pengaduan	berita/isi_alur.png	isi-form-pengaduan	<p>Silahkan isi form pengaduan dan jangan lupa untuk mencantumkan no. Wa untuk konfirmasi tindak lanjut dari admin dinas kesehatan provinsi papua tengah.</p>	\N	\N	\N	ba6ec3e2-cbe6-41ff-b369-926fec4629d7	\N	\N
2025-05-27 18:54:34+07	2025-06-17 22:38:07+07	\N	\N	\N	23ae69f2-1371-460a-a70b-1bc63b1e6fb0	Pilih Menu Pengaduan	berita/pilih_alur.png	pilih-menu-pengaduan	<p>Pilih menu pengaduan dan siapkan hal apa yang ingin anda sampaikan dengan detail sehingga admin dapat memberikan respon lebih cepat.</p>	\N	\N	\N	ba6ec3e2-cbe6-41ff-b369-926fec4629d7	\N	\N
2025-05-27 17:59:46+07	2025-06-17 23:30:26+07	\N	\N	\N	63ba8fa8-dc74-43ec-89e2-fac2814cda81	Infografis	berita/infografis_2.jpeg	infografis-1	<p>-</p>	\N	\N	\N	2d592833-5506-46ef-a222-be1e32c3876a	\N	\N
2025-05-27 17:58:31+07	2025-06-17 23:30:37+07	\N	\N	\N	52e47268-3cb5-44f3-a596-358e39c4e134	Infografis	berita/infografis_3.jpg	infografis	<p>-</p>	\N	\N	\N	2d592833-5506-46ef-a222-be1e32c3876a	\N	\N
2025-06-15 07:58:38+07	2025-06-17 23:30:55+07	\N	\N	\N	27e14d2f-fbf0-40f6-8b43-cd45c737df8a	Survey	berita/ChatGPT_Image_Jun_16_2025_10_36_47_AM.png	survey	<p>Survei SPM - Ventraplus+ sebagai Wadah Inovasi</p>	\N	\N	\N	72c6b33a-1124-43fd-befd-27fb293f0fd3	\N	\N
2025-05-27 18:00:55+07	2025-06-17 23:31:09+07	\N	\N	\N	02c98567-8808-4ad9-a57f-2d9f4186590f	Infografis	berita/infografis1.jpeg	infografis-2	<p>-</p>	\N	\N	\N	2d592833-5506-46ef-a222-be1e32c3876a	\N	\N
2025-05-25 19:19:53+07	2025-06-17 23:43:51+07	\N	\N	\N	3a81af61-6e92-4b1b-9bda-9af3760b98e0	Wamendiktisaintek: Literasi Adalah Tanggung Jawab Bersama	berita/berita4.jpeg	wamendiktisaintek-literasi-adalah-tanggung-jawab-bersama	<p><strong>Medan Merdeka Selatan, Jakarta</strong> - Wakil Menteri Pendidikan Tinggi, Sains, dan Teknologi (Dikti Saintek), Fauzan, mengajak seluruh elemen bangsa, khususnya institusi Pendidikan tinggi, untuk berperan aktif dan membangun budaya literasi.</p><p>Demikian disampaikan pada Puncak Perayaan HUT ke-45 Perpustakaan Nasional Republik Indonesia (Perpusnas) sekaligus Peluncuran KKN Tematik Literasi dan Relawan Literasi Masyarakat (RELIMA), Jumat (16/05/2025).</p><p>Mengutip pepatah Arab "Al-‘Ilmu Nūr, wal-Jahlu Ẓulmah" yang berarti “Ilmu adalah cahaya, dan kebodohan adalah kegelapan”, Wamen Fauzan menyatakan ilmu pengetahuan sebagai fondasi kebahagiaan dan kesuksesan di dunia maupun akhirat.</p><p>Dia juga menekankan bahwa dalam konteks kehidupan berbangsa, bernegara, dan beragama, keberadaan pusat literasi seperti perpustakaan tidak bisa diabaikan.</p><p>"Perpustakaan sebagai sumber belajar tentu tidak harus dimaknai secara fisik tapi harus dimaknai secara luas," ungkapnya.</p><p>Wamen Fauzan, menyatakan, keprihatinannya terhadap rendahnya minat baca masyarakat Indonesia. Berdasarkan data UNESCO, tingkat minat baca masyarakat Indonesia hanya 0,001 persen, atau hanya satu dari 1.000 orang yang rajin membaca.</p><p>Data Badan Pusat Statistik (BPS) tahun 2020 juga menunjukkan bahwa hanya sekitar 10% penduduk yang gemar membaca buku, bukan sekadar pesan singkat atau media sosial.</p><p>“Ini menjadi keprihatinan kita bersama. Literasi bukan hanya tanggung jawab perpustakaan, tetapi tanggung jawab kolektif seluruh elemen bangsa,” ujarnya.</p><p>Atas hal tersebut, Perpusnas bekerja sama dengan Kemendikti Saintek melalui program Kampus Berdampak, membuat satu program strategis KKN Tematik Literasi. Program ini merupakan bentuk nyata pengabdian kepada masyarakat yang berfokus pada penguatan budaya baca dan kecakapan literasi.</p><p>Lebih lanjut, Wamen Fauzan menegaskan kampus harus mampu berkontribusi langsung dalam mengatasi persoalan sosial di lingkungan sekitarnya.</p><p>“Kampus tidak boleh hanya menjadi menara gading. Keberadaan kampus harus memberikan dampak positif bagi masyarakat sekitar. Kalau kampusnya bagus, tapi masyarakatnya miskin dan penuh masalah, maka tanggung jawab sosial kampus itu dipertanyakan,” katanya.</p><p>Wamen Fauzan menambahkan, melalui Kampus Berdampak, perguruan tinggi diharapkan mampu menjadi problem solver terhadap berbagai persoalan yang dihadapi masyarakat.</p><p>"Kampus harus menjadi problem solver terhadap persoalan yang ada di masyarakat salah satunya adalah problem baca yang ada di Indonesia," imbuhnya.</p><p>Sementara itu, Kepala Perpusnas E. Aminudin Azis menjelaskan KKN Tematik Literasi sebagai wujud kemitraan dengan Kemendikti Saintek yang akan menggarap peningkatan budaya baca dan kecakapan literasi di 1.000 desa/kelurahan.</p><p>"Program ini melibatkan 22 perguruan tinggi, yang akan menurunkan sekitar 15 ribu mahasiswa, ratusan dosen dan pustakawan di masing-masing wilayah," jelasnya.</p><p>Acara HUT ke-45 Perpusnas juga dihadiri oleh Menteri Koordinator Bidang Pembangunan Manusia dan Kebudayaan (Menko PMK), Pratikno; Kepala Arsip Nasional RI,&nbsp; Mego Pinandito; Kepala Badan Pengembangan dan Pembinaan Bahasa, Kementerian Pendidikan Dasar dan Menengah, Hafidz Muksin; Sekretaris Utama (Sestama) Perpusnas, Joko Santoso; plt. Deputi Bidang Pengembangan Bahan Pustaka dan Jasa Informasi Perpusnas, Ofy Sofiana; Deputi Bidang Pengembangan Sumber Daya Perpustakaan, Adin Bondar.</p><p>Reporter: Wara Merdeka</p><p>Dokumentasi: Tim Humas Perpusnas</p>	\N	\N	\N	5182b9cd-8a3c-43c1-98aa-ddb5d68dd2a5	\N	\N
2025-05-27 17:31:07+07	2025-06-17 22:29:54+07	\N	\N	\N	d674cfac-f3c1-4e6f-b153-5ea536c611e4	Library Everywhere	berita/icon_library.png	library-everywhere	<p>VentraPlus+ adalah platform digital inovatif yang merevolusi layanan perpustakaan di era digital. Jelajahi fitur-fitur kami yang menarik, seperti E-book, E-cerpen, Karya Anak Negeri, dan Klinik Literasi!&nbsp;</p>	\N	\N	\N	a7b86cfe-0148-4473-8f6d-ec07d3563b29	\N	\N
2025-05-25 19:24:20+07	2025-06-18 15:37:59.517812+07	\N	\N	\N	c1b5e358-ddea-4048-9752-cc7e8985a058	Seminar Nasional KLN 2025: Perpusnas Tegaskan Komitmen Literasi Berbasis Inklusi Sosial	berita/berita5.jpeg	seminar-nasional-kln-2025-perpusnas-tegaskan-komitmen-literasi-berbasis-inklusi-sosial	<p>Bogor— Perpustakaan Nasional Republik Indonesia melalui kegiatan Transformasi Perpustakaan Berbasis Inklusi Sosial (TPBIS) menyediakan ruang bagi masyarakat luas untuk berekspresi dan mengembangkan potensi diri.</p><p>Demikian disampaikan Pustakawan Ahli Muda Perpustakaan Nasional Republik Indonesia (Perpusnas), Irhamni Ali, dalam kegiatan Seminar Nasional Komunitas Literasi Nusantara (KLN) bersama Komunitas Ideal 2025, Jumat (2/5/2025).</p><p>“Dengan adanya TPBIS, masyarakat dapat menggunakan perpustakaan sebagai wadah untuk melakukan berbagai macam bentuk pelatihan termasuk pelatihan terkait dengan&nbsp;<i>cyber security&nbsp;</i>seperti misalnya bagaimana menggunakan data, bagaimana mencari informasi serta membedakan informasi yang baik dan benar,” jelasnya.</p><p>Lebih lanjut, Irhamni Ali menyampaikan bahwa Perpusnas akan meluncurkan program Relawan Literasi Masyarakat (ReLima) bertepatan dengan Hari Ulang Tahun ke-45 Perpusnas pada 17 Mei 2025 mendatang.</p><p>“Dalam program ini, kami akan melakukan sejumlah pelatihan dan mengirimkan relawan-relawan literasi ke berbagai jenis perpustakaan yang ada di Indonesia khususnya perpustakaan yang ada di komunitas untuk melakukan pelatihan-pelatihan dan pembinaan terkait dengan literasi,” urainya.</p><p>Kegiatan dengan tema “Transformasi Digital dalam Pendidikan dan Keamanan Siber: Langkah Kolektif Menuju Indonesia Cerdas juga didukung oleh Menteri Komunikasi dan Informasi Digital, Meutya Hafid yang menyatakan transformasi digital adalah gerbang masa depan dan semangat anak muda seperti ini harus terus didukung.</p><p>Ferdinandus Wali Ate, Ketua Umum KLN, menyampaikan bahwa seminar ini adalah bentuk gerakan bersama untuk membangun ekosistem pendidikan yang aman dan berdaya digital.</p><p>"Kami ingin literasi digital tidak hanya jadi wacana, tapi menjadi gerakan kolektif yang menyentuh hingga akar rumput," tuturnya.</p><p>Sementara itu, Gubernur Nusa Tenggara Timur (NTT), Melki Laka Lana, menyampaikan teknologi digital adalah jembatan yang mampu mengatasi batas ruang dan waktu. Oleh karena itu, pemerintah provinsi NTT berkomitmen akan mewujudkan transformasi digital khususnya dalam dunia pendidikan yang inklusif dan berkelanjutan.</p><p>“Transformasi digital dalam dunia pendidikan, dapat menghubungkan akses pendidikan yang lebih luas, melaksanakan standarisasi pembelajaran dan peningkatan kualitas pendidikan secara keseluruhan,” tuturnya.</p><p>Lebih lanjut, Melki Laka Lana menjelaskan bahwa transformasi digital dan keamanan siber adalah dua sisi mata uang yang tidak terpisahkan karena itu diperlukan tidak hanya generasi yang cerdas dan inovatif melainkan juga tangguh secara moral dan aman secara digital.</p><p>“Provinsi NTT dengan segala potensi dan keunikannya siap berkontribusi aktif dalam mewujudkan masa depan tersebut. Kami yakin bahwa dari timur, cahaya perubahan akan bersinar melalui kerja keras, kolaborasi dan komitmen yang berkelanjutan.” tuturnya.</p><p>Perwakilan Ketua DPRD Kota Bogor, Endah, dalam kesempatan ini menyampaikan apresiasi yang setinggi-tingginya kepada Komunitas Literasi Nusantara yang telah menggagas dan menyelenggarakan kegiatan ini.</p><p>“Kegiatan ini merupakan bentuk kontribusi yang nyata dari masyarakat sipil untuk mendorong kemajuan pendidikan digital sekaligus menjadi ruang diskusi yang produktif antara pemangku kebijakan, akademis, komunitas dan generasi muda,” tuturnya.</p><p>Lebih lanjut, Endah menjelaskan beberapa hal yang perlu diperkuat DPRD Kota Bogor melalui kebijakan daerah antara lain penguatan infrastruktur digital yang merata dan mendorong perluasan akses internet,&nbsp; penguatan literasi digital dan etika bermedia, serta perlindungan keamanan siber dalam pendidikan.</p><p>Dalam paparannya Anggota Komisi III DPRD Kota Bogor, Lusiana Nurissiyadah, menekankan pentingnya penguatan regulasi dan pengawasan sebagai pondasi reformasi pendidikan yang adil, efektif, dan berkelanjutan.</p><p>“Arah kebijakan pendidikan ke depan harus berpijak pada tiga pilar utama yaitu pendidikan berkelanjutan, pendidikan inklusif dan pemerataan akses digital serta perlu adanya ekosistem pendidikan,” jelasnya.</p><p>Hadir sebagai pemateri dalam kegiatan ini perwakilan Deputi Bidang Operasional Keamanan Siber dan Sandi Negara Badan Siber dan Sandi Negara (BSSN),&nbsp; Nurul Hasani, Kepala Dinas Kominfo Kota Bogor, Rahmat Hidayat, dan Founder dan CTO&nbsp;<a href="http://digitalexchange.id/">digitalexchange.id</a>, Iqbal Aristya.</p><p>Seminar ini diadakan secara<i> hybrid&nbsp;</i>dalam rangka memperingati Hari Pendidikan Nasional dan dihadiri lebih dari 250 peserta dari berbagai kalangan—guru, dosen, mahasiswa, pelajar, pengurus OSIS, hingga organisasi pemuda dan mahasiswa.</p><p>Diharapkan, acara ini tidak berhenti sebagai seremonial tahunan tetapi sebagai gerakan literasi bersama untuk membangun kesadaran nasional. Dalam seminar ini diadakan peluncuran program-program strategis seperti UMKM resmi KLN, laman resmi KLN (kln.or.id) dan 1000 Satgas Literasi Digital Indonesia.</p><p>Reporter &amp; Dokumentasi: Anastasia Lily</p>	\N	\N	\N	5182b9cd-8a3c-43c1-98aa-ddb5d68dd2a5	\N	\N
2025-05-25 19:08:11+07	2025-06-18 15:36:55.523196+07	\N	\N	\N	bbb2ba65-b23a-48b9-9005-c68cd873e47c	Transformasi Digital Jadi Fokus Inovasi Layanan Publik Perpusnas	berita/berita.2.jpg	transformasi-digital-jadi-fokus-inovasi-layanan-publik-perpusnas	<p><strong>Salemba, Jakarta </strong>– Transformasi digital layanan publik seperti akses pustaka digital, jejaring Indonesia Research, dan inisiatif berbasis masyarakat menjadi fokus utama dalam penyusunan proposal Kompetisi Inovasi Pelayanan Publik (KIPP) Tahun 2025.&nbsp;</p><p>Hal tersebut disampaikan oleh Sekretaris Utama Perpustakaan Nasional Republik Indonesia (Perpusnas), Joko Santoso, dalam Rapat Koordinasi Pengumpulan Proposal KIPP Tahun 2025 di Ruang Aula Gedung Layanan Perpusnas, Salemba,&nbsp; Jakarta Pusat, Rabu (21/5/2025).</p><p>Joko menyatakan pentingnya keselarasan antara tema KIPP 2025, “Mewujudkan Pelayanan Publik Berdampak untuk Kesejahteraan Masyarakat,” dengan arah kebijakan strategis Perpusnas, terutama dalam hal transformasi digital dan kontribusi terhadap Tujuan Pembangunan Berkelanjutan (SDGs).</p><p>“Inovasi yang kita ajukan harus menunjukkan efektivitas, efisiensi, dan kebermanfaatan nyata. Bukan hanya dari sisi internal, tapi juga dirasakan langsung oleh masyarakat, baik melalui kecepatan layanan, kemudahan akses, hingga testimoni publik,” ujarnya.</p><p>Rapat ini melibatkan seluruh kepala unit kerja di lingkungan Perpusnas untuk menyusun langkah strategis dan menyempurnakan proposal inovasi layanan publik yang akan diajukan ke KIPP 2025.&nbsp;</p><p>Joko mendorong agar setiap unit kerja mengoptimalkan kesempatan ini dengan mengusulkan maksimal 15 inovasi, sesuai ketentuan Kementerian PANRB. “Ini kesempatan emas untuk menunjukkan kontribusi kita terhadap pelayanan publik yang adaptif dan berkelanjutan,” tegasnya.</p><p>Sementara itu, Kepala Biro Hukum, Organisasi, Kerja Sama, dan Hubungan Masyarakat (HOKH), Sri Marganingsih, memberitahukan bahwa unit kerja dapat mulai memasukkan informasi terkait inovasi yang akan diikutsertakan, mengacu pada persyaratan dan mekanisme yang berlaku.</p><p>Ia menyebut, pada KIPP tahun 2023, Perpusnas mengajukan sembilan inovasi. Beberapa di antaranya perlu perbaikan, terutama dalam aspek keberlanjutan dan bukti pengembangan.&nbsp;</p><p>“Contohnya Transformasi Perpustakaan Berbasis Inklusi Sosial (TPBIS) yang tahun ini diperkuat melalui program Relawan Literasi Masyarakat (Relima) yang didukung pemerintah provinsi. Ini bukti bahwa inovasi terus berkembang,” tuturnya.&nbsp;</p><p>Sri Marganingsih juga menyoroti pentingnya pembaruan pada inovasi seperti Khasanah Pustaka Nusantara (Khastara), termasuk penggunaan metode seperti <i>people exchange</i>. Ia menegaskan bahwa idealnya inovasi yang diajukan telah dirancang setidaknya dua tahun sebelumnya, seperti pada tema KKN Literasi yang dipersiapkan sejak awal agar pada 2027 sudah matang untuk diusulkan.&nbsp;</p><p>“Karena waktu sudah sangat mepet, kami mohon agar proses pengumpulan data inovasi ini segera dilaksanakan," tegasnya.</p><p>Plt. Deputi Bidang Pengembangan Bahan Pustaka dan Jasa Informasi, Ofy Sofiana, menambahkan bahwa partisipasi dalam KIPP adalah momentum penting untuk menunjukkan komitmen pimpinan terhadap inovasi pelayanan.</p><p>“Ketika suatu inovasi masuk ke tahap nominasi akhir, pimpinan harus hadir untuk mempresentasikan. Itu menunjukkan dukungan nyata dari pimpinan terhadap inovasi yang diajukan,” ungkapnya.</p><p>Ofy juga mengingatkan bahwa dokumentasi menjadi hal krusial. Ia mencontohkan inovasi yang sempat masuk KIPP, yaitu <i>Live Chat </i>dari Pusat Jasa Informasi Perpustakaan dan Pengelolaan Naskah Nusantara (Pujasintara) yang sangat baik secara konsep, namun kurang kuat dari sisi kelengkapan dokumen hukum.&nbsp;</p><p>Ia mengajak semua unit kerja untuk memanfaatkan peluang ini secara kolektif. “Momen ini sangat penting untuk menunjukkan bahwa Perpusnas mampu menampilkan prestasi dan inovasi berdampak,” pungkasnya.</p><p>Rapat ini dihadiri oleh seluruh pimpinan unit kerja di lingkungan Perpusnas, baik pusat maupun Unit Pelaksana Teknis (UPT), untuk menyampaikan dan memfinalisasi proposal inovasi yang telah diikutsertakan dalam KIPP 2025.</p><p>&nbsp;</p><p><strong>Reporter: Alditta Khoirun Nisa / Indah</strong></p><p><strong>Dokumentasi: Prakas Agrestian&nbsp;</strong></p>	\N	\N	\N	5182b9cd-8a3c-43c1-98aa-ddb5d68dd2a5	\N	\N
2025-05-25 19:02:20+07	2025-06-18 15:37:26.572798+07	\N	\N	\N	00ef5fd0-5f9a-4942-84d3-953636537d6b	Perpusnas Dukung Kolaborasi Penerbit untuk Tingkatkan Literasi	berita/berita.jpeg	perpusnas-dukung-kolaborasi-penerbit-untuk-tingkatkan-literasi	<p>Jakarta, Kepala Perpustakaan Nasional Republik Indonesia (Perpusnas), E. Aminudin Aziz, menyampaikan buku yang berkualitas berperan penting dalam upaya mencerdaskan bangsa.</p><p>Menurutnya terdapat tiga pihak yang memegang peran dalam literasi nasional, diantaranya penulis, penerbit dan perpustakaan.</p><p>"Ketika sebuah buku tidak berkualitas, maka ada tiga pihak yang berdosa. Pertama, penulis yang tidak menghadirkan buku yang menginspirasi dan energi positif. Kedua, penerbit yang menerbitkan tanpa seleksi ketat. Ketiga, perpustakaan yang membeli buku tanpa kurasi layak," ungkapnya pada&nbsp; HUT ke-75 Ikatan Penerbit Indonesia (IKAPI) dan Hari Buku Nasional&nbsp; serta menuju Indonesia Internasional Book Fair (IIBF) 2025, Rabu (21/5/2025).</p><p>Dia menyampaikan bahwa Perpusnas terus melakukan evaluasi, termasuk dalam pengelolaan ISBN agar lebih cepat dan transparan. “Kalau dokumennya lengkap dan benar, pengurusan ISBN tidak akan lebih dari tiga hari,” katanya.</p><p>Kepala Perpusnas menyayangkan banyaknya buku di perpustakaan yang kurang menarik atau tidak layak dijadikan rujukan. Untuk itu, Perpusnas kini tengah menginisiasi penyaduran karya-karya sastra klasik menjadi versi berbahasa kekinian agar lebih mudah dipahami generasi muda.</p><p>“Kami juga tengah menyiapkan komik sejarah seperti Diponegoro, dalam rangka memperingati 200 tahun Perang Jawa. Kami ingin agar buku tetap hidup dalam bentuk yang relevan dan menarik,” ujarnya.</p><p>Ia berharap kolaborasi antara Perpusnas, IKAPI, dan para penulis dapat ditingkatkan guna menciptakan ekosistem literasi yang saling mendukung.</p><p>“Dari 2.700-an penerbit, hanya 900-an yang aktif. Mudah-mudahan ini bukan tanda redupnya penerbitan, tapi justru awal semangat baru,” harapnya.</p><p>Sementara itu, Ketua IKAPI, Arys Hilman Nugraha, menjelaskan bahwa IKAPI yang berdiri sejak 17 Mei 1950 dengan hanya 13 anggota penerbit, kini telah berkembang menjadi 2.721 penerbit. Namun, dari jumlah tersebut, hanya 982 yang masih aktif.</p><p>“Banyak penerbit yang pamit dan mengundurkan diri. Ini situasi yang tidak mudah,” ujarnya.</p><p>Arys mengatakan bahwa industri penerbitan saat ini menghadapi tantangan serius, terutama akibat disrupsi teknologi dan perubahan pola konsumsi masyarakat yang kian beralih ke digital, apalagi sejak pandemi. Dia juga menyayangkan bahwa industri penerbitan kerap disalahpahami publik.</p><p>“Penerbit sering dikira sama dengan percetakan. Bahkan ada anggapan kami penuh uang, atau pemain proyek pengadaan. Padahal, penerbitan adalah bagian dari industri pengetahuan, bukan sekadar aktivitas ekonomi,” tegasnya.</p><p>Arys mengajak seluruh anggota IKAPI untuk memperkuat kolaborasi demi menciptakan ekosistem perbukuan yang sehat dan berkelanjutan.</p><p>Acara ini juga dirangkaikan dengan Talkshow "Buku Terbuka, Pikiran Tertutup: Apakah Bangsa Ini Takut Berpengetahuan ?", dengan menghadirkan narasumber Kepala Pusat Perbukuan, Supriyatno; Penulis dan Aktivis Literasi, Maman Suherman; Penulis, J.S Khairen.</p><p>&nbsp;</p><p><br>&nbsp;</p>	\N	\N	\N	5182b9cd-8a3c-43c1-98aa-ddb5d68dd2a5	\N	\N
2025-05-25 19:14:01+07	2025-06-18 15:36:35.494846+07	\N	\N	\N	77884c48-c9c4-49b3-ba31-59ee1d5a7a97	Perpustakaan Penguat Mutu Pendidikan	berita/berita3.jpeg	perpustakaan-penguat-mutu-pendidikan	<p><strong>Salemba, Jakarta</strong> - Kehadiran perpustakaan merupakan elemen penting dalam mendukung pencapaian mutu pendidikan.</p><p>Demikian disampaikan Deputi Bidang Pengembangan Sumber Daya Perpustakaan Perpustakaan Nasional Republik Indonesia (Perpusnas), Adin Bondar, saat memberikan sambutan dalam kegiatan Visitasi Re-Akreditasi UPT Perpustakaan Universitas 'Aisyiyah Bandung (Unisa), Rabu (21/5/2025).</p><p>Hadir secara daring, Deputi Adin menyampaikan peran strategis perpustakaan dalam menjamin mutu pendidikan melalui penyediaan informasi yang kredibel serta dukungan terhadap inovasi dan riset. Ia menegaskan bahwa akreditasi perpustakaan seharusnya tidak hanya dimaknai sebagai formalitas saja, melainkan sebagai upaya peningkatan kualitas layanan dan kontribusi nyata terhadap proses pembelajaran dan penelitian.</p><p>“Perpustakaan bertransformasi tidak hanya sebagai tempat menyimpan buku, tapi menjadi ruang terbuka sebagai pusat pengetahuan dan tumbuhnya kreativitas, serta berdampak nyata bagi masyarakat,” ungkapnya.</p><p>Pada kesempatan ini, Deputi Adin juga menyampaikan upaya Perpusnas dalam mendukung mutu pendidikan di perguruan tinggi dengan memperkaya koleksi jurnal melalui E-Resources. Berkolaborasi dengan Kementerian Tinggi, Sains dan Teknologi (Kemendiktisaitek), Perpusnas akan membuat one stop gateway akses nasional terkait koleksi jurnal ilmiah dalam E-Resources yang nantinya dapat digunakan seluruh perguruan tinggi di Indonesia.</p><p>“Selain itu, bersama Kemendiktisaitek kami menjalankan program KKN Tematik Literasi melibatkan 22 perguruan tinggi dan 15 ribu mahasiswa yang akan menggarap peningkatan budaya baca dan kecakapan literasi di 1.000 desa/kelurahan,” paparnya.</p><p>Sementara itu, Wakil Rektor II Unisa Bandung, Nandang Jamiat Nugraha, berkomitmen mendukung penuh penguatan fungsi perpustakaan melalui pengembangan koleksi perpustakaan yang relevan dan mutakhir, peningkatan anggaran, dan penguatan kompetensi yang berkelanjutan.</p><p>“Langkah ini kami tempuh tidak hanya untuk memenuhi standar akreditasi tapi juga untuk menjawab kebutuhan dari akademisi akan layanan informasi yang cepat akurat dan kredibel. Kami percaya perpustakaan adalah ruang tumbuhnya ide penelitian dan inovasi,” jelasnya.</p><p><strong>&nbsp;</strong></p>	\N	\N	\N	5182b9cd-8a3c-43c1-98aa-ddb5d68dd2a5	\N	\N
2025-05-27 17:18:35+07	2025-06-20 13:42:18.844974+07	\N	2025-06-20 13:42:18.841907+07	\N	6157b7ff-5128-427e-bea6-b5566e1ca3e2	E-CERPEN	berita/icon_buku.png	e-cerpen	<p>Temukan beragam kisah dalam genggaman Anda melalui <strong>E-cerpen</strong>. Nikmati cerita-cerita pendek yang ringkas namun penuh makna, mudah diakses, dan selalu siap sedia untuk dibaca kapan saja Anda butuhkan inspirasi atau hiburan.</p>	\N	\N	\N	a7b86cfe-0148-4473-8f6d-ec07d3563b29	\N	\N
\.


--
-- Data for Name: deiyaiplus_admin_creator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_creator (created_at, updated_at, deleted_at, archived_at, status_at, creator_id, nama_creator, email, password, tanggal_lahir, tanggal_regestrasi, status, images, archived_by_id, created_by_id, deleted_by_id, status_by_id, updated_by_id) FROM stdin;
2025-06-20 12:47:00.072806+07	2025-06-20 12:47:00.072806+07	\N	\N	\N	22b3c6a9-3266-4920-a559-6fc7e5eef876	test	test@gmail.com	pbkdf2_sha256$260000$XXC9I2DzoYPSeFpAyHyU82$QQRGbMcMdNeKKUR4kQg+cQGmgnc5UtL5rONb+HXS63k=	\N	2025-06-20 12:47:00.072806+07	active		\N	\N	\N	\N	\N
\.


--
-- Data for Name: deiyaiplus_admin_ebook; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_ebook (created_at, updated_at, deleted_at, archived_at, status_at, ebook_id, judul, sinopsis_ebook, cover, path_ebook, penulis, batas_usia, tahun_terbit, tanggal_verifikasi, tanggal_publikasi, alasan_penolakan, slug, durasi_baca, bahasa, status, archived_by_id, created_by_id, creator_id, deleted_by_id, kategori_id_id, status_by_id, updated_by_id, user_id_id) FROM stdin;
2025-06-08 19:09:05+07	2025-06-17 23:25:24+07	\N	\N	\N	863cd35e-346e-4ef0-a597-3c017adf8d75	Kamus Besar Bahasa Indonesia	<p>Ebook KBBI adalah alat bantu esensial bagi siapa pun yang ingin memahami, menggunakan, atau mempelajari bahasa Indonesia secara mendalam dan akurat. Ini adalah perpustakaan leksikal portabel yang memungkinkan pengguna untuk mencari informasi kebahasaan kapan saja dan di mana saja.</p>	ebook/2_fIbJYMb.jpg	images/ebook/Kamus_Bahasa_Indonesia_Tim_Penyusun_Z-Library.pdf	Dedy Sugono	18+	2008-10-28	2025-06-17 23:25:24+07	2025-06-17 23:25:07+07	\N	kamus-besar-bahasa-indonesia	4-6 Menit	Indonesia	terverifikasi	\N	\N	\N	\N	d0b19944-f720-4020-b2de-1c44dae2ebfd	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-08 19:13:09+07	2025-06-17 23:24:44+07	\N	\N	\N	956209b1-17f7-4dec-82b2-44a00dc91f2d	Air minum yang sehat	<p>Momo yang tinggal di sebuah kampung dekat hutan. Pada suatu pagi, Momo hinggap di ruang kelas. Di dalam kelas tersebut, siswa kelas dua sedang belajar tentang kesehatan, khususnya mengenai air minum yang sehat. Momo, yang ingin tahu, memutuskan untuk mendengarkan pelajaran tersebut, bertanya-tanya dalam hati, "Apa itu air minum yang sehat?"</p>	ebook/1_L2Q1YP2.jpg	images/ebook/Air_Minum_yang_Sehat.pdf	Adi Sumunar	18+	2018-08-13	2025-06-17 23:24:44+07	2025-06-17 23:24:36+07	\N	air-minum-yang-sehat	4-6 Menit	Indonesia	terverifikasi	\N	\N	\N	\N	d0b19944-f720-4020-b2de-1c44dae2ebfd	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-08 19:41:07+07	2025-06-17 23:21:16+07	\N	\N	\N	130e4207-3587-4776-be2e-5e22829766a9	Buku Pembinaan Rohani Islam	<p>Pada tahun 1965, Gubernur Jawa Barat mendorong Muhammadiyah untuk mendirikan Rumah Sakit Islam di Bandung, merespon kebutuhan masyarakat dan kegagalan inisiatif sebelumnya. Keputusan ini diperkuat oleh Muktamar Muhammadiyah ke-36 di tahun yang sama, yang mengamanatkan pembangunan RS Muhammadiyah di setiap provinsi. Didorong oleh tanggung jawab dan melihat dominasi RS swasta non-muslim di Bandung, Pimpinan Wilayah Muhammadiyah dan 'Aisyiyah pada 1967 menyetujui pendirian RS. Setelah konsultasi dengan pemerintah kota dan musyawarah internal, lokasi RS ditentukan di wilayah Karees dengan menukar amal usaha Panti Asuhan Taman Harapan Muhammadiyah dan Asrama Putri 'Aisyiyah, yang diformalkan pada 1 September 1967.</p>	ebook/2_roixDGZ.jpg	images/ebook/Buku_Pembina_Rohani_Islam.pdf	Olvia Nursaadah	18+	2019-03-02	2025-06-17 23:21:16+07	2025-06-17 23:21:05+07	\N	Buku-Pembinaan-Rohani-Islam	4-6 Menit	Indonesia	terverifikasi	\N	\N	\N	\N	7d7d9edc-f0e7-46e2-8943-33d53540c4a7	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-08 19:02:35+07	2025-06-17 23:25:59+07	\N	\N	\N	24b4bd90-913a-4872-84b7-13de83f9674c	Perahu Kertas	<p>"Perahu Kertas" menceritakan kisah <strong>Keenan</strong>, pelukis berbakat yang dipaksa belajar ekonomi, dan <strong>Kugi</strong>, penulis dongeng imajinatif. Mereka bertemu di bangku kuliah dan merasakan koneksi mendalam, namun terhalang oleh hubungan Keenan dan keengganan Kugi. Terpisah oleh waktu dan pilihan hidup, mereka menjalani jalur karier yang berbeda dan menjalin hubungan dengan orang lain (Keenan dengan Dabim, Kugi dengan Remi). Meskipun begitu, takdir terus menyatukan mereka, menguji cinta dan persahabatan, serta memaksa mereka untuk mengikuti kata hati demi mewujudkan impian dan menemukan arti kebahagiaan sejati.</p>	ebook/3_VVPlJrh.jpg	images/ebook/Perahu_Kertas.pdf	Endang Wuriyani	18+	2009-08-29	2025-06-17 23:25:59+07	2025-06-17 23:25:44+07	\N	perahu-kertas	4-6 Menit	Indonesia	terverifikasi	\N	\N	\N	\N	d0b19944-f720-4020-b2de-1c44dae2ebfd	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-08 19:54:28+07	2025-06-17 23:20:17+07	\N	\N	\N	0469c49b-8745-41fe-bf63-ee138a5ae447	Tradisi dan Kebudayaan Nusantara	<p>Ebook atau karya ini menggali kekayaan dan keragaman warisan budaya Indonesia. Materi yang dibahas meliputi berbagai bentuk seni (tari, musik, batik), ritual dan upacara adat, sistem kepercayaan lokal, filosofi hidup, kuliner, hingga bahasa daerah. Tujuannya adalah memperkenalkan, melestarikan, dan memahami keunikan serta dinamika tradisi dan kebudayaan Nusantara sebagai cerminan identitas multikultural bangsa.</p>	ebook/3.jpg	images/ebook/Tradisi_dan_Kebudayaan_Nusantara.pdf	Sumanto Al Qutuby 	18+	2017-06-02	2025-06-17 23:20:17+07	2025-06-17 23:20:05+07	\N	tradisi-dan-kebudayaan-nusantara	4-6 Menit	Indonesia	terverifikasi	\N	\N	\N	\N	ab8dbc95-1054-42b7-b29b-378c95e47eb7	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-08 20:00:41+07	2025-06-17 23:19:45+07	\N	\N	\N	0dca4fcd-f9a3-40fa-b78d-1f95c0df534b	Seni Budaya	<p>&nbsp;Seni Budaya adalah ekspresi dari nilai, kepercayaan, dan tradisi suatu masyarakat. Karya ini menyoroti bagaimana budaya membentuk seni dan sebaliknya, serta peran senibudaya dalam identitas, dialog antarbudaya, dan refleksi kondisi sosial.</p>	ebook/2.jpg	images/ebook/Seni_Budaya.pdf	Tri WahyuNingsih, S.Pd	18+	2010-10-22	2025-06-17 23:19:45+07	2025-06-17 23:18:34+07	\N	seni-budaya	4-6 Menit	Indonesia	terverifikasi	\N	\N	\N	\N	ab8dbc95-1054-42b7-b29b-378c95e47eb7	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-08 19:46:04+07	2025-06-17 23:20:48+07	\N	\N	\N	a1671548-17e6-4017-a233-c5511e80eae9	Injil-Matius-1-14	<p>Matthew dan Katherine dibaptis oleh Pendeta Philip. Setelah ditinggal dukacita, Matthew menikah lagi dengan Mary Warburton pada Juli 1690. Mereka mengalami duka beruntun dengan meninggalnya dua putri mereka, Elisabeth dan bayi perempuan kedua, yang keduanya meninggal di usia sangat muda. Di tengah penderitaan, Matthew merenungkan imannya dan menerima bahwa anak-anaknya kini berada di surga.</p>	ebook/1_DCJOq73.jpg	images/ebook/Injil-Matius-1-14.pdf	 Johnny Tjia	18+	2007-07-17	2025-06-17 23:20:48+07	2025-06-17 23:20:38+07	\N	injil-matius-1-14	4-6 Menit	Indonesia	terverifikasi	\N	\N	\N	\N	7d7d9edc-f0e7-46e2-8943-33d53540c4a7	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-08 19:28:00+07	2025-06-17 23:22:24+07	\N	\N	\N	a70c31ee-9a7f-47c1-a53d-581e4c76e565	Ilmu Keperawatan Medikal Bedah dan Gawat Darurat	<p>Keperawatan medikal bedah adalah spesialisasi kompleks yang berfokus pada perawatan orang dewasa dengan berbagai masalah medis dan pasca-bedah. Bidang ini menggabungkan ilmu dan teknik keperawatan penyakit dalam serta pembedahan, dengan pendekatan berbasis bukti, holistik (bio-psiko-sosio-spiritual), berpusat pada klien, dan memperhatikan aspek etika serta kemanusiaan. Disebutkan pula bahwa keperawatan medikal bedah telah berkembang dari posisi entry-level menjadi spesialisasi esensial dalam pelayanan kesehatan, dengan karakteristik utama berupa prioritas, pengorganisasian, pemikiran kritis, dan pemecahan masalah yang inovatif.</p>	ebook/3_BgBSWKS.jpg	images/ebook/Ilmu_Keperawatan_Medikal_Bedah_dan_Gawat_Darurat.pdf	 Ns. Arif Munandar, S.Kep., M.Kep	18+	2022-02-03	2025-06-17 23:22:24+07	2025-06-17 23:22:11+07	\N	ilmu-keperawatan-medikal-bedah-dan-gawat-darurat	4-6 Menit	Indonesia	terverifikasi	\N	\N	\N	\N	86343adb-b342-4540-94b5-5598aaedd2f2	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-08 19:24:03+07	2025-06-17 23:23:22+07	\N	\N	\N	23fd15a9-45aa-493f-977c-ca4ca56ea1ed	KesehatanDanKebugaranJasmani	<p>olahraga dan kebugaran di lingkungan SMK 26 Jakarta. Disebutkan bahwa tuntutan dunia kerja, yang akan dihadapi oleh siswa SMK, sangat memerlukan tingkat kebugaran yang tinggi. Oleh karena itu, dengan memberikan pemahaman tentang kebutuhan kebugaran di dunia kerja, memantau status gizi yang baik, dan memberikan bimbingan yang berkelanjutan, diharapkan kebugaran siswa dapat ditingkatkan. Bagian akhir teks juga menyertakan informasi singkat mengenai latar belakang akademik penulis.</p>	ebook/2_h98kHT4.jpg	images/ebook/KesehatanDanKebugaranJasmani.pdf	Ana marsela Suwarno, M.Pd	18+	2023-02-13	2025-06-17 23:23:22+07	2025-06-17 23:23:09+07	\N	kesehatandankebugaranjasmani	4-6 Menit	Indonesia	terverifikasi	\N	\N	\N	\N	86343adb-b342-4540-94b5-5598aaedd2f2	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-08 19:17:31+07	2025-06-17 23:23:59+07	\N	\N	\N	aa3a8547-ca11-4b45-b74a-c7388513fb06	Psikologis Kesehatan	<p>Psikologi kesehatan adalah cabang psikologi yang mengkaji secara mendalam bagaimana kondisi psikologis memengaruhi kesehatan seseorang, mengapa individu jatuh sakit, dan bagaimana mereka bereaksi terhadap penyakit. Munculnya disiplin ilmu ini didorong oleh beberapa faktor utama, di antaranya peningkatan penyakit kronis yang terkait dengan gaya hidup, peran penting aspek ekonomi dalam pengembangan perawatan kesehatan, serta pengakuan terhadap kontribusi signifikan faktor psikologis dan sosial terhadap kesehatan dan kondisi sakit. Selain itu, kebutuhan untuk membuktikan efektivitas intervensi psikologis dalam meningkatkan kesehatan masyarakat dan adanya sumbangan metodologis dari penelitian juga turut melatarbelakangi perkembangan psikologi kesehatan. Dengan demikian, latar belakang ini menekankan urgensi psikologi kesehatan dalam memahami kompleksitas masalah kesehatan modern melalui lensa psikologis dan sosial.</p>	ebook/1_qT8BD8Q.jpg	images/ebook/Psikologi_Kesehatan.pdf	Dr. Yusuf Alamudi, M.Kes  	18+	2013-03-12	2025-06-17 23:23:59+07	2025-06-17 23:23:46+07	\N	psikologis-kesehatan	4-6 Menit	Indonesia	terverifikasi	\N	\N	\N	\N	86343adb-b342-4540-94b5-5598aaedd2f2	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-08 20:05:44+07	2025-06-17 23:19:32+07	\N	\N	\N	860a7eec-e6a2-4f49-bc70-0e051b92921f	Kebudayaan di Indonesia	<p>"Kebudayaan" akan mengeksplorasi berbagai aspek seperti pembentukan identitas kolektif, transmisi nilai-nilai dari generasi ke generasi, adaptasi budaya terhadap lingkungan, serta interaksi dan difusi antarbudaya. Materi juga mungkin mencakup pembahasan tentang unsur-unsur universal kebudayaan (seperti bahasa, sistem kekerabatan, agama, dan sistem ekonomi), serta perbedaan-perbedaan budaya yang menghasilkan keragaman luar biasa di seluruh dunia.</p><p>Pada intinya, karya ini bertujuan untuk memberikan pemahaman komprehensif tentang bagaimana kebudayaan membentuk perilaku, pandangan dunia, dan organisasi sosial manusia, serta perannya dalam menciptakan makna dan kohesi dalam kehidupan bermasyarakat.</p>	ebook/1.jpg	images/ebook/Kebudayaan_di_Indonesia.pdf	Desi Karolina, S.Ps,M.Pd	18+	2021-12-30	2025-06-17 23:19:32+07	2025-06-17 23:19:20+07	\N	kebudayaan-di-indonesia	4-6 Menit	Indonesia	terverifikasi	\N	\N	\N	\N	ab8dbc95-1054-42b7-b29b-378c95e47eb7	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-08 19:35:06+07	2025-06-17 23:21:48+07	\N	\N	\N	237b3c0e-5c7d-4979-a792-7c647bf619f2	Abraham Sahabat Allah	<p>Abram yang telah menunjukkan ketaatan penuh kepada perintah Allah, melakukan perjalanan menuju negeri yang dijanjikan. Meskipun Allah telah menepati janji-Nya, sebuah kejadian tak terduga yang bertentangan dengan harapan Abram justru terjadi. Narasi ini kemudian mengajukan serangkaian pertanyaan kunci: tentang peristiwa yang menimpa Abram, tindakan Abram dalam menghadapi situasi tersebut, karakter Abram yang terungkap di tengah kesulitan, posisi Allah dalam kesulitan itu, dan pelajaran yang dapat diambil tentang Allah dari pengalaman Abram. Penggalan ini secara efektif membangun ketegangan dan rasa ingin tahu pembaca tentang ujian iman yang akan dihadapi Abram.</p>	ebook/3_oxvF069.jpg	images/ebook/Abraham_Sahabat_Allah.pdf	Evangelism Board NRG	18+	2017-04-05	2025-06-17 23:21:48+07	2025-06-17 23:21:37+07	\N	abraham-sahabat-allah	4-6 Menit	Indonesia	terverifikasi	\N	\N	\N	\N	7d7d9edc-f0e7-46e2-8943-33d53540c4a7	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-08 18:51:10+07	2025-06-19 16:23:07.050337+07	\N	\N	\N	3556fd49-eba7-46f9-924b-f03483a79964	Setelah dia pergi Soeharto	<p>Soeharto memberlakukan protokol ketat di rumah sakit, membatasi siapa saja yang boleh menjenguk, bahkan beberapa mantan orang dekat seperti Harmoko dan Habibie tidak diizinkan masuk. Setelah wafat, liputan media semakin intens, berfokus pada kebaikan dan kisah sukses Soeharto, meningkatkan rating televisi dan menarik banyak iklan. Penulis mengamati bahwa upaya "menggoreng" perasaan rakyat melalui TV ini berhasil menciptakan persepsi publik di mana Soeharto hanya boleh diberi simpati dan doa. Siapa pun yang mencoba menyinggung kesalahan atau dosanya dianggap keliru, jahil, atau menyimpan dendam. Fenomena ini, menurut Asep Purnama Bahtiar, seorang dosen, menunjukkan bahwa media massa telah mengkonstruksi "dunia" tentang Soeharto, bukan lagi menyampaikan kenyataan sebagaimana adanya.</p>	ebook/3_hVPoD3d.jpg	images/ebook/Setelah_dia_pergi_Soeharto.pdf	Leila S. Chudori 	18+	2018-06-12	2025-06-19 16:23:07.049328+07	2025-06-19 16:22:51.637318+07	\N	setelah-dia-pergi-soeharto	4-6 Menit	Indonesia	terverifikasi	\N	\N	\N	\N	95da19e9-1b66-4a94-907c-b9d9cd25a779	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-08 18:40:14+07	2025-06-19 16:24:23.731523+07	\N	\N	\N	07bcaa68-8543-4373-9721-a51c0f5ec8ea	Gunung Puntang	<p>Der Text behandelt die Herausforderung, eine Funkverbindung über 11.500 km zu überbrücken, was mit den damaligen technischen Mitteln nur schwer zu lösen war. Bereits 1913 gab es Pläne für eine Verbindung zwischen Holland und Java mittels dreier Zwischenstationen: eine auf Malta, eine in Tripolis und eine dritte in Massaua. Dieses Projekt barg jedoch das Risiko verschiedener Hindernisse. Ein zweites Projekt sah eine Verbindung von Java nach Holland in westlicher Richtung vor, wobei Zwischenstationen in den USA genutzt werden sollten, da man zu Beginn des Weltkriegs von der Neutralität der USA ausging. Die Überbrückung dieser Distanz, größtenteils über Land und halbwegs über hohe Gebirge Zentralasiens, stellte eine immense technische Aufgabe dar. Während des nördlichen Sommers sollte die Strecke in etwa 3 Stunden und im nördlichen Winter in 7 Stunden überbrückt werden. Anfang 1916 wurde eine Empfangsanlage entwickelt und dem niederländischen Kolonialministerium zur Erprobung in Java angeboten.</p>	ebook/1_JKVb09J.jpg	images/ebook/Gunung_Puntang.pdf	Vany Oktaviany	18+	2015-01-23	2025-06-19 16:24:23.731523+07	2025-06-19 16:24:10.313592+07	\N	gunung-puntang	4-6 Menit	Jerman	terverifikasi	\N	\N	\N	\N	95da19e9-1b66-4a94-907c-b9d9cd25a779	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-08 18:46:59+07	2025-06-19 16:23:52.930468+07	\N	\N	\N	eee02bc9-38e0-4898-8b1b-638ef9c5337c	Kebangkitan Pemuda	<p>Pergerakan pemuda Indonesia dinanti kembali untuk memberikan arah bagi perjalanan bangsa. Kaum muda selalu diyakini sebagai pelopor yang mengobarkan api kehidupan dan menjadi pilar kebangkitan suatu bangsa. Dengan kegelisahan pemuda yang kian mengental dan berpotensi menjadi ledakan energi, momentum ini dianggap tepat untuk melahirkan Undang-Undang Kepemudaan. Undang-undang ini diharapkan menempatkan generasi muda sebagai subjek utama pembangunan, menjamin masa depan Indonesia melalui perbaikan pendidikan, peningkatan kualitas hidup, dan perlindungan hukum sebagai pemenuhan hak-hak asasi pemuda.</p>	ebook/2_JOukv1u.jpg	images/ebook/kebangkitan_Pemuda.pdf	uhammad Elvandi, Lc. MA	18+	2013-05-02	2025-06-19 16:23:52.930468+07	2025-06-19 16:23:39.246616+07	\N	kebangkitan-pemuda	4-6 Menit	Indonesia	terverifikasi	\N	\N	\N	\N	95da19e9-1b66-4a94-907c-b9d9cd25a779	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
\.


--
-- Data for Name: deiyaiplus_admin_ecerpen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_ecerpen (created_at, updated_at, deleted_at, archived_at, status_at, ecerpen_id, judul, sinopsis, cover, path_ecerpen, penulis, tanggal_verifikasi, batas_usia, alasan_penolakan, tanggal_publikasi, slug, durasi_baca, status, archived_by_id, created_by_id, creator_id, deleted_by_id, kategori_id_id, status_by_id, updated_by_id, user_id_id) FROM stdin;
2025-06-04 10:21:05+07	2025-06-20 00:15:51.753288+07	\N	\N	\N	07e7c685-e145-4ac0-b7c1-8a1faf1a49e2	Gayatri Milenial 	<p>Dyah Ayu Gayatri Srinarendra Rajapatni, yang akrab disapa Gea, adalah seorang siswi SMA yang merasa telah beranjak dewasa. Ia percaya orang tuanya terinspirasi oleh tokoh sentral Majapahit saat memberinya nama, mungkin karena harapan besar atau pengaruh keluarga ibunya yang menganut budaya Kejawen.</p><p>Gea merasa dewasa bukan karena pemikirannya yang militan, melainkan karena ia mengambil peran penting dalam menghadapi krisis di perusahaan ayahnya. Ketika perusahaan mengalami PHK besar-besaran akibat distorsi dan ayahnya sering didatangi "tamu" tak diundang yang mendesak untuk melakukan manuver, Gea selalu mendampingi ayahnya untuk menemui dan menghadapi situasi tersebut.</p>	ecerpen/1.jpg	images/ecerpen/Gayatri_Milenial.pdf	Haidar Maarifa 	2025-06-20 00:15:51.753288+07	17+	\N	2021-03-25 00:00:00+07	gayatri-milenial	4-6 Menit	terverifikasi	\N	\N	\N	\N	a9db3d4f-99bc-4ec2-b84a-ffb87d9d3e87	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-03 18:27:09+07	2025-06-17 22:51:49+07	\N	\N	\N	df84da78-3e13-4c4c-9f06-41092c27db2e	Aku Anak Berani dan Pantang Menyerah	<p>Kisah ini memperkenalkan Uswah, seorang siswi kelas 4 SD yang cerdas dan periang, sekaligus satu-satunya anak perempuan dari tiga bersaudara. Meskipun demikian, Uswah tampak kurang percaya diri dalam mengemukakan pendapatnya. Hal ini terlihat ketika ibunya menginginkan sesuatu yang sebenarnya tidak cocok untuk Uswah, namun ia hanya diam meskipun merasa keberatan. Contohnya, saat ibunya meminta kapster memotong poni rambut Uswah sangat pendek, Uswah tidak menyuarakan ketidaksetujuannya. Narasi ini menyoroti tema suara anak yang tertekan dan pengaruh orang tua yang mungkin bermaksud baik namun terlalu mendominasi.</p>	ecerpen/1_IyeLEP3.jpg	images/ecerpen/Aku_Anak_Berani_dan_Pantang_Menyerah_tipe_anak-anak.pdf	Leguty Family	2025-06-17 22:51:49+07	13+	\N	2021-12-19 10:00:00+07	Aku-Anak-Berani-dan-Pantang-Menyerah	4-6 Menit	terverifikasi	\N	\N	\N	\N	1588cd8b-784d-4c50-bccf-b1eae6c0a960	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-04 10:13:29+07	2025-06-20 00:15:22.109783+07	\N	\N	\N	ed3cfd61-8e4c-4b4a-9be8-4fe5b515c218	Turnamen Kecil	<p>Di desa Kalibri, hiduplah seorang anak pendiam bernama Albi, siswa kelas 5 SD, yang hanya memiliki sedikit teman dekat. Suatu hari, temannya, Izam, mengajaknya bermain voli sepulang sekolah. Albi yang sudah lama tidak bermain voli karena sibuk belajar untuk PTS, langsung setuju untuk ikut bermain pada pukul setengah dua.</p><p>Setelah pulang sekolah dan membersihkan diri, Albi pamit kepada ibunya dan berangkat ke lapangan dengan sepeda kesayangannya, "Bico". Sesampainya di sana, Albi disambut oleh teman-temannya yang lain, termasuk Anton, Zaki, Toni, Reza, Briyan, dan Rangga. Mereka belum membagi kelompok dan menunggu Albi. Setelah melakukan suit, Albi memenangkan suit melawan Toni, dan timnya ditentukan berdasarkan hasil suit tersebut.</p>	ecerpen/3_MqNV4Vg.jpg	images/ecerpen/Turnamen_Kecil.pdf	Lia Nur Risqi 	2025-06-20 00:15:22.109783+07	18+	\N	2023-01-18 00:00:00+07	turnamen-kecil	4-6 Menit	terverifikasi	\N	\N	\N	\N	3106f671-c946-4093-bf00-014c14b0f17b	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-03 19:04:51+07	2025-06-20 00:14:19.969847+07	\N	\N	\N	19a23f52-fa7d-44f6-adb2-8759b9df0416	Yogyakarta	<p>Cerpen ini mengisahkan kegembiraan seorang anak (tokoh "aku") ketika ibunya secara mendadak mengumumkan rencana liburan keluarga ke Yogyakarta pada hari Minggu. Kabar ini disambut antusias oleh "aku", yang langsung menanyakan detail keberangkatan dan transportasi. Sang ibu menjelaskan bahwa mereka akan berangkat pukul 03.30 pagi dan naik kereta.</p><p>Keesokan harinya, keluarga itu bangun pukul 03.00 pagi untuk salat Subuh dan bersiap-siap. Mereka menuju stasiun dengan mobil, berharap tiba sekitar pukul 04.00 pagi sebelum kereta tiba pukul 05.00. Namun, di luar dugaan, perjalanan mereka diwarnai kemacetan. Meskipun demikian, "aku" tetap santai dan berharap bisa sampai tepat waktu.</p><p>Mereka akhirnya tiba di stasiun pukul 04.19. Sambil menunggu kereta, mereka memutuskan untuk sarapan soto di restoran terdekat. Setelah sarapan, pada pukul 04.50, kereta tiba. "Aku" dan keluarganya segera naik dan mendapatkan tempat duduk yang nyaman. Selama perjalanan, "aku" dan adiknya menikmati pemandangan indah di luar jendela kereta, merasakan pengalaman pertama naik kereta dengan penuh kegembiraan. Cerpen ini menyoroti momen kebersamaan keluarga dan antusiasme dalam menghadapi liburan.</p>	ecerpen/3_JTY21oV.jpg	images/ecerpen/Yogyakarta.pdf	Muhammad Rahmanuddin Dinejad 	2025-06-20 00:14:19.969847+07	18+	\N	2020-10-05 00:00:00+07	Yogyakarta	4-6 Menit	terverifikasi	\N	\N	\N	\N	9b5e8d09-f2fd-45bd-9837-36de8186fbf1	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-03 18:40:22+07	2025-06-20 00:13:50.529798+07	\N	\N	\N	95eff00a-07d1-4e1e-b90e-22a09868e155	Harga Sebuah Kejujuran 	<p>Cerpen ini berpusat pada dilemma etika yang dihadapi Niken dan Wulan, murid kelas 5A, saat mereka mengetahui kecurangan teman sebangku mereka, Caca. Caca secara diam-diam mengganti jawaban salah pada lembar ulangannya dengan jawaban benar yang ditulis guru, Bu Aisyah. Bu Aisyah, yang sangat mempercayai murid-muridnya dan bangga akan peningkatan nilai mereka, bahkan memuji Caca di depan kelas, membuat Dini, si juara kelas, merasa tergeser.</p><p>Niken dan Wulan, yang menyaksikan kecurangan itu, merasa serba salah. Mereka tidak berani menegur Caca karena keluarga Caca, terutama ayahnya Pak Darma, adalah sosok dermawan yang telah banyak membantu keluarga mereka, termasuk memberikan pekerjaan baru kepada ayah Wulan dan santunan kepada anak yatim seperti Niken. Mereka juga menyadari bahwa Caca tidak pernah membicarakan kebaikan keluarganya di sekolah, sehingga teman-teman lain tidak mengetahui bantuan yang diberikan.</p><p>Kecurangan Caca berlanjut, dan kegelisahan Niken dan Wulan memuncak ketika sekolah mengumumkan lomba cerdas cermat antar kelas. Setelah pemungutan suara, Caca terpilih mewakili kelas 5A, mengalahkan Dini yang selama ini selalu menjadi perwakilan. Dini, meski merasa sakit hati, juga memiliki ikatan emosional dengan keluarga Caca karena Ayahnya pernah dibantu oleh Pak Darma saat sakit. Niken dan Wulan mencoba membujuk Dini untuk melaporkan kecurangan Caca demi kebaikan kelas, bahkan menawarkan diri sebagai saksi, tetapi Dini bimbang karena tidak ingin mengadu dan juga mengingat kebaikan keluarga Caca.</p><p>Puncaknya terjadi saat lomba cerdas cermat. Caca yang selama ini mengandalkan kecurangan, terlihat sangat gugup dan tertinggal jauh dari peserta lain. Kelas 5A terancam menjadi juara terakhir. Adegan ini menyoroti konsekuensi dari ketidakjujuran dan beban moral yang dirasakan oleh teman-teman yang menyaksikannya, serta kompleksitas hubungan pertemanan dan rasa terima kasih yang menghambat mereka untuk bertindak.</p>	ecerpen/3_jbvpVYH.jpg	images/ecerpen/Harga_Sebuah_Kejujuran_tipe_anak-anak.pdf	Alifia Khoerunnisa 	2025-06-20 00:13:50.529798+07	13+	\N	2003-10-18 00:00:00+07	Harga-Sebuah-Kejujuran	4-6 Menit	terverifikasi	\N	\N	\N	\N	1588cd8b-784d-4c50-bccf-b1eae6c0a960	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-03 18:31:58+07	2025-06-17 22:51:20+07	\N	\N	\N	c00fdae7-f1f6-40bf-a572-cf6ce0432898	Aku dan Mimpiku	<p>Cerpen ini mengisahkan Helio, seorang remaja kelas 12, yang sejak kecil memendam cita-cita besar untuk menjadi seorang dokter. Mimpi ini sangat didukung oleh sang ayah, yang dulunya juga memiliki impian serupa namun tak bisa tercapai karena kendala finansial. Sang ayah selalu menanamkan semangat untuk terus berusaha dan pantang menyerah, menguatkan Helio setiap kali ia merasa putus asa.</p><p>Namun, di balik semangat tersebut, Helio menyimpan kekhawatiran mendalam. Setelah kepergian ibunda dan kemudian disusul oleh ayahnya beberapa bulan lalu, kondisi finansial keluarga memburuk. Helio kini tinggal bersama pamannya, dan ia menyadari bahwa jalan menuju mimpinya semakin berat. Ia giat mengikuti berbagai olimpiade dan lomba dengan harapan bisa mendapatkan beasiswa sebagai bekal.</p><p>Kisah berlanjut saat Helio mengingat janjinya untuk belajar bersama Luna di perpustakaan sepulang sekolah untuk persiapan olimpiade. Ia segera bergegas ke perpustakaan yang sunyi dan tenang, sebuah tempat yang ideal untuk belajar, sambil menunggu kedatangan Luna dan mencari buku-buku. Cerpen ini menyoroti perjuangan Helio dalam meraih mimpinya di tengah cobaan hidup dan kehilangannya.</p>	ecerpen/2_REiZyiA.jpg	images/ecerpen/aku_dan_mimpiku_tipe_anak-anak.pdf	Nadya Carissa Wongkar	2025-06-17 22:51:20+07	13+	\N	2022-11-20 10:00:00+07	aku-dan-mimpiku	4-6 Menit	terverifikasi	\N	\N	\N	\N	1588cd8b-784d-4c50-bccf-b1eae6c0a960	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-03 19:22:07+07	2025-06-20 00:14:56.344765+07	\N	\N	\N	6e65db96-4720-44d0-a3e2-a0a601ceb9c8	Si Kecil Budi 	<p>Cerpen ini mengisahkan awal mula kehidupan Louis Braille, seorang anak berusia tiga tahun yang kehilangan penglihatannya akibat kecelakaan tragis. Kisah bermula di Coupvrey, Perancis, sebuah desa peternak kuda yang menjadi ikon wisata dan tengah merayakan Coupvrey Horse Festival tahunan. Di tengah keramaian festival, Louis bermain riang bersama anjing peliharaannya, Jo.</p><p>Tanpa disadari, permainan kejar-kejaran mereka membawa Louis dan Jo tersesat jauh dari desa. Dengan kepolosan balitanya, Louis berusaha mencari jalan pulang. Keberuntungan memihak mereka saat bertemu seorang kakek tua bernama Memphis Dempay. Louis, yang dikenal pandai berbicara, menceritakan tentang dirinya dan ayahnya, Simon Rene Braille, joki kondang dan pemilik Braille Horse Arena. Kakek Dempay terkesima dan bersedia mengantar Louis pulang.</p><p>Setibanya di desa, Louis bergegas mencari ayahnya yang sedang beristirahat. Setelah perdebatan lucu antara orang tuanya, Simon akhirnya menemui Kakek Dempay. Sementara Simon dan Kakek Dempay berbincang, Louis kembali bermain petak umpet dengan Jo. Ia bersembunyi di dalam kandang kuda ayahnya. Namun, saat meniup peluit sebagai tanda untuk Jo, suara peluit itu mengejutkan kuda-kuda, menyebabkan kegaduhan dan perkakas berjatuhan. Nahas, Louis tertimpa pelana di kepalanya.</p><p>Simon dan Kakek Dempay yang mendengar keributan segera menghampiri kandang dan menemukan Louis menangis kesakitan dengan darah mengalir dari pelipisnya. Mereka segera memanggil Dr. Grosjean. Louis dibawa ke rumah sakit, dan hasil pemeriksaan menunjukkan bahwa kedua matanya terinfeksi parah, menyebabkan ia kehilangan penglihatan secara permanen. Keluarga Braille terpukul dan menyesali kejadian itu, namun Louis kecil menunjukkan ketabahan luar biasa, menenangkan kedua orang tuanya dengan senyum penuh harapan.</p><p>Meskipun hidupnya diselimuti kegelapan, Louis Braille tidak menyerah. Kisah ini menegaskan bahwa kehilangan penglihatan bukanlah akhir segalanya, melainkan awal dari perjalanan Louis untuk mencari cara agar ia dapat menjalani hidupnya dengan bahagia, yang pada akhirnya mengantarkannya menjadi penemu metode baca bagi kaum tunanetra.</p>	ecerpen/3_0PAGzjF.jpg	images/ecerpen/Si_Kecil_Budi.pdf	Meryta Ajeng A. 	2025-06-20 00:14:56.344765+07	18+	\N	2015-06-23 00:00:00+07	Si-Kecil-Budi	4-6 Menit	terverifikasi	\N	\N	\N	\N	d8785632-e2fd-4d29-b7c2-423f49e76f46	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-04 10:17:14+07	2025-06-20 00:15:39.070845+07	\N	\N	\N	61af5d07-2350-4bac-8e5d-46adeaaef226	Untuk Garuda	<p>Joko, seorang kiper berusia 18 tahun, bermain untuk tim sepak bola besar dan memiliki banyak teman, terutama kapten timnya, Gerry. Suatu hari, mereka berdua terpilih untuk mengikuti seleksi tim nasional, dan dari banyaknya saingan, hanya Joko dan Gerry yang berhasil lolos. Gerry, yang akan mengenakan nomor punggung 10 dan menjadi kapten, berbincang santai dengan Joko tentang nomor punggung mereka.</p><p>Timnas kemudian mengadakan latihan untuk menentukan sebelas pemain utama yang akan menghadapi timnas Jepang. Pelatih mengumumkan formasi 4-3-3 dengan Joko sebagai kiper, Dedy dan Beni sebagai <i>central back</i>, Dodi dan Abdul sebagai <i>bek</i> kanan dan kiri, Dono dan Doni sebagai gelandang serang, Cristian sebagai gelandang bertahan, Ilham dan Asep sebagai penyerang, serta Gerry sebagai <i>targetman</i> dan kapten.</p><p>Setelah melalui perjalanan Piala Dunia yang sulit, tim Joko berhasil mencapai final dan akan berhadapan dengan Inggris. Di babak pertama, saat pertandingan berjalan 35 menit, Inggris mendapatkan tendangan bebas di dekat kotak penalti akibat pelanggaran Cristian. Tendangan tersebut mengarah ke pojok tiang gawang Joko dan tidak terjangkau, menghasilkan gol untuk Inggris.</p>	ecerpen/2_j2sM0Ff.jpg	images/ecerpen/Untuk_Garuda.pdf	Muhammad Arrizal Ibnu Ramadhan	2025-06-20 00:15:39.070845+07	18+	\N	2015-09-28 00:00:00+07	untuk-garuda	4-6 Menit	terverifikasi	\N	\N	\N	\N	3106f671-c946-4093-bf00-014c14b0f17b	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-04 10:26:55+07	2025-06-20 00:16:16.161017+07	\N	\N	\N	e922ec78-5810-4c5b-86e1-739455c35e9b	Revolyutsiya	<p>Seorang gadis muda terbangun di pagi hari dengan perasaan bahagia. Ia bersiap-siap dan berangkat menuju tokonya dengan senyum di bibir, menikmati suasana pagi. Namun, ketenangan itu terusik saat segerombolan pasukan berkuda berjubah hijau melintas menuju istana. Raut wajah mereka memancarkan kemarahan yang membuat suasana kota berubah menjadi panik dan lesu.</p><p>Kondisi kota memang sedang kacau balau akibat krisis ekonomi dan politik setelah kekalahan perang pada tahun 1915. Wanita harus bekerja keras untuk memenuhi kebutuhan sehari-hari, dan kelaparan serta pajak tinggi menjadi masalah umum. Setiap kali pasukan berkuda, yang dikenal sebagai pemberontak monarki yang kejam, datang ke istana, kekacauan selalu terjadi.</p><p>Kepala toko mengumumkan bahwa mereka harus bekerja hingga larut malam untuk memastikan pasokan pangan cukup esok hari, menandakan situasi darurat. Mereka juga diizinkan membawa pulang roti. Saat malam tiba, suara tembakan bertubi-tubi terdengar. Gadis itu mengintip dan melihat lebih banyak pasukan berkuda bergerak menuju istana. Karena situasi di luar terlalu berbahaya, mereka tidak bisa pulang dan memutuskan bersembunyi di ruang bawah tanah. Suara teriakan minta tolong dan tangisan terdengar dari atas, diikuti hentakan keras dan reruntuhan bangunan di bagian belakang toko. Mereka pun terperangkap dalam kegelapan.</p>	ecerpen/3.jpg	images/ecerpen/Revolyutsiya.pdf	Yulia Rista 	2025-06-20 00:16:16.161017+07	17+	\N	2023-06-23 00:00:00+07	revolyutsiya	4-6 Menit	terverifikasi	\N	\N	\N	\N	a9db3d4f-99bc-4ec2-b84a-ffb87d9d3e87	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-03 18:54:16+07	2025-06-20 00:13:34.359007+07	\N	\N	\N	d3248015-96dd-498e-93a3-1120c5b772b3	Membatik	<p>Cerpen ini mengisahkan Sahitha, seorang remaja putri yang sangat mencintai seni membatik, salah satu warisan budaya Indonesia. Kisah diawali dengan rutinitas pagi Sahitha yang disiplin, mulai dari bangun subuh, salat, hingga mempersiapkan diri untuk les membatik. Ia diantar oleh kakak perempuannya, Laiyah, ke tempat les.</p><p>Di tempat les, Sahitha bertemu sahabatnya, Nasyfa, dan Ayfa. Mereka berbincang tentang adanya pemilihan perwakilan untuk lomba membatik tingkat kabupaten. Tak lama kemudian, kakak pembimbing les, Kak Athik dan Kak Gheno, mengumumkan lima nama yang terpilih, termasuk Sahitha, Nasyfa, Ayfa, Yuriva, dan Olvira. Sahitha merasa senang dan termotivasi.</p><p>Pada sesi membatik hari itu, tema yang diberikan adalah "Indonesia". Sahitha memilih tema kehidupan bawah laut Indonesia, menggambar ikan, terumbu karang, pasir, dan rumput laut. Sementara itu, Nasyfa membuat motif flora Indonesia seperti bunga melati, anggrek bulan, dan raflesia arnoldi. Sahitha mempersiapkan diri dengan sangat serius untuk lomba yang akan diadakan dua minggu lagi, bahkan rela pulang lebih malam dari les demi meningkatkan kemampuannya.</p><p>Cerpen ini berakhir dengan gambaran masa depan Sahitha yang sukses. Ia menjadi pembuat batik terkenal di seluruh dunia setelah berhasil menembus lomba hingga ke mancanegara. Kisah ini menyampaikan pesan tentang kecintaan terhadap budaya, kerja keras, dan bagaimana dedikasi pada suatu hobi dapat membawa seseorang meraih kesuksesan besar dan mengharumkan nama bangsa.</p>	ecerpen/2_tHVxPrK.jpg	images/ecerpen/Membatik.pdf	Alyaniza Nur Adelawina	2025-06-20 00:13:34.359007+07	18+	\N	2017-06-21 00:00:00+07	Membatik	4-6 Menit	terverifikasi	\N	\N	\N	\N	9b5e8d09-f2fd-45bd-9837-36de8186fbf1	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-03 19:00:22+07	2025-06-20 00:14:05.861076+07	\N	\N	\N	e48b190a-d003-4bb3-b8e6-c35cb3b61a73	Permainan Baru Otto	<p>Cerpen ini mengisahkan tokoh "aku" yang, tidak seperti biasanya, memilih untuk bermain egrang, sebuah permainan baru yang ia pelajari dari abang tentara di distriknya. Ia mengajak Kareen, temannya, untuk ikut bermain. Dengan sigap, "aku" memotong bambu dan membuatkan egrang baru untuk Kareen, menjelaskan cara pembuatannya dengan logat khas Papua. Baik "aku" maupun Kareen, yang sudah terbiasa membuat mainan dari kayu, tidak mengalami kesulitan berarti dalam membuat egrang mereka sendiri.</p>	ecerpen/1_MPehugR.jpg	images/ecerpen/Permainan_Baru_Otto.pdf	Tika Awalin	2025-06-20 00:14:05.861076+07	18+	\N	2020-12-18 00:00:00+07	permainan-baru-otto	4-6 Menit	terverifikasi	\N	\N	\N	\N	9b5e8d09-f2fd-45bd-9837-36de8186fbf1	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-03 19:14:47+07	2025-06-20 00:14:44.361362+07	\N	\N	\N	6042a77e-1d53-4929-ab8c-78d4188daa27	Senyuman Awan Kelam	<p>Cerpen ini mengisahkan awal mula kehidupan Louis Braille, seorang anak berusia tiga tahun yang kehilangan penglihatannya akibat kecelakaan tragis. Kisah bermula di Coupvrey, Perancis, sebuah desa peternak kuda yang menjadi ikon wisata dan tengah merayakan Coupvrey Horse Festival tahunan. Di tengah keramaian festival, Louis bermain riang bersama anjing peliharaannya, Jo.</p><p>Tanpa disadari, permainan kejar-kejaran mereka membawa Louis dan Jo tersesat jauh dari desa. Dengan kepolosan balitanya, Louis berusaha mencari jalan pulang. Keberuntungan memihak mereka saat bertemu seorang kakek tua bernama Memphis Dempay. Louis, yang dikenal pandai berbicara, menceritakan tentang dirinya dan ayahnya, Simon Rene Braille, joki kondang dan pemilik Braille Horse Arena. Kakek Dempay terkesima dan bersedia mengantar Louis pulang.</p><p>Setibanya di desa, Louis bergegas mencari ayahnya yang sedang beristirahat. Setelah perdebatan lucu antara orang tuanya, Simon akhirnya menemui Kakek Dempay. Sementara Simon dan Kakek Dempay berbincang, Louis kembali bermain petak umpet dengan Jo. Ia bersembunyi di dalam kandang kuda ayahnya. Namun, saat meniup peluit sebagai tanda untuk Jo, suara peluit itu mengejutkan kuda-kuda, menyebabkan kegaduhan dan perkakas berjatuhan. Nahas, Louis tertimpa pelana di kepalanya.</p><p>Simon dan Kakek Dempay yang mendengar keributan segera menghampiri kandang dan menemukan Louis menangis kesakitan dengan darah mengalir dari pelipisnya. Mereka segera memanggil Dr. Grosjean. Louis dibawa ke rumah sakit, dan hasil pemeriksaan menunjukkan bahwa kedua matanya terinfeksi parah, menyebabkan ia kehilangan penglihatan secara permanen. Keluarga Braille terpukul dan menyesali kejadian itu, namun Louis kecil menunjukkan ketabahan luar biasa, menenangkan kedua orang tuanya dengan senyum penuh harapan.</p><p>Meskipun hidupnya diselimuti kegelapan, Louis Braille tidak menyerah. Kisah ini menegaskan bahwa kehilangan penglihatan bukanlah akhir segalanya, melainkan awal dari perjalanan Louis untuk mencari cara agar ia dapat menjalani hidupnya dengan bahagia, yang pada akhirnya mengantarkannya menjadi penemu metode baca bagi kaum tunanetra.</p>	ecerpen/4.jpg	images/ecerpen/Senyuman_Awan_Kelam.pdf	Galih Andriansyah 	2025-06-20 00:14:44.361362+07	18+	\N	2019-01-17 00:00:00+07	senyuman-awan-kelam	4-6 Menit	terverifikasi	\N	\N	\N	\N	d8785632-e2fd-4d29-b7c2-423f49e76f46	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-03 19:10:38+07	2025-06-20 00:14:31.588135+07	\N	\N	\N	c27d7f78-3160-456e-a136-11e07385da0d	Amai Saksi Bisu Perlawanan PRRI 1958	<p>Cerpen ini mengisahkan pengalaman masa kecil Amai, seorang gadis berusia sepuluh tahun dari Batu Bulek, Tanah Datar, Sumatera Barat, yang hidup di tengah konflik antara APRI dan PRRI. Amai, anak sulung dari empat bersaudara, tinggal bersama neneknya sementara orang tuanya merantau. Kesehariannya diisi dengan membantu nenek dan bermain bersama teman-teman.</p><p>Suatu sore, suasana riang Amai dan teman-temannya mendadak berubah menjadi ketakutan ketika suara tembakan dari helikopter serdadu APRI terdengar. Amai segera berlari dan bersembunyi di dalam parit besar sendirian selama setengah jam. Meskipun pucat dan syok saat pulang, neneknya memeluknya penuh kecemasan. Peristiwa serupa terjadi berulang kali, membuat Amai terbiasa dengan ketakutan meskipun tetap merasakannya.</p><p>Ketegangan semakin terasa ketika Amai mendengar kabar kerabat jauhnya tewas tertembak. Malam itu, ia bersama neneknya melewati pasar yang berbau amis darah dalam perjalanan menuju rumah duka. Untuk melindungi diri, Amai bersama nenek dan adik-adiknya bahkan membuat lubang galian di rumah sebagai tempat persembunyian. Amai yang khawatir bertanya kepada neneknya apakah perang akan segera berakhir dan mereka akan aman. Neneknya berusaha menenangkan Amai, meyakinkan bahwa mereka tidak menjadi target utama.</p><p>Kisah ini ditutup dengan refleksi Amai yang kini berusia 70 tahun. Pengalaman kelam di masa kecilnya itu masih membekas dan membuatnya bersyukur keluarganya selamat, namun tidak akan pernah terlupakan. Cerpen ini secara apik menggambarkan dampak konflik bersenjata terhadap kehidupan anak-anak dan ketahanan mental mereka dalam menghadapi situasi sulit.</p>	ecerpen/1_m3rpHK8.jpg	images/ecerpen/Amai_Saksi_Bisu_Perlawanan_PRRI_1958.pdf	Rendi Nofreza 	2025-06-20 00:14:31.588135+07	18+	\N	2022-06-10 00:00:00+07	Amai-Saksi-Bisu-Perlawanan-PRRI-1958	4-6 Menit	terverifikasi	\N	\N	\N	\N	d8785632-e2fd-4d29-b7c2-423f49e76f46	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-04 10:08:39+07	2025-06-20 00:15:09.128671+07	\N	\N	\N	2fcbd65d-e69d-420e-be26-ba5b7005c9f2	Ingin Jadi Pemain Timnas 	<p>Di lapangan sepak bola, Putera menunjukkan keahliannya yang luar biasa dalam menggiring bola dan mencetak gol, selalu membawa kemenangan bagi timnya. Ia mengenakan sepatu bola pemberian almarhum ayahnya, yang memberinya semangat. Sahabatnya, Rizky, selalu mendukung dan mengagumi Putera.</p><p>Suatu sore, saat Putera dan Rizky sedang berlatih, seorang pemuda bernama Reza, seorang pemain timnas, menghampiri mereka. Reza sedang mencari pemain muda berbakat untuk seleksi timnas U-15. Ia terkesan dengan skill Putera dan menawarinya kesempatan untuk mengikuti seleksi, namun hanya memilih satu di antara mereka.</p><p>Putera dilema. Ia tidak ingin meninggalkan Rizky, sahabat setianya, tetapi ia juga ingin mewujudkan mimpinya menjadi pemain sepak bola sungguhan. Dengan dukungan tulus dari Rizky yang mengingatkannya akan pentingnya kesempatan, Putera akhirnya menerima tawaran Reza, meskipun dengan berat hati. Rizky sendiri melompat kegirangan, bahagia untuk sahabatnya. Mereka pun berjanji akan bertemu lagi besok.</p>	ecerpen/1_9t1WgoF.jpg	images/ecerpen/Ingin_Jadi_Pemain_Timnas.pdf	Saiful Bachri 	2025-06-20 00:15:09.128671+07	18+	\N	2017-06-28 00:00:00+07	ingin-jadi-pemain-timnas	4-6 Menit	terverifikasi	\N	\N	\N	\N	3106f671-c946-4093-bf00-014c14b0f17b	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
2025-06-04 10:24:40+07	2025-06-20 00:16:03.878091+07	\N	\N	\N	d01f44ef-7e44-41b2-9b0a-e2b661c3c8aa	Kutitipkan Padamu Tolong Dijaga	<p>Saat berumur lima tahun, Raden Jampang Sangaji menimba ilmu agama di Padepokan Lokadayajati. Suatu hari, Syeh Alit Guna, pemimpin padepokan, memanggil Raden dan mengajaknya menunggang kuda ke Bukit Sulardjitan, jauh dari padepokan. Di sana, Syeh mengajarkan Raden ilmu langka yang belum pernah diajarkan kepada santri lain: ilmu kadigdayan karomah wali Allah, yang dikenal sebagai ilmu Putar Adji Jaya Kawijayan. Ilmu ini diyakini pernah dipelajari oleh salah satu wali Allah di masa lampau.</p><p>Setelah menguasai ilmu tersebut dan beranjak dewasa, nama Raden Jampang Sangaji diganti menjadi Kanjeng Pangeran Sulardjito, diambil dari nama bukit tempat ia belajar. Ia juga dipercayakan amanah berupa dua pusaka ampuh: Tumbak Kyai Gagak Alit dan Keris Naga Kincir untuk berjaga-jaga.</p><p>Sebagai seorang pendekar, Kanjeng Pangeran Sulardjito kemudian turun gunung dan berkelana hingga mencapai wilayah Sunda Wiwitan. Saat ia dan kudanya tiba di perbatasan Galuh, dalam perjalanan menuju Cirebon, ia dihadang oleh segerombolan perampok bertubuh besar, berotot kekar, dan berwajah kejam, masing-masing membawa pedang dan panah.</p>	ecerpen/2.jpg	images/ecerpen/Kutitipkan_Padamu_Tolong_Dijaga.pdf	Bhinuko Warih Danardono 	2025-06-20 00:16:03.878091+07	17+	\N	2023-09-22 00:00:00+07	kutitipkan-padamu-tolong-dijaga	4-6 Menit	terverifikasi	\N	\N	\N	\N	a9db3d4f-99bc-4ec2-b84a-ffb87d9d3e87	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e
\.


--
-- Data for Name: deiyaiplus_admin_karya; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_karya (created_at, updated_at, deleted_at, archived_at, status_at, karya_id, judul_karya, deskripsi_karya, status, archived_by_id, created_by_id, deleted_by_id, kategori_id_id, status_by_id, updated_by_id, user_id_id, slug) FROM stdin;
2025-06-10 18:43:24+07	2025-06-20 00:20:32.116474+07	\N	\N	\N	a83a56b0-0b25-480f-92a6-bfa70dc27f44	Teknologi di Era Digital Berkembang Pesat	<p>Era digital yang kita jalani saat ini ditandai dengan <strong>perkembangan teknologi yang luar biasa cepat dan berdampak fundamental</strong> pada hampir setiap aspek kehidupan. Percepatan ini bukan hanya tentang inovasi baru, tetapi juga tentang bagaimana teknologi yang ada menjadi semakin canggih, terjangkau,</p>	\N	\N	\N	\N	2c88b4bf-b517-447b-aef7-116653eac354	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e	Teknologi-di-Era-Digital-Berkembang-Pesat
2025-06-10 18:50:27+07	2025-06-20 00:27:23.190396+07	\N	\N	\N	33a97721-fc3c-491e-84b2-99e9bbdff953	Serunya Membaca	<p>Membaca adalah petualangan tanpa batas yang dimulai dari setiap lembar halaman. Keseruannya bukan hanya terletak pada penyerapan informasi, melainkan pada pengalaman menyeluruh yang ditawarkannya.</p>	\N	\N	\N	\N	2c88b4bf-b517-447b-aef7-116653eac354	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e	Serunya-Membaca
2025-06-10 19:21:21+07	2025-06-20 00:21:21.508289+07	\N	\N	\N	e97e82b8-a300-4786-b46c-3166e29bfedf	Indonesia Pusaka	<p>"Indonesia Pusaka" adalah sebuah lagu kebangsaan yang sangat populer di Indonesia, digubah oleh <strong>Ismail Marzuki</strong>. Lagu ini bukan sekadar melodi dan lirik, melainkan sebuah <strong>deskripsi puitis dan mendalam tentang kecintaan, kebanggaan, serta harapan terhadap tanah air Indonesia.</strong></p>	\N	\N	\N	\N	7c43d563-a5fd-4db3-9b50-bdb1c838790f	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e	Indonesia-Pusaka
2025-06-10 18:39:19+07	2025-06-20 00:19:13.876592+07	\N	\N	\N	3d1cc7e2-b277-43e8-9935-756d585fc6e4	Sekti Angklung	<p>Sekti" adalah judul lagu yang populer, dan kemudian diaransemen ulang atau dicover dalam <strong>versi angklung</strong>. Salah satu grup yang sering mengaransemen lagu-lagu populer ke dalam versi angklung adalah <strong>Angklung Satria Jogja</strong>. Mereka memiliki beberapa video di platform seperti YouTube dan TikTok yang menampilkan lagu "Sekti" yang dimainkan dengan angklung.</p>	\N	\N	\N	\N	2e5743d6-a8d2-4536-875c-1d276a514037	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e	Sekti-Angklung
2025-06-10 17:32:59+07	2025-06-20 00:19:49.996308+07	\N	\N	\N	3624da17-799d-42e7-a0ae-4d2b60466e45	Tari Seka	<p>Tari Seka adalah tarian tradisional yang berasal dari <strong>Provinsi Nusa Tenggara Timur (NTT)</strong>, khususnya dari daerah <strong>Flores Timur</strong>. Tarian ini merupakan salah satu ekspresi budaya yang kaya dan memiliki makna mendalam dalam kehidupan masyarakat setempat. Secara etimologis, kata "Seka" diyakini berasal dari bahasa daerah yang berarti "menyambut" atau "memuliakan".</p>	\N	\N	\N	\N	2e5743d6-a8d2-4536-875c-1d276a514037	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e	Tari-Seka
2025-06-10 18:47:22+07	2025-06-20 00:21:53.974728+07	\N	\N	\N	6c4ec230-f69a-402d-81e5-f8f67d98914c	Implementasi Bela Negara 	<p>Implementasi <strong>Bela Negara</strong> adalah wujud nyata dari kesadaran setiap warga negara untuk turut serta dalam menjaga kedaulatan, keutuhan wilayah, dan keselamatan bangsa dan negara. Ini bukan hanya tanggung jawab militer, melainkan kewajiban fundamental setiap individu yang dilakukan sesuai profesi dan kemampuannya.</p><p>Bela Negara di era modern tidak selalu diwujudkan dalam angkat senjata, apalagi dalam konteks Indonesia yang menganut sistem pertahanan semesta. Implementasinya sangat luas, mencakup berbagai aspek kehidupan, baik fisik maupun non-fisik.</p>	\N	\N	\N	\N	2c88b4bf-b517-447b-aef7-116653eac354	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e	Implementasi-Bela-Negara
2025-06-10 17:26:28+07	2025-06-20 00:24:12.646947+07	\N	\N	\N	7a23d325-0ac0-4410-8204-2b3686facb82	Tari Zapin Lampung	<p>Tari Japin (atau Zapin) adalah salah satu tarian tradisional Melayu yang sangat populer dan telah menyebar ke berbagai wilayah di Nusantara, termasuk Lampung. Meskipun akar aslinya berasal dari pengaruh Arab dan Persia yang masuk bersamaan dengan penyebaran Islam, tari Japin telah berakulturasi dengan budaya lokal di setiap daerah, menciptakan variasi dan kekhasan tersendiri. Tari Japin dikenal dengan beberapa variasi, salah satunya adalah <strong>Zapin Bedana</strong>. Ada juga kreasi-kreasi baru seperti "Tari Zapin Bukaghau" yang menggambarkan sekelompok pemuda-pemudi mencari dambaan hati.</p>	\N	\N	\N	\N	2e5743d6-a8d2-4536-875c-1d276a514037	\N	\N	a3727e2a-cf34-4b90-82f0-c4d306b3e73e	Tari-Zapin-Lampung
\.


--
-- Data for Name: deiyaiplus_admin_katalog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_katalog (created_at, updated_at, deleted_at, archived_at, status_at, katalog_id, judul_katalog, deskripsi_katalog, images, link, archived_by_id, created_by_id, deleted_by_id, status_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: deiyaiplus_admin_kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_kategori (created_at, updated_at, deleted_at, archived_at, status_at, kategori_id, nama_kategori, sub_kategori, jenis_kategori, archived_by_id, created_by_id, deleted_by_id, status_by_id, updated_by_id) FROM stdin;
2025-05-25 18:54:20+07	2025-05-25 18:54:20+07	\N	\N	\N	ae4fe53d-9848-44c8-af5d-4145e747176c	E-cerpen	E-cerpen	ecerpen	\N	\N	\N	\N	\N
2025-05-25 18:54:49+07	2025-05-25 18:54:49+07	\N	\N	\N	46e65a18-dab4-42c3-a477-b697de14bbeb	E-Book	E-Book	ebook	\N	\N	\N	\N	\N
2025-05-25 18:55:10+07	2025-05-25 18:55:10+07	\N	\N	\N	0a1484bf-6296-4efa-8dce-42684ec65d1d	Karya	Karya	karya	\N	\N	\N	\N	\N
2025-05-25 18:55:35+07	2025-05-25 18:55:35+07	\N	\N	\N	b8bf6552-786d-4506-b2e8-7490721625b3	Berita	Berita	berita	\N	\N	\N	\N	\N
2025-05-25 18:56:11+07	2025-05-25 18:56:11+07	\N	\N	\N	f532e873-209f-466e-a7b7-331927e4cab1	Pengaduan	Pengaduan	pengaduan	\N	\N	\N	\N	\N
2025-05-25 18:56:50+07	2025-05-25 18:56:50+07	\N	\N	\N	2d592833-5506-46ef-a222-be1e32c3876a	Infografis	Infografis	infografis	\N	\N	\N	\N	\N
2025-05-25 18:57:18+07	2025-05-27 16:56:24+07	\N	\N	\N	ba6ec3e2-cbe6-41ff-b369-926fec4629d7	Alur Pengaduan	Alur Pengaduan	alur pengaduan	\N	\N	\N	\N	\N
2025-05-27 16:56:47+07	2025-05-27 16:56:47+07	\N	\N	\N	a7b86cfe-0148-4473-8f6d-ec07d3563b29	Fitur	fitur	fitur	\N	\N	\N	\N	\N
2025-06-03 18:01:46+07	2025-06-03 18:01:46+07	\N	\N	\N	1588cd8b-784d-4c50-bccf-b1eae6c0a960	Anak-Anak	Anak-Anak	ecerpen	\N	\N	\N	\N	\N
2025-06-03 18:02:39+07	2025-06-03 18:02:39+07	\N	\N	\N	9b5e8d09-f2fd-45bd-9837-36de8186fbf1	Budaya	Budaya	ecerpen	\N	\N	\N	\N	\N
2025-06-03 18:03:56+07	2025-06-03 18:03:56+07	\N	\N	\N	d8785632-e2fd-4d29-b7c2-423f49e76f46	Moral	Moral	ecerpen	\N	\N	\N	\N	\N
2025-06-03 18:04:35+07	2025-06-03 18:04:35+07	\N	\N	\N	3106f671-c946-4093-bf00-014c14b0f17b	Olaraga	Olaraga	ecerpen	\N	\N	\N	\N	\N
2025-06-03 18:05:06+07	2025-06-03 18:05:06+07	\N	\N	\N	a9db3d4f-99bc-4ec2-b84a-ffb87d9d3e87	Sejarah	Sejarah	ecerpen	\N	\N	\N	\N	\N
2025-06-08 18:34:33+07	2025-06-08 18:34:33+07	\N	\N	\N	95da19e9-1b66-4a94-907c-b9d9cd25a779	Sejarah	Sejarah	ebook	\N	\N	\N	\N	\N
2025-06-08 18:35:02+07	2025-06-08 18:35:02+07	\N	\N	\N	d0b19944-f720-4020-b2de-1c44dae2ebfd	Pendidikan	Pendidikan	ebook	\N	\N	\N	\N	\N
2025-06-08 18:35:25+07	2025-06-08 18:35:25+07	\N	\N	\N	86343adb-b342-4540-94b5-5598aaedd2f2	Kesehatan	Kesehatan	ebook	\N	\N	\N	\N	\N
2025-06-08 18:36:05+07	2025-06-08 18:36:05+07	\N	\N	\N	7d7d9edc-f0e7-46e2-8943-33d53540c4a7	Kerohanian	Kerohanian	ebook	\N	\N	\N	\N	\N
2025-06-08 18:36:32+07	2025-06-08 18:36:51+07	\N	\N	\N	ab8dbc95-1054-42b7-b29b-378c95e47eb7	Budaya	Budaya	ebook	\N	\N	\N	\N	\N
2025-06-10 17:10:15+07	2025-06-10 17:10:15+07	\N	\N	\N	2c88b4bf-b517-447b-aef7-116653eac354	Pendidikan	Pendidikan	karya	\N	\N	\N	\N	\N
2025-06-10 17:12:06+07	2025-06-10 17:12:06+07	\N	\N	\N	2e5743d6-a8d2-4536-875c-1d276a514037	Budaya	Budaya	karya	\N	\N	\N	\N	\N
2025-06-10 17:13:37+07	2025-06-10 17:13:37+07	\N	\N	\N	7c43d563-a5fd-4db3-9b50-bdb1c838790f	jenderal 	jenderal 	karya	\N	\N	\N	\N	\N
2025-06-15 07:58:08+07	2025-06-15 07:58:08+07	\N	\N	\N	72c6b33a-1124-43fd-befd-27fb293f0fd3	Survey	Survey	survey	\N	\N	\N	\N	\N
2025-05-25 18:51:28+07	2025-06-20 13:09:08.782897+07	\N	\N	\N	5182b9cd-8a3c-43c1-98aa-ddb5d68dd2a5	Berita	Berita	berita	\N	\N	\N	\N	\N
2025-06-08 18:32:25+07	2025-06-20 13:09:30.543817+07	\N	\N	\N	afb0ce7d-e240-42d4-8f9c-d6f7eb56890d	Sejarah	Sejarah	ebook	\N	\N	\N	\N	\N
\.


--
-- Data for Name: deiyaiplus_admin_konten_karya; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_konten_karya (konten_karya_id, nama_file, jenis_file, link, file, karya_id_id) FROM stdin;
f434c8ca-681a-44db-80e2-718c6299f400	cover_2.jpg	jpg	karya/3d1cc7e2-b277-43e8-9935-756d585fc6e4/2.jpg	karya/2.jpg	3d1cc7e2-b277-43e8-9935-756d585fc6e4
526f22e3-106a-431d-98c7-e8211ddb2081	cover_3.jpg	jpg	karya/3624da17-799d-42e7-a0ae-4d2b60466e45/3.jpg	karya/3_9EQXLPT.jpg	3624da17-799d-42e7-a0ae-4d2b60466e45
865d633f-1f8d-4677-b0ad-8684c36cf400	cover_1.jpg	jpg	karya/a83a56b0-0b25-480f-92a6-bfa70dc27f44/1.jpg	karya/1.jpg	a83a56b0-0b25-480f-92a6-bfa70dc27f44
01478da1-4747-47f5-9c63-b628645f7df0	cover_1.jpg	jpg	karya/e97e82b8-a300-4786-b46c-3166e29bfedf/1.jpg	karya/1_NsTFd0c.jpg	e97e82b8-a300-4786-b46c-3166e29bfedf
01c2a4f5-3e1c-4861-8e49-c6b3ae2cd6c5	cover_4.jpg	jpg	karya/6c4ec230-f69a-402d-81e5-f8f67d98914c/4.jpg	karya/4.jpg	6c4ec230-f69a-402d-81e5-f8f67d98914c
53c89c4c-b088-4bb8-930a-b9f9f7678f13	cover_3.jpg	jpg	karya/33a97721-fc3c-491e-84b2-99e9bbdff953/3.jpg	karya/3_0Qelo7K.jpg	33a97721-fc3c-491e-84b2-99e9bbdff953
44e47ff4-51e1-4727-a896-3fa203cde15c	file_permainan angkul.pdf	pdf	karya/3d1cc7e2-b277-43e8-9935-756d585fc6e4/permainan angkul.pdf	karya/permainan_angkul.pdf	3d1cc7e2-b277-43e8-9935-756d585fc6e4
066a1964-0496-4383-94ca-20c9e24a7452	gallery_SEKTI angklung satria jogja _ musik versi angklung.mp4	mp4	karya/3d1cc7e2-b277-43e8-9935-756d585fc6e4/SEKTI angklung satria jogja _ musik versi angklung.mp4	karya/SEKTI_angklung_satria_jogja___musik_versi_angklung.mp4	3d1cc7e2-b277-43e8-9935-756d585fc6e4
f2577393-eb90-4550-9f1f-6839328058e4	file_Tari Seka.pdf	pdf	karya/3624da17-799d-42e7-a0ae-4d2b60466e45/Tari Seka.pdf	karya/Tari_Seka.pdf	3624da17-799d-42e7-a0ae-4d2b60466e45
437fa6d4-be03-4c7f-898e-e8b306c3e8b6	gallery_Tari Seka _ Papua.mp4	mp4	karya/3624da17-799d-42e7-a0ae-4d2b60466e45/Tari Seka _ Papua.mp4	karya/Tari_Seka___Papua.mp4	3624da17-799d-42e7-a0ae-4d2b60466e45
b90288ab-3599-4101-8d76-15f430357ff8	file_Teknologi-Digital-Di-Era-Modern.pdf	pdf	karya/a83a56b0-0b25-480f-92a6-bfa70dc27f44/Teknologi-Digital-Di-Era-Modern.pdf	karya/Teknologi-Digital-Di-Era-Modern.pdf	a83a56b0-0b25-480f-92a6-bfa70dc27f44
740eb728-aadb-402d-a329-b53347020412	gallery_[Motion Grafis] Teknologi di Era Digital Berkembang Pesat.mp4	mp4	karya/a83a56b0-0b25-480f-92a6-bfa70dc27f44/[Motion Grafis] Teknologi di Era Digital Berkembang Pesat.mp4	karya/Motion_Grafis_Teknologi_di_Era_Digital_Berkembang_Pesat.mp4	a83a56b0-0b25-480f-92a6-bfa70dc27f44
6b71ae77-604a-43ac-b049-9d0b8137708b	file_Indonesia Pusaka.pdf	pdf	karya/e97e82b8-a300-4786-b46c-3166e29bfedf/Indonesia Pusaka.pdf	karya/Indonesia_Pusaka.pdf	e97e82b8-a300-4786-b46c-3166e29bfedf
7455c350-4d42-419a-8c74-b0b58d3ec640	gallery_INDONESIA PUSAKA - SATU NUSA SATU BANGSA ( Lagu Nasional ) COVER - Ifan Suady x Putri Resky.mp4	mp4	karya/e97e82b8-a300-4786-b46c-3166e29bfedf/INDONESIA PUSAKA - SATU NUSA SATU BANGSA ( Lagu Nasional ) COVER - Ifan Suady x Putri Resky.mp4	karya/INDONESIA_PUSAKA_-_SATU_NUSA_SATU_BANGSA__Lagu_Nasional__COVER_-_Ifan_Suady_x_Putri_Resky.mp4	e97e82b8-a300-4786-b46c-3166e29bfedf
8ed7b724-710f-409e-befb-6e2f636f354c	file_implementasi-bela-negara.pdf	pdf	karya/6c4ec230-f69a-402d-81e5-f8f67d98914c/implementasi-bela-negara.pdf	karya/implementasi-bela-negara.pdf	6c4ec230-f69a-402d-81e5-f8f67d98914c
87022840-1695-4e29-949d-4360e6664af7	gallery_Implementasi Bela Negara (Semangat Perjuangan) - Kewarganegaraan,  Politeknik Negeri Lampung.mp4	mp4	karya/6c4ec230-f69a-402d-81e5-f8f67d98914c/Implementasi Bela Negara (Semangat Perjuangan) - Kewarganegaraan,  Politeknik Negeri Lampung.mp4	karya/Implementasi_Bela_Negara_Semangat_Perjuangan_-_Kewarganegaraan__Politeknik_Negeri_Lampung.mp4	6c4ec230-f69a-402d-81e5-f8f67d98914c
69ce7050-ee7f-4143-a788-99a27e568aea	file_serunya-membaca-buku.pdf	pdf	karya/33a97721-fc3c-491e-84b2-99e9bbdff953/serunya-membaca-buku.pdf	karya/serunya-membaca-buku.pdf	33a97721-fc3c-491e-84b2-99e9bbdff953
ccad2719-699c-45f5-b0c4-241f46fc63a1	gallery_Serunya Membaca.mp4	mp4	karya/33a97721-fc3c-491e-84b2-99e9bbdff953/Serunya Membaca.mp4	karya/Serunya_Membaca.mp4	33a97721-fc3c-491e-84b2-99e9bbdff953
33c81f4b-fe25-4bbf-b862-7d9f695e8bc5	cover_1.jpg	jpg	karya/7a23d325-0ac0-4410-8204-2b3686facb82/1.jpg	karya/1_fW6OdNP.jpg	7a23d325-0ac0-4410-8204-2b3686facb82
56b29ed4-615a-452e-b5e4-50b6cc0c64c9	file_PDF TARI BEDANA.pdf	pdf	karya/7a23d325-0ac0-4410-8204-2b3686facb82/PDF TARI BEDANA.pdf	karya/PDF_TARI_BEDANA.pdf	7a23d325-0ac0-4410-8204-2b3686facb82
5715d9b2-6945-470b-8666-36c91f7702c6	gallery_Tari Zapin Lampung __ Tari Kreasi Lampung.mp4	mp4	karya/7a23d325-0ac0-4410-8204-2b3686facb82/Tari Zapin Lampung __ Tari Kreasi Lampung.mp4	karya/Tari_Zapin_Lampung____Tari_Kreasi_Lampung.mp4	7a23d325-0ac0-4410-8204-2b3686facb82
215a16d7-38ac-43b9-8bdd-3475053f619b	gallery_1.jpg	jpg	karya/7a23d325-0ac0-4410-8204-2b3686facb82/1.jpg	karya/1_hi2zjpu.jpg	7a23d325-0ac0-4410-8204-2b3686facb82
\.


--
-- Data for Name: deiyaiplus_admin_master_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_master_user (password, last_login, user_id, email, username, is_staff, is_superuser, is_active, is_verified, date_joined, date_of_birth, images, role) FROM stdin;
pbkdf2_sha256$260000$YIQQ5jzthfePUWP6XQomts$tlMYi6mbnaV0ItZZ2kxvw4F5eSP9TUw1d6Fojzs7H2w=	2025-06-11 16:49:20+07	f2efe934-5b38-4a7b-a12c-67b7059100fd	nisa@gmail.com	nisa	t	t	t	t	2025-05-25 18:37:52+07	\N		super_admin
pbkdf2_sha256$260000$phVBC5NJXDNyQZnKB5VWgE$YjZyJk3u2sJqJOsYG+JTHaOSx/dHxDH5twVib9cKsZ8=	2025-06-20 00:09:27.188776+07	a3727e2a-cf34-4b90-82f0-c4d306b3e73e	admin@gmail.com	admin	t	t	t	t	2025-06-17 08:40:44+07	2025-06-20	images/avatar/VentraPlus.png	super_admin
pbkdf2_sha256$260000$xV0vBKujHwPUqdvV5djWoJ$jVGPLwv+HWrG3fctwwTtLhgCYJCNIViWGJIiSCcfl4I=	\N	79f58cd1-4542-4de6-aef9-f72bcf17ca0a	sekolah@gmail.com	sekolah dasar	f	f	t	f	2025-06-20 13:08:06.917294+07	2025-06-20	images/avatar/VentraPlus_1T5uBwJ.png	admin_sekolah
\.


--
-- Data for Name: deiyaiplus_admin_partner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_partner (created_at, updated_at, deleted_at, archived_at, status_at, partner_id, nama, images, judul_patner, link, archived_by_id, created_by_id, deleted_by_id, status_by_id, updated_by_id) FROM stdin;
2025-05-27 18:14:14+07	2025-06-17 23:52:01+07	\N	\N	\N	d51825cb-7116-4cc0-97c4-952b47074b3b	Komisi Pemberantasan Korupsi	images/partner/kpk.png	Patner	https://www.halaman patner/komisi pemberantasan korupsi-artikel/	\N	\N	\N	\N	\N
2025-05-27 17:35:59+07	2025-06-17 23:52:22+07	\N	\N	\N	cb7c445b-a13b-48e2-b606-0856e53ec1d5	Perpustakaan Nasional	images/partner/perpusnas.png	Patner	https://www.halaman patner/patnerperpustakaan nasional-artikel/	\N	\N	\N	\N	\N
2025-05-27 19:06:35+07	2025-06-17 23:52:37+07	\N	\N	\N	0136c74d-69a9-40c8-a556-1365561c4c35	Perpustakaan Deiyai	images/partner/lg-disperpus-deiyai.png	Patner	https://www.halaman patner/patnerperpustakaan deiyai-artikel/	\N	\N	\N	\N	\N
2025-05-27 17:50:07+07	2025-06-17 23:53:01+07	\N	\N	\N	bea784e0-838c-4748-92af-e7404313e2cd	Kabupaten Deiyai	images/partner/lg-deiyai.png	Patner	https://www.halaman patner/patner perpustakaan deiyai-artikel/	\N	\N	\N	\N	\N
2025-05-27 18:16:34+07	2025-06-17 23:53:17+07	\N	\N	\N	dc6fe140-1a0a-4c5d-b34e-83e56b7991c7	Provinsi Papua Tengah	images/partner/ppt.png	Patner	https://www.halaman patner/patnerpemerintahan papua tengah-artikel/	\N	\N	\N	\N	\N
2025-05-27 18:13:23+07	2025-06-17 23:53:28+07	\N	\N	\N	01418f9e-1b4a-4617-82d4-b35bb550cf93	Kementerian Dalam Negeri Republik Indonesia	images/partner/mendari.png	Patner	https://www.halaman patner/Kementerian Dalam Negeri Republik Indonesia-artikel/	\N	\N	\N	\N	\N
\.


--
-- Data for Name: deiyaiplus_admin_pejabat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_pejabat (created_at, updated_at, deleted_at, archived_at, status_at, pejabat_id, images, nama_pejabat, jabatan, deskripsi, archived_by_id, created_by_id, deleted_by_id, status_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: deiyaiplus_admin_pengaduan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_pengaduan (created_at, updated_at, deleted_at, archived_at, status_at, pengaduan_id, nama_pengadu, email, nik, no_whatsapp, deskripsi_pengaduan, jenis_pelapor, read_status, replay_status, kategori_pengaduan, archived_by_id, created_by_id, deleted_by_id, status_by_id, updated_by_id) FROM stdin;
2025-06-20 13:43:41.989005+07	2025-06-20 13:43:54.114617+07	\N	\N	\N	a7803195-a4fb-4ef0-9a33-91bf48f23ee0	adnan syakir	adnansyakir111@gmail.com	1238907865	0895346311792	pengaduan	perorangan	t	sudah dibalas	pelayanan	\N	\N	\N	\N	\N
\.


--
-- Data for Name: deiyaiplus_admin_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_profile (created_at, updated_at, deleted_at, archived_at, status_at, profile_id, tipe, deskripsi, images, archived_by_id, created_by_id, deleted_by_id, status_by_id, updated_by_id) FROM stdin;
2025-06-11 10:08:17+07	2025-06-11 11:22:00+07	\N	2025-06-11 11:22:00+07	\N	656dbf23-4fac-48cc-bdcd-9c8a4cc48c41	sejarah	<p>Ventraplus+ berasal dari bahasa latin dan merujuk pada kandungan atau rahim, dapat dianalogikan sebagai wadah yang minyimpan gagasan atau ide yang berpotensi melahirkan pemikiran baru&nbsp;dan&nbsp;inovatif. ( sejarah ventraplus)</p>	images/Profile/Ventraplus_1_GtA6QjU.jpg	\N	\N	\N	\N	\N
2025-05-25 19:45:28+07	2025-06-11 06:10:14+07	\N	\N	\N	47892c08-ffd9-46c3-a795-2a4522dd2348	pejabat	<p>Selamat datang di VentraPlus+!</p><p>Dengan bangga dan optimisme, kami perkenalkan VentraPlus+, sebuah platform digital yang menjadi lompatan besar bagi Dinas Perpustakaan Kabupaten Deiyai. Di era digital ini, perpustakaan harus bertransformasi menjadi pusat pengetahuan, kreativitas, dan pengembangan potensi.</p><p>VentraPlus+ hadir untuk merevolusi pelayanan perpustakaan. Kami berkomitmen menjadikan pengelolaan lebih efisien, akses ke koleksi lebih mudah, serta program literasi lebih terencana dan menjangkau lebih banyak anak-anak di seluruh Kabupaten Deiyai.</p><p>Mari kita manfaatkan VentraPlus+ semaksimal mungkin untuk menciptakan masyarakat yang lebih literat dan berpengetahuan.</p>	images/Profile/testimoni.png	\N	\N	\N	\N	\N
2025-06-11 11:28:59+07	2025-06-11 16:50:45+07	\N	2025-06-11 16:50:45+07	\N	dab256d8-343a-49ce-b2a0-7f98ec1e3c53	sejarah	<p>p</p>	images/Profile/struktur_pt_rst-Page-2.jpg	\N	\N	\N	\N	\N
2025-05-25 19:46:51+07	2025-06-15 17:48:46+07	\N	\N	\N	d33916b7-af7e-405a-a410-21d2cd560060	sambutan	<p>Dengan bangga dan optimisme, kami hadirkan <strong>VentraPlus+</strong>, sebuah platform digital yang menjadi lompatan besar bagi Dinas Perpustakaan Kabupaten Deiyai. Di era digital, perpustakaan harus bertransformasi menjadi pusat pengetahuan, kreativitas, dan pengembangan potensi.</p><p><strong>VentraPlus+</strong> merevolusi pelayanan perpustakaan, menjadikan pengelolaan lebih efisien, akses ke koleksi lebih mudah, dan program literasi lebih terencana serta menjangkau lebih banyak anak.</p>	images/Profile/testimoni.png	\N	\N	\N	\N	\N
2025-05-25 19:42:16+07	2025-06-17 23:55:08+07	\N	\N	\N	74619b78-b108-4169-8803-58fdbed64de9	visi	<p>Menjadi platform digital terdepan yang memberdayakan Dinas Perpustakaan Kabupaten Deiyai dalam menciptakan masyarakat yang literat, inovatif, dan berbudaya, serta menjadi pusat pengembangan bakat anak daerah.</p>	images/Profile/Visi.png	\N	\N	\N	\N	\N
2025-05-25 19:43:26+07	2025-06-17 23:55:42+07	\N	\N	\N	4fd5c96f-5f7f-4a97-b8a5-917b1c720583	misi	<p><strong>Misi Aplikasi VentraPlus+</strong></p><ol><li><strong>Meningkatkan Kualitas Pelayanan Perpustakaan</strong></li><li><strong>Mengoptimalkan Pengelolaan Perpustakaan</strong></li><li><strong>Meningkatkan Minat Baca Masyarakat</strong></li><li><strong>Mendorong Eksplorasi dan Pengembangan Bakat Anak Daerah</strong></li><li><strong>Membangun Komunitas Literasi Digital</strong></li></ol><p>&nbsp;</p><p>&nbsp;</p>	images/Profile/Visi_1.png	\N	\N	\N	\N	\N
2025-06-15 06:59:03+07	2025-06-17 23:58:01+07	\N	\N	\N	5acad28d-11a5-41b2-bbb1-4d8994dadcda	sejarah	<p>Ventraplus+ berasal dari bahasa latin dan merujuk pada kandungan atau rahim, dapat dianalogikan sebagai wadah yang minyimpan gagasan atau ide yang berpotensi melahirkan pemikiran baru&nbsp;dan&nbsp;inovatif.</p>	images/Profile/VentraPlus.png	\N	\N	\N	\N	\N
2025-05-25 19:34:33+07	2025-06-20 13:11:33.257179+07	\N	2025-06-20 13:11:33.257179+07	\N	2f05bb5c-a76b-4f4f-a67e-1e237bb8815d	misi	<p>Ventraplus+ berasal dari bahasa latin dan merujuk pada kandungan atau rahim, dapat dianalogikan sebagai wadah yang minyimpan gagasan atau ide yang berpotensi melahirkan pemikiran baru&nbsp;dan&nbsp;inovatif.&nbsp;</p>	images/Profile/Ventraplus_1.jpg	\N	\N	\N	\N	\N
\.


--
-- Data for Name: deiyaiplus_admin_sekolah; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_sekolah (created_at, updated_at, deleted_at, archived_at, status_at, sekolah_id, nama_sekolah, alamat_sekolah, jenjang, archived_by_id, created_by_id, deleted_by_id, status_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: deiyaiplus_admin_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_settings (created_at, updated_at, deleted_at, archived_at, status_at, settings_id, nama_aplikasi, deskripsi_aplikasi, barcode, logo, alamat, kontak, email, link_maps, archived_by_id, created_by_id, deleted_by_id, status_by_id, updated_by_id) FROM stdin;
2025-05-27 20:20:53+07	2025-06-20 13:14:07.929172+07	\N	\N	\N	620c6147-3553-4df7-957b-8bd8fc8d0f4a	VentarPlus+	<p>-</p>	images/settings/barcode/Ventraplus.jpg	images/settings/logo/Ventraplus_1.jpg	Jl. Cendrawasih No. 01 Waghete, Tigi, Deiyai - Papua	0895346311793	VentraPlus03@gmail.com	\N	\N	\N	\N	\N	\N
2025-05-27 20:43:14+07	2025-06-20 13:14:22.908418+07	\N	2025-06-20 13:14:22.908418+07	\N	531f441c-8af5-4d0b-b744-4883cb9059af	Provinsi Papua Tengah ya	<p>-</p>	images/settings/barcode/Ventraplus_1_DOTRBgp.jpg	images/settings/logo/Ventraplus_vnbSokk.jpg	Jl. Cendrawasih No. 01 Waghete, Tigi, Deiyai - Papuaj 	0895346311793	VentraPlus+@gmail.com	https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3972.3841783542234!2d105.23055407401334!3d-5.358208753632105!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e40c54fa0db33eb%3A0xe69b7788ca97353a!2sPoliteknik%20Negeri%20Lampung!5e0!3m2!1sid!2sid!4v1748455211525!5m2!1sid!2sid	\N	\N	\N	\N	\N
\.


--
-- Data for Name: deiyaiplus_admin_slider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_slider (created_at, updated_at, deleted_at, archived_at, status_at, slider_id, judul_slider, sub_judul_slider, tampilan_judul, background_slider, elemen_gambar, is_video_background, link, archived_by_id, created_by_id, deleted_by_id, status_by_id, updated_by_id) FROM stdin;
2025-05-27 17:06:50+07	2025-06-17 22:27:22+07	\N	\N	\N	b99ce5da-d5f2-4945-9832-31544f87ccb1	Home	Backgroud	Halaman Depan	images/slider/background/b5.png	images/slider/elemen/b7.png	f	https://www.halaman depan/halaman-artikel/	\N	\N	\N	\N	\N
2025-05-27 17:52:37+07	2025-06-17 22:27:40+07	\N	\N	\N	7c97329e-5299-4794-8002-9d13e6c9d2de	Home	Backgroud	Halaman Depan	images/slider/background/b7.png	images/slider/elemen/b5.png	f	https://www.halaman depan/halaman3-artikel/	\N	\N	\N	\N	\N
2025-05-27 17:08:35+07	2025-06-17 22:28:14+07	\N	\N	\N	b31ae89d-b3aa-44e6-b6ca-c878e12cd58f	Home	Backgroud	Halaman depan	images/slider/background/b4.png	images/slider/elemen/b4.png	f	https://www.halaman depan/halaman2-artikel/	\N	\N	\N	\N	\N
\.


--
-- Data for Name: deiyaiplus_admin_taggeditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deiyaiplus_admin_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
4	00ef5fd0-5f9a-4942-84d3-953636537d6b	22	4
5	00ef5fd0-5f9a-4942-84d3-953636537d6b	22	1
6	00ef5fd0-5f9a-4942-84d3-953636537d6b	22	5
7	bbb2ba65-b23a-48b9-9005-c68cd873e47c	22	6
8	bbb2ba65-b23a-48b9-9005-c68cd873e47c	22	7
9	bbb2ba65-b23a-48b9-9005-c68cd873e47c	22	8
10	77884c48-c9c4-49b3-ba31-59ee1d5a7a97	22	9
11	77884c48-c9c4-49b3-ba31-59ee1d5a7a97	22	10
12	77884c48-c9c4-49b3-ba31-59ee1d5a7a97	22	11
13	3a81af61-6e92-4b1b-9bda-9af3760b98e0	22	12
14	3a81af61-6e92-4b1b-9bda-9af3760b98e0	22	13
15	3a81af61-6e92-4b1b-9bda-9af3760b98e0	22	14
16	c1b5e358-ddea-4048-9752-cc7e8985a058	22	15
17	c1b5e358-ddea-4048-9752-cc7e8985a058	22	2
18	c1b5e358-ddea-4048-9752-cc7e8985a058	22	16
1	c1b5e358-ddea-4048-9752-cc7e8985a058	20	17
2	c1b5e358-ddea-4048-9752-cc7e8985a058	20	18
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	deiyaiplus_admin	master_user
7	deiyaiplus_admin	creator
8	deiyaiplus_admin	karya
9	deiyaiplus_admin	taggeditem
10	deiyaiplus_admin	slider
11	deiyaiplus_admin	settings
12	deiyaiplus_admin	sekolah
13	deiyaiplus_admin	profile
14	deiyaiplus_admin	pengaduan
15	deiyaiplus_admin	partner
16	deiyaiplus_admin	konten_karya
17	deiyaiplus_admin	kategori
18	deiyaiplus_admin	ecerpen
19	deiyaiplus_admin	ebook
20	deiyaiplus_admin	berita
21	taggit	tag
22	taggit	taggeditem
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-06-18 14:49:50.385971+07
2	taggit	0001_initial	2025-06-18 14:49:50.446507+07
3	taggit	0002_auto_20150616_2121	2025-06-18 14:49:50.456721+07
4	contenttypes	0002_remove_content_type_name	2025-06-18 14:49:50.472034+07
5	taggit	0003_taggeditem_add_unique_index	2025-06-18 14:49:50.481432+07
6	deiyaiplus_admin	0001_initial	2025-06-18 14:49:51.518481+07
7	admin	0001_initial	2025-06-18 14:49:51.591076+07
8	admin	0002_logentry_remove_auto_add	2025-06-18 14:49:51.619331+07
9	admin	0003_logentry_add_action_flag_choices	2025-06-18 14:49:51.655046+07
10	auth	0001_initial	2025-06-18 14:49:51.851533+07
11	auth	0002_alter_permission_name_max_length	2025-06-18 14:49:51.880362+07
12	auth	0003_alter_user_email_max_length	2025-06-18 14:49:51.886515+07
13	auth	0004_alter_user_username_opts	2025-06-18 14:49:51.896367+07
14	auth	0005_alter_user_last_login_null	2025-06-18 14:49:51.903683+07
15	auth	0006_require_contenttypes_0002	2025-06-18 14:49:51.907591+07
16	auth	0007_alter_validators_add_error_messages	2025-06-18 14:49:51.917246+07
17	auth	0008_alter_user_username_max_length	2025-06-18 14:49:51.923764+07
18	auth	0009_alter_user_last_name_max_length	2025-06-18 14:49:51.934824+07
19	auth	0010_alter_group_name_max_length	2025-06-18 14:49:51.965665+07
20	auth	0011_update_proxy_permissions	2025-06-18 14:49:51.9939+07
21	auth	0012_alter_user_first_name_max_length	2025-06-18 14:49:52.002722+07
22	sessions	0001_initial	2025-06-18 14:49:52.024598+07
23	deiyaiplus_admin	0002_alter_karya_status	2025-06-18 15:00:23.248003+07
24	deiyaiplus_admin	0003_karya_slug	2025-06-18 20:19:32.198021+07
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
6f7knaf42e8ioqua4yidlwt62ixoq8ve	.eJxVjjkOwjAQRe_iGluOt3Eo6TlDNJ4ZExYlUpYKcXcSKQXU_72n_1YdrkvfrbNM3Z3VWaEHB-JQU_VBh9JanV21mgJ7m4oX8KJOv1pBesqwu_zA4TYaGodluhezI-ZYZ3MdWV6Xg_0L9Dj3m-0rgVDLkaDWkhNwxsQBwnYiugjVMZVENYqP3paE0oQMjaBNNSO36vMFFAJB6g:1uSIlT:EjElQts-W9ElTCAblspsdjsuFLBVD4E-ylpKxe66_Dg	2025-07-04 00:09:27.191325+07
r1ojssrvuyjqc3s9hnnutt69ttq84pt1	.eJxVj01OxDAMhe-SNakydmInLGfPGSrHcegAaqW2s0LcnVbqAtbvfe_n243y3Kfxudk6Ppp7dYIMbCBeO0Yfawk-Qw9eY8NAFY3R3MtfrIp-2nyy7UPm92XQZd7XRx1Oy3Cp2_C2NPu6X95_AZNs00FjVzYtLSn3XjNxy0ItcjxGJEjcoWkl7ckwYagkdouZbyaBepZWjlBdTfblegJQUUmKRyDysUDwklLxdPYks56Z3M8v9vZQHQ:1uSUal:zLefsRS32XTWzBAak2HU3E1RL9caeQyjCWPr6qLxNs4	2025-07-04 12:47:11.639091+07
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
1	Literasi	literasi
2	Tegaskan	tegaskan
3	Komitmeb	komitmeb
4	Tingkatkan	tingkatkan
5	Minat Baca	minat-baca
6	Inovasi	inovasi
7	Layanan	layanan
8	Publik	publik
9	Penguat	penguat
10	Mutu	mutu
11	Pendidikan	pendidikan
12	Leterasi	leterasi
13	Adalah	adalah
14	Tanggung Jawab Bersama	tanggung-jawab-bersama
15	Litearsi	litearsi
16	Komitmen	komitmen
17	seminar	seminar
18	perusahaan	perusahaan
19	tag	tag
20	ba	ba
21	tg	tg
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 88, true);


--
-- Name: deiyaiplus_admin_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deiyaiplus_admin_taggeditem_id_seq', 7, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 22, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 21, true);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: deiyaiplus_admin_berita deiyaiplus_admin_berita_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_berita
    ADD CONSTRAINT deiyaiplus_admin_berita_pkey PRIMARY KEY (berita_id);


--
-- Name: deiyaiplus_admin_berita deiyaiplus_admin_berita_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_berita
    ADD CONSTRAINT deiyaiplus_admin_berita_slug_key UNIQUE (slug);


--
-- Name: deiyaiplus_admin_creator deiyaiplus_admin_creator_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_creator
    ADD CONSTRAINT deiyaiplus_admin_creator_email_key UNIQUE (email);


--
-- Name: deiyaiplus_admin_creator deiyaiplus_admin_creator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_creator
    ADD CONSTRAINT deiyaiplus_admin_creator_pkey PRIMARY KEY (creator_id);


--
-- Name: deiyaiplus_admin_ebook deiyaiplus_admin_ebook_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ebook
    ADD CONSTRAINT deiyaiplus_admin_ebook_pkey PRIMARY KEY (ebook_id);


--
-- Name: deiyaiplus_admin_ebook deiyaiplus_admin_ebook_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ebook
    ADD CONSTRAINT deiyaiplus_admin_ebook_slug_key UNIQUE (slug);


--
-- Name: deiyaiplus_admin_ecerpen deiyaiplus_admin_ecerpen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ecerpen
    ADD CONSTRAINT deiyaiplus_admin_ecerpen_pkey PRIMARY KEY (ecerpen_id);


--
-- Name: deiyaiplus_admin_ecerpen deiyaiplus_admin_ecerpen_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ecerpen
    ADD CONSTRAINT deiyaiplus_admin_ecerpen_slug_key UNIQUE (slug);


--
-- Name: deiyaiplus_admin_karya deiyaiplus_admin_karya_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_karya
    ADD CONSTRAINT deiyaiplus_admin_karya_pkey PRIMARY KEY (karya_id);


--
-- Name: deiyaiplus_admin_karya deiyaiplus_admin_karya_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_karya
    ADD CONSTRAINT deiyaiplus_admin_karya_slug_key UNIQUE (slug);


--
-- Name: deiyaiplus_admin_kategori deiyaiplus_admin_kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_kategori
    ADD CONSTRAINT deiyaiplus_admin_kategori_pkey PRIMARY KEY (kategori_id);


--
-- Name: deiyaiplus_admin_konten_karya deiyaiplus_admin_konten_karya_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_konten_karya
    ADD CONSTRAINT deiyaiplus_admin_konten_karya_pkey PRIMARY KEY (konten_karya_id);


--
-- Name: deiyaiplus_admin_master_user deiyaiplus_admin_master_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_master_user
    ADD CONSTRAINT deiyaiplus_admin_master_user_email_key UNIQUE (email);


--
-- Name: deiyaiplus_admin_master_user deiyaiplus_admin_master_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_master_user
    ADD CONSTRAINT deiyaiplus_admin_master_user_pkey PRIMARY KEY (user_id);


--
-- Name: deiyaiplus_admin_master_user deiyaiplus_admin_master_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_master_user
    ADD CONSTRAINT deiyaiplus_admin_master_user_username_key UNIQUE (username);


--
-- Name: deiyaiplus_admin_partner deiyaiplus_admin_partner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_partner
    ADD CONSTRAINT deiyaiplus_admin_partner_pkey PRIMARY KEY (partner_id);


--
-- Name: deiyaiplus_admin_pengaduan deiyaiplus_admin_pengaduan_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_pengaduan
    ADD CONSTRAINT deiyaiplus_admin_pengaduan_email_key UNIQUE (email);


--
-- Name: deiyaiplus_admin_pengaduan deiyaiplus_admin_pengaduan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_pengaduan
    ADD CONSTRAINT deiyaiplus_admin_pengaduan_pkey PRIMARY KEY (pengaduan_id);


--
-- Name: deiyaiplus_admin_profile deiyaiplus_admin_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_profile
    ADD CONSTRAINT deiyaiplus_admin_profile_pkey PRIMARY KEY (profile_id);


--
-- Name: deiyaiplus_admin_sekolah deiyaiplus_admin_sekolah_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_sekolah
    ADD CONSTRAINT deiyaiplus_admin_sekolah_pkey PRIMARY KEY (sekolah_id);


--
-- Name: deiyaiplus_admin_settings deiyaiplus_admin_settings_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_settings
    ADD CONSTRAINT deiyaiplus_admin_settings_email_key UNIQUE (email);


--
-- Name: deiyaiplus_admin_settings deiyaiplus_admin_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_settings
    ADD CONSTRAINT deiyaiplus_admin_settings_pkey PRIMARY KEY (settings_id);


--
-- Name: deiyaiplus_admin_slider deiyaiplus_admin_slider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_slider
    ADD CONSTRAINT deiyaiplus_admin_slider_pkey PRIMARY KEY (slider_id);


--
-- Name: deiyaiplus_admin_taggeditem deiyaiplus_admin_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_taggeditem
    ADD CONSTRAINT deiyaiplus_admin_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: deiyaiplus_admin_berita_archived_by_id_9fdd1f82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_berita_archived_by_id_9fdd1f82 ON public.deiyaiplus_admin_berita USING btree (archived_by_id);


--
-- Name: deiyaiplus_admin_berita_archived_by_id_9fdd1f82_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_berita_archived_by_id_9fdd1f82_like ON public.deiyaiplus_admin_berita USING btree (archived_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_berita_berita_id_00c8635a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_berita_berita_id_00c8635a_like ON public.deiyaiplus_admin_berita USING btree (berita_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_berita_created_by_id_ab074421; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_berita_created_by_id_ab074421 ON public.deiyaiplus_admin_berita USING btree (created_by_id);


--
-- Name: deiyaiplus_admin_berita_created_by_id_ab074421_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_berita_created_by_id_ab074421_like ON public.deiyaiplus_admin_berita USING btree (created_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_berita_deleted_by_id_c2f0effc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_berita_deleted_by_id_c2f0effc ON public.deiyaiplus_admin_berita USING btree (deleted_by_id);


--
-- Name: deiyaiplus_admin_berita_deleted_by_id_c2f0effc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_berita_deleted_by_id_c2f0effc_like ON public.deiyaiplus_admin_berita USING btree (deleted_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_berita_kategori_id_id_2e357f99; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_berita_kategori_id_id_2e357f99 ON public.deiyaiplus_admin_berita USING btree (kategori_id_id);


--
-- Name: deiyaiplus_admin_berita_kategori_id_id_2e357f99_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_berita_kategori_id_id_2e357f99_like ON public.deiyaiplus_admin_berita USING btree (kategori_id_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_berita_slug_fbc67551_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_berita_slug_fbc67551_like ON public.deiyaiplus_admin_berita USING btree (slug varchar_pattern_ops);


--
-- Name: deiyaiplus_admin_berita_status_by_id_1984e0af; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_berita_status_by_id_1984e0af ON public.deiyaiplus_admin_berita USING btree (status_by_id);


--
-- Name: deiyaiplus_admin_berita_status_by_id_1984e0af_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_berita_status_by_id_1984e0af_like ON public.deiyaiplus_admin_berita USING btree (status_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_berita_updated_by_id_43454077; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_berita_updated_by_id_43454077 ON public.deiyaiplus_admin_berita USING btree (updated_by_id);


--
-- Name: deiyaiplus_admin_berita_updated_by_id_43454077_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_berita_updated_by_id_43454077_like ON public.deiyaiplus_admin_berita USING btree (updated_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_creator_archived_by_id_fa7c2fdd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_creator_archived_by_id_fa7c2fdd ON public.deiyaiplus_admin_creator USING btree (archived_by_id);


--
-- Name: deiyaiplus_admin_creator_archived_by_id_fa7c2fdd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_creator_archived_by_id_fa7c2fdd_like ON public.deiyaiplus_admin_creator USING btree (archived_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_creator_created_by_id_b50454d6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_creator_created_by_id_b50454d6 ON public.deiyaiplus_admin_creator USING btree (created_by_id);


--
-- Name: deiyaiplus_admin_creator_created_by_id_b50454d6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_creator_created_by_id_b50454d6_like ON public.deiyaiplus_admin_creator USING btree (created_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_creator_creator_id_62df980c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_creator_creator_id_62df980c_like ON public.deiyaiplus_admin_creator USING btree (creator_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_creator_deleted_by_id_51072751; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_creator_deleted_by_id_51072751 ON public.deiyaiplus_admin_creator USING btree (deleted_by_id);


--
-- Name: deiyaiplus_admin_creator_deleted_by_id_51072751_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_creator_deleted_by_id_51072751_like ON public.deiyaiplus_admin_creator USING btree (deleted_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_creator_email_fdacedb1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_creator_email_fdacedb1_like ON public.deiyaiplus_admin_creator USING btree (email varchar_pattern_ops);


--
-- Name: deiyaiplus_admin_creator_status_by_id_63aa7cd6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_creator_status_by_id_63aa7cd6 ON public.deiyaiplus_admin_creator USING btree (status_by_id);


--
-- Name: deiyaiplus_admin_creator_status_by_id_63aa7cd6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_creator_status_by_id_63aa7cd6_like ON public.deiyaiplus_admin_creator USING btree (status_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_creator_updated_by_id_8d2c0d56; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_creator_updated_by_id_8d2c0d56 ON public.deiyaiplus_admin_creator USING btree (updated_by_id);


--
-- Name: deiyaiplus_admin_creator_updated_by_id_8d2c0d56_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_creator_updated_by_id_8d2c0d56_like ON public.deiyaiplus_admin_creator USING btree (updated_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ebook_archived_by_id_89c8204e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_archived_by_id_89c8204e ON public.deiyaiplus_admin_ebook USING btree (archived_by_id);


--
-- Name: deiyaiplus_admin_ebook_archived_by_id_89c8204e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_archived_by_id_89c8204e_like ON public.deiyaiplus_admin_ebook USING btree (archived_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ebook_created_by_id_9395c478; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_created_by_id_9395c478 ON public.deiyaiplus_admin_ebook USING btree (created_by_id);


--
-- Name: deiyaiplus_admin_ebook_created_by_id_9395c478_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_created_by_id_9395c478_like ON public.deiyaiplus_admin_ebook USING btree (created_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ebook_creator_id_ad333367; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_creator_id_ad333367 ON public.deiyaiplus_admin_ebook USING btree (creator_id);


--
-- Name: deiyaiplus_admin_ebook_creator_id_ad333367_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_creator_id_ad333367_like ON public.deiyaiplus_admin_ebook USING btree (creator_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ebook_deleted_by_id_67936df5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_deleted_by_id_67936df5 ON public.deiyaiplus_admin_ebook USING btree (deleted_by_id);


--
-- Name: deiyaiplus_admin_ebook_deleted_by_id_67936df5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_deleted_by_id_67936df5_like ON public.deiyaiplus_admin_ebook USING btree (deleted_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ebook_ebook_id_51fb0403_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_ebook_id_51fb0403_like ON public.deiyaiplus_admin_ebook USING btree (ebook_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ebook_kategori_id_id_0ba964b0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_kategori_id_id_0ba964b0 ON public.deiyaiplus_admin_ebook USING btree (kategori_id_id);


--
-- Name: deiyaiplus_admin_ebook_kategori_id_id_0ba964b0_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_kategori_id_id_0ba964b0_like ON public.deiyaiplus_admin_ebook USING btree (kategori_id_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ebook_slug_b74d9666_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_slug_b74d9666_like ON public.deiyaiplus_admin_ebook USING btree (slug varchar_pattern_ops);


--
-- Name: deiyaiplus_admin_ebook_status_by_id_f0bc8f16; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_status_by_id_f0bc8f16 ON public.deiyaiplus_admin_ebook USING btree (status_by_id);


--
-- Name: deiyaiplus_admin_ebook_status_by_id_f0bc8f16_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_status_by_id_f0bc8f16_like ON public.deiyaiplus_admin_ebook USING btree (status_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ebook_updated_by_id_dfc28d74; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_updated_by_id_dfc28d74 ON public.deiyaiplus_admin_ebook USING btree (updated_by_id);


--
-- Name: deiyaiplus_admin_ebook_updated_by_id_dfc28d74_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_updated_by_id_dfc28d74_like ON public.deiyaiplus_admin_ebook USING btree (updated_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ebook_user_id_id_c42f67de; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_user_id_id_c42f67de ON public.deiyaiplus_admin_ebook USING btree (user_id_id);


--
-- Name: deiyaiplus_admin_ebook_user_id_id_c42f67de_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ebook_user_id_id_c42f67de_like ON public.deiyaiplus_admin_ebook USING btree (user_id_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ecerpen_archived_by_id_2f7cbda3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_archived_by_id_2f7cbda3 ON public.deiyaiplus_admin_ecerpen USING btree (archived_by_id);


--
-- Name: deiyaiplus_admin_ecerpen_archived_by_id_2f7cbda3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_archived_by_id_2f7cbda3_like ON public.deiyaiplus_admin_ecerpen USING btree (archived_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ecerpen_created_by_id_27b16e94; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_created_by_id_27b16e94 ON public.deiyaiplus_admin_ecerpen USING btree (created_by_id);


--
-- Name: deiyaiplus_admin_ecerpen_created_by_id_27b16e94_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_created_by_id_27b16e94_like ON public.deiyaiplus_admin_ecerpen USING btree (created_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ecerpen_creator_id_118cb641; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_creator_id_118cb641 ON public.deiyaiplus_admin_ecerpen USING btree (creator_id);


--
-- Name: deiyaiplus_admin_ecerpen_creator_id_118cb641_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_creator_id_118cb641_like ON public.deiyaiplus_admin_ecerpen USING btree (creator_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ecerpen_deleted_by_id_0350c736; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_deleted_by_id_0350c736 ON public.deiyaiplus_admin_ecerpen USING btree (deleted_by_id);


--
-- Name: deiyaiplus_admin_ecerpen_deleted_by_id_0350c736_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_deleted_by_id_0350c736_like ON public.deiyaiplus_admin_ecerpen USING btree (deleted_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ecerpen_ecerpen_id_2edeed8d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_ecerpen_id_2edeed8d_like ON public.deiyaiplus_admin_ecerpen USING btree (ecerpen_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ecerpen_kategori_id_id_27008f18; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_kategori_id_id_27008f18 ON public.deiyaiplus_admin_ecerpen USING btree (kategori_id_id);


--
-- Name: deiyaiplus_admin_ecerpen_kategori_id_id_27008f18_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_kategori_id_id_27008f18_like ON public.deiyaiplus_admin_ecerpen USING btree (kategori_id_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ecerpen_slug_94ac30f2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_slug_94ac30f2_like ON public.deiyaiplus_admin_ecerpen USING btree (slug varchar_pattern_ops);


--
-- Name: deiyaiplus_admin_ecerpen_status_by_id_095c90cb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_status_by_id_095c90cb ON public.deiyaiplus_admin_ecerpen USING btree (status_by_id);


--
-- Name: deiyaiplus_admin_ecerpen_status_by_id_095c90cb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_status_by_id_095c90cb_like ON public.deiyaiplus_admin_ecerpen USING btree (status_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ecerpen_updated_by_id_310c8575; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_updated_by_id_310c8575 ON public.deiyaiplus_admin_ecerpen USING btree (updated_by_id);


--
-- Name: deiyaiplus_admin_ecerpen_updated_by_id_310c8575_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_updated_by_id_310c8575_like ON public.deiyaiplus_admin_ecerpen USING btree (updated_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_ecerpen_user_id_id_b0faeac8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_user_id_id_b0faeac8 ON public.deiyaiplus_admin_ecerpen USING btree (user_id_id);


--
-- Name: deiyaiplus_admin_ecerpen_user_id_id_b0faeac8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_ecerpen_user_id_id_b0faeac8_like ON public.deiyaiplus_admin_ecerpen USING btree (user_id_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_karya_archived_by_id_ce87e6d6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_archived_by_id_ce87e6d6 ON public.deiyaiplus_admin_karya USING btree (archived_by_id);


--
-- Name: deiyaiplus_admin_karya_archived_by_id_ce87e6d6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_archived_by_id_ce87e6d6_like ON public.deiyaiplus_admin_karya USING btree (archived_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_karya_created_by_id_56985651; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_created_by_id_56985651 ON public.deiyaiplus_admin_karya USING btree (created_by_id);


--
-- Name: deiyaiplus_admin_karya_created_by_id_56985651_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_created_by_id_56985651_like ON public.deiyaiplus_admin_karya USING btree (created_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_karya_deleted_by_id_5d9aa2c4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_deleted_by_id_5d9aa2c4 ON public.deiyaiplus_admin_karya USING btree (deleted_by_id);


--
-- Name: deiyaiplus_admin_karya_deleted_by_id_5d9aa2c4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_deleted_by_id_5d9aa2c4_like ON public.deiyaiplus_admin_karya USING btree (deleted_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_karya_karya_id_36be8005_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_karya_id_36be8005_like ON public.deiyaiplus_admin_karya USING btree (karya_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_karya_kategori_id_id_a39622c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_kategori_id_id_a39622c7 ON public.deiyaiplus_admin_karya USING btree (kategori_id_id);


--
-- Name: deiyaiplus_admin_karya_kategori_id_id_a39622c7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_kategori_id_id_a39622c7_like ON public.deiyaiplus_admin_karya USING btree (kategori_id_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_karya_slug_2c712eb9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_slug_2c712eb9_like ON public.deiyaiplus_admin_karya USING btree (slug varchar_pattern_ops);


--
-- Name: deiyaiplus_admin_karya_status_by_id_bf58a795; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_status_by_id_bf58a795 ON public.deiyaiplus_admin_karya USING btree (status_by_id);


--
-- Name: deiyaiplus_admin_karya_status_by_id_bf58a795_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_status_by_id_bf58a795_like ON public.deiyaiplus_admin_karya USING btree (status_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_karya_updated_by_id_37d1cd25; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_updated_by_id_37d1cd25 ON public.deiyaiplus_admin_karya USING btree (updated_by_id);


--
-- Name: deiyaiplus_admin_karya_updated_by_id_37d1cd25_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_updated_by_id_37d1cd25_like ON public.deiyaiplus_admin_karya USING btree (updated_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_karya_user_id_id_28f636be; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_user_id_id_28f636be ON public.deiyaiplus_admin_karya USING btree (user_id_id);


--
-- Name: deiyaiplus_admin_karya_user_id_id_28f636be_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_karya_user_id_id_28f636be_like ON public.deiyaiplus_admin_karya USING btree (user_id_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_kategori_archived_by_id_76f6c1fc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_kategori_archived_by_id_76f6c1fc ON public.deiyaiplus_admin_kategori USING btree (archived_by_id);


--
-- Name: deiyaiplus_admin_kategori_archived_by_id_76f6c1fc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_kategori_archived_by_id_76f6c1fc_like ON public.deiyaiplus_admin_kategori USING btree (archived_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_kategori_created_by_id_1dfde8ed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_kategori_created_by_id_1dfde8ed ON public.deiyaiplus_admin_kategori USING btree (created_by_id);


--
-- Name: deiyaiplus_admin_kategori_created_by_id_1dfde8ed_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_kategori_created_by_id_1dfde8ed_like ON public.deiyaiplus_admin_kategori USING btree (created_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_kategori_deleted_by_id_bb645359; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_kategori_deleted_by_id_bb645359 ON public.deiyaiplus_admin_kategori USING btree (deleted_by_id);


--
-- Name: deiyaiplus_admin_kategori_deleted_by_id_bb645359_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_kategori_deleted_by_id_bb645359_like ON public.deiyaiplus_admin_kategori USING btree (deleted_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_kategori_kategori_id_f1845818_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_kategori_kategori_id_f1845818_like ON public.deiyaiplus_admin_kategori USING btree (kategori_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_kategori_status_by_id_3a43ea45; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_kategori_status_by_id_3a43ea45 ON public.deiyaiplus_admin_kategori USING btree (status_by_id);


--
-- Name: deiyaiplus_admin_kategori_status_by_id_3a43ea45_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_kategori_status_by_id_3a43ea45_like ON public.deiyaiplus_admin_kategori USING btree (status_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_kategori_updated_by_id_1aa31fcb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_kategori_updated_by_id_1aa31fcb ON public.deiyaiplus_admin_kategori USING btree (updated_by_id);


--
-- Name: deiyaiplus_admin_kategori_updated_by_id_1aa31fcb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_kategori_updated_by_id_1aa31fcb_like ON public.deiyaiplus_admin_kategori USING btree (updated_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_konten_karya_karya_id_id_f5728afa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_konten_karya_karya_id_id_f5728afa ON public.deiyaiplus_admin_konten_karya USING btree (karya_id_id);


--
-- Name: deiyaiplus_admin_konten_karya_karya_id_id_f5728afa_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_konten_karya_karya_id_id_f5728afa_like ON public.deiyaiplus_admin_konten_karya USING btree (karya_id_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_konten_karya_konten_karya_id_f5c088f5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_konten_karya_konten_karya_id_f5c088f5_like ON public.deiyaiplus_admin_konten_karya USING btree (konten_karya_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_master_user_email_815928f5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_master_user_email_815928f5_like ON public.deiyaiplus_admin_master_user USING btree (email varchar_pattern_ops);


--
-- Name: deiyaiplus_admin_master_user_user_id_1e3d3f40_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_master_user_user_id_1e3d3f40_like ON public.deiyaiplus_admin_master_user USING btree (user_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_master_user_username_0fc926a7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_master_user_username_0fc926a7_like ON public.deiyaiplus_admin_master_user USING btree (username varchar_pattern_ops);


--
-- Name: deiyaiplus_admin_partner_archived_by_id_c8bb2e44; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_partner_archived_by_id_c8bb2e44 ON public.deiyaiplus_admin_partner USING btree (archived_by_id);


--
-- Name: deiyaiplus_admin_partner_archived_by_id_c8bb2e44_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_partner_archived_by_id_c8bb2e44_like ON public.deiyaiplus_admin_partner USING btree (archived_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_partner_created_by_id_9ebf49e5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_partner_created_by_id_9ebf49e5 ON public.deiyaiplus_admin_partner USING btree (created_by_id);


--
-- Name: deiyaiplus_admin_partner_created_by_id_9ebf49e5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_partner_created_by_id_9ebf49e5_like ON public.deiyaiplus_admin_partner USING btree (created_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_partner_deleted_by_id_87bd8617; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_partner_deleted_by_id_87bd8617 ON public.deiyaiplus_admin_partner USING btree (deleted_by_id);


--
-- Name: deiyaiplus_admin_partner_deleted_by_id_87bd8617_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_partner_deleted_by_id_87bd8617_like ON public.deiyaiplus_admin_partner USING btree (deleted_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_partner_partner_id_2514a1a4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_partner_partner_id_2514a1a4_like ON public.deiyaiplus_admin_partner USING btree (partner_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_partner_status_by_id_349b84b6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_partner_status_by_id_349b84b6 ON public.deiyaiplus_admin_partner USING btree (status_by_id);


--
-- Name: deiyaiplus_admin_partner_status_by_id_349b84b6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_partner_status_by_id_349b84b6_like ON public.deiyaiplus_admin_partner USING btree (status_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_partner_updated_by_id_21ce0104; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_partner_updated_by_id_21ce0104 ON public.deiyaiplus_admin_partner USING btree (updated_by_id);


--
-- Name: deiyaiplus_admin_partner_updated_by_id_21ce0104_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_partner_updated_by_id_21ce0104_like ON public.deiyaiplus_admin_partner USING btree (updated_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_pengaduan_archived_by_id_6d070c8e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_pengaduan_archived_by_id_6d070c8e ON public.deiyaiplus_admin_pengaduan USING btree (archived_by_id);


--
-- Name: deiyaiplus_admin_pengaduan_archived_by_id_6d070c8e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_pengaduan_archived_by_id_6d070c8e_like ON public.deiyaiplus_admin_pengaduan USING btree (archived_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_pengaduan_created_by_id_af63800f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_pengaduan_created_by_id_af63800f ON public.deiyaiplus_admin_pengaduan USING btree (created_by_id);


--
-- Name: deiyaiplus_admin_pengaduan_created_by_id_af63800f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_pengaduan_created_by_id_af63800f_like ON public.deiyaiplus_admin_pengaduan USING btree (created_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_pengaduan_deleted_by_id_badc1975; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_pengaduan_deleted_by_id_badc1975 ON public.deiyaiplus_admin_pengaduan USING btree (deleted_by_id);


--
-- Name: deiyaiplus_admin_pengaduan_deleted_by_id_badc1975_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_pengaduan_deleted_by_id_badc1975_like ON public.deiyaiplus_admin_pengaduan USING btree (deleted_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_pengaduan_email_747cd9e1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_pengaduan_email_747cd9e1_like ON public.deiyaiplus_admin_pengaduan USING btree (email varchar_pattern_ops);


--
-- Name: deiyaiplus_admin_pengaduan_pengaduan_id_7f914961_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_pengaduan_pengaduan_id_7f914961_like ON public.deiyaiplus_admin_pengaduan USING btree (pengaduan_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_pengaduan_status_by_id_bceb00ba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_pengaduan_status_by_id_bceb00ba ON public.deiyaiplus_admin_pengaduan USING btree (status_by_id);


--
-- Name: deiyaiplus_admin_pengaduan_status_by_id_bceb00ba_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_pengaduan_status_by_id_bceb00ba_like ON public.deiyaiplus_admin_pengaduan USING btree (status_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_pengaduan_updated_by_id_2d49656a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_pengaduan_updated_by_id_2d49656a ON public.deiyaiplus_admin_pengaduan USING btree (updated_by_id);


--
-- Name: deiyaiplus_admin_pengaduan_updated_by_id_2d49656a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_pengaduan_updated_by_id_2d49656a_like ON public.deiyaiplus_admin_pengaduan USING btree (updated_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_profile_archived_by_id_f3674a5c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_profile_archived_by_id_f3674a5c ON public.deiyaiplus_admin_profile USING btree (archived_by_id);


--
-- Name: deiyaiplus_admin_profile_archived_by_id_f3674a5c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_profile_archived_by_id_f3674a5c_like ON public.deiyaiplus_admin_profile USING btree (archived_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_profile_created_by_id_cc454419; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_profile_created_by_id_cc454419 ON public.deiyaiplus_admin_profile USING btree (created_by_id);


--
-- Name: deiyaiplus_admin_profile_created_by_id_cc454419_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_profile_created_by_id_cc454419_like ON public.deiyaiplus_admin_profile USING btree (created_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_profile_deleted_by_id_b684076b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_profile_deleted_by_id_b684076b ON public.deiyaiplus_admin_profile USING btree (deleted_by_id);


--
-- Name: deiyaiplus_admin_profile_deleted_by_id_b684076b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_profile_deleted_by_id_b684076b_like ON public.deiyaiplus_admin_profile USING btree (deleted_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_profile_profile_id_4bb12707_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_profile_profile_id_4bb12707_like ON public.deiyaiplus_admin_profile USING btree (profile_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_profile_status_by_id_3f8915ba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_profile_status_by_id_3f8915ba ON public.deiyaiplus_admin_profile USING btree (status_by_id);


--
-- Name: deiyaiplus_admin_profile_status_by_id_3f8915ba_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_profile_status_by_id_3f8915ba_like ON public.deiyaiplus_admin_profile USING btree (status_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_profile_updated_by_id_8a353659; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_profile_updated_by_id_8a353659 ON public.deiyaiplus_admin_profile USING btree (updated_by_id);


--
-- Name: deiyaiplus_admin_profile_updated_by_id_8a353659_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_profile_updated_by_id_8a353659_like ON public.deiyaiplus_admin_profile USING btree (updated_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_sekolah_archived_by_id_096c55f2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_sekolah_archived_by_id_096c55f2 ON public.deiyaiplus_admin_sekolah USING btree (archived_by_id);


--
-- Name: deiyaiplus_admin_sekolah_archived_by_id_096c55f2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_sekolah_archived_by_id_096c55f2_like ON public.deiyaiplus_admin_sekolah USING btree (archived_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_sekolah_created_by_id_c131df66; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_sekolah_created_by_id_c131df66 ON public.deiyaiplus_admin_sekolah USING btree (created_by_id);


--
-- Name: deiyaiplus_admin_sekolah_created_by_id_c131df66_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_sekolah_created_by_id_c131df66_like ON public.deiyaiplus_admin_sekolah USING btree (created_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_sekolah_deleted_by_id_8277ae67; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_sekolah_deleted_by_id_8277ae67 ON public.deiyaiplus_admin_sekolah USING btree (deleted_by_id);


--
-- Name: deiyaiplus_admin_sekolah_deleted_by_id_8277ae67_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_sekolah_deleted_by_id_8277ae67_like ON public.deiyaiplus_admin_sekolah USING btree (deleted_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_sekolah_sekolah_id_1c1323cc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_sekolah_sekolah_id_1c1323cc_like ON public.deiyaiplus_admin_sekolah USING btree (sekolah_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_sekolah_status_by_id_d39930ad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_sekolah_status_by_id_d39930ad ON public.deiyaiplus_admin_sekolah USING btree (status_by_id);


--
-- Name: deiyaiplus_admin_sekolah_status_by_id_d39930ad_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_sekolah_status_by_id_d39930ad_like ON public.deiyaiplus_admin_sekolah USING btree (status_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_sekolah_updated_by_id_c332d33e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_sekolah_updated_by_id_c332d33e ON public.deiyaiplus_admin_sekolah USING btree (updated_by_id);


--
-- Name: deiyaiplus_admin_sekolah_updated_by_id_c332d33e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_sekolah_updated_by_id_c332d33e_like ON public.deiyaiplus_admin_sekolah USING btree (updated_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_settings_archived_by_id_c4be2649; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_settings_archived_by_id_c4be2649 ON public.deiyaiplus_admin_settings USING btree (archived_by_id);


--
-- Name: deiyaiplus_admin_settings_archived_by_id_c4be2649_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_settings_archived_by_id_c4be2649_like ON public.deiyaiplus_admin_settings USING btree (archived_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_settings_created_by_id_0d7c7497; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_settings_created_by_id_0d7c7497 ON public.deiyaiplus_admin_settings USING btree (created_by_id);


--
-- Name: deiyaiplus_admin_settings_created_by_id_0d7c7497_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_settings_created_by_id_0d7c7497_like ON public.deiyaiplus_admin_settings USING btree (created_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_settings_deleted_by_id_8ddda5d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_settings_deleted_by_id_8ddda5d7 ON public.deiyaiplus_admin_settings USING btree (deleted_by_id);


--
-- Name: deiyaiplus_admin_settings_deleted_by_id_8ddda5d7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_settings_deleted_by_id_8ddda5d7_like ON public.deiyaiplus_admin_settings USING btree (deleted_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_settings_email_f15f7927_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_settings_email_f15f7927_like ON public.deiyaiplus_admin_settings USING btree (email varchar_pattern_ops);


--
-- Name: deiyaiplus_admin_settings_settings_id_d9769966_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_settings_settings_id_d9769966_like ON public.deiyaiplus_admin_settings USING btree (settings_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_settings_status_by_id_27be430d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_settings_status_by_id_27be430d ON public.deiyaiplus_admin_settings USING btree (status_by_id);


--
-- Name: deiyaiplus_admin_settings_status_by_id_27be430d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_settings_status_by_id_27be430d_like ON public.deiyaiplus_admin_settings USING btree (status_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_settings_updated_by_id_4b09c84c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_settings_updated_by_id_4b09c84c ON public.deiyaiplus_admin_settings USING btree (updated_by_id);


--
-- Name: deiyaiplus_admin_settings_updated_by_id_4b09c84c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_settings_updated_by_id_4b09c84c_like ON public.deiyaiplus_admin_settings USING btree (updated_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_slider_archived_by_id_ebca161b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_slider_archived_by_id_ebca161b ON public.deiyaiplus_admin_slider USING btree (archived_by_id);


--
-- Name: deiyaiplus_admin_slider_archived_by_id_ebca161b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_slider_archived_by_id_ebca161b_like ON public.deiyaiplus_admin_slider USING btree (archived_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_slider_created_by_id_2f21df27; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_slider_created_by_id_2f21df27 ON public.deiyaiplus_admin_slider USING btree (created_by_id);


--
-- Name: deiyaiplus_admin_slider_created_by_id_2f21df27_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_slider_created_by_id_2f21df27_like ON public.deiyaiplus_admin_slider USING btree (created_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_slider_deleted_by_id_7898b847; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_slider_deleted_by_id_7898b847 ON public.deiyaiplus_admin_slider USING btree (deleted_by_id);


--
-- Name: deiyaiplus_admin_slider_deleted_by_id_7898b847_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_slider_deleted_by_id_7898b847_like ON public.deiyaiplus_admin_slider USING btree (deleted_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_slider_slider_id_81cbd618_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_slider_slider_id_81cbd618_like ON public.deiyaiplus_admin_slider USING btree (slider_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_slider_status_by_id_8a0602bb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_slider_status_by_id_8a0602bb ON public.deiyaiplus_admin_slider USING btree (status_by_id);


--
-- Name: deiyaiplus_admin_slider_status_by_id_8a0602bb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_slider_status_by_id_8a0602bb_like ON public.deiyaiplus_admin_slider USING btree (status_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_slider_updated_by_id_572be660; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_slider_updated_by_id_572be660 ON public.deiyaiplus_admin_slider USING btree (updated_by_id);


--
-- Name: deiyaiplus_admin_slider_updated_by_id_572be660_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_slider_updated_by_id_572be660_like ON public.deiyaiplus_admin_slider USING btree (updated_by_id text_pattern_ops);


--
-- Name: deiyaiplus_admin_taggeditem_content_type_id_104b43eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_taggeditem_content_type_id_104b43eb ON public.deiyaiplus_admin_taggeditem USING btree (content_type_id);


--
-- Name: deiyaiplus_admin_taggeditem_object_id_acd45bfd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_taggeditem_object_id_acd45bfd ON public.deiyaiplus_admin_taggeditem USING btree (object_id);


--
-- Name: deiyaiplus_admin_taggeditem_tag_id_fcf96284; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deiyaiplus_admin_taggeditem_tag_id_fcf96284 ON public.deiyaiplus_admin_taggeditem USING btree (tag_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_admin_log_user_id_c564eba6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6_like ON public.django_admin_log USING btree (user_id text_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_berita deiyaiplus_admin_ber_archived_by_id_9fdd1f82_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_berita
    ADD CONSTRAINT deiyaiplus_admin_ber_archived_by_id_9fdd1f82_fk_deiyaiplu FOREIGN KEY (archived_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_berita deiyaiplus_admin_ber_created_by_id_ab074421_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_berita
    ADD CONSTRAINT deiyaiplus_admin_ber_created_by_id_ab074421_fk_deiyaiplu FOREIGN KEY (created_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_berita deiyaiplus_admin_ber_deleted_by_id_c2f0effc_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_berita
    ADD CONSTRAINT deiyaiplus_admin_ber_deleted_by_id_c2f0effc_fk_deiyaiplu FOREIGN KEY (deleted_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_berita deiyaiplus_admin_ber_kategori_id_id_2e357f99_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_berita
    ADD CONSTRAINT deiyaiplus_admin_ber_kategori_id_id_2e357f99_fk_deiyaiplu FOREIGN KEY (kategori_id_id) REFERENCES public.deiyaiplus_admin_kategori(kategori_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_berita deiyaiplus_admin_ber_status_by_id_1984e0af_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_berita
    ADD CONSTRAINT deiyaiplus_admin_ber_status_by_id_1984e0af_fk_deiyaiplu FOREIGN KEY (status_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_berita deiyaiplus_admin_ber_updated_by_id_43454077_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_berita
    ADD CONSTRAINT deiyaiplus_admin_ber_updated_by_id_43454077_fk_deiyaiplu FOREIGN KEY (updated_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_creator deiyaiplus_admin_cre_archived_by_id_fa7c2fdd_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_creator
    ADD CONSTRAINT deiyaiplus_admin_cre_archived_by_id_fa7c2fdd_fk_deiyaiplu FOREIGN KEY (archived_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_creator deiyaiplus_admin_cre_created_by_id_b50454d6_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_creator
    ADD CONSTRAINT deiyaiplus_admin_cre_created_by_id_b50454d6_fk_deiyaiplu FOREIGN KEY (created_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_creator deiyaiplus_admin_cre_deleted_by_id_51072751_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_creator
    ADD CONSTRAINT deiyaiplus_admin_cre_deleted_by_id_51072751_fk_deiyaiplu FOREIGN KEY (deleted_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_creator deiyaiplus_admin_cre_status_by_id_63aa7cd6_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_creator
    ADD CONSTRAINT deiyaiplus_admin_cre_status_by_id_63aa7cd6_fk_deiyaiplu FOREIGN KEY (status_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_creator deiyaiplus_admin_cre_updated_by_id_8d2c0d56_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_creator
    ADD CONSTRAINT deiyaiplus_admin_cre_updated_by_id_8d2c0d56_fk_deiyaiplu FOREIGN KEY (updated_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ebook deiyaiplus_admin_ebo_archived_by_id_89c8204e_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ebook
    ADD CONSTRAINT deiyaiplus_admin_ebo_archived_by_id_89c8204e_fk_deiyaiplu FOREIGN KEY (archived_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ebook deiyaiplus_admin_ebo_created_by_id_9395c478_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ebook
    ADD CONSTRAINT deiyaiplus_admin_ebo_created_by_id_9395c478_fk_deiyaiplu FOREIGN KEY (created_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ebook deiyaiplus_admin_ebo_creator_id_ad333367_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ebook
    ADD CONSTRAINT deiyaiplus_admin_ebo_creator_id_ad333367_fk_deiyaiplu FOREIGN KEY (creator_id) REFERENCES public.deiyaiplus_admin_creator(creator_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ebook deiyaiplus_admin_ebo_deleted_by_id_67936df5_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ebook
    ADD CONSTRAINT deiyaiplus_admin_ebo_deleted_by_id_67936df5_fk_deiyaiplu FOREIGN KEY (deleted_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ebook deiyaiplus_admin_ebo_kategori_id_id_0ba964b0_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ebook
    ADD CONSTRAINT deiyaiplus_admin_ebo_kategori_id_id_0ba964b0_fk_deiyaiplu FOREIGN KEY (kategori_id_id) REFERENCES public.deiyaiplus_admin_kategori(kategori_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ebook deiyaiplus_admin_ebo_status_by_id_f0bc8f16_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ebook
    ADD CONSTRAINT deiyaiplus_admin_ebo_status_by_id_f0bc8f16_fk_deiyaiplu FOREIGN KEY (status_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ebook deiyaiplus_admin_ebo_updated_by_id_dfc28d74_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ebook
    ADD CONSTRAINT deiyaiplus_admin_ebo_updated_by_id_dfc28d74_fk_deiyaiplu FOREIGN KEY (updated_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ebook deiyaiplus_admin_ebo_user_id_id_c42f67de_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ebook
    ADD CONSTRAINT deiyaiplus_admin_ebo_user_id_id_c42f67de_fk_deiyaiplu FOREIGN KEY (user_id_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ecerpen deiyaiplus_admin_ece_archived_by_id_2f7cbda3_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ecerpen
    ADD CONSTRAINT deiyaiplus_admin_ece_archived_by_id_2f7cbda3_fk_deiyaiplu FOREIGN KEY (archived_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ecerpen deiyaiplus_admin_ece_created_by_id_27b16e94_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ecerpen
    ADD CONSTRAINT deiyaiplus_admin_ece_created_by_id_27b16e94_fk_deiyaiplu FOREIGN KEY (created_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ecerpen deiyaiplus_admin_ece_creator_id_118cb641_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ecerpen
    ADD CONSTRAINT deiyaiplus_admin_ece_creator_id_118cb641_fk_deiyaiplu FOREIGN KEY (creator_id) REFERENCES public.deiyaiplus_admin_creator(creator_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ecerpen deiyaiplus_admin_ece_deleted_by_id_0350c736_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ecerpen
    ADD CONSTRAINT deiyaiplus_admin_ece_deleted_by_id_0350c736_fk_deiyaiplu FOREIGN KEY (deleted_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ecerpen deiyaiplus_admin_ece_kategori_id_id_27008f18_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ecerpen
    ADD CONSTRAINT deiyaiplus_admin_ece_kategori_id_id_27008f18_fk_deiyaiplu FOREIGN KEY (kategori_id_id) REFERENCES public.deiyaiplus_admin_kategori(kategori_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ecerpen deiyaiplus_admin_ece_status_by_id_095c90cb_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ecerpen
    ADD CONSTRAINT deiyaiplus_admin_ece_status_by_id_095c90cb_fk_deiyaiplu FOREIGN KEY (status_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ecerpen deiyaiplus_admin_ece_updated_by_id_310c8575_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ecerpen
    ADD CONSTRAINT deiyaiplus_admin_ece_updated_by_id_310c8575_fk_deiyaiplu FOREIGN KEY (updated_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_ecerpen deiyaiplus_admin_ece_user_id_id_b0faeac8_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_ecerpen
    ADD CONSTRAINT deiyaiplus_admin_ece_user_id_id_b0faeac8_fk_deiyaiplu FOREIGN KEY (user_id_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_karya deiyaiplus_admin_kar_archived_by_id_ce87e6d6_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_karya
    ADD CONSTRAINT deiyaiplus_admin_kar_archived_by_id_ce87e6d6_fk_deiyaiplu FOREIGN KEY (archived_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_karya deiyaiplus_admin_kar_created_by_id_56985651_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_karya
    ADD CONSTRAINT deiyaiplus_admin_kar_created_by_id_56985651_fk_deiyaiplu FOREIGN KEY (created_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_karya deiyaiplus_admin_kar_deleted_by_id_5d9aa2c4_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_karya
    ADD CONSTRAINT deiyaiplus_admin_kar_deleted_by_id_5d9aa2c4_fk_deiyaiplu FOREIGN KEY (deleted_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_karya deiyaiplus_admin_kar_kategori_id_id_a39622c7_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_karya
    ADD CONSTRAINT deiyaiplus_admin_kar_kategori_id_id_a39622c7_fk_deiyaiplu FOREIGN KEY (kategori_id_id) REFERENCES public.deiyaiplus_admin_kategori(kategori_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_karya deiyaiplus_admin_kar_status_by_id_bf58a795_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_karya
    ADD CONSTRAINT deiyaiplus_admin_kar_status_by_id_bf58a795_fk_deiyaiplu FOREIGN KEY (status_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_karya deiyaiplus_admin_kar_updated_by_id_37d1cd25_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_karya
    ADD CONSTRAINT deiyaiplus_admin_kar_updated_by_id_37d1cd25_fk_deiyaiplu FOREIGN KEY (updated_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_karya deiyaiplus_admin_kar_user_id_id_28f636be_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_karya
    ADD CONSTRAINT deiyaiplus_admin_kar_user_id_id_28f636be_fk_deiyaiplu FOREIGN KEY (user_id_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_kategori deiyaiplus_admin_kat_archived_by_id_76f6c1fc_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_kategori
    ADD CONSTRAINT deiyaiplus_admin_kat_archived_by_id_76f6c1fc_fk_deiyaiplu FOREIGN KEY (archived_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_kategori deiyaiplus_admin_kat_created_by_id_1dfde8ed_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_kategori
    ADD CONSTRAINT deiyaiplus_admin_kat_created_by_id_1dfde8ed_fk_deiyaiplu FOREIGN KEY (created_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_kategori deiyaiplus_admin_kat_deleted_by_id_bb645359_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_kategori
    ADD CONSTRAINT deiyaiplus_admin_kat_deleted_by_id_bb645359_fk_deiyaiplu FOREIGN KEY (deleted_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_kategori deiyaiplus_admin_kat_status_by_id_3a43ea45_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_kategori
    ADD CONSTRAINT deiyaiplus_admin_kat_status_by_id_3a43ea45_fk_deiyaiplu FOREIGN KEY (status_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_kategori deiyaiplus_admin_kat_updated_by_id_1aa31fcb_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_kategori
    ADD CONSTRAINT deiyaiplus_admin_kat_updated_by_id_1aa31fcb_fk_deiyaiplu FOREIGN KEY (updated_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_konten_karya deiyaiplus_admin_kon_karya_id_id_f5728afa_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_konten_karya
    ADD CONSTRAINT deiyaiplus_admin_kon_karya_id_id_f5728afa_fk_deiyaiplu FOREIGN KEY (karya_id_id) REFERENCES public.deiyaiplus_admin_karya(karya_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_partner deiyaiplus_admin_par_archived_by_id_c8bb2e44_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_partner
    ADD CONSTRAINT deiyaiplus_admin_par_archived_by_id_c8bb2e44_fk_deiyaiplu FOREIGN KEY (archived_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_partner deiyaiplus_admin_par_created_by_id_9ebf49e5_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_partner
    ADD CONSTRAINT deiyaiplus_admin_par_created_by_id_9ebf49e5_fk_deiyaiplu FOREIGN KEY (created_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_partner deiyaiplus_admin_par_deleted_by_id_87bd8617_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_partner
    ADD CONSTRAINT deiyaiplus_admin_par_deleted_by_id_87bd8617_fk_deiyaiplu FOREIGN KEY (deleted_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_partner deiyaiplus_admin_par_status_by_id_349b84b6_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_partner
    ADD CONSTRAINT deiyaiplus_admin_par_status_by_id_349b84b6_fk_deiyaiplu FOREIGN KEY (status_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_partner deiyaiplus_admin_par_updated_by_id_21ce0104_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_partner
    ADD CONSTRAINT deiyaiplus_admin_par_updated_by_id_21ce0104_fk_deiyaiplu FOREIGN KEY (updated_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_pengaduan deiyaiplus_admin_pen_archived_by_id_6d070c8e_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_pengaduan
    ADD CONSTRAINT deiyaiplus_admin_pen_archived_by_id_6d070c8e_fk_deiyaiplu FOREIGN KEY (archived_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_pengaduan deiyaiplus_admin_pen_created_by_id_af63800f_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_pengaduan
    ADD CONSTRAINT deiyaiplus_admin_pen_created_by_id_af63800f_fk_deiyaiplu FOREIGN KEY (created_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_pengaduan deiyaiplus_admin_pen_deleted_by_id_badc1975_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_pengaduan
    ADD CONSTRAINT deiyaiplus_admin_pen_deleted_by_id_badc1975_fk_deiyaiplu FOREIGN KEY (deleted_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_pengaduan deiyaiplus_admin_pen_status_by_id_bceb00ba_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_pengaduan
    ADD CONSTRAINT deiyaiplus_admin_pen_status_by_id_bceb00ba_fk_deiyaiplu FOREIGN KEY (status_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_pengaduan deiyaiplus_admin_pen_updated_by_id_2d49656a_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_pengaduan
    ADD CONSTRAINT deiyaiplus_admin_pen_updated_by_id_2d49656a_fk_deiyaiplu FOREIGN KEY (updated_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_profile deiyaiplus_admin_pro_archived_by_id_f3674a5c_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_profile
    ADD CONSTRAINT deiyaiplus_admin_pro_archived_by_id_f3674a5c_fk_deiyaiplu FOREIGN KEY (archived_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_profile deiyaiplus_admin_pro_created_by_id_cc454419_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_profile
    ADD CONSTRAINT deiyaiplus_admin_pro_created_by_id_cc454419_fk_deiyaiplu FOREIGN KEY (created_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_profile deiyaiplus_admin_pro_deleted_by_id_b684076b_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_profile
    ADD CONSTRAINT deiyaiplus_admin_pro_deleted_by_id_b684076b_fk_deiyaiplu FOREIGN KEY (deleted_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_profile deiyaiplus_admin_pro_status_by_id_3f8915ba_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_profile
    ADD CONSTRAINT deiyaiplus_admin_pro_status_by_id_3f8915ba_fk_deiyaiplu FOREIGN KEY (status_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_profile deiyaiplus_admin_pro_updated_by_id_8a353659_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_profile
    ADD CONSTRAINT deiyaiplus_admin_pro_updated_by_id_8a353659_fk_deiyaiplu FOREIGN KEY (updated_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_sekolah deiyaiplus_admin_sek_archived_by_id_096c55f2_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_sekolah
    ADD CONSTRAINT deiyaiplus_admin_sek_archived_by_id_096c55f2_fk_deiyaiplu FOREIGN KEY (archived_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_sekolah deiyaiplus_admin_sek_created_by_id_c131df66_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_sekolah
    ADD CONSTRAINT deiyaiplus_admin_sek_created_by_id_c131df66_fk_deiyaiplu FOREIGN KEY (created_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_sekolah deiyaiplus_admin_sek_deleted_by_id_8277ae67_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_sekolah
    ADD CONSTRAINT deiyaiplus_admin_sek_deleted_by_id_8277ae67_fk_deiyaiplu FOREIGN KEY (deleted_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_sekolah deiyaiplus_admin_sek_status_by_id_d39930ad_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_sekolah
    ADD CONSTRAINT deiyaiplus_admin_sek_status_by_id_d39930ad_fk_deiyaiplu FOREIGN KEY (status_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_sekolah deiyaiplus_admin_sek_updated_by_id_c332d33e_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_sekolah
    ADD CONSTRAINT deiyaiplus_admin_sek_updated_by_id_c332d33e_fk_deiyaiplu FOREIGN KEY (updated_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_settings deiyaiplus_admin_set_archived_by_id_c4be2649_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_settings
    ADD CONSTRAINT deiyaiplus_admin_set_archived_by_id_c4be2649_fk_deiyaiplu FOREIGN KEY (archived_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_settings deiyaiplus_admin_set_created_by_id_0d7c7497_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_settings
    ADD CONSTRAINT deiyaiplus_admin_set_created_by_id_0d7c7497_fk_deiyaiplu FOREIGN KEY (created_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_settings deiyaiplus_admin_set_deleted_by_id_8ddda5d7_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_settings
    ADD CONSTRAINT deiyaiplus_admin_set_deleted_by_id_8ddda5d7_fk_deiyaiplu FOREIGN KEY (deleted_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_settings deiyaiplus_admin_set_status_by_id_27be430d_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_settings
    ADD CONSTRAINT deiyaiplus_admin_set_status_by_id_27be430d_fk_deiyaiplu FOREIGN KEY (status_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_settings deiyaiplus_admin_set_updated_by_id_4b09c84c_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_settings
    ADD CONSTRAINT deiyaiplus_admin_set_updated_by_id_4b09c84c_fk_deiyaiplu FOREIGN KEY (updated_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_slider deiyaiplus_admin_sli_archived_by_id_ebca161b_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_slider
    ADD CONSTRAINT deiyaiplus_admin_sli_archived_by_id_ebca161b_fk_deiyaiplu FOREIGN KEY (archived_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_slider deiyaiplus_admin_sli_created_by_id_2f21df27_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_slider
    ADD CONSTRAINT deiyaiplus_admin_sli_created_by_id_2f21df27_fk_deiyaiplu FOREIGN KEY (created_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_slider deiyaiplus_admin_sli_deleted_by_id_7898b847_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_slider
    ADD CONSTRAINT deiyaiplus_admin_sli_deleted_by_id_7898b847_fk_deiyaiplu FOREIGN KEY (deleted_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_slider deiyaiplus_admin_sli_status_by_id_8a0602bb_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_slider
    ADD CONSTRAINT deiyaiplus_admin_sli_status_by_id_8a0602bb_fk_deiyaiplu FOREIGN KEY (status_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_slider deiyaiplus_admin_sli_updated_by_id_572be660_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_slider
    ADD CONSTRAINT deiyaiplus_admin_sli_updated_by_id_572be660_fk_deiyaiplu FOREIGN KEY (updated_by_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_taggeditem deiyaiplus_admin_tag_content_type_id_104b43eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_taggeditem
    ADD CONSTRAINT deiyaiplus_admin_tag_content_type_id_104b43eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deiyaiplus_admin_taggeditem deiyaiplus_admin_taggeditem_tag_id_fcf96284_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deiyaiplus_admin_taggeditem
    ADD CONSTRAINT deiyaiplus_admin_taggeditem_tag_id_fcf96284_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_deiyaiplu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_deiyaiplu FOREIGN KEY (user_id) REFERENCES public.deiyaiplus_admin_master_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

