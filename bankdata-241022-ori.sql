--
-- PostgreSQL database dump
--

-- Dumped from database version 12.20 (Ubuntu 12.20-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 16.0

-- Started on 2024-10-22 15:40:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 16535)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 229 (class 1259 OID 16559)
-- Name: dynamic_inputs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dynamic_inputs (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    type_of_file character varying(50) NOT NULL,
    type_of_input character varying(10) NOT NULL,
    default_value character varying(255),
    created_at timestamp without time zone,
    created_by bigint,
    updated_at timestamp without time zone,
    updated_by bigint,
    deleted_at timestamp without time zone,
    deleted_by bigint,
    description text,
    is_enabled boolean DEFAULT true NOT NULL,
    is_required boolean DEFAULT false NOT NULL,
    is_multiple boolean,
    label character varying(150),
    behavior character varying(100),
    option_reference character varying(50)
);


ALTER TABLE public.dynamic_inputs OWNER TO postgres;

--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN dynamic_inputs.behavior; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dynamic_inputs.behavior IS 'akan digunakan untuk menambatkan sifat-sifat seperti, tidak boleh ada spasi atau harus ada numerik (diatur lewat class). Atau untuk input file, menentukan attribute ACCEPT img atau doc (diatur lewat config)';


--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN dynamic_inputs.option_reference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dynamic_inputs.option_reference IS 'dipakai sebagai TYPE dari table OPTIONS. Jadi untuk menambahkan opsi, tambahkan di table OPSI dengan TYPE sesuai yang didaftarkan di kolom ini';


--
-- TOC entry 230 (class 1259 OID 16568)
-- Name: dynamic_inputs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dynamic_inputs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dynamic_inputs_id_seq OWNER TO postgres;

--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 230
-- Name: dynamic_inputs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dynamic_inputs_id_seq OWNED BY public.dynamic_inputs.id;


--
-- TOC entry 209 (class 1259 OID 16410)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16408)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 208
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 226 (class 1259 OID 16546)
-- Name: file_sharings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.file_sharings (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    file_id integer,
    type_of_sharing integer,
    expired_at timestamp without time zone,
    created_at timestamp without time zone,
    created_by bigint,
    updated_at timestamp without time zone,
    updated_by bigint
);


ALTER TABLE public.file_sharings OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16507)
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    title text NOT NULL,
    user_group_id integer,
    type_of_file character varying(20),
    type_of_publicity character varying(20),
    editorial_permission character varying(20),
    keywords text,
    file_main text,
    file_link text,
    dynamic_inputs jsonb,
    created_at timestamp without time zone,
    created_by bigint,
    updated_at timestamp without time zone,
    updated_by bigint,
    deleted_at timestamp without time zone,
    deleted_by bigint,
    type_of_extension character varying(20)
);


ALTER TABLE public.files OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16552)
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_id_seq OWNER TO postgres;

--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 227
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- TOC entry 231 (class 1259 OID 16572)
-- Name: keywords; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keywords (
    id integer NOT NULL,
    subject character varying(50) NOT NULL,
    created_at timestamp without time zone,
    created_by bigint,
    updated_at timestamp without time zone,
    updated_by bigint,
    number_of_uses integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.keywords OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16578)
-- Name: keywords_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.keywords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.keywords_id_seq OWNER TO postgres;

--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 232
-- Name: keywords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.keywords_id_seq OWNED BY public.keywords.id;


--
-- TOC entry 225 (class 1259 OID 16515)
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    subject character varying(100) NOT NULL,
    description text,
    request jsonb,
    response jsonb,
    created_at timestamp without time zone,
    created_by bigint
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16554)
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logs_id_seq OWNER TO postgres;

--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 228
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- TOC entry 215 (class 1259 OID 16448)
-- Name: menu_actions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_actions (
    id bigint NOT NULL,
    menu_id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100),
    is_enabled boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone,
    created_by bigint,
    updated_at timestamp without time zone,
    updated_by bigint,
    deleted_at timestamp without time zone,
    deleted_by bigint,
    description text
);


ALTER TABLE public.menu_actions OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16460)
-- Name: menu_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_actions_id_seq OWNER TO postgres;

--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 217
-- Name: menu_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_actions_id_seq OWNED BY public.menu_actions.id;


--
-- TOC entry 212 (class 1259 OID 16436)
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    icon character varying(50),
    child_of integer,
    display_type character varying(20),
    is_menu_with_action boolean,
    created_at timestamp without time zone,
    created_by bigint,
    updated_at timestamp without time zone,
    updated_by bigint,
    deleted_at timestamp without time zone,
    deleted_by bigint
);


ALTER TABLE public.menus OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16441)
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menus_id_seq OWNER TO postgres;

--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 213
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- TOC entry 204 (class 1259 OID 16387)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16385)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 203
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 222 (class 1259 OID 16486)
-- Name: options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.options (
    id bigint NOT NULL,
    type character varying(100) NOT NULL,
    value character varying(255),
    value2 character varying(255),
    label character varying(255),
    description text,
    img_main text,
    created_at timestamp without time zone,
    created_by bigint,
    updated_at timestamp without time zone,
    updated_by bigint,
    deleted_at timestamp without time zone,
    deleted_by bigint
);


ALTER TABLE public.options OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16494)
-- Name: options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.options_id_seq OWNER TO postgres;

--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 223
-- Name: options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.options_id_seq OWNED BY public.options.id;


--
-- TOC entry 207 (class 1259 OID 16403)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16424)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16422)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 210
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 216 (class 1259 OID 16454)
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_permissions (
    id bigint NOT NULL,
    role_id integer NOT NULL,
    menu_action_id integer NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone,
    created_by bigint,
    updated_at timestamp without time zone,
    updated_by bigint,
    deleted_at timestamp without time zone,
    deleted_by bigint
);


ALTER TABLE public.role_permissions OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16464)
-- Name: role_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 219
-- Name: role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_permissions_id_seq OWNED BY public.role_permissions.id;


--
-- TOC entry 214 (class 1259 OID 16443)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp without time zone,
    created_by bigint,
    updated_at timestamp without time zone,
    updated_by bigint,
    deleted_at timestamp without time zone,
    deleted_by bigint,
    description text,
    is_enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16462)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 218
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 220 (class 1259 OID 16466)
-- Name: user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_groups (
    id bigint NOT NULL,
    fullname character varying(100) NOT NULL,
    email character varying(255),
    phone character varying(20),
    img_main text,
    is_enabled boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone,
    created_by bigint,
    updated_at timestamp without time zone,
    updated_by bigint,
    deleted_at timestamp without time zone,
    deleted_by bigint,
    nickname character varying(20) NOT NULL
);


ALTER TABLE public.user_groups OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16475)
-- Name: user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 221
-- Name: user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_groups_id_seq OWNED BY public.user_groups.id;


--
-- TOC entry 206 (class 1259 OID 16395)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    role_id integer NOT NULL,
    user_group_id integer NOT NULL,
    img_main text,
    is_enabled boolean DEFAULT true NOT NULL,
    created_by integer,
    updated_by integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16393)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 205
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2920 (class 2604 OID 16570)
-- Name: dynamic_inputs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamic_inputs ALTER COLUMN id SET DEFAULT nextval('public.dynamic_inputs_id_seq'::regclass);


--
-- TOC entry 2904 (class 2604 OID 16413)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 2917 (class 2604 OID 16556)
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- TOC entry 2923 (class 2604 OID 16580)
-- Name: keywords id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keywords ALTER COLUMN id SET DEFAULT nextval('public.keywords_id_seq'::regclass);


--
-- TOC entry 2918 (class 2604 OID 16557)
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- TOC entry 2910 (class 2604 OID 16484)
-- Name: menu_actions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_actions ALTER COLUMN id SET DEFAULT nextval('public.menu_actions_id_seq'::regclass);


--
-- TOC entry 2907 (class 2604 OID 16483)
-- Name: menus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- TOC entry 2901 (class 2604 OID 16390)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2916 (class 2604 OID 16558)
-- Name: options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options ALTER COLUMN id SET DEFAULT nextval('public.options_id_seq'::regclass);


--
-- TOC entry 2906 (class 2604 OID 16427)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 2912 (class 2604 OID 16482)
-- Name: role_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions ALTER COLUMN id SET DEFAULT nextval('public.role_permissions_id_seq'::regclass);


--
-- TOC entry 2908 (class 2604 OID 16481)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 2914 (class 2604 OID 16480)
-- Name: user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_groups_id_seq'::regclass);


--
-- TOC entry 2902 (class 2604 OID 16398)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3116 (class 0 OID 16559)
-- Dependencies: 229
-- Data for Name: dynamic_inputs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dynamic_inputs (id, name, type_of_file, type_of_input, default_value, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, description, is_enabled, is_required, is_multiple, label, behavior, option_reference) FROM stdin;
1	nomor_surat	surat	text	\N	\N	\N	\N	\N	\N	\N	\N	t	t	\N	Nomor Surat	class-nospace	\N
5	nomor_peraturan	peraturan	text	\N	2024-04-16 08:50:09	\N	2024-04-17 02:50:45	\N	\N	\N	test....	t	t	\N	Nomor Peraturan Fisik	class-nospace,class-uppercase	\N
9	lokasi_fisik	peraturan	text	\N	2024-04-29 11:40:50	\N	2024-04-29 11:40:50	\N	\N	\N	\N	t	f	\N	Lokasi Fisik	\N	\N
2	lampiran	surat	file	\N	\N	\N	2024-05-08 15:14:53	\N	\N	\N	\N	t	f	f	Lampiran	mime-doc,mime-img	\N
10	nomor_sertifikat	sertifikat	text	\N	2024-05-08 14:36:37	\N	2024-05-15 11:14:29	19	\N	\N	\N	t	t	\N	Nomor Sertifikat	class-nospace	\N
\.


--
-- TOC entry 3096 (class 0 OID 16410)
-- Dependencies: 209
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 16546)
-- Dependencies: 226
-- Data for Name: file_sharings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.file_sharings (id, file_id, type_of_sharing, expired_at, created_at, created_by, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 16507)
-- Dependencies: 224
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, title, user_group_id, type_of_file, type_of_publicity, editorial_permission, keywords, file_main, file_link, dynamic_inputs, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, type_of_extension) FROM stdin;
72	BAST SEMENTARA MUHAMMADDIYAH KATINGAN 2024	3	bast	public	user_group	katingan	/storage//file-manager//file-manager-72-file_main.pdf	\N	\N	2024-05-20 08:23:39	19	2024-06-06 08:21:04	\N	2024-06-06 08:21:04	19	pdf
65	BAST AC KEJAKSAAN	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-65-file_main.pdf	\N	\N	2024-05-20 07:59:59	19	2024-06-06 08:20:26	\N	2024-06-06 08:20:26	19	pdf
54	Foto PJ Bupati - Syaiful	2	media	public	user_group	bupati,bupati katingan,pj bupati,syaiful	/storage//file-manager//file-manager-54-file_main.png	\N	\N	2024-05-02 09:50:20	1	2024-05-02 13:53:38	\N	\N	\N	png
55	Foto Camat Katingan Hilir	1	media	public	user_group	katingan,camat,katingan hilir	/storage//file-manager//file-manager-55-file_main.png	\N	\N	2024-05-02 13:53:00	1	2024-05-02 13:53:00	\N	\N	\N	png
56	Logo Katingan	1	media	public	user_group	katingan,logo,kabupaten	/storage//file-manager//file-manager-56-file_main.png	\N	\N	2024-05-08 14:43:23	1	2024-05-14 09:10:05	1	\N	\N	png
66	BAST SEMENTARA POLRES KATINGAN KH 1107 NU	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-66-file_main.pdf	\N	\N	2024-05-20 08:02:02	19	2024-06-06 08:20:26	\N	2024-06-06 08:20:26	19	pdf
67	BAST SEMENTARA MASJID FITRIAH TUMBANG SANAMANG	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-67-file_main.pdf	\N	\N	2024-05-20 08:04:19	19	2024-06-06 08:20:26	\N	2024-06-06 08:20:26	19	pdf
68	BAST PINJAM PAKAI APV KH 9059 NU MASJID AL IMAM TEWANG BARINGIN	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-68-file_main.pdf	\N	\N	2024-05-20 08:06:58	19	2024-06-06 08:20:26	\N	2024-06-06 08:20:26	19	pdf
60	berkas test - edited	1	media	public	user_group	\N	/storage//file-manager//file-manager-60-file_main.png	\N	\N	2024-05-14 09:14:31	1	2024-05-14 09:22:02	1	2024-05-14 09:22:02	1	png
69	BAST SEMENTARA AL-GHOFRONT DEPAG	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-69-file_main.pdf	\N	\N	2024-05-20 08:08:52	19	2024-06-06 08:20:26	\N	2024-06-06 08:20:26	19	pdf
70	BAST SEMENTARA AVANZA ADVENTUS PERKIM	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-70-file_main.pdf	\N	\N	2024-05-20 08:10:22	19	2024-06-06 08:20:26	\N	2024-06-06 08:20:26	19	pdf
73	BAST SEMENTARA RUSH BAPELITBANG 2024	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-73-file_main.pdf	\N	\N	2024-05-20 08:26:49	19	2024-06-06 08:21:04	\N	2024-06-06 08:21:04	19	pdf
61	Naskah Perjanjian Masjid Fitriah Tumbang Sanamang \r\n(BAST PINJAM PAKAI AMBULANCE)	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-61-file_main.pdf	\N	\N	2024-05-15 07:51:41	19	2024-05-20 08:19:25	19	2024-05-20 08:19:25	19	pdf
62	PEMINJAMAN BPKB KH 5922 NY	3	surat	user_group	user_group	katingan	/storage//file-manager//file-manager-62-file_main.pdf	\N	{"lampiran": "/storage//file-manager//file-manager-62-dynamic_inputs.lampiran.pdf", "nomor_surat": "050/243/Bappedalitbang-Um/2024"}	2024-05-15 08:01:48	19	2024-06-06 08:20:26	19	2024-06-06 08:20:26	19	pdf
74	BAST SEMENTARA RUSH MARKUS 20214	3	bast	public	user_group	katingan	/storage//file-manager//file-manager-74-file_main.pdf	\N	\N	2024-05-20 08:29:52	19	2024-06-06 08:21:04	\N	2024-06-06 08:21:04	19	pdf
75	BAST SEMENTARA TRITON DINAS PERIKANAN DAN PERHUBUNGAN	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-75-file_main.pdf	\N	\N	2024-05-20 11:06:22	19	2024-06-06 08:21:04	\N	2024-06-06 08:21:04	19	pdf
63	usulan komponen harga 2024 (DLH)	3	surat	public	user_group	katingan	/storage//file-manager//file-manager-63-file_main.pdf	\N	{"lampiran": "/storage//file-manager//file-manager-63-dynamic_inputs.lampiran.pdf", "nomor_surat": "660.0.2/386/DLH-PROG/IV/2024"}	2024-05-15 08:26:58	19	2024-05-20 08:19:49	\N	2024-05-20 08:19:49	19	pdf
64	SERTIFIKAT RUMAH MARTINA HERMIN	3	sertifikat	public	user_group	kabupaten,katingan hilir	/storage//file-manager//file-manager-64-file_main.pdf	\N	{"nomor_sertifikat": "15.10.04.04.4.0000abc"}	2024-05-15 08:29:21	19	2024-05-20 08:20:05	20	2024-05-20 08:20:05	19	pdf
71	BAST SEMENTARA DISDIK INOVA ZENIX KH 1210 NU	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-71-file_main.pdf	\N	\N	2024-05-20 08:21:29	19	2024-06-06 08:20:26	\N	2024-06-06 08:20:26	19	pdf
76	BAST VARIO DONY MERIANTO MERAH	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-76-file_main.pdf	\N	\N	2024-05-20 11:08:07	19	2024-06-06 08:21:04	\N	2024-06-06 08:21:04	19	pdf
77	KUMPULAN STNK	3	bast	public	user_group	katingan	/storage//file-manager//file-manager-77-file_main.pdf	\N	\N	2024-05-20 11:08:57	19	2024-06-06 08:21:04	\N	2024-06-06 08:21:04	19	pdf
78	PENGALIHAN STATUS SPEEDBOD KEC.MANDAWAI	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-78-file_main.pdf	\N	\N	2024-05-20 11:10:36	19	2024-06-06 08:21:04	\N	2024-06-06 08:21:04	19	pdf
80	PENGALIHAN STATUS SPEEDBOD Kec.MANDAWAI	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-80-file_main.pdf	\N	\N	2024-05-22 15:05:10	19	2024-06-06 08:21:04	\N	2024-06-06 08:21:04	19	pdf
81	PERMOHONAN HIBAH MOBIL KEJAKSAAN	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-81-file_main.pdf	\N	\N	2024-05-22 15:06:15	19	2024-06-06 08:21:04	\N	2024-06-06 08:21:04	19	pdf
82	PINJAM PAKAI AMBULANCE MESJID JAMI ALGHUFRONT	3	bast	public	user_group	katingan	/storage//file-manager//file-manager-82-file_main.pdf	\N	\N	2024-05-22 15:07:25	19	2024-06-06 08:21:04	\N	2024-06-06 08:21:04	19	pdf
83	PINJAM PAKAI MOBIL KH 1056 NU	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-83-file_main.pdf	\N	\N	2024-05-22 15:08:13	19	2024-06-06 08:21:04	\N	2024-06-06 08:21:04	19	pdf
84	SK PEJABAT PENGELOLA BARANG MILIK DAERAH KAB KATINGAN ( BARU)	3	sk	user_group	user_group	katingan	/storage//file-manager//file-manager-84-file_main.pdf	\N	\N	2024-05-22 15:10:30	19	2024-06-06 08:21:04	\N	2024-06-06 08:21:04	19	pdf
86	SK PENETAPAN BARU TANAH PADA DINAS PENDIDIKAN KAB.KATINGAN TAHUN 2024	3	sk	public	user_group	katingan	/storage//file-manager//file-manager-86-file_main.pdf	\N	\N	2024-05-22 15:26:15	19	2024-06-06 08:21:04	\N	2024-06-06 08:21:04	19	pdf
89	BAST AC (KEJAKSAN)	3	bast	public	user_group	\N	/storage//file-manager//file-manager-89-file_main.pdf	\N	\N	2024-06-06 08:24:46	19	2024-06-06 08:24:46	\N	\N	\N	pdf
87	SK PENETAPAN BARU Kec.KATINGAN HILIR ,KEC.TWS GARING, KEC. PULAU MALAN, KEC. KATINGAN TENGAH, KEC. SANAMAN MANTIKEI DAN KATINGAN KUALA pada DINAS PUPR	3	sk	public	user_group	katingan	/storage//file-manager//file-manager-87-file_main.pdf	\N	\N	2024-05-22 15:32:02	19	2024-06-06 08:19:38	\N	2024-06-06 08:19:38	19	pdf
88	SK PEJABAT PENGELOLA BARANG LAMA TAHUN 2024	3	sk	user_group	user_group	katingan	/storage//file-manager//file-manager-88-file_main.pdf	\N	\N	2024-05-22 15:50:08	19	2024-06-06 08:19:38	\N	2024-06-06 08:19:38	19	pdf
90	BAST POLRES KH 1107 NU	3	bast	public	user_group	\N	/storage//file-manager//file-manager-90-file_main.pdf	\N	\N	2024-06-06 08:26:34	19	2024-06-06 08:26:34	\N	\N	\N	pdf
107	BERITA ACARA KALAPAS 2024	3	bast	user_group	user_group	\N	/storage//file-manager//file-manager-107-file_main.pdf	\N	\N	2024-07-02 09:07:13	19	2024-07-02 09:07:13	\N	\N	\N	pdf
79	PINJAM PAKAI AMBULANCE MESJID JAMI ALGHUFRONT 2024	3	bast	user_group	user_group	katingan	/storage//file-manager//file-manager-79-file_main.pdf	\N	\N	2024-05-20 11:13:36	19	2024-06-06 08:21:04	\N	2024-06-06 08:21:04	19	pdf
85	SK PENETAPAN BARU TANAH DI BAWAH Kec.KATINGAN HILIR,Kec.TWS GARING,KEC.PULAU MALAN,KEC.KATINGAN TENGAH, KEC.SANAMAN MANTIKEI, KEC.KATINGAN KUALA PADA DINAS PUPR TAHUN 2024	3	sk	user_group	user_group	katingan	/storage//file-manager//file-manager-85-file_main.pdf	\N	\N	2024-05-22 15:24:45	19	2024-06-06 08:21:04	\N	2024-06-06 08:21:04	19	pdf
91	BAST SEMENTARA  MASJID JAMI AL-GHUPRONT KEC.KATINGAN HULU	3	bast	public	user_group	\N	/storage//file-manager//file-manager-91-file_main.pdf	\N	\N	2024-06-06 08:28:49	19	2024-06-06 08:28:49	\N	\N	\N	pdf
92	KODIM ( HIBAH TANAH ) 459/B /32/III/2024	3	surat	public	user_group	\N	/storage//file-manager//file-manager-92-file_main.pdf	\N	{"nomor_surat": "B/32/III/2024"}	2024-06-06 08:37:00	19	2024-06-06 08:39:53	\N	2024-06-06 08:39:53	19	pdf
93	KODIM HIBAH TANAH (B/32/III/2024)	3	surat	public	user_group	\N	/storage//file-manager//file-manager-93-file_main.pdf	\N	{"lampiran": "undefined", "nomor_surat": "B/32/III/2024"}	2024-06-06 08:40:59	19	2024-06-06 08:42:55	19	\N	\N	pdf
94	KEMENTRIAN AGAMA KAB KATINGAN (B-35/KK.15.13/1/KS.00/04/2024)	3	surat	public	user_group	\N	/storage//file-manager//file-manager-94-file_main.pdf	\N	{"nomor_surat": "B-35/KK.15.13/1/KS.00/04/2024"}	2024-06-06 08:45:48	19	2024-06-06 08:45:48	\N	\N	\N	pdf
95	PERPANJANGAN PINJAM PAKAI POLRES (B/435/III/LOG.2.2/2024)	3	surat	public	user_group	\N	/storage//file-manager//file-manager-95-file_main.pdf	\N	{"nomor_surat": "(B/435/III/LOG.2.2/2024)"}	2024-06-06 08:52:46	19	2024-06-06 08:52:46	\N	\N	\N	pdf
96	DINKES PERMOHONAN PEMINJAMAN SERTIFIKAT TANAH (440/2342/SKT-1/IV-2024)	3	surat	public	user_group	\N	/storage//file-manager//file-manager-96-file_main.pdf	\N	{"nomor_surat": "(440/2342/SKT-1/IV-2024)"}	2024-06-06 09:00:14	19	2024-06-06 09:00:14	\N	\N	\N	pdf
97	BPBD PENYAMPAIAN RENCANA KEBUTUHAN (360/205/IV/BPBD/2024)	3	surat	public	user_group	\N	/storage//file-manager//file-manager-97-file_main.pdf	\N	{"nomor_surat": "(360/205/IV/BPBD/2024)"}	2024-06-06 09:04:20	19	2024-06-06 09:04:20	\N	\N	\N	pdf
98	SURAT KELUAR BALASAN U/ KEMENAG  (HIBAH MOBIL DINAS KH 1156 NU)	3	surat	public	user_group	\N	/storage//file-manager//file-manager-98-file_main.pdf	\N	{"nomor_surat": "-"}	2024-06-06 09:28:44	19	2024-06-06 09:28:44	\N	\N	\N	pdf
99	SETWAN USULAN RENCANA KEBUTUHAN 2024 (75/716/SETWAN/IV/2024)	3	surat	public	user_group	\N	/storage//file-manager//file-manager-99-file_main.pdf	\N	{"nomor_surat": "75/716/SETWAN/IV/2024"}	2024-06-06 09:34:07	19	2024-06-06 09:34:08	\N	\N	\N	pdf
100	DPUPR (INPUT SSH) 2024	3	surat	public	user_group	\N	/storage//file-manager//file-manager-100-file_main.pdf	\N	{"nomor_surat": "032/108-A/DPUPR-SET/IV/2024"}	2024-06-06 09:38:25	19	2024-06-06 09:38:25	\N	\N	\N	pdf
101	KEC.KATINGAN HULU USUL PENETAPAN STATUS	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-101-file_main.pdf	\N	{"nomor_surat": "032/30/Aset-KH/IV/2024"}	2024-06-06 09:43:55	19	2024-06-06 09:43:55	\N	\N	\N	pdf
102	USULAN RKBM KABUPATEN KATINGAN HULU 2024	3	surat	public	user_group	\N	/storage//file-manager//file-manager-102-file_main.pdf	\N	{"nomor_surat": "032/15/Kathulu/IV/2024"}	2024-06-06 09:48:39	19	2024-06-06 09:48:39	\N	\N	\N	pdf
103	USULAN RKBM Kec. PETAK MALAI	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-103-file_main.pdf	\N	{"nomor_surat": "032/036/PTMK/IV/2024"}	2024-06-06 11:21:28	19	2024-06-06 11:21:28	\N	\N	\N	pdf
104	INSPEKTORAT RKBMD (PENYAMPAIAN DATA NAMA PERSONIL UNTUK PEMBENTUKAN TIM)	3	surat	public	user_group	\N	/storage//file-manager//file-manager-104-file_main.pdf	\N	{"nomor_surat": "700/137/INSP/IV/2024"}	2024-06-06 14:51:53	19	2024-06-06 14:51:53	\N	\N	\N	pdf
105	RSUD MAS AMSYAR KASONGAN (USULAN PENAMBAHAN BIAYA PADA STANDAR HARGA SATUAN PEMERINTAH KAB.KATINGAN Th.2024)	3	surat	public	user_group	\N	/storage//file-manager//file-manager-105-file_main.pdf	\N	{"nomor_surat": "445/468-2/TV-RSUD/IV"}	2024-06-06 14:56:47	19	2024-06-06 14:56:47	\N	\N	\N	pdf
106	KERTAS KERJA ASET 2023 ASET TETAP AUDITED	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-106-file_main.xlsx	\N	{"nomor_surat": "-"}	2024-06-06 15:35:58	19	2024-06-06 15:35:58	\N	\N	\N	xlsx
108	NASKAH PERJANJIAN HIBAH KALAPAS	3	bast	user_group	user_group	\N	/storage//file-manager//file-manager-108-file_main.pdf	\N	\N	2024-07-02 09:08:19	19	2024-07-02 09:08:19	\N	\N	\N	pdf
109	SK PELEPASAN HAK KALAPAS	3	bast	user_group	user_group	\N	/storage//file-manager//file-manager-109-file_main.pdf	\N	\N	2024-07-02 09:09:46	19	2024-07-02 09:09:46	\N	\N	\N	pdf
110	SK PERSETUJUAN PIHAK KALAPAS	3	bast	user_group	user_group	\N	/storage//file-manager//file-manager-110-file_main.pdf	\N	\N	2024-07-02 09:11:32	19	2024-07-02 09:11:32	\N	\N	\N	pdf
111	SURAT KALAPAS DAN DISPERKIMTAN	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-111-file_main.pdf	\N	{"nomor_surat": "200/286/DISPERKIMTAN-1/XI/2023"}	2024-07-02 09:15:05	19	2024-07-02 09:15:05	\N	\N	\N	pdf
112	HIBAH TANAH A.N ABARLAN	3	bast	user_group	user_group	\N	/storage//file-manager//file-manager-112-file_main.pdf	\N	\N	2024-07-02 09:21:19	19	2024-07-02 09:21:19	\N	\N	\N	pdf
113	SURAT TANAH A.N ABARLAN	3	bast	user_group	user_group	\N	/storage//file-manager//file-manager-113-file_main.pdf	\N	\N	2024-07-02 09:23:50	19	2024-07-02 09:23:50	\N	\N	\N	pdf
114	SURAT HIBAH A.N ALBARLAN	3	bast	user_group	user_group	\N	/storage//file-manager//file-manager-114-file_main.pdf	\N	\N	2024-07-02 09:30:05	19	2024-07-02 09:30:05	\N	\N	\N	pdf
115	SURAT TANAH A.N ALBARLAN	3	bast	user_group	user_group	\N	/storage//file-manager//file-manager-115-file_main.pdf	\N	\N	2024-07-02 09:31:16	19	2024-07-02 09:31:16	\N	\N	\N	pdf
116	HIBAH TANAH A.N MURDIN KADRI	3	bast	user_group	user_group	\N	/storage//file-manager//file-manager-116-file_main.pdf	\N	\N	2024-07-02 09:33:42	19	2024-07-02 09:33:42	\N	\N	\N	pdf
117	SURAT TANAH MURDIN KADRI	3	bast	user_group	user_group	\N	/storage//file-manager//file-manager-117-file_main.pdf	\N	\N	2024-07-02 09:35:12	19	2024-07-02 09:35:12	\N	\N	\N	pdf
118	BPBD TL Hasil Temuan BPK	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-118-file_main.pdf	\N	{"nomor_surat": "360/402/BPBD/VII/2024"}	2024-07-22 14:56:50	19	2024-07-22 14:56:50	\N	\N	\N	pdf
119	BUPATI KATINGAN / PENETAPAN LOKASI TANAH KANAK-KANAK NEGRI PEMBINA	3	surat	public	user_group	\N	/storage//file-manager//file-manager-119-file_main.pdf	\N	{"nomor_surat": "100.3.3.2/256/2024"}	2024-07-22 14:58:55	19	2024-07-22 14:58:55	\N	\N	\N	pdf
120	BUPATI KATINGAN ( PENETAPAN LOKASI TANAH)	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-120-file_main.pdf	\N	{"nomor_surat": "100.3.3.2/256/2024"}	2024-07-23 09:53:20	19	2024-07-23 09:53:20	\N	\N	\N	pdf
121	DISHUB (PEMUTAHIRAN DATA ASET TETAP)	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-121-file_main.pdf	\N	\N	2024-07-23 14:46:38	19	2024-07-23 14:46:38	\N	\N	\N	pdf
122	DLH (USULAN KOMPONEN STANDAR HARGA)	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-122-file_main.pdf	\N	{"nomor_surat": "600.4/692/DLH-PEDAL/VII/2024"}	2024-07-23 14:54:37	19	2024-07-23 14:54:37	\N	\N	\N	pdf
123	DLH (USULAN PERJANJIAN PENGGUNAAN SEMENTARA (TRUCK AMBROL)	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-123-file_main.pdf	\N	{"nomor_surat": "660.0.1/621/DLH-UM/VI/2024"}	2024-07-23 14:58:45	19	2024-07-23 14:58:45	\N	\N	\N	pdf
124	DLH (USULAN KOMPONEN STANDAR HARGA)	3	surat	public	user_group	\N	/storage//file-manager//file-manager-124-file_main.pdf	\N	{"nomor_surat": "660.4/692/DLH-PEDAL/VII/2024"}	2024-07-24 09:45:36	19	2024-07-24 09:45:36	\N	\N	\N	pdf
125	DP3AP2KB (PERSETUJUAN PENGALIHAN STATUS BMD)	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-125-file_main.pdf	\N	{"nomor_surat": "000.232/370.2/DP3AP2KB"}	2024-07-24 10:30:12	19	2024-07-24 10:30:12	\N	\N	\N	pdf
126	DPTTK (Permohonan Usulan Penambahan SSH	3	surat	public	user_group	\N	/storage//file-manager//file-manager-126-file_main.pdf	\N	{"nomor_surat": "47/DPPTK-BK/VII/2024"}	2024-07-24 10:51:54	19	2024-07-24 10:51:54	\N	\N	\N	pdf
127	DISDIK ( TANGGUNG JAWAB MUTLAK dan SURVEY HARGA KELOTOK )	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-127-file_main.pdf	\N	{"nomor_surat": "800/981/DISDIK.1/2024"}	2024-08-05 08:08:28	19	2024-08-05 08:08:28	\N	\N	\N	pdf
128	DISDUKCAPIL (USULAN SSH)	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-128-file_main.pdf	\N	{"nomor_surat": "470/366/Disdukcapil-1/2024"}	2024-08-05 09:00:36	19	2024-08-05 09:00:36	\N	\N	\N	pdf
129	DISPORA-DK2OP (Penertiban Pencatatan dan Pengguna BMD pada DISPORA	3	surat	public	user_group	\N	/storage//file-manager//file-manager-129-file_main.pdf	\N	{"nomor_surat": "00.30/503/DK2OP-1/VIII/2024"}	2024-08-05 09:03:14	19	2024-08-05 09:03:14	\N	\N	\N	pdf
130	DINKES (Usulan Penamambahan Merk, Harga Satuan dan Spesifikasi DPA Pemerintah Kab.Katingan)	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-130-file_main.pdf	\N	{"nomor_surat": "900.1/6388/kesmas/III/2024"}	2024-08-08 08:10:56	19	2024-08-08 08:10:56	\N	\N	\N	pdf
131	DINKES (Pengadaan Kendaraan Dinas)	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-131-file_main.pdf	\N	{"nomor_surat": "440/6541/SKT-2/VIII-2024"}	2024-08-12 12:00:32	19	2024-08-12 12:00:32	\N	\N	\N	pdf
132	DKUKMP ( Penyampaian Permohonan Perubahan Nama Pengguna Barang Pada Aplikasi SIMBADA Th 2024 )	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-132-file_main.pdf	\N	{"nomor_surat": "000.2.3.2/289/DKUKMP-1/VIII/2023"}	2024-08-12 15:44:42	19	2024-08-12 15:44:42	\N	\N	\N	pdf
133	DISHUBKAN (USUL MUTASI BMD)	3	surat	public	user_group	\N	/storage//file-manager//file-manager-133-file_main.pdf	\N	{"nomor_surat": "032/323/Dishubkan-Um/2024"}	2024-08-26 11:31:59	19	2024-08-26 11:31:59	\N	\N	\N	pdf
134	IKLH Kabupaten Katingan 2023	20	media	public	user_group	\N	/storage//file-manager//file-manager-134-file_main.pdf	\N	\N	2024-10-14 10:12:54	21	2024-10-14 10:12:54	\N	\N	\N	pdf
135	IKLH Kabupaten Katingan 2022	20	media	public	user_group	IKLH	/storage//file-manager//file-manager-135-file_main.pdf	\N	\N	2024-10-14 11:54:09	21	2024-10-14 11:54:09	\N	\N	\N	pdf
136	Keanekagaraman Hayati	20	media	public	user_group	\N	/storage//file-manager//file-manager-136-file_main.pdf	\N	\N	2024-10-19 11:42:04	21	2024-10-19 11:42:04	\N	\N	\N	pdf
137	Tutupan Lahan Kabupaten Katingan_2024	20	media	public	user_group	\N	/storage//file-manager//file-manager-137-file_main.pdf	\N	\N	2024-10-19 11:53:41	21	2024-10-19 11:53:41	\N	\N	\N	pdf
138	SETDA ( Bawaslu Usulan Pinjam Pakai )	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-138-file_main.pdf	\N	{"nomor_surat": "-"}	2024-10-22 14:46:19	19	2024-10-22 14:46:19	\N	\N	\N	pdf
139	DINAS PU (Permohonan SSH)	3	surat	user_group	user_group	\N	/storage//file-manager//file-manager-139-file_main.pdf	\N	{"nomor_surat": "050/505/DPUPR-SET/X2024"}	2024-10-22 14:51:42	19	2024-10-22 14:51:42	\N	\N	\N	pdf
\.


--
-- TOC entry 3118 (class 0 OID 16572)
-- Dependencies: 231
-- Data for Name: keywords; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keywords (id, subject, created_at, created_by, updated_at, updated_by, number_of_uses) FROM stdin;
1	hibah	\N	\N	\N	\N	1
33	bupati	2024-05-02 09:50:20	\N	2024-05-02 09:50:20	\N	1
34	pj bupati	2024-05-02 09:50:20	\N	2024-05-02 09:50:20	\N	1
35	bupati katingan	2024-05-02 09:50:20	\N	2024-05-02 09:50:20	\N	1
36	syaiful	2024-05-02 09:50:20	\N	2024-05-02 09:50:20	\N	1
37	katingan	2024-05-02 13:53:00	\N	2024-05-02 13:53:00	\N	1
38	camat	2024-05-02 13:53:00	\N	2024-05-02 13:53:00	\N	1
39	katingan hilir	2024-05-02 13:53:00	\N	2024-05-02 13:53:00	\N	1
40	logo	2024-05-08 14:43:23	\N	2024-05-08 14:43:23	\N	1
41	kabupaten	2024-05-14 09:10:05	\N	2024-05-14 09:10:05	\N	1
42	IKLH	2024-10-14 11:54:09	\N	2024-10-14 11:54:09	\N	1
\.


--
-- TOC entry 3112 (class 0 OID 16515)
-- Dependencies: 225
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs (id, subject, description, request, response, created_at, created_by) FROM stdin;
1	Edit Satuan Kerja	\N	{"id": "13", "email": "disdik@katingankab.go.id", "phone": "081234567891", "fullname": "Dinas Pendidikan - Edited", "nickname": "Disdik"}	{"data": {"id": "13", "data": {"email": "disdik@katingankab.go.id", "phone": "081234567891", "fullname": "Dinas Pendidikan - Edited", "nickname": "Disdik"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-04-17 08:16:03	1
2	Hapus Satuan Kerja	\N	13	{"data": 0, "status": true, "message": "Berhasil menghapus data"}	2024-04-18 14:50:52	1
3	Hapus Satuan Kerja	\N	14	{"data": 1, "status": true, "message": "Berhasil menghapus data"}	2024-04-18 15:00:14	1
4	Hapus Satuan Kerja	\N	15	{"data": 1, "status": true, "message": "Berhasil menghapus data"}	2024-04-18 15:00:17	1
5	Tambah Satuan Kerja	\N	{"email": "ldap@katingankab.go.id", "phone": "0857123456782", "fullname": "Lightweight Directory Access Protocol", "img_main": {}, "nickname": "LDAP"}	{"data": {"output": {"id": 18, "email": "ldap@katingankab.go.id", "phone": "0857123456782", "fullname": "Lightweight Directory Access Protocol", "img_main": {}, "nickname": "LDAP", "created_at": "2024-04-18T08:04:05.000000Z", "updated_at": "2024-04-18T08:04:05.000000Z"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-04-18 15:04:05	1
6	Hapus Satuan Kerja	\N	16	{"data": 1, "status": true, "message": "Berhasil menghapus data"}	2024-04-18 15:04:29	1
7	Hapus Satuan Kerja	\N	18	{"data": 1, "status": true, "message": "Berhasil menghapus data"}	2024-04-18 15:04:32	1
8	Hapus Satuan Kerja	\N	17	{"data": 1, "status": true, "message": "Berhasil menghapus data"}	2024-04-18 15:04:36	1
10	Edit Peran	\N	{"id": "12", "name": "Test 1 - Edited", "is_enabled": "on", "description": "test (edited)  . . . .", "menu_action": ["1", "3", "4", "5", "6", "26"]}	{"data": {"id": "12", "data": {"name": "Test 1 - Edited", "is_enabled": "on", "description": "test (edited)  . . . ."}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-04-18 15:30:25	1
11	Tambah Peran	\N	{"name": "Test 2", "is_enabled": "on", "description": "test . . . .", "menu_action": ["1"]}	{"data": {"output": {"id": 13, "name": "Test 2", "created_at": "2024-04-18T08:31:37.000000Z", "updated_at": "2024-04-18T08:31:37.000000Z", "description": "test . . . ."}, "output_img": 1, "output_permission": {"1": {"id": 170, "role_id": 13, "created_at": "2024-04-18T08:31:37.000000Z", "is_enabled": true, "updated_at": "2024-04-18T08:31:37.000000Z", "menu_action_id": "1"}}}, "status": true, "message": "Berhasil menyimpan data"}	2024-04-18 15:31:37	1
12	Hapus Peran	\N	13	{"data": 1, "status": true, "message": "Berhasil menghapus data"}	2024-04-18 15:31:47	1
13	Tambah Kelola Berkas	\N	{"title": "Test 13", "keywords": ["abc", "abc2", "abc3", "abc4", "abc5"], "file_main": {}, "type_of_file": "peraturan", "file_indexes2": null, "user_group_id": "2", "dynamic_inputs": {"nomor_peraturan": "3rphdbq8c2erhdsy"}, "type_of_publicity": "public", "editorial_permission": "public"}	{"data": {"output": {"id": 52, "title": "Test 13", "file_main": {}, "created_at": "2024-04-18T08:39:17.000000Z", "updated_at": "2024-04-18T08:39:17.000000Z", "type_of_file": "peraturan", "user_group_id": "2", "type_of_publicity": "public", "editorial_permission": "public"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-04-18 15:39:17	1
14	Edit Kelola Berkas	\N	{"id": "52", "title": "Test 13 - Edited", "keywords": ["abc", "abc2", "abc3", "abc4", "abc5"], "type_of_file": "peraturan", "file_indexes2": null, "user_group_id": "2", "dynamic_inputs": {"nomor_peraturan": "3rphdbq8c2erhdsyedited"}, "type_of_publicity": "public", "editorial_permission": "public"}	{"data": {"id": "52", "data": {"title": "Test 13 - Edited", "keywords": "abc,abc2,abc3,abc4,abc5", "type_of_file": "peraturan", "user_group_id": "2", "dynamic_inputs": "{\\"nomor_peraturan\\":\\"3rphdbq8c2erhdsyedited\\"}", "type_of_publicity": "public", "editorial_permission": "public"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-04-18 15:41:03	1
15	Hapus Satuan Kerja	\N	1	{"data": 1, "status": true, "message": "Berhasil menghapus data"}	2024-04-22 15:27:04	1
16	Hapus Satuan Kerja	\N	1	{"data": [{"id": 2, "name": "BankData SAdmin", "email": "superuser@mail.com", "role_id": 1, "img_main": null, "created_at": "2024-03-11T21:29:49.000000Z", "is_enabled": true, "updated_at": "2024-03-20T01:12:44.000000Z", "user_group_id": 1, "email_verified_at": null}, {"id": 1, "name": "Evelline Krst - Developer", "email": "ev.attoff@gmail.com", "role_id": 1, "img_main": null, "created_at": "2024-03-07T06:50:57.000000Z", "is_enabled": true, "updated_at": "2024-03-07T06:50:57.000000Z", "user_group_id": 1, "email_verified_at": null}], "status": false, "message": "Ada user yang berhubungan dengan satuan kerja ini. \\n              Hapus dahulu akun yang terkait jika ingin menghilangkan satker, atau cukup nonaktifkan satker lewat menu edit"}	2024-04-22 15:36:43	1
17	Tambah Input Dinamis	\N	{"name": "lokasi_fisik", "label": "Lokasi Fisik", "is_enabled": "on", "description": null, "type_of_file": "peraturan", "type_of_input": "text"}	{"data": {"output": {"id": 9, "name": "lokasi_fisik", "label": "Lokasi Fisik", "created_at": "2024-04-29T04:40:50.000000Z", "is_enabled": "on", "updated_at": "2024-04-29T04:40:50.000000Z", "description": null, "type_of_file": "peraturan", "type_of_input": "text"}}, "status": true, "message": "Berhasil menyimpan data"}	2024-04-29 11:40:50	1
18	Tambah Pengguna	\N	{"name": "test log", "email": "testlog@gmail.com", "_token": "WwO3zkzko2lGbQV6jVNWYHwGpd2zEvMMbFFUe5mH", "role_id": "12", "user_group_id": "2", "password_confirmation": "123123123"}	{"id": 16, "name": "test log", "email": "testlog@gmail.com", "role_id": "12", "created_at": "2024-04-29T04:50:38.000000Z", "updated_at": "2024-04-29T04:50:38.000000Z", "user_group_id": "2"}	2024-04-29 11:50:38	1
19	Tambah Pengguna	\N	{"name": "13738778389398", "email": "nkdugew@gedfu.cifiep", "_token": "WwO3zkzko2lGbQV6jVNWYHwGpd2zEvMMbFFUe5mH", "role_id": "2", "user_group_id": "2"}	[null]	2024-04-29 11:52:59	1
20	Tambah Pengguna	\N	{"name": "test log 2", "email": "testlog2@gmail.com", "_token": "WwO3zkzko2lGbQV6jVNWYHwGpd2zEvMMbFFUe5mH", "role_id": "2", "user_group_id": "2"}	[null]	2024-04-29 11:55:00	1
21	Login Gagal	ev.attoff@gmail.com	\N	\N	2024-04-29 14:49:51	\N
22	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-04-29 14:49:56	1
23	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-04-29 14:49:58	1
24	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-04-29 15:03:23	1
25	Edit Pengguna	\N	{"name": "test log 2", "email": "testlog2@gmail.com", "_token": "qWqiMxbh1KanSZ8zWBVS6G8fXgl5yfuXxHYdZXYK", "role_id": "2", "user_group_id": "2"}	1	2024-04-29 16:12:41	1
26	Edit Pengguna	\N	{"name": "test log 2 - edited", "email": "testlog2@gmail.com", "_token": "qWqiMxbh1KanSZ8zWBVS6G8fXgl5yfuXxHYdZXYK", "role_id": "2", "user_group_id": "2"}	1	2024-04-29 16:12:51	1
27	Edit Pengguna	\N	{"name": "test log 2 - edited 2", "email": "testlog2@gmail.com", "_token": "qWqiMxbh1KanSZ8zWBVS6G8fXgl5yfuXxHYdZXYK", "role_id": "2", "user_group_id": "2"}	1	2024-04-29 16:20:17	1
28	Edit Pengguna	\N	{"name": "test log 2 - edited 2", "email": "testlog22@gmail.com", "_token": "qWqiMxbh1KanSZ8zWBVS6G8fXgl5yfuXxHYdZXYK", "role_id": "2", "user_group_id": "2"}	1	2024-04-29 16:20:37	1
29	Edit Pengguna	\N	{"name": "test log 2 - edited 2", "email": "testlog22@gmail.com", "_token": "qWqiMxbh1KanSZ8zWBVS6G8fXgl5yfuXxHYdZXYK", "role_id": "2", "user_group_id": "2"}	1	2024-04-29 16:20:59	1
30	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-04-30 09:07:46	1
31	Edit Satuan Kerja	\N	{"id": "2", "email": "bkad@katingankab.go.id", "phone": "088888888888888", "fullname": "Badan Keuangan & Aset Daerah Kabupaten Katingan", "img_main": {}, "nickname": "BKAD"}	{"data": {"id": "2", "data": {"email": "bkad@katingankab.go.id", "phone": "088888888888888", "fullname": "Badan Keuangan & Aset Daerah Kabupaten Katingan", "img_main": "/storage//user-group//user-group-2.png", "nickname": "BKAD"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-04-30 09:40:32	1
32	Login Gagal	ev.attoff@gmail.com	\N	\N	2024-04-30 09:49:37	\N
33	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-04-30 09:54:06	1
34	Login Gagal	ev.attoff@gmail.com	\N	\N	2024-04-30 09:54:13	\N
35	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-04-30 10:09:15	1
36	Login Gagal	ev.attoff@gmail.com	\N	\N	2024-04-30 10:10:45	\N
37	Login Gagal	ev.attoff@gmail.com	\N	\N	2024-04-30 10:12:06	\N
38	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-04-30 10:12:13	1
39	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-04-30 14:13:54	1
40	Login Berhasil	myuser8@mail.com	\N	\N	2024-04-30 15:33:46	8
41	Login Berhasil	myuser8@mail.com	\N	\N	2024-05-02 08:53:34	8
42	Tambah Kelola Berkas	\N	{"title": "Foto PJ Bupati - Syaiful", "keywords": ["bupati", "pj bupati", "bupati katingan", "syaiful"], "file_main": {}, "type_of_file": "media", "file_indexes2": null, "user_group_id": "2", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 54, "title": "Foto PJ Bupati - Syaiful", "file_main": {}, "created_at": "2024-05-02T02:50:20.000000Z", "updated_at": "2024-05-02T02:50:20.000000Z", "type_of_file": "media", "user_group_id": "2", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-02 09:50:20	8
43	Hapus Kelola Berkas	\N	35	{"data": {"20": 1, "21": 1, "22": 1, "35": 1}, "status": true, "message": "Berhasil menghapus data"}	2024-05-02 10:44:22	8
44	Login Berhasil	milka.bkad@katingankab.com	\N	\N	2024-05-02 10:46:43	13
45	Hapus Kelola Berkas	\N	{"data": {"10": "test 5", "11": "test 5", "12": "test 5", "51": "test 12"}}	{"data": {"10": 1, "11": 1, "12": 1, "51": 1}, "status": true, "message": "Berhasil menghapus data"}	2024-05-02 10:49:01	13
46	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-02 13:49:34	1
47	Tambah Kelola Berkas	\N	{"title": "Foto Camat Katingan Hilir", "keywords": ["katingan", "camat", "katingan hilir"], "file_main": {}, "type_of_file": "media", "file_indexes2": null, "user_group_id": "1", "type_of_publicity": "public", "editorial_permission": "public"}	{"data": {"output": {"id": 55, "title": "Foto Camat Katingan Hilir", "file_main": {}, "created_at": "2024-05-02T06:53:00.000000Z", "updated_at": "2024-05-02T06:53:00.000000Z", "type_of_file": "media", "user_group_id": "1", "type_of_publicity": "public", "editorial_permission": "public"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-02 13:53:00	1
48	Edit Kelola Berkas	\N	{"id": "54", "title": "Foto PJ Bupati - Syaiful", "keywords": ["bupati", "bupati katingan", "pj bupati", "syaiful"], "file_main": {}, "type_of_file": "media", "file_indexes2": null, "user_group_id": "2", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"id": "54", "data": {"title": "Foto PJ Bupati - Syaiful", "keywords": "bupati,bupati katingan,pj bupati,syaiful", "file_main": "/storage//file-manager//file-manager-54-file_main.png", "type_of_file": "media", "user_group_id": "2", "type_of_extension": "png", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-02 13:53:38	1
49	Edit Kelola Berkas	\N	{"id": "54", "title": "Foto PJ Bupati - Syaiful", "keywords": ["bupati", "bupati katingan", "pj bupati", "syaiful"], "file_main": {}, "type_of_file": "media", "file_indexes2": null, "user_group_id": "2", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"id": "54", "data": {"title": "Foto PJ Bupati - Syaiful", "keywords": "bupati,bupati katingan,pj bupati,syaiful", "file_main": "/storage//file-manager//file-manager-54-file_main.png", "type_of_file": "media", "user_group_id": "2", "type_of_extension": "png", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-02 13:53:38	1
50	Edit Satuan Kerja	\N	{"id": "2", "email": "bkad@katingankab.go.id", "phone": "088888888888888", "fullname": "Badan Keuangan & Aset Daerah Kabupaten Katingan", "img_main": {}, "nickname": "BKAD"}	{"data": {"id": "2", "data": {"email": "bkad@katingankab.go.id", "phone": "088888888888888", "fullname": "Badan Keuangan & Aset Daerah Kabupaten Katingan", "img_main": "/storage//user-group//user-group-2.png", "nickname": "BKAD"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-02 13:54:09	1
51	Edit Satuan Kerja	\N	{"id": "1", "email": "diskominfostandi@katingankab.go.id", "phone": "123", "fullname": "Dinas Komunikasi Informatika Statistik dan Persandian Kabupaten Katingan", "img_main": {}, "nickname": "DISKOMINFO"}	{"data": {"id": "1", "data": {"email": "diskominfostandi@katingankab.go.id", "phone": "123", "fullname": "Dinas Komunikasi Informatika Statistik dan Persandian Kabupaten Katingan", "img_main": "/storage//user-group//user-group-1.png", "nickname": "DISKOMINFO"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-02 13:54:16	1
52	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-03 10:00:43	1
53	Login Gagal	sdajndskla@gmail.com	\N	\N	2024-05-08 08:20:41	\N
54	Login Gagal	admin@gmail.com	\N	\N	2024-05-08 08:20:51	\N
55	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-08 09:52:17	1
56	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-08 11:08:07	1
57	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-08 12:22:34	1
58	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-08 14:25:18	1
59	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-08 14:28:22	1
60	Tambah Input Dinamis	\N	{"name": "nomor_sertifikat", "label": "Nomor Sertifikat", "is_enabled": "on", "description": null, "is_required": "on", "type_of_file": "sertifikat", "type_of_input": "number"}	{"data": {"output": {"id": 10, "name": "nomor_sertifikat", "label": "Nomor Sertifikat", "created_at": "2024-05-08T07:36:37.000000Z", "is_enabled": "on", "updated_at": "2024-05-08T07:36:37.000000Z", "description": null, "is_required": "on", "type_of_file": "sertifikat", "type_of_input": "number"}}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-08 14:36:37	1
61	Tambah Kelola Berkas	\N	{"title": "logo katingan", "keywords": ["katingan", "logo"], "file_main": {}, "type_of_file": "media", "file_indexes2": null, "user_group_id": "1", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 56, "title": "logo katingan", "file_main": {}, "created_at": "2024-05-08T07:43:23.000000Z", "updated_at": "2024-05-08T07:43:23.000000Z", "type_of_file": "media", "user_group_id": "1", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-08 14:43:23	1
62	Edit Kelola Berkas	\N	{"id": "56", "title": "logo katingan", "keywords": ["katingan", "logo"], "type_of_file": "media", "file_indexes2": null, "user_group_id": "1", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"id": "56", "data": {"title": "logo katingan", "keywords": "katingan,logo", "type_of_file": "media", "user_group_id": "1", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-08 14:43:49	1
63	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-08 14:44:14	1
64	Login Berhasil	milka.bkad@katingankab.com	\N	\N	2024-05-08 14:44:30	13
65	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-08 14:51:07	1
66	Hapus Kelola Berkas	\N	{"data": {"15": "test 5", "16": "test 5", "17": "test 5", "30": "test 6 - EDITED 2", "31": "test 6 - diff data", "36": "test 10", "52": "Test 13 - Edited"}}	{"data": {"15": 1, "16": 1, "17": 1, "30": 1, "31": 1, "36": 1, "52": 1}, "status": true, "message": "Berhasil menghapus data"}	2024-05-08 14:55:31	1
67	Hapus Kelola Berkas	\N	{"data": {"56": "logo katingan"}}	{"data": {"56": 1}, "status": true, "message": "Berhasil menghapus data"}	2024-05-08 14:56:08	1
68	Tambah Peran	\N	{"name": "Data Entry BMD", "is_enabled": "on", "description": "Bidang Pengelola Barang Milik Daerah BKAD", "menu_action": ["1", "3", "4", "5", "7", "8", "2", "9", "25", "32", "33", "34", "35", "36", "31"]}	{"data": {"output": {"id": 14, "name": "Data Entry BMD", "created_at": "2024-05-08T08:05:30.000000Z", "updated_at": "2024-05-08T08:05:30.000000Z", "description": "Bidang Pengelola Barang Milik Daerah BKAD"}, "output_img": 1, "output_permission": {"1": {"id": 171, "role_id": 14, "created_at": "2024-05-08T08:05:30.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:05:30.000000Z", "menu_action_id": "1"}, "2": {"id": 177, "role_id": 14, "created_at": "2024-05-08T08:05:30.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:05:30.000000Z", "menu_action_id": "2"}, "3": {"id": 172, "role_id": 14, "created_at": "2024-05-08T08:05:30.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:05:30.000000Z", "menu_action_id": "3"}, "4": {"id": 173, "role_id": 14, "created_at": "2024-05-08T08:05:30.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:05:30.000000Z", "menu_action_id": "4"}, "5": {"id": 174, "role_id": 14, "created_at": "2024-05-08T08:05:30.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:05:30.000000Z", "menu_action_id": "5"}, "7": {"id": 175, "role_id": 14, "created_at": "2024-05-08T08:05:30.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:05:30.000000Z", "menu_action_id": "7"}, "8": {"id": 176, "role_id": 14, "created_at": "2024-05-08T08:05:30.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:05:30.000000Z", "menu_action_id": "8"}, "9": {"id": 178, "role_id": 14, "created_at": "2024-05-08T08:05:30.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:05:30.000000Z", "menu_action_id": "9"}, "25": {"id": 179, "role_id": 14, "created_at": "2024-05-08T08:05:30.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:05:30.000000Z", "menu_action_id": "25"}, "31": {"id": 185, "role_id": 14, "created_at": "2024-05-08T08:05:30.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:05:30.000000Z", "menu_action_id": "31"}, "32": {"id": 180, "role_id": 14, "created_at": "2024-05-08T08:05:30.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:05:30.000000Z", "menu_action_id": "32"}, "33": {"id": 181, "role_id": 14, "created_at": "2024-05-08T08:05:30.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:05:30.000000Z", "menu_action_id": "33"}, "34": {"id": 182, "role_id": 14, "created_at": "2024-05-08T08:05:30.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:05:30.000000Z", "menu_action_id": "34"}, "35": {"id": 183, "role_id": 14, "created_at": "2024-05-08T08:05:30.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:05:30.000000Z", "menu_action_id": "35"}, "36": {"id": 184, "role_id": 14, "created_at": "2024-05-08T08:05:30.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:05:30.000000Z", "menu_action_id": "36"}}}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-08 15:05:30	1
69	Tambah Pengguna	\N	{"name": "Silvina Apriyati", "email": "apriyatisilvina@gmail.com", "_token": "ineDgWPld6d3BKgesY5ARNifzcz9ZWww2CKcRM2n", "role_id": "14", "user_group_id": "2"}	{"id": 19, "name": "Silvina Apriyati", "email": "apriyatisilvina@gmail.com", "role_id": "14", "created_at": "2024-05-08T08:06:24.000000Z", "updated_at": "2024-05-08T08:06:24.000000Z", "user_group_id": "2"}	2024-05-08 15:06:24	1
70	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-05-08 15:06:33	19
71	Login Gagal	superuser@mail.com	\N	\N	2024-05-08 15:10:04	\N
72	Login Gagal	superuser@mail.com	\N	\N	2024-05-08 15:10:08	\N
73	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-08 15:10:15	1
74	Tambah Peran	\N	{"name": "Kepala Bidang PBMD", "is_enabled": "on", "description": null, "menu_action": ["1", "3", "4", "5", "6", "7", "8", "2", "9", "13", "19", "26", "27", "28", "29", "30", "25", "32", "33", "34", "35", "36", "31"]}	{"data": {"output": {"id": 15, "name": "Kepala Bidang PBMD", "created_at": "2024-05-08T08:11:19.000000Z", "updated_at": "2024-05-08T08:11:19.000000Z", "description": null}, "output_img": 1, "output_permission": {"1": {"id": 186, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "1"}, "2": {"id": 193, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "2"}, "3": {"id": 187, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "3"}, "4": {"id": 188, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "4"}, "5": {"id": 189, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "5"}, "6": {"id": 190, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "6"}, "7": {"id": 191, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "7"}, "8": {"id": 192, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "8"}, "9": {"id": 194, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "9"}, "13": {"id": 195, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "13"}, "19": {"id": 196, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "19"}, "25": {"id": 202, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "25"}, "26": {"id": 197, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "26"}, "27": {"id": 198, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "27"}, "28": {"id": 199, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "28"}, "29": {"id": 200, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "29"}, "30": {"id": 201, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "30"}, "31": {"id": 208, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "31"}, "32": {"id": 203, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "32"}, "33": {"id": 204, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "33"}, "34": {"id": 205, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "34"}, "35": {"id": 206, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "35"}, "36": {"id": 207, "role_id": 15, "created_at": "2024-05-08T08:11:19.000000Z", "is_enabled": true, "updated_at": "2024-05-08T08:11:19.000000Z", "menu_action_id": "36"}}}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-08 15:11:19	1
75	Edit Peran	\N	{"id": "14", "name": "Data Entry PBMD", "is_enabled": "on", "description": "Bidang Pengelola Barang Milik Daerah BKAD", "menu_action": ["1", "3", "4", "5", "7", "8", "2", "9", "25", "32", "33", "34", "35", "36", "31"]}	{"data": {"id": "14", "data": {"name": "Data Entry PBMD", "is_enabled": "on", "description": "Bidang Pengelola Barang Milik Daerah BKAD"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-08 15:11:30	1
76	Tambah Pengguna	\N	{"name": "Kepala Bidang PBMD", "email": "bidpbmd@katingankab.go.id", "_token": "cch2vSwIBLu8dSOVrODdEA7FI5uuKOGaxYfqgkce", "role_id": "15", "user_group_id": "2"}	{"id": 20, "name": "Kepala Bidang PBMD", "email": "bidpbmd@katingankab.go.id", "role_id": "15", "created_at": "2024-05-08T08:12:16.000000Z", "updated_at": "2024-05-08T08:12:16.000000Z", "user_group_id": "2"}	2024-05-08 15:12:16	1
77	Edit Input Dinamis	\N	{"id": "2", "label": "Lampiran", "behavior": ["mime-doc", "mime-img"], "is_enabled": "on", "description": null, "type_of_file": "surat", "type_of_input": "file"}	{"data": {"id": "2", "data": {"label": "Lampiran", "behavior": "mime-doc,mime-img", "is_enabled": "on", "description": null, "type_of_file": "surat", "type_of_input": "file"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-08 15:14:26	1
78	Edit Input Dinamis	\N	{"id": "2", "label": "Lampiran", "behavior": ["mime-doc", "mime-img"], "is_enabled": "on", "description": null, "type_of_file": "surat", "type_of_input": "file"}	{"data": {"id": "2", "data": {"label": "Lampiran", "behavior": "mime-doc,mime-img", "is_enabled": "on", "description": null, "type_of_file": "surat", "type_of_input": "file"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-08 15:14:53	1
79	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-14 08:46:02	1
80	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-14 09:08:46	1
81	Edit Kelola Berkas	\N	{"id": "56", "title": "Logo Katingan", "keywords": ["katingan", "logo", "kabupaten"], "type_of_file": "media", "file_indexes2": null, "user_group_id": "1", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"id": "56", "data": {"title": "Logo Katingan", "keywords": "katingan,logo,kabupaten", "updated_by": 1, "type_of_file": "media", "user_group_id": "1", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-14 09:10:05	1
82	Tambah Kelola Berkas	\N	{"title": "berkas test", "file_main": {}, "type_of_file": "media", "file_indexes2": null, "user_group_id": "1", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 60, "title": "berkas test", "file_main": {}, "created_at": "2024-05-14T02:14:31.000000Z", "updated_at": "2024-05-14T02:14:31.000000Z", "type_of_file": "media", "user_group_id": "1", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-14 09:14:32	1
83	Edit Kelola Berkas	\N	{"id": "60", "title": "berkas test - edited", "type_of_file": "media", "file_indexes2": null, "user_group_id": "1", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"id": "60", "data": {"title": "berkas test - edited", "updated_by": 1, "type_of_file": "media", "user_group_id": "1", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-14 09:15:07	1
84	Hapus Kelola Berkas	\N	{"data": {"60": "berkas test - edited"}}	{"data": {"60": 1}, "status": true, "message": "Berhasil menghapus data"}	2024-05-14 09:15:59	1
85	Hapus Kelola Berkas	\N	{"data": {"60": "berkas test - edited"}}	{"data": {"60": true}, "status": true, "message": "Berhasil menghapus data"}	2024-05-14 09:18:19	1
86	Hapus Kelola Berkas	\N	{"data": {"60": "berkas test - edited"}}	{"data": {"60": 1}, "status": true, "message": "Berhasil menghapus data"}	2024-05-14 09:22:02	1
87	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-05-15 07:46:54	19
88	Tambah Kelola Berkas	\N	{"title": "Naskah Perjanjian Masjid Fitriah Tumbang Sanamang", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 61, "title": "Naskah Perjanjian Masjid Fitriah Tumbang Sanamang", "file_main": {}, "created_at": "2024-05-15T00:51:41.000000Z", "updated_at": "2024-05-15T00:51:41.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-15 07:51:41	19
89	Edit Kelola Berkas	\N	{"id": "61", "title": "Naskah Perjanjian Masjid Fitriah Tumbang Sanamang", "keywords": ["katingan"], "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"id": "61", "data": {"title": "Naskah Perjanjian Masjid Fitriah Tumbang Sanamang", "keywords": "katingan", "updated_by": 19, "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-15 07:52:41	19
90	Edit Kelola Berkas	\N	{"id": "61", "title": "Naskah Perjanjian Masjid Fitriah Tumbang Sanamang \\r\\n(BAST PINJAM PAKAI)", "keywords": ["katingan"], "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"id": "61", "data": {"title": "Naskah Perjanjian Masjid Fitriah Tumbang Sanamang \\r\\n(BAST PINJAM PAKAI)", "keywords": "katingan", "updated_by": 19, "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-15 07:56:00	19
91	Edit Kelola Berkas	\N	{"id": "61", "title": "Naskah Perjanjian Masjid Fitriah Tumbang Sanamang \\r\\n(BAST PINJAM PAKAI AMBULANCE)", "keywords": ["katingan"], "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"id": "61", "data": {"title": "Naskah Perjanjian Masjid Fitriah Tumbang Sanamang \\r\\n(BAST PINJAM PAKAI AMBULANCE)", "keywords": "katingan", "updated_by": 19, "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-15 07:57:17	19
92	Tambah Kelola Berkas	\N	{"title": "PEMINJAMAN BPKB KH 5922 NY", "keywords": ["katingan"], "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "050/243/Bappedalitbang-Um/2024"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 62, "title": "PEMINJAMAN BPKB KH 5922 NY", "file_main": {}, "created_at": "2024-05-15T01:01:48.000000Z", "updated_at": "2024-05-15T01:01:48.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-15 08:01:48	19
93	Edit Kelola Berkas	\N	{"id": "61", "title": "Naskah Perjanjian Masjid Fitriah Tumbang Sanamang \\r\\n(BAST PINJAM PAKAI AMBULANCE)", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"id": "61", "data": {"title": "Naskah Perjanjian Masjid Fitriah Tumbang Sanamang \\r\\n(BAST PINJAM PAKAI AMBULANCE)", "keywords": "katingan", "file_main": "/storage//file-manager//file-manager-61-file_main.pdf", "updated_by": 19, "type_of_file": "bast", "user_group_id": "3", "type_of_extension": "pdf", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-15 08:08:34	19
111	Tambah Kelola Berkas	\N	{"title": "BAST AC KEJAKSAAN", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 65, "title": "BAST AC KEJAKSAAN", "file_main": {}, "created_at": "2024-05-20T00:59:59.000000Z", "updated_at": "2024-05-20T00:59:59.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-20 07:59:59	19
94	Edit Kelola Berkas	\N	{"id": "62", "title": "PEMINJAMAN BPKB KH 5922 NY", "keywords": ["katingan"], "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"lampiran": {}, "nomor_surat": "050/243/Bappedalitbang-Um/2024"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"id": "62", "data": {"title": "PEMINJAMAN BPKB KH 5922 NY", "keywords": "katingan", "file_main": "/storage//file-manager//file-manager-62-file_main.pdf", "updated_by": 19, "type_of_file": "surat", "user_group_id": "3", "dynamic_inputs": "{\\"nomor_surat\\":\\"050\\\\/243\\\\/Bappedalitbang-Um\\\\/2024\\",\\"lampiran\\":\\"\\\\/storage\\\\/\\\\/file-manager\\\\/\\\\/file-manager-62-dynamic_inputs.lampiran.pdf\\"}", "type_of_extension": "pdf", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-15 08:19:20	19
95	Tambah Kelola Berkas	\N	{"title": "usulan komponen harga 2024 (DLH)", "keywords": ["katingan"], "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"lampiran": {}, "nomor_surat": "660.0.2/386/DLH-PROG/IV/2024"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 63, "title": "usulan komponen harga 2024 (DLH)", "file_main": {}, "created_at": "2024-05-15T01:26:58.000000Z", "updated_at": "2024-05-15T01:26:58.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-15 08:26:58	19
96	Tambah Kelola Berkas	\N	{"title": "SERTIFIKAT RUMAH MARTINA HERMIN", "keywords": ["kabupaten", "katingan hilir"], "file_main": {}, "type_of_file": "sertifikat", "file_indexes2": null, "user_group_id": "3", "dynamic_inputs": {"nomor_sertifikat": "123456789"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 64, "title": "SERTIFIKAT RUMAH MARTINA HERMIN", "file_main": {}, "created_at": "2024-05-15T01:29:21.000000Z", "updated_at": "2024-05-15T01:29:21.000000Z", "type_of_file": "sertifikat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-15 08:29:21	19
97	Edit Input Dinamis	\N	{"id": "10", "label": "Nomor Sertifikat", "is_enabled": "on", "description": null, "is_required": "on", "type_of_file": "sertifikat", "type_of_input": "text"}	{"data": {"id": "10", "data": {"label": "Nomor Sertifikat", "is_enabled": "on", "updated_by": 19, "description": null, "is_required": "on", "type_of_file": "sertifikat", "type_of_input": "text"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-15 08:31:48	19
98	Edit Kelola Berkas	\N	{"id": "64", "title": "SERTIFIKAT RUMAH MARTINA HERMIN", "keywords": ["kabupaten", "katingan hilir"], "type_of_file": "sertifikat", "file_indexes2": null, "user_group_id": "3", "dynamic_inputs": {"nomor_sertifikat": "15.10.04.04.4.0000abc"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"id": "64", "data": {"title": "SERTIFIKAT RUMAH MARTINA HERMIN", "keywords": "kabupaten,katingan hilir", "updated_by": 19, "type_of_file": "sertifikat", "user_group_id": "3", "dynamic_inputs": "{\\"nomor_sertifikat\\":\\"15.10.04.04.4.0000abc\\"}", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-15 08:33:08	19
99	Edit Kelola Berkas	\N	{"id": "64", "title": "SERTIFIKAT RUMAH MARTINA HERMIN", "keywords": ["kabupaten", "katingan hilir"], "file_main": {}, "type_of_file": "sertifikat", "file_indexes2": null, "user_group_id": "3", "dynamic_inputs": {"nomor_sertifikat": "15.10.04.04.4.0000abc"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"id": "64", "data": {"title": "SERTIFIKAT RUMAH MARTINA HERMIN", "keywords": "kabupaten,katingan hilir", "file_main": "/storage//file-manager//file-manager-64-file_main.pdf", "updated_by": 19, "type_of_file": "sertifikat", "user_group_id": "3", "dynamic_inputs": "{\\"nomor_sertifikat\\":\\"15.10.04.04.4.0000abc\\"}", "type_of_extension": "pdf", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-15 08:40:59	19
100	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-15 11:03:06	1
101	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-05-15 11:04:20	19
102	Edit Input Dinamis	\N	{"id": "10", "label": "Nomor Sertifikat", "behavior": ["class-nospace"], "is_enabled": "on", "description": null, "is_required": "on", "type_of_file": "sertifikat", "type_of_input": "text"}	{"data": {"id": "10", "data": {"label": "Nomor Sertifikat", "behavior": "class-nospace", "is_enabled": "on", "updated_by": 19, "description": null, "is_required": "on", "type_of_file": "sertifikat", "type_of_input": "text"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-15 11:14:29	19
103	Login Berhasil	bidpbmd@katingankab.go.id	\N	\N	2024-05-16 10:09:44	20
104	Edit Kelola Berkas	\N	{"id": "64", "title": "SERTIFIKAT RUMAH MARTINA HERMIN", "keywords": ["kabupaten", "katingan hilir"], "file_main": {}, "type_of_file": "sertifikat", "file_indexes2": null, "user_group_id": "3", "dynamic_inputs": {"nomor_sertifikat": "15.10.04.04.4.0000abc"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"id": "64", "data": {"title": "SERTIFIKAT RUMAH MARTINA HERMIN", "keywords": "kabupaten,katingan hilir", "file_main": "/storage//file-manager//file-manager-64-file_main.pdf", "updated_by": 20, "type_of_file": "sertifikat", "user_group_id": "3", "dynamic_inputs": "{\\"nomor_sertifikat\\":\\"15.10.04.04.4.0000abc\\"}", "type_of_extension": "pdf", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-05-16 10:12:33	20
105	Edit Pengguna	\N	{"name": "Kepala Bidang PBMD", "email": "bidpbmd@katingankab.go.id", "_token": "WR0YwuG6riXrHQIMfZUrHvuhpfVUu5NJK1fEDvUP", "role_id": "15", "user_group_id": "3"}	1	2024-05-16 10:15:53	20
106	Login Gagal	bidpbmd@katingankab.go.id	\N	\N	2024-05-16 10:16:26	\N
107	Login Gagal	bidpbmd@katingankab.go.id	\N	\N	2024-05-16 10:18:14	\N
108	Login Berhasil	bidpbmd@katingankab.go.id	\N	\N	2024-05-16 10:18:36	20
109	Login Berhasil	bidpbmd@katingankab.go.id	\N	\N	2024-05-16 10:28:51	20
110	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-05-20 07:56:13	19
196	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-07-08 10:14:10	19
112	Tambah Kelola Berkas	\N	{"title": "BAST SEMENTARA POLRES KATINGAN KH 1107 NU", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 66, "title": "BAST SEMENTARA POLRES KATINGAN KH 1107 NU", "file_main": {}, "created_at": "2024-05-20T01:02:02.000000Z", "updated_at": "2024-05-20T01:02:02.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-20 08:02:02	19
113	Tambah Kelola Berkas	\N	{"title": "BAST SEMENTARA MASJID FITRIAH TUMBANG SANAMANG", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 67, "title": "BAST SEMENTARA MASJID FITRIAH TUMBANG SANAMANG", "file_main": {}, "created_at": "2024-05-20T01:04:19.000000Z", "updated_at": "2024-05-20T01:04:19.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-20 08:04:19	19
114	Tambah Kelola Berkas	\N	{"title": "BAST PINJAM PAKAI APV KH 9059 NU MASJID AL IMAM TEWANG BARINGIN", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 68, "title": "BAST PINJAM PAKAI APV KH 9059 NU MASJID AL IMAM TEWANG BARINGIN", "file_main": {}, "created_at": "2024-05-20T01:06:58.000000Z", "updated_at": "2024-05-20T01:06:58.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-20 08:06:58	19
115	Tambah Kelola Berkas	\N	{"title": "BAST SEMENTARA AL-GHOFRONT DEPAG", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 69, "title": "BAST SEMENTARA AL-GHOFRONT DEPAG", "file_main": {}, "created_at": "2024-05-20T01:08:52.000000Z", "updated_at": "2024-05-20T01:08:52.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-20 08:08:52	19
116	Tambah Kelola Berkas	\N	{"title": "BAST SEMENTARA AVANZA ADVENTUS PERKIM", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 70, "title": "BAST SEMENTARA AVANZA ADVENTUS PERKIM", "file_main": {}, "created_at": "2024-05-20T01:10:22.000000Z", "updated_at": "2024-05-20T01:10:22.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-20 08:10:22	19
117	Hapus Kelola Berkas	\N	{"data": {"61": "Naskah Perjanjian Masjid Fitriah Tumbang Sanamang \\n(BAST PINJAM PAKAI AMBULANCE)"}}	{"data": {"61": 1}, "status": true, "message": "Berhasil menghapus data"}	2024-05-20 08:19:25	19
118	Hapus Kelola Berkas	\N	{"data": {"63": "usulan komponen harga 2024 (DLH)"}}	{"data": {"63": 1}, "status": true, "message": "Berhasil menghapus data"}	2024-05-20 08:19:49	19
119	Hapus Kelola Berkas	\N	{"data": {"64": "SERTIFIKAT RUMAH MARTINA HERMIN"}}	{"data": {"64": 1}, "status": true, "message": "Berhasil menghapus data"}	2024-05-20 08:20:05	19
120	Tambah Kelola Berkas	\N	{"title": "BAST SEMENTARA DISDIK INOVA ZENIX KH 1210 NU", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 71, "title": "BAST SEMENTARA DISDIK INOVA ZENIX KH 1210 NU", "file_main": {}, "created_at": "2024-05-20T01:21:29.000000Z", "updated_at": "2024-05-20T01:21:29.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-20 08:21:29	19
121	Tambah Kelola Berkas	\N	{"title": "BAST SEMENTARA MUHAMMADDIYAH KATINGAN 2024", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 72, "title": "BAST SEMENTARA MUHAMMADDIYAH KATINGAN 2024", "file_main": {}, "created_at": "2024-05-20T01:23:39.000000Z", "updated_at": "2024-05-20T01:23:39.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-20 08:23:39	19
122	Tambah Kelola Berkas	\N	{"title": "BAST SEMENTARA RUSH BAPELITBANG 2024", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 73, "title": "BAST SEMENTARA RUSH BAPELITBANG 2024", "file_main": {}, "created_at": "2024-05-20T01:26:49.000000Z", "updated_at": "2024-05-20T01:26:49.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-20 08:26:49	19
123	Tambah Kelola Berkas	\N	{"title": "BAST SEMENTARA RUSH MARKUS 20214", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 74, "title": "BAST SEMENTARA RUSH MARKUS 20214", "file_main": {}, "created_at": "2024-05-20T01:29:52.000000Z", "updated_at": "2024-05-20T01:29:52.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-20 08:29:52	19
124	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-05-20 11:03:34	19
197	Login Gagal	1or=or@gmail.com	\N	\N	2024-07-20 13:45:03	\N
125	Tambah Kelola Berkas	\N	{"title": "BAST SEMENTARA TRITON DINAS PERIKANAN DAN PERHUBUNGAN", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 75, "title": "BAST SEMENTARA TRITON DINAS PERIKANAN DAN PERHUBUNGAN", "file_main": {}, "created_at": "2024-05-20T04:06:22.000000Z", "updated_at": "2024-05-20T04:06:22.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-20 11:06:22	19
126	Tambah Kelola Berkas	\N	{"title": "BAST VARIO DONY MERIANTO MERAH", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 76, "title": "BAST VARIO DONY MERIANTO MERAH", "file_main": {}, "created_at": "2024-05-20T04:08:07.000000Z", "updated_at": "2024-05-20T04:08:07.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-20 11:08:07	19
127	Tambah Kelola Berkas	\N	{"title": "KUMPULAN STNK", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 77, "title": "KUMPULAN STNK", "file_main": {}, "created_at": "2024-05-20T04:08:57.000000Z", "updated_at": "2024-05-20T04:08:57.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-20 11:08:58	19
128	Tambah Kelola Berkas	\N	{"title": "PENGALIHAN STATUS SPEEDBOD KEC.MANDAWAI", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 78, "title": "PENGALIHAN STATUS SPEEDBOD KEC.MANDAWAI", "file_main": {}, "created_at": "2024-05-20T04:10:36.000000Z", "updated_at": "2024-05-20T04:10:36.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-20 11:10:36	19
129	Tambah Kelola Berkas	\N	{"title": "PINJAM PAKAI AMBULANCE MESJID JAMI ALGHUFRONT 2024", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 79, "title": "PINJAM PAKAI AMBULANCE MESJID JAMI ALGHUFRONT 2024", "file_main": {}, "created_at": "2024-05-20T04:13:36.000000Z", "updated_at": "2024-05-20T04:13:36.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-20 11:13:36	19
130	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-05-20 15:08:20	19
131	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-05-22 14:26:35	19
132	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-22 14:29:29	1
133	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-05-22 15:00:18	19
134	Tambah Kelola Berkas	\N	{"title": "PENGALIHAN STATUS SPEEDBOD Kec.MANDAWAI", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 80, "title": "PENGALIHAN STATUS SPEEDBOD Kec.MANDAWAI", "file_main": {}, "created_at": "2024-05-22T08:05:10.000000Z", "updated_at": "2024-05-22T08:05:10.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-22 15:05:10	19
135	Tambah Kelola Berkas	\N	{"title": "PERMOHONAN HIBAH MOBIL KEJAKSAAN", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 81, "title": "PERMOHONAN HIBAH MOBIL KEJAKSAAN", "file_main": {}, "created_at": "2024-05-22T08:06:15.000000Z", "updated_at": "2024-05-22T08:06:15.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-22 15:06:15	19
136	Tambah Kelola Berkas	\N	{"title": "PINJAM PAKAI AMBULANCE MESJID JAMI ALGHUFRONT", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 82, "title": "PINJAM PAKAI AMBULANCE MESJID JAMI ALGHUFRONT", "file_main": {}, "created_at": "2024-05-22T08:07:25.000000Z", "updated_at": "2024-05-22T08:07:25.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-22 15:07:25	19
137	Tambah Kelola Berkas	\N	{"title": "PINJAM PAKAI MOBIL KH 1056 NU", "keywords": ["katingan"], "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 83, "title": "PINJAM PAKAI MOBIL KH 1056 NU", "file_main": {}, "created_at": "2024-05-22T08:08:13.000000Z", "updated_at": "2024-05-22T08:08:13.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-22 15:08:13	19
138	Tambah Kelola Berkas	\N	{"title": "SK PEJABAT PENGELOLA BARANG MILIK DAERAH KAB KATINGAN ( BARU)", "keywords": ["katingan"], "file_main": {}, "type_of_file": "sk", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 84, "title": "SK PEJABAT PENGELOLA BARANG MILIK DAERAH KAB KATINGAN ( BARU)", "file_main": {}, "created_at": "2024-05-22T08:10:30.000000Z", "updated_at": "2024-05-22T08:10:30.000000Z", "type_of_file": "sk", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-22 15:10:30	19
198	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-07-22 11:49:38	19
139	Tambah Kelola Berkas	\N	{"title": "SK PENETAPAN BARU TANAH DI BAWAH Kec.KATINGAN HILIR,Kec.TWS GARING,KEC.PULAU MALAN,KEC.KATINGAN TENGAH, KEC.SANAMAN MANTIKEI, KEC.KATINGAN KUALA PADA DINAS PUPR TAHUN 2024", "keywords": ["katingan"], "file_main": {}, "type_of_file": "sk", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 85, "title": "SK PENETAPAN BARU TANAH DI BAWAH Kec.KATINGAN HILIR,Kec.TWS GARING,KEC.PULAU MALAN,KEC.KATINGAN TENGAH, KEC.SANAMAN MANTIKEI, KEC.KATINGAN KUALA PADA DINAS PUPR TAHUN 2024", "file_main": {}, "created_at": "2024-05-22T08:24:45.000000Z", "updated_at": "2024-05-22T08:24:45.000000Z", "type_of_file": "sk", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-22 15:24:45	19
140	Tambah Kelola Berkas	\N	{"title": "SK PENETAPAN BARU TANAH PADA DINAS PENDIDIKAN KAB.KATINGAN TAHUN 2024", "keywords": ["katingan"], "file_main": {}, "type_of_file": "sk", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 86, "title": "SK PENETAPAN BARU TANAH PADA DINAS PENDIDIKAN KAB.KATINGAN TAHUN 2024", "file_main": {}, "created_at": "2024-05-22T08:26:15.000000Z", "updated_at": "2024-05-22T08:26:15.000000Z", "type_of_file": "sk", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-22 15:26:15	19
141	Tambah Kelola Berkas	\N	{"title": "SK PENETAPAN BARU Kec.KATINGAN HILIR ,KEC.TWS GARING, KEC. PULAU MALAN, KEC. KATINGAN TENGAH, KEC. SANAMAN MANTIKEI DAN KATINGAN KUALA pada DINAS PUPR", "keywords": ["katingan"], "file_main": {}, "type_of_file": "sk", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 87, "title": "SK PENETAPAN BARU Kec.KATINGAN HILIR ,KEC.TWS GARING, KEC. PULAU MALAN, KEC. KATINGAN TENGAH, KEC. SANAMAN MANTIKEI DAN KATINGAN KUALA pada DINAS PUPR", "file_main": {}, "created_at": "2024-05-22T08:32:02.000000Z", "updated_at": "2024-05-22T08:32:02.000000Z", "type_of_file": "sk", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-22 15:32:02	19
142	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-05-22 15:47:07	19
143	Tambah Kelola Berkas	\N	{"title": "SK PEJABAT PENGELOLA BARANG LAMA TAHUN 2024", "keywords": ["katingan"], "file_main": {}, "type_of_file": "sk", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 88, "title": "SK PEJABAT PENGELOLA BARANG LAMA TAHUN 2024", "file_main": {}, "created_at": "2024-05-22T08:50:08.000000Z", "updated_at": "2024-05-22T08:50:08.000000Z", "type_of_file": "sk", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-05-22 15:50:08	19
144	Login Gagal	admin@gmail.com	\N	\N	2024-05-29 09:05:00	\N
145	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-05-29 09:07:21	19
146	Login Gagal	helga@gmail.com	\N	\N	2024-05-29 09:10:21	\N
147	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-29 09:10:25	1
148	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-29 09:33:34	1
149	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-05-29 14:45:41	1
150	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-06-04 07:47:45	19
151	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-06-06 08:18:40	19
152	Hapus Kelola Berkas	\N	{"data": {"87": "SK PENETAPAN BARU Kec.KATINGAN HILIR ,KEC.TWS GARING, KEC. PULAU MALAN, KEC. KATINGAN TENGAH, KEC. SANAMAN MANTIKEI DAN KATINGAN KUALA pada DINAS PUPR", "88": "SK PEJABAT PENGELOLA BARANG LAMA TAHUN 2024"}}	{"data": {"87": 1, "88": 1}, "status": true, "message": "Berhasil menghapus data"}	2024-06-06 08:19:38	19
153	Hapus Kelola Berkas	\N	{"data": {"62": "PEMINJAMAN BPKB KH 5922 NY", "65": "BAST AC KEJAKSAAN", "66": "BAST SEMENTARA POLRES KATINGAN KH 1107 NU", "67": "BAST SEMENTARA MASJID FITRIAH TUMBANG SANAMANG", "68": "BAST PINJAM PAKAI APV KH 9059 NU MASJID AL IMAM TEWANG BARINGIN", "69": "BAST SEMENTARA AL-GHOFRONT DEPAG", "70": "BAST SEMENTARA AVANZA ADVENTUS PERKIM", "71": "BAST SEMENTARA DISDIK INOVA ZENIX KH 1210 NU"}}	{"data": {"62": 1, "65": 1, "66": 1, "67": 1, "68": 1, "69": 1, "70": 1, "71": 1}, "status": true, "message": "Berhasil menghapus data"}	2024-06-06 08:20:26	19
154	Hapus Kelola Berkas	\N	{"data": {"72": "BAST SEMENTARA MUHAMMADDIYAH KATINGAN 2024", "73": "BAST SEMENTARA RUSH BAPELITBANG 2024", "74": "BAST SEMENTARA RUSH MARKUS 20214", "75": "BAST SEMENTARA TRITON DINAS PERIKANAN DAN PERHUBUNGAN", "76": "BAST VARIO DONY MERIANTO MERAH", "77": "KUMPULAN STNK", "78": "PENGALIHAN STATUS SPEEDBOD KEC.MANDAWAI", "79": "PINJAM PAKAI AMBULANCE MESJID JAMI ALGHUFRONT 2024", "80": "PENGALIHAN STATUS SPEEDBOD Kec.MANDAWAI", "81": "PERMOHONAN HIBAH MOBIL KEJAKSAAN", "82": "PINJAM PAKAI AMBULANCE MESJID JAMI ALGHUFRONT", "83": "PINJAM PAKAI MOBIL KH 1056 NU", "84": "SK PEJABAT PENGELOLA BARANG MILIK DAERAH KAB KATINGAN ( BARU)", "85": "SK PENETAPAN BARU TANAH DI BAWAH Kec.KATINGAN HILIR,Kec.TWS GARING,KEC.PULAU MALAN,KEC.KATINGAN TENGAH, KEC.SANAMAN MANTIKEI, KEC.KATINGAN KUALA PADA DINAS PUPR TAHUN 2024", "86": "SK PENETAPAN BARU TANAH PADA DINAS PENDIDIKAN KAB.KATINGAN TAHUN 2024"}}	{"data": {"72": 1, "73": 1, "74": 1, "75": 1, "76": 1, "77": 1, "78": 1, "79": 1, "80": 1, "81": 1, "82": 1, "83": 1, "84": 1, "85": 1, "86": 1}, "status": true, "message": "Berhasil menghapus data"}	2024-06-06 08:21:04	19
155	Tambah Kelola Berkas	\N	{"title": "BAST AC (KEJAKSAN)", "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 89, "title": "BAST AC (KEJAKSAN)", "file_main": {}, "created_at": "2024-06-06T01:24:46.000000Z", "updated_at": "2024-06-06T01:24:46.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 08:24:46	19
156	Tambah Kelola Berkas	\N	{"title": "BAST POLRES KH 1107 NU", "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 90, "title": "BAST POLRES KH 1107 NU", "file_main": {}, "created_at": "2024-06-06T01:26:34.000000Z", "updated_at": "2024-06-06T01:26:34.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 08:26:34	19
157	Tambah Kelola Berkas	\N	{"title": "BAST SEMENTARA  MASJID JAMI AL-GHUPRONT KEC.KATINGAN HULU", "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 91, "title": "BAST SEMENTARA  MASJID JAMI AL-GHUPRONT KEC.KATINGAN HULU", "file_main": {}, "created_at": "2024-06-06T01:28:49.000000Z", "updated_at": "2024-06-06T01:28:49.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 08:28:49	19
158	Tambah Kelola Berkas	\N	{"title": "KODIM ( HIBAH TANAH ) 459/B /32/III/2024", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "B/32/III/2024"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 92, "title": "KODIM ( HIBAH TANAH ) 459/B /32/III/2024", "file_main": {}, "created_at": "2024-06-06T01:37:00.000000Z", "updated_at": "2024-06-06T01:37:00.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 08:37:00	19
159	Hapus Kelola Berkas	\N	{"data": {"92": "KODIM ( HIBAH TANAH ) 459/B /32/III/2024"}}	{"data": {"92": 1}, "status": true, "message": "Berhasil menghapus data"}	2024-06-06 08:39:53	19
160	Tambah Kelola Berkas	\N	{"title": "KODIM HIBAH TANAH", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "B/32/III/2024"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 93, "title": "KODIM HIBAH TANAH", "file_main": {}, "created_at": "2024-06-06T01:40:59.000000Z", "updated_at": "2024-06-06T01:40:59.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 08:40:59	19
161	Edit Kelola Berkas	\N	{"id": "93", "title": "B/32/III/2024", "type_of_file": "surat", "file_indexes2": null, "user_group_id": "3", "dynamic_inputs": {"lampiran": "undefined", "nomor_surat": "B/32/III/2024"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"id": "93", "data": {"title": "B/32/III/2024", "updated_by": 19, "type_of_file": "surat", "user_group_id": "3", "dynamic_inputs": "{\\"nomor_surat\\":\\"B\\\\/32\\\\/III\\\\/2024\\",\\"lampiran\\":\\"undefined\\"}", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-06-06 08:42:22	19
162	Edit Kelola Berkas	\N	{"id": "93", "title": "KODIM HIBAH TANAH (B/32/III/2024)", "type_of_file": "surat", "file_indexes2": null, "user_group_id": "3", "dynamic_inputs": {"lampiran": "undefined", "nomor_surat": "B/32/III/2024"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"id": "93", "data": {"title": "KODIM HIBAH TANAH (B/32/III/2024)", "updated_by": 19, "type_of_file": "surat", "user_group_id": "3", "dynamic_inputs": "{\\"nomor_surat\\":\\"B\\\\/32\\\\/III\\\\/2024\\",\\"lampiran\\":\\"undefined\\"}", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-06-06 08:42:55	19
163	Tambah Kelola Berkas	\N	{"title": "KEMENTRIAN AGAMA KAB KATINGAN (B-35/KK.15.13/1/KS.00/04/2024)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "B-35/KK.15.13/1/KS.00/04/2024"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 94, "title": "KEMENTRIAN AGAMA KAB KATINGAN (B-35/KK.15.13/1/KS.00/04/2024)", "file_main": {}, "created_at": "2024-06-06T01:45:48.000000Z", "updated_at": "2024-06-06T01:45:48.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 08:45:48	19
164	Tambah Kelola Berkas	\N	{"title": "PERPANJANGAN PINJAM PAKAI POLRES (B/435/III/LOG.2.2/2024)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "(B/435/III/LOG.2.2/2024)"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 95, "title": "PERPANJANGAN PINJAM PAKAI POLRES (B/435/III/LOG.2.2/2024)", "file_main": {}, "created_at": "2024-06-06T01:52:46.000000Z", "updated_at": "2024-06-06T01:52:46.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 08:52:46	19
165	Tambah Kelola Berkas	\N	{"title": "DINKES PERMOHONAN PEMINJAMAN SERTIFIKAT TANAH (440/2342/SKT-1/IV-2024)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "(440/2342/SKT-1/IV-2024)"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 96, "title": "DINKES PERMOHONAN PEMINJAMAN SERTIFIKAT TANAH (440/2342/SKT-1/IV-2024)", "file_main": {}, "created_at": "2024-06-06T02:00:14.000000Z", "updated_at": "2024-06-06T02:00:14.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 09:00:14	19
166	Tambah Kelola Berkas	\N	{"title": "BPBD PENYAMPAIAN RENCANA KEBUTUHAN (360/205/IV/BPBD/2024)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "(360/205/IV/BPBD/2024)"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 97, "title": "BPBD PENYAMPAIAN RENCANA KEBUTUHAN (360/205/IV/BPBD/2024)", "file_main": {}, "created_at": "2024-06-06T02:04:20.000000Z", "updated_at": "2024-06-06T02:04:20.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 09:04:20	19
199	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-07-22 14:53:40	19
167	Tambah Kelola Berkas	\N	{"title": "SURAT KELUAR BALASAN U/ KEMENAG  (HIBAH MOBIL DINAS KH 1156 NU)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "-"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 98, "title": "SURAT KELUAR BALASAN U/ KEMENAG  (HIBAH MOBIL DINAS KH 1156 NU)", "file_main": {}, "created_at": "2024-06-06T02:28:44.000000Z", "updated_at": "2024-06-06T02:28:44.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 09:28:44	19
168	Tambah Kelola Berkas	\N	{"title": "SETWAN USULAN RENCANA KEBUTUHAN 2024 (75/716/SETWAN/IV/2024)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "75/716/SETWAN/IV/2024"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 99, "title": "SETWAN USULAN RENCANA KEBUTUHAN 2024 (75/716/SETWAN/IV/2024)", "file_main": {}, "created_at": "2024-06-06T02:34:07.000000Z", "updated_at": "2024-06-06T02:34:07.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 09:34:08	19
169	Tambah Kelola Berkas	\N	{"title": "DPUPR (INPUT SSH) 2024", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "032/108-A/DPUPR-SET/IV/2024"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 100, "title": "DPUPR (INPUT SSH) 2024", "file_main": {}, "created_at": "2024-06-06T02:38:25.000000Z", "updated_at": "2024-06-06T02:38:25.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 09:38:25	19
170	Tambah Kelola Berkas	\N	{"title": "KEC.KATINGAN HULU USUL PENETAPAN STATUS", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "032/30/Aset-KH/IV/2024"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 101, "title": "KEC.KATINGAN HULU USUL PENETAPAN STATUS", "file_main": {}, "created_at": "2024-06-06T02:43:55.000000Z", "updated_at": "2024-06-06T02:43:55.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 09:43:55	19
171	Tambah Kelola Berkas	\N	{"title": "USULAN RKBM KABUPATEN KATINGAN HULU 2024", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "032/15/Kathulu/IV/2024"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 102, "title": "USULAN RKBM KABUPATEN KATINGAN HULU 2024", "file_main": {}, "created_at": "2024-06-06T02:48:39.000000Z", "updated_at": "2024-06-06T02:48:39.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 09:48:39	19
172	Tambah Kelola Berkas	\N	{"title": "USULAN RKBM Kec. PETAK MALAI", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "032/036/PTMK/IV/2024"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 103, "title": "USULAN RKBM Kec. PETAK MALAI", "file_main": {}, "created_at": "2024-06-06T04:21:28.000000Z", "updated_at": "2024-06-06T04:21:28.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 11:21:28	19
173	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-06-06 14:46:28	19
174	Tambah Kelola Berkas	\N	{"title": "INSPEKTORAT RKBMD (PENYAMPAIAN DATA NAMA PERSONIL UNTUK PEMBENTUKAN TIM)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "700/137/INSP/IV/2024"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 104, "title": "INSPEKTORAT RKBMD (PENYAMPAIAN DATA NAMA PERSONIL UNTUK PEMBENTUKAN TIM)", "file_main": {}, "created_at": "2024-06-06T07:51:53.000000Z", "updated_at": "2024-06-06T07:51:53.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 14:51:53	19
175	Tambah Kelola Berkas	\N	{"title": "RSUD MAS AMSYAR KASONGAN (USULAN PENAMBAHAN BIAYA PADA STANDAR HARGA SATUAN PEMERINTAH KAB.KATINGAN Th.2024)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "445/468-2/TV-RSUD/IV"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 105, "title": "RSUD MAS AMSYAR KASONGAN (USULAN PENAMBAHAN BIAYA PADA STANDAR HARGA SATUAN PEMERINTAH KAB.KATINGAN Th.2024)", "file_main": {}, "created_at": "2024-06-06T07:56:47.000000Z", "updated_at": "2024-06-06T07:56:47.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 14:56:47	19
176	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-06-06 15:34:05	19
177	Tambah Kelola Berkas	\N	{"title": "KERTAS KERJA ASET 2023 ASET TETAP AUDITED", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "-"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 106, "title": "KERTAS KERJA ASET 2023 ASET TETAP AUDITED", "file_main": {}, "created_at": "2024-06-06T08:35:58.000000Z", "updated_at": "2024-06-06T08:35:58.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-06-06 15:35:58	19
178	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-06-21 07:55:27	19
179	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-06-28 13:41:40	1
180	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-06-29 13:01:25	1
181	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-07-02 09:05:00	19
271	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-10-14 11:49:27	21
182	Tambah Kelola Berkas	\N	{"title": "BERITA ACARA KALAPAS 2024", "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 107, "title": "BERITA ACARA KALAPAS 2024", "file_main": {}, "created_at": "2024-07-02T02:07:13.000000Z", "updated_at": "2024-07-02T02:07:13.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-02 09:07:13	19
183	Tambah Kelola Berkas	\N	{"title": "NASKAH PERJANJIAN HIBAH KALAPAS", "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 108, "title": "NASKAH PERJANJIAN HIBAH KALAPAS", "file_main": {}, "created_at": "2024-07-02T02:08:19.000000Z", "updated_at": "2024-07-02T02:08:19.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-02 09:08:19	19
184	Tambah Kelola Berkas	\N	{"title": "SK PELEPASAN HAK KALAPAS", "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 109, "title": "SK PELEPASAN HAK KALAPAS", "file_main": {}, "created_at": "2024-07-02T02:09:46.000000Z", "updated_at": "2024-07-02T02:09:46.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-02 09:09:46	19
185	Tambah Kelola Berkas	\N	{"title": "SK PERSETUJUAN PIHAK KALAPAS", "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 110, "title": "SK PERSETUJUAN PIHAK KALAPAS", "file_main": {}, "created_at": "2024-07-02T02:11:32.000000Z", "updated_at": "2024-07-02T02:11:32.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-02 09:11:32	19
186	Tambah Kelola Berkas	\N	{"title": "SURAT KALAPAS DAN DISPERKIMTAN", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "200/286/DISPERKIMTAN-1/XI/2023"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 111, "title": "SURAT KALAPAS DAN DISPERKIMTAN", "file_main": {}, "created_at": "2024-07-02T02:15:05.000000Z", "updated_at": "2024-07-02T02:15:05.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-02 09:15:05	19
187	Tambah Kelola Berkas	\N	{"title": "HIBAH TANAH A.N ABARLAN", "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 112, "title": "HIBAH TANAH A.N ABARLAN", "file_main": {}, "created_at": "2024-07-02T02:21:19.000000Z", "updated_at": "2024-07-02T02:21:19.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-02 09:21:19	19
188	Tambah Kelola Berkas	\N	{"title": "SURAT TANAH A.N ABARLAN", "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 113, "title": "SURAT TANAH A.N ABARLAN", "file_main": {}, "created_at": "2024-07-02T02:23:50.000000Z", "updated_at": "2024-07-02T02:23:50.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-02 09:23:50	19
189	Tambah Kelola Berkas	\N	{"title": "SURAT HIBAH A.N ALBARLAN", "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 114, "title": "SURAT HIBAH A.N ALBARLAN", "file_main": {}, "created_at": "2024-07-02T02:30:05.000000Z", "updated_at": "2024-07-02T02:30:05.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-02 09:30:05	19
190	Tambah Kelola Berkas	\N	{"title": "SURAT TANAH A.N ALBARLAN", "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 115, "title": "SURAT TANAH A.N ALBARLAN", "file_main": {}, "created_at": "2024-07-02T02:31:16.000000Z", "updated_at": "2024-07-02T02:31:16.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-02 09:31:16	19
191	Tambah Kelola Berkas	\N	{"title": "HIBAH TANAH A.N MURDIN KADRI", "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 116, "title": "HIBAH TANAH A.N MURDIN KADRI", "file_main": {}, "created_at": "2024-07-02T02:33:42.000000Z", "updated_at": "2024-07-02T02:33:42.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-02 09:33:42	19
192	Tambah Kelola Berkas	\N	{"title": "SURAT TANAH MURDIN KADRI", "file_main": {}, "type_of_file": "bast", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 117, "title": "SURAT TANAH MURDIN KADRI", "file_main": {}, "created_at": "2024-07-02T02:35:12.000000Z", "updated_at": "2024-07-02T02:35:12.000000Z", "type_of_file": "bast", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-02 09:35:12	19
193	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-07-04 15:05:35	19
194	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-07-05 15:35:41	19
195	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-07-08 07:52:36	19
200	Tambah Kelola Berkas	\N	{"title": "BPBD TL Hasil Temuan BPK", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "360/402/BPBD/VII/2024"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 118, "title": "BPBD TL Hasil Temuan BPK", "file_main": {}, "created_at": "2024-07-22T07:56:50.000000Z", "updated_at": "2024-07-22T07:56:50.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-22 14:56:50	19
201	Tambah Kelola Berkas	\N	{"title": "BUPATI KATINGAN / PENETAPAN LOKASI TANAH KANAK-KANAK NEGRI PEMBINA", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "100.3.3.2/256/2024"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 119, "title": "BUPATI KATINGAN / PENETAPAN LOKASI TANAH KANAK-KANAK NEGRI PEMBINA", "file_main": {}, "created_at": "2024-07-22T07:58:55.000000Z", "updated_at": "2024-07-22T07:58:55.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-22 14:58:55	19
202	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-07-23 09:48:11	19
203	Tambah Kelola Berkas	\N	{"title": "BUPATI KATINGAN ( PENETAPAN LOKASI TANAH)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "100.3.3.2/256/2024"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 120, "title": "BUPATI KATINGAN ( PENETAPAN LOKASI TANAH)", "file_main": {}, "created_at": "2024-07-23T02:53:20.000000Z", "updated_at": "2024-07-23T02:53:20.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-23 09:53:20	19
204	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-07-23 14:40:31	19
205	Tambah Kelola Berkas	\N	{"title": "DISHUB (PEMUTAHIRAN DATA ASET TETAP)", "file_main": {}, "type_of_file": "surat", "file_indexes2": null, "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 121, "title": "DISHUB (PEMUTAHIRAN DATA ASET TETAP)", "file_main": {}, "created_at": "2024-07-23T07:46:38.000000Z", "updated_at": "2024-07-23T07:46:38.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-23 14:46:38	19
206	Tambah Kelola Berkas	\N	{"title": "DLH (USULAN KOMPONEN STANDAR HARGA)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "600.4/692/DLH-PEDAL/VII/2024"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 122, "title": "DLH (USULAN KOMPONEN STANDAR HARGA)", "file_main": {}, "created_at": "2024-07-23T07:54:37.000000Z", "updated_at": "2024-07-23T07:54:37.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-23 14:54:37	19
207	Tambah Kelola Berkas	\N	{"title": "DLH (USULAN PERJANJIAN PENGGUNAAN SEMENTARA (TRUCK AMBROL)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "660.0.1/621/DLH-UM/VI/2024"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 123, "title": "DLH (USULAN PERJANJIAN PENGGUNAAN SEMENTARA (TRUCK AMBROL)", "file_main": {}, "created_at": "2024-07-23T07:58:45.000000Z", "updated_at": "2024-07-23T07:58:45.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-23 14:58:45	19
208	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-07-24 09:40:31	19
209	Tambah Kelola Berkas	\N	{"title": "DLH (USULAN KOMPONEN STANDAR HARGA)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "660.4/692/DLH-PEDAL/VII/2024"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 124, "title": "DLH (USULAN KOMPONEN STANDAR HARGA)", "file_main": {}, "created_at": "2024-07-24T02:45:36.000000Z", "updated_at": "2024-07-24T02:45:36.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-24 09:45:36	19
210	Tambah Kelola Berkas	\N	{"title": "DP3AP2KB (PERSETUJUAN PENGALIHAN STATUS BMD)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "000.232/370.2/DP3AP2KB"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 125, "title": "DP3AP2KB (PERSETUJUAN PENGALIHAN STATUS BMD)", "file_main": {}, "created_at": "2024-07-24T03:30:12.000000Z", "updated_at": "2024-07-24T03:30:12.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-24 10:30:12	19
211	Tambah Kelola Berkas	\N	{"title": "DPTTK (Permohonan Usulan Penambahan SSH", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "47/DPPTK-BK/VII/2024"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 126, "title": "DPTTK (Permohonan Usulan Penambahan SSH", "file_main": {}, "created_at": "2024-07-24T03:51:54.000000Z", "updated_at": "2024-07-24T03:51:54.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-07-24 10:51:54	19
212	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-07-24 14:52:43	19
213	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-08-05 07:51:53	19
214	Tambah Kelola Berkas	\N	{"title": "DISDIK ( TANGGUNG JAWAB MUTLAK dan SURVEY HARGA KELOTOK )", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "800/981/DISDIK.1/2024"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 127, "title": "DISDIK ( TANGGUNG JAWAB MUTLAK dan SURVEY HARGA KELOTOK )", "file_main": {}, "created_at": "2024-08-05T01:08:28.000000Z", "updated_at": "2024-08-05T01:08:28.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-08-05 08:08:28	19
215	Tambah Kelola Berkas	\N	{"title": "DISDUKCAPIL (USULAN SSH)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "470/366/Disdukcapil-1/2024"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 128, "title": "DISDUKCAPIL (USULAN SSH)", "file_main": {}, "created_at": "2024-08-05T02:00:36.000000Z", "updated_at": "2024-08-05T02:00:36.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-08-05 09:00:36	19
216	Tambah Kelola Berkas	\N	{"title": "DISPORA-DK2OP (Penertiban Pencatatan dan Pengguna BMD pada DISPORA", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "00.30/503/DK2OP-1/VIII/2024"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 129, "title": "DISPORA-DK2OP (Penertiban Pencatatan dan Pengguna BMD pada DISPORA", "file_main": {}, "created_at": "2024-08-05T02:03:14.000000Z", "updated_at": "2024-08-05T02:03:14.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-08-05 09:03:14	19
217	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-08-05 15:17:20	19
218	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-08-06 08:54:02	19
219	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-08-06 15:10:23	19
220	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-08-08 08:05:21	19
221	Tambah Kelola Berkas	\N	{"title": "DINKES (Usulan Penamambahan Merk, Harga Satuan dan Spesifikasi DPA Pemerintah Kab.Katingan)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "900.1/6388/kesmas/III/2024"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 130, "title": "DINKES (Usulan Penamambahan Merk, Harga Satuan dan Spesifikasi DPA Pemerintah Kab.Katingan)", "file_main": {}, "created_at": "2024-08-08T01:10:56.000000Z", "updated_at": "2024-08-08T01:10:56.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-08-08 08:10:56	19
222	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-08-08 15:12:05	19
223	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-08-12 11:57:56	19
224	Tambah Kelola Berkas	\N	{"title": "DINKES (Pengadaan Kendaraan Dinas)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "440/6541/SKT-2/VIII-2024"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 131, "title": "DINKES (Pengadaan Kendaraan Dinas)", "file_main": {}, "created_at": "2024-08-12T05:00:32.000000Z", "updated_at": "2024-08-12T05:00:32.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-08-12 12:00:32	19
225	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-08-12 15:41:40	19
226	Tambah Kelola Berkas	\N	{"title": "DKUKMP ( Penyampaian Permohonan Perubahan Nama Pengguna Barang Pada Aplikasi SIMBADA Th 2024 )", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "000.2.3.2/289/DKUKMP-1/VIII/2023"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 132, "title": "DKUKMP ( Penyampaian Permohonan Perubahan Nama Pengguna Barang Pada Aplikasi SIMBADA Th 2024 )", "file_main": {}, "created_at": "2024-08-12T08:44:42.000000Z", "updated_at": "2024-08-12T08:44:42.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-08-12 15:44:42	19
227	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-08-13 08:35:53	19
228	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-08-14 11:36:26	19
229	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-08-19 10:20:49	1
230	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-08-19 15:42:14	19
231	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-08-26 11:17:56	19
232	Tambah Kelola Berkas	\N	{"title": "DISHUBKAN (USUL MUTASI BMD)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "032/323/Dishubkan-Um/2024"}, "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 133, "title": "DISHUBKAN (USUL MUTASI BMD)", "file_main": {}, "created_at": "2024-08-26T04:31:59.000000Z", "updated_at": "2024-08-26T04:31:59.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-08-26 11:31:59	19
233	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-08-26 15:26:23	19
234	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-09-03 10:18:16	1
235	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-09-03 11:40:02	1
236	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-09-17 10:54:38	19
237	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-09-20 08:47:46	19
238	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-09-23 10:30:41	1
239	Tambah Satuan Kerja	\N	{"email": "labdlhkatingan@gmail.com", "phone": "0852480619", "fullname": "Bidang Pengendalian Pencemaran dan Kerusakan Lingkungan - Dinas Lingkungan Hidup Kabupaten Katingan", "img_main": {}, "nickname": "PPKL-DLH"}	{"data": {"output": {"id": 20, "email": "labdlhkatingan@gmail.com", "phone": "0852480619", "fullname": "Bidang Pengendalian Pencemaran dan Kerusakan Lingkungan - Dinas Lingkungan Hidup Kabupaten Katingan", "img_main": {}, "nickname": "PPKL-DLH", "created_at": "2024-09-23T04:00:09.000000Z", "updated_at": "2024-09-23T04:00:09.000000Z"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-09-23 11:00:09	1
240	Edit Satuan Kerja	\N	{"id": "3", "email": "bkad@katingankab.go.id", "phone": "0", "fullname": "Bidang Pengelola Barang Milik Daerah - Badan Keuangan & Aset Daerah Kabupaten Katingan", "nickname": "PBMD-BKAD"}	{"data": {"id": "3", "data": {"email": "bkad@katingankab.go.id", "phone": "0", "fullname": "Bidang Pengelola Barang Milik Daerah - Badan Keuangan & Aset Daerah Kabupaten Katingan", "nickname": "PBMD-BKAD", "updated_by": 1}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-09-23 11:04:46	1
241	Edit Satuan Kerja	\N	{"id": "20", "email": "labdlhkatingan@gmail.com", "phone": "0", "fullname": "Bidang Pengendalian Pencemaran dan Kerusakan Lingkungan - Dinas Lingkungan Hidup Kabupaten Katingan", "nickname": "PPKL-DLH"}	{"data": {"id": "20", "data": {"email": "labdlhkatingan@gmail.com", "phone": "0", "fullname": "Bidang Pengendalian Pencemaran dan Kerusakan Lingkungan - Dinas Lingkungan Hidup Kabupaten Katingan", "nickname": "PPKL-DLH", "updated_by": 1}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-09-23 11:08:17	1
242	Tambah Peran	\N	{"name": "Data Entry PPKL", "is_enabled": "on", "description": "Pengendalian Pencemaran dan Kerusakan Lingkungan", "menu_action": ["1", "3", "4", "5", "7", "8", "2", "9", "25", "31"]}	{"data": {"output": {"id": 16, "name": "Data Entry PPKL", "created_at": "2024-09-23T04:10:13.000000Z", "updated_at": "2024-09-23T04:10:13.000000Z", "description": "Pengendalian Pencemaran dan Kerusakan Lingkungan"}, "output_img": 1, "output_permission": {"1": {"id": 224, "role_id": 16, "created_at": "2024-09-23T04:10:13.000000Z", "is_enabled": true, "updated_at": "2024-09-23T04:10:13.000000Z", "menu_action_id": "1"}, "2": {"id": 230, "role_id": 16, "created_at": "2024-09-23T04:10:13.000000Z", "is_enabled": true, "updated_at": "2024-09-23T04:10:13.000000Z", "menu_action_id": "2"}, "3": {"id": 225, "role_id": 16, "created_at": "2024-09-23T04:10:13.000000Z", "is_enabled": true, "updated_at": "2024-09-23T04:10:13.000000Z", "menu_action_id": "3"}, "4": {"id": 226, "role_id": 16, "created_at": "2024-09-23T04:10:13.000000Z", "is_enabled": true, "updated_at": "2024-09-23T04:10:13.000000Z", "menu_action_id": "4"}, "5": {"id": 227, "role_id": 16, "created_at": "2024-09-23T04:10:13.000000Z", "is_enabled": true, "updated_at": "2024-09-23T04:10:13.000000Z", "menu_action_id": "5"}, "7": {"id": 228, "role_id": 16, "created_at": "2024-09-23T04:10:13.000000Z", "is_enabled": true, "updated_at": "2024-09-23T04:10:13.000000Z", "menu_action_id": "7"}, "8": {"id": 229, "role_id": 16, "created_at": "2024-09-23T04:10:13.000000Z", "is_enabled": true, "updated_at": "2024-09-23T04:10:13.000000Z", "menu_action_id": "8"}, "9": {"id": 231, "role_id": 16, "created_at": "2024-09-23T04:10:13.000000Z", "is_enabled": true, "updated_at": "2024-09-23T04:10:13.000000Z", "menu_action_id": "9"}, "25": {"id": 232, "role_id": 16, "created_at": "2024-09-23T04:10:13.000000Z", "is_enabled": true, "updated_at": "2024-09-23T04:10:13.000000Z", "menu_action_id": "25"}, "31": {"id": 233, "role_id": 16, "created_at": "2024-09-23T04:10:13.000000Z", "is_enabled": true, "updated_at": "2024-09-23T04:10:13.000000Z", "menu_action_id": "31"}}}, "status": true, "message": "Berhasil menyimpan data"}	2024-09-23 11:10:13	1
243	Edit Peran	\N	{"id": "16", "name": "Data Entry PPKL", "is_enabled": "on", "description": "Pengendalian Pencemaran dan Kerusakan Lingkungan", "menu_action": ["1", "3", "4", "5", "7", "8", "2", "9", "19", "25", "31"]}	{"data": {"id": "16", "data": {"name": "Data Entry PPKL", "is_enabled": "on", "updated_by": 1, "description": "Pengendalian Pencemaran dan Kerusakan Lingkungan"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-09-23 11:11:31	1
244	Tambah Pengguna	\N	{"name": "Marika Eka Yunika", "email": "labdlhkatingan@gmail.com", "_token": "vrSlR0K2IyUZR1MEo3xa8rBQCJBhd5fNzIbMj6mF", "role_id": "16", "user_group_id": "20"}	{"id": 21, "name": "Marika Eka Yunika", "email": "labdlhkatingan@gmail.com", "role_id": "16", "created_at": "2024-09-23T04:12:09.000000Z", "updated_at": "2024-09-23T04:12:09.000000Z", "user_group_id": "20"}	2024-09-23 11:12:09	1
245	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-09-23 11:12:21	21
246	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-09-23 11:13:45	1
247	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-09-23 11:29:28	21
248	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-09-23 12:05:44	1
249	Edit Peran	\N	{"id": "16", "name": "Data Entry PPKL", "is_enabled": "on", "description": "Pengendalian Pencemaran dan Kerusakan Lingkungan", "menu_action": ["1", "3", "4", "5", "7", "8", "2", "9", "13", "19", "25", "31"]}	{"data": {"id": "16", "data": {"name": "Data Entry PPKL", "is_enabled": "on", "updated_by": 1, "description": "Pengendalian Pencemaran dan Kerusakan Lingkungan"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-09-23 12:07:19	1
250	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-09-23 12:07:27	21
251	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-09-23 12:29:56	1
252	Login Berhasil	ev.attoff@gmail.com	\N	\N	2024-09-23 14:39:01	1
253	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-09-23 14:46:26	21
254	Edit Peran	\N	{"id": "16", "name": "Data Entry PPKL", "is_enabled": "on", "description": "Pengendalian Pencemaran dan Kerusakan Lingkungan", "menu_action": ["1", "3", "4", "5", "7", "8", "2", "9", "19", "31"]}	{"data": {"id": "16", "data": {"name": "Data Entry PPKL", "is_enabled": "on", "updated_by": 21, "description": "Pengendalian Pencemaran dan Kerusakan Lingkungan"}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-09-23 14:51:34	21
255	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-09-23 14:51:41	21
256	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-09-23 14:52:34	21
257	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-09-23 14:58:25	21
258	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-09-24 09:17:43	19
259	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-10-07 08:50:18	19
260	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-10-11 11:34:13	21
261	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-10-11 11:35:24	21
262	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-10-11 14:06:38	21
263	Edit Satuan Kerja	\N	{"id": "20", "email": "labdlhkatingan@gmail.com", "phone": "0", "fullname": "Dinas Lingkungan Hidup Kabupaten Katingan", "nickname": "DLH"}	{"data": {"id": "20", "data": {"email": "labdlhkatingan@gmail.com", "phone": "0", "fullname": "Dinas Lingkungan Hidup Kabupaten Katingan", "nickname": "DLH", "updated_by": 21}, "output": 1}, "status": true, "message": "Berhasil mengubah data"}	2024-10-11 14:07:15	21
264	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-10-14 08:30:12	21
265	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-10-14 08:58:14	19
266	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-10-14 09:05:22	21
267	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-10-14 10:09:31	21
268	Tambah Kelola Berkas	\N	{"title": "IKLH Kabupaten Katingan 2023", "file_main": {}, "type_of_file": "media", "file_indexes2": null, "user_group_id": "20", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 134, "title": "IKLH Kabupaten Katingan 2023", "file_main": {}, "created_at": "2024-10-14T03:12:54.000000Z", "updated_at": "2024-10-14T03:12:54.000000Z", "type_of_file": "media", "user_group_id": "20", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-10-14 10:12:54	21
269	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-10-14 10:58:51	21
270	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-10-14 11:02:28	21
272	Tambah Kelola Berkas	\N	{"title": "IKLH Kabupaten Katingan 2022", "keywords": ["IKLH"], "file_main": {}, "type_of_file": "media", "file_indexes2": null, "user_group_id": "20", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 135, "title": "IKLH Kabupaten Katingan 2022", "file_main": {}, "created_at": "2024-10-14T04:54:09.000000Z", "updated_at": "2024-10-14T04:54:09.000000Z", "type_of_file": "media", "user_group_id": "20", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-10-14 11:54:09	21
273	Login Gagal	apriyatisilvina@gamail.com	\N	\N	2024-10-16 08:27:28	\N
274	Login Gagal	apriyatisilvina@gamail.com	\N	\N	2024-10-16 08:28:03	\N
275	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-10-16 08:28:29	19
276	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-10-18 16:48:43	21
277	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-10-19 11:35:50	21
278	Tambah Kelola Berkas	\N	{"title": "Keanekagaraman Hayati", "file_main": {}, "type_of_file": "media", "file_indexes2": null, "user_group_id": "20", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 136, "title": "Keanekagaraman Hayati", "file_main": {}, "created_at": "2024-10-19T04:42:04.000000Z", "updated_at": "2024-10-19T04:42:04.000000Z", "type_of_file": "media", "user_group_id": "20", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-10-19 11:42:04	21
279	Tambah Kelola Berkas	\N	{"title": "Tutupan Lahan Kabupaten Katingan_2024", "file_main": {}, "type_of_file": "media", "file_indexes2": null, "user_group_id": "20", "type_of_publicity": "public", "editorial_permission": "user_group"}	{"data": {"output": {"id": 137, "title": "Tutupan Lahan Kabupaten Katingan_2024", "file_main": {}, "created_at": "2024-10-19T04:53:41.000000Z", "updated_at": "2024-10-19T04:53:41.000000Z", "type_of_file": "media", "user_group_id": "20", "type_of_publicity": "public", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-10-19 11:53:41	21
280	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-10-22 07:49:57	19
281	Login Berhasil	apriyatisilvina@gmail.com	\N	\N	2024-10-22 14:41:51	19
282	Tambah Kelola Berkas	\N	{"title": "SETDA ( Bawaslu Usulan Pinjam Pakai )", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "-"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 138, "title": "SETDA ( Bawaslu Usulan Pinjam Pakai )", "file_main": {}, "created_at": "2024-10-22T07:46:19.000000Z", "updated_at": "2024-10-22T07:46:19.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-10-22 14:46:19	19
283	Tambah Kelola Berkas	\N	{"title": "DINAS PU (Permohonan SSH)", "file_main": {}, "type_of_file": "surat", "file_indexes2": "dynamic_inputs.lampiran", "user_group_id": "3", "dynamic_inputs": {"nomor_surat": "050/505/DPUPR-SET/X2024"}, "type_of_publicity": "user_group", "editorial_permission": "user_group"}	{"data": {"output": {"id": 139, "title": "DINAS PU (Permohonan SSH)", "file_main": {}, "created_at": "2024-10-22T07:51:42.000000Z", "updated_at": "2024-10-22T07:51:42.000000Z", "type_of_file": "surat", "user_group_id": "3", "type_of_publicity": "user_group", "editorial_permission": "user_group"}, "output_img": 1}, "status": true, "message": "Berhasil menyimpan data"}	2024-10-22 14:51:42	19
284	Login Berhasil	labdlhkatingan@gmail.com	\N	\N	2024-10-22 15:39:02	21
\.


--
-- TOC entry 3102 (class 0 OID 16448)
-- Dependencies: 215
-- Data for Name: menu_actions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_actions (id, menu_id, name, slug, is_enabled, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, description) FROM stdin;
32	9	filter-list		t	\N	\N	\N	\N	\N	\N	menggunakan filter khusus untuk pencarian spesifik
3	4	filter-list		t	\N	\N	\N	\N	\N	\N	menggunakan filter khusus untuk pencarian spesifik
4	4	add		t	\N	\N	\N	\N	\N	\N	menambahkan data baru
5	4	edit		t	\N	\N	\N	\N	\N	\N	mengubah data yang sudah ada
6	4	delete		t	\N	\N	\N	\N	\N	\N	mengapus data
10	5	filter-list		t	\N	\N	\N	\N	\N	\N	menggunakan filter khusus untuk pencarian spesifik
11	5	delete		t	\N	\N	\N	\N	\N	\N	mengapus data
14	6	filter-list		t	\N	\N	\N	\N	\N	\N	menggunakan filter khusus untuk pencarian spesifik
15	6	add		t	\N	\N	\N	\N	\N	\N	menambahkan data baru
16	6	edit		t	\N	\N	\N	\N	\N	\N	mengubah data yang sudah ada
17	6	delete		t	\N	\N	\N	\N	\N	\N	mengapus data
20	7	filter-list		t	\N	\N	\N	\N	\N	\N	menggunakan filter khusus untuk pencarian spesifik
21	7	add		t	\N	\N	\N	\N	\N	\N	menambahkan data baru
22	7	edit		t	\N	\N	\N	\N	\N	\N	mengubah data yang sudah ada
23	7	delete		t	\N	\N	\N	\N	\N	\N	mengapus data
26	8	filter-list		t	\N	\N	\N	\N	\N	\N	menggunakan filter khusus untuk pencarian spesifik
27	8	add		t	\N	\N	\N	\N	\N	\N	menambahkan data baru
28	8	edit		t	\N	\N	\N	\N	\N	\N	mengubah data yang sudah ada
29	8	delete		t	\N	\N	\N	\N	\N	\N	mengapus data
33	9	add		t	\N	\N	\N	\N	\N	\N	menambahkan data baru
34	9	edit		t	\N	\N	\N	\N	\N	\N	mengubah data yang sudah ada
35	9	delete		t	\N	\N	\N	\N	\N	\N	mengapus data
7	4	export		t	\N	\N	\N	\N	\N	\N	ekspor ke EXCEL / PDF
8	4	sync		t	\N	\N	\N	\N	\N	\N	sync data
12	5	export		t	\N	\N	\N	\N	\N	\N	ekspor ke EXCEL / PDF
18	6	export		t	\N	\N	\N	\N	\N	\N	ekspor ke EXCEL / PDF
24	7	export		t	\N	\N	\N	\N	\N	\N	ekspor ke EXCEL / PDF
30	8	export		t	\N	\N	\N	\N	\N	\N	ekspor ke EXCEL / PDF
36	9	export		t	\N	\N	\N	\N	\N	\N	ekspor ke EXCEL / PDF
1	3	read	/dashboard	t	\N	\N	\N	\N	\N	\N	melihat dashboard sederhana
2	4	read	/files	t	\N	\N	\N	\N	\N	\N	melihat daftar data
9	5	read	/logs	t	\N	\N	\N	\N	\N	\N	melihat daftar data
13	6	read	/roles	t	\N	\N	\N	\N	\N	\N	melihat daftar data
19	7	read	/user-groups	t	\N	\N	\N	\N	\N	\N	melihat daftar data
25	8	read	/users	t	\N	\N	\N	\N	\N	\N	melihat daftar data
31	9	read	/dynamic-inputs	t	\N	\N	\N	\N	\N	\N	melihat daftar data
\.


--
-- TOC entry 3099 (class 0 OID 16436)
-- Dependencies: 212
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menus (id, name, icon, child_of, display_type, is_menu_with_action, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by) FROM stdin;
1	Aktivitas	\N	\N	divider-text	\N	\N	\N	\N	\N	\N	\N
2	Master	\N	\N	divider-text	\N	\N	\N	\N	\N	\N	\N
3	Dashboard	home	1	\N	t	\N	\N	\N	\N	\N	\N
4	Kelola Berkas	hard-drive	1	\N	t	\N	\N	\N	\N	\N	\N
5	Log	file-clock	1	\N	t	\N	\N	\N	\N	\N	\N
6	Kelola Akses	scan-face	2	\N	t	\N	\N	\N	\N	\N	\N
7	SatKer	component	2	\N	t	\N	\N	\N	\N	\N	\N
8	Pengguna	user	2	\N	t	\N	\N	\N	\N	\N	\N
9	Kelola Input	sidebar	2	\N	t	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3091 (class 0 OID 16387)
-- Dependencies: 204
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_reset_tokens_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2019_12_14_000001_create_personal_access_tokens_table	1
\.


--
-- TOC entry 3109 (class 0 OID 16486)
-- Dependencies: 222
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.options (id, type, value, value2, label, description, img_main, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by) FROM stdin;
1	ACTIVE_STATUS	true	\N	Aktif	\N	\N	\N	\N	\N	\N	\N	\N
2	ACTIVE_STATUS	false	\N	Tidak Aktif	\N	\N	\N	\N	\N	\N	\N	\N
4	EDITORIAL_PERMISSION	user_group	\N	Satuan Kerja Penginput	\N	\N	\N	\N	\N	\N	\N	\N
5	EDITORIAL_PERMISSION	public	\N	Publik	\N	\N	\N	\N	\N	\N	\N	\N
6	TYPE_OF_PUBLICITY	public	\N	Publik	\N	\N	\N	\N	\N	\N	\N	\N
7	TYPE_OF_PUBLICITY	user_group	\N	Satuan Kerja Penginput	\N	\N	\N	\N	\N	\N	\N	\N
8	TYPE_OF_FILE	surat	\N	Surat	\N	\N	\N	\N	\N	\N	\N	\N
9	TYPE_OF_FILE	peraturan	\N	Peraturan	\N	\N	\N	\N	\N	\N	\N	\N
13	TYPE_OF_FILE	sertifikat	\N	Sertifikat	\N	\N	\N	\N	\N	\N	\N	\N
10	TYPE_OF_FILE	sk	\N	SK	Surat Keputusan	\N	\N	\N	\N	\N	\N	\N
11	TYPE_OF_FILE	bpkb	\N	BPKB	Buku Pemilik Kendaraan Bermotor	\N	\N	\N	\N	\N	\N	\N
12	TYPE_OF_FILE	stnk	\N	STNK	Surat Tanda Nomor Kendaraan	\N	\N	\N	\N	\N	\N	\N
14	TYPE_OF_INPUT	text	\N	Text	\N	\N	\N	\N	\N	\N	\N	\N
16	TYPE_OF_INPUT	textarea	\N	Textarea (input text dengan tampilan lebih besar)	\N	\N	\N	\N	\N	\N	\N	\N
18	TYPE_OF_INPUT	number	\N	Number (hanya menerima angka)	\N	\N	\N	\N	\N	\N	\N	\N
19	TYPE_OF_INPUT	email	\N	Email (ada validasi format email)	\N	\N	\N	\N	\N	\N	\N	\N
20	TYPE_OF_INPUT	password	\N	Password	\N	\N	\N	\N	\N	\N	\N	\N
21	TYPE_OF_INPUT	file	\N	File (memungkinkan upload gambar atau dokumen)	\N	\N	\N	\N	\N	\N	\N	\N
22	TYPE_OF_INPUT	color	\N	Color (input khusus warna)	\N	\N	\N	\N	\N	\N	\N	\N
23	TYPE_OF_INPUT	date	\N	Date (input khusus dengan format tanggal-bulan-tahun)	\N	\N	\N	\N	\N	\N	\N	\N
24	TYPE_OF_INPUT	month	\N	Month (input khusus dengan format bulan-tahun)	\N	\N	\N	\N	\N	\N	\N	\N
26	TYPE_OF_INPUT	week	\N	Week (input khusus dengan format minggu)	\N	\N	\N	\N	\N	\N	\N	\N
27	BEHAVIOR_OF_INPUT_FILE	mime-doc	\N	Menerima dokumen	\N	\N	\N	\N	\N	\N	\N	\N
28	BEHAVIOR_OF_INPUT_FILE	mime-img	\N	Menerima gambar	\N	\N	\N	\N	\N	\N	\N	\N
29	BEHAVIOR_OF_INPUT_TEXT	class-nospace	\N	Tidak boleh spasi	\N	\N	\N	\N	\N	\N	\N	\N
30	BEHAVIOR_OF_INPUT_TEXT	class-numeric	\N	Hanya angka	\N	\N	\N	\N	\N	\N	\N	\N
31	BEHAVIOR_OF_INPUT_TEXT	class-uppercase	\N	Auto huruf besar	\N	\N	\N	\N	\N	\N	\N	\N
32	BEHAVIOR_OF_INPUT_TEXT	class-lowercase	\N	Auto huruf kecil	\N	\N	\N	\N	\N	\N	\N	\N
33	BEHAVIOR_OF_INPUT_TEXTAREA	class-nospace	\N	Tidak boleh spasi	\N	\N	\N	\N	\N	\N	\N	\N
34	BEHAVIOR_OF_INPUT_TEXTAREA	class-numeric	\N	Hanya angka	\N	\N	\N	\N	\N	\N	\N	\N
35	BEHAVIOR_OF_INPUT_TEXTAREA	class-uppercase	\N	Auto huruf besar	\N	\N	\N	\N	\N	\N	\N	\N
36	BEHAVIOR_OF_INPUT_TEXTAREA	class-lowercase	\N	Auto huruf kecil	\N	\N	\N	\N	\N	\N	\N	\N
37	TYPE_OF_FILE	media	\N	Media	Media (Aset Foto/Gambar)	\N	\N	\N	\N	\N	\N	\N
38	TYPE_OF_FILE	bast	\N	BAST	Berita Acara Serah Terima	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3094 (class 0 OID 16403)
-- Dependencies: 207
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 16424)
-- Dependencies: 211
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 16454)
-- Dependencies: 216
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_permissions (id, role_id, menu_action_id, is_enabled, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by) FROM stdin;
1	11	1	t	2024-03-19 02:25:25	\N	2024-03-19 02:50:36	\N	2024-03-19 02:50:36	\N
2	11	2	t	2024-03-19 02:25:25	\N	2024-03-19 02:50:36	\N	2024-03-19 02:50:36	\N
3	11	4	t	2024-03-19 02:25:25	\N	2024-03-19 02:50:36	\N	2024-03-19 02:50:36	\N
4	11	6	t	2024-03-19 02:25:25	\N	2024-03-19 02:50:36	\N	2024-03-19 02:50:36	\N
5	11	10	t	2024-03-19 02:25:25	\N	2024-03-19 02:50:36	\N	2024-03-19 02:50:36	\N
6	11	12	t	2024-03-19 02:25:25	\N	2024-03-19 02:50:36	\N	2024-03-19 02:50:36	\N
7	11	15	t	2024-03-19 02:25:25	\N	2024-03-19 02:50:36	\N	2024-03-19 02:50:36	\N
8	11	21	t	2024-03-19 02:25:25	\N	2024-03-19 02:50:36	\N	2024-03-19 02:50:36	\N
9	11	26	t	2024-03-19 02:25:25	\N	2024-03-19 02:50:36	\N	2024-03-19 02:50:36	\N
10	11	31	t	2024-03-19 02:25:25	\N	2024-03-19 02:50:36	\N	2024-03-19 02:50:36	\N
11	11	1	t	2024-03-19 02:50:36	\N	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N
12	11	2	t	2024-03-19 02:50:36	\N	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N
13	11	4	t	2024-03-19 02:50:36	\N	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N
14	11	6	t	2024-03-19 02:50:36	\N	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N
15	11	10	t	2024-03-19 02:50:36	\N	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N
16	11	12	t	2024-03-19 02:50:36	\N	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N
17	11	15	t	2024-03-19 02:50:36	\N	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N
18	11	21	t	2024-03-19 02:50:36	\N	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N
19	11	26	t	2024-03-19 02:50:36	\N	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N
20	11	31	t	2024-03-19 02:50:36	\N	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N
21	11	1	t	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N	\N	\N
22	11	2	t	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N	\N	\N
23	11	3	t	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N	\N	\N
24	11	4	t	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N	\N	\N
25	11	5	t	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N	\N	\N
26	11	6	t	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N	\N	\N
27	11	10	t	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N	\N	\N
28	11	11	t	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N	\N	\N
29	11	12	t	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N	\N	\N
30	11	13	t	2024-03-19 02:51:49	\N	2024-03-19 02:51:49	\N	\N	\N
31	11	14	t	2024-03-19 02:51:50	\N	2024-03-19 02:51:50	\N	\N	\N
32	11	15	t	2024-03-19 02:51:50	\N	2024-03-19 02:51:50	\N	\N	\N
33	11	19	t	2024-03-19 02:51:50	\N	2024-03-19 02:51:50	\N	\N	\N
34	11	20	t	2024-03-19 02:51:50	\N	2024-03-19 02:51:50	\N	\N	\N
35	11	21	t	2024-03-19 02:51:50	\N	2024-03-19 02:51:50	\N	\N	\N
36	11	26	t	2024-03-19 02:51:50	\N	2024-03-19 02:51:50	\N	\N	\N
37	11	27	t	2024-03-19 02:51:50	\N	2024-03-19 02:51:50	\N	\N	\N
38	11	28	t	2024-03-19 02:51:50	\N	2024-03-19 02:51:50	\N	\N	\N
39	11	31	t	2024-03-19 02:51:50	\N	2024-03-19 02:51:50	\N	\N	\N
40	11	32	t	2024-03-19 02:51:50	\N	2024-03-19 02:51:50	\N	\N	\N
77	2	1	t	2024-03-19 03:34:54	\N	2024-03-19 03:34:54	\N	\N	\N
78	2	2	t	2024-03-19 03:34:54	\N	2024-03-19 03:34:54	\N	\N	\N
79	2	3	t	2024-03-19 03:34:54	\N	2024-03-19 03:34:54	\N	\N	\N
80	2	4	t	2024-03-19 03:34:54	\N	2024-03-19 03:34:54	\N	\N	\N
81	2	5	t	2024-03-19 03:34:54	\N	2024-03-19 03:34:54	\N	\N	\N
82	2	6	t	2024-03-19 03:34:54	\N	2024-03-19 03:34:54	\N	\N	\N
83	2	7	t	2024-03-19 03:34:55	\N	2024-03-19 03:34:55	\N	\N	\N
84	2	8	t	2024-03-19 03:34:55	\N	2024-03-19 03:34:55	\N	\N	\N
85	2	9	t	2024-03-19 03:34:55	\N	2024-03-19 03:34:55	\N	\N	\N
86	2	10	t	2024-03-19 03:34:55	\N	2024-03-19 03:34:55	\N	\N	\N
87	2	12	t	2024-03-19 03:34:55	\N	2024-03-19 03:34:55	\N	\N	\N
88	2	25	t	2024-03-19 03:34:55	\N	2024-03-19 03:34:55	\N	\N	\N
41	1	1	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
42	1	2	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
43	1	3	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
44	1	4	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
45	1	5	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
46	1	6	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
47	1	7	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
48	1	8	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
49	1	9	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
50	1	10	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
51	1	11	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
52	1	12	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
53	1	13	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
54	1	14	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
55	1	15	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
56	1	16	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
57	1	17	t	2024-03-19 03:33:00	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
58	1	18	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
59	1	19	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
60	1	20	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
61	1	21	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
62	1	22	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
63	1	23	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
64	1	24	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
65	1	25	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
66	1	26	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
67	1	27	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
68	1	28	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
69	1	29	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
70	1	30	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
71	1	31	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
72	1	32	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
73	1	33	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
74	1	34	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
75	1	35	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
76	1	36	t	2024-03-19 03:33:01	\N	2024-03-19 03:35:18	\N	2024-03-19 03:35:18	\N
89	1	1	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
90	1	2	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
91	1	3	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
92	1	4	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
93	1	5	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
94	1	6	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
95	1	7	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
96	1	8	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
97	1	9	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
98	1	10	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
99	1	11	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
100	1	12	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
101	1	13	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
102	1	14	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
103	1	15	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
104	1	16	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
105	1	17	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
106	1	18	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
107	1	19	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
108	1	20	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
109	1	21	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
110	1	22	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
111	1	23	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
112	1	24	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
113	1	25	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
114	1	26	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
115	1	27	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
116	1	28	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
117	1	29	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
118	1	30	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
119	1	31	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
120	1	32	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
121	1	33	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
122	1	34	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
123	1	35	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
124	1	36	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N
125	1	1	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
126	1	2	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
127	1	3	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
128	1	4	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
129	1	5	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
130	1	6	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
131	1	7	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
132	1	8	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
133	1	9	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
134	1	10	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
135	1	11	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
136	1	12	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
137	1	13	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
138	1	14	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
139	1	15	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
140	1	16	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
141	1	17	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
142	1	18	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
143	1	19	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
144	1	20	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
145	1	21	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
146	1	22	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
147	1	23	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
148	1	24	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
149	1	25	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
150	1	26	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
151	1	27	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
152	1	28	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
153	1	29	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
154	1	30	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
155	1	31	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
156	1	32	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
157	1	33	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
158	1	34	t	2024-03-19 03:35:19	\N	2024-03-19 03:35:19	\N	\N	\N
159	1	35	t	2024-03-19 03:35:20	\N	2024-03-19 03:35:20	\N	\N	\N
160	1	36	t	2024-03-19 03:35:20	\N	2024-03-19 03:35:20	\N	\N	\N
161	12	1	t	2024-04-18 15:23:52	\N	2024-04-18 15:30:24	\N	2024-04-18 15:30:24	\N
162	12	3	t	2024-04-18 15:23:52	\N	2024-04-18 15:30:24	\N	2024-04-18 15:30:24	\N
163	12	26	t	2024-04-18 15:23:52	\N	2024-04-18 15:30:24	\N	2024-04-18 15:30:24	\N
164	12	1	t	2024-04-18 15:30:24	\N	2024-04-18 15:30:24	\N	\N	\N
165	12	3	t	2024-04-18 15:30:24	\N	2024-04-18 15:30:24	\N	\N	\N
166	12	4	t	2024-04-18 15:30:25	\N	2024-04-18 15:30:25	\N	\N	\N
167	12	5	t	2024-04-18 15:30:25	\N	2024-04-18 15:30:25	\N	\N	\N
168	12	6	t	2024-04-18 15:30:25	\N	2024-04-18 15:30:25	\N	\N	\N
169	12	26	t	2024-04-18 15:30:25	\N	2024-04-18 15:30:25	\N	\N	\N
170	13	1	t	2024-04-18 15:31:37	\N	2024-04-18 15:31:37	\N	\N	\N
186	15	1	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
187	15	3	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
188	15	4	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
189	15	5	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
190	15	6	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
191	15	7	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
192	15	8	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
193	15	2	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
194	15	9	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
195	15	13	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
196	15	19	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
197	15	26	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
198	15	27	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
199	15	28	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
200	15	29	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
201	15	30	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
202	15	25	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
203	15	32	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
204	15	33	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
205	15	34	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
206	15	35	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
207	15	36	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
208	15	31	t	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N
171	14	1	t	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N
172	14	3	t	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N
173	14	4	t	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N
174	14	5	t	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N
175	14	7	t	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N
176	14	8	t	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N
177	14	2	t	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N
178	14	9	t	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N
179	14	25	t	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N
180	14	32	t	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N
181	14	33	t	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N
182	14	34	t	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N
183	14	35	t	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N
184	14	36	t	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N
185	14	31	t	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N
209	14	1	t	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N	\N	\N
210	14	3	t	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N	\N	\N
211	14	4	t	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N	\N	\N
212	14	5	t	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N	\N	\N
213	14	7	t	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N	\N	\N
214	14	8	t	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N	\N	\N
215	14	2	t	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N	\N	\N
216	14	9	t	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N	\N	\N
217	14	25	t	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N	\N	\N
218	14	32	t	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N	\N	\N
219	14	33	t	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N	\N	\N
220	14	34	t	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N	\N	\N
221	14	35	t	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N	\N	\N
222	14	36	t	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N	\N	\N
223	14	31	t	2024-05-08 15:11:30	\N	2024-05-08 15:11:30	\N	\N	\N
224	16	1	t	2024-09-23 11:10:13	\N	2024-09-23 11:11:31	\N	2024-09-23 11:11:31	\N
225	16	3	t	2024-09-23 11:10:13	\N	2024-09-23 11:11:31	\N	2024-09-23 11:11:31	\N
226	16	4	t	2024-09-23 11:10:13	\N	2024-09-23 11:11:31	\N	2024-09-23 11:11:31	\N
227	16	5	t	2024-09-23 11:10:13	\N	2024-09-23 11:11:31	\N	2024-09-23 11:11:31	\N
228	16	7	t	2024-09-23 11:10:13	\N	2024-09-23 11:11:31	\N	2024-09-23 11:11:31	\N
229	16	8	t	2024-09-23 11:10:13	\N	2024-09-23 11:11:31	\N	2024-09-23 11:11:31	\N
230	16	2	t	2024-09-23 11:10:13	\N	2024-09-23 11:11:31	\N	2024-09-23 11:11:31	\N
231	16	9	t	2024-09-23 11:10:13	\N	2024-09-23 11:11:31	\N	2024-09-23 11:11:31	\N
232	16	25	t	2024-09-23 11:10:13	\N	2024-09-23 11:11:31	\N	2024-09-23 11:11:31	\N
233	16	31	t	2024-09-23 11:10:13	\N	2024-09-23 11:11:31	\N	2024-09-23 11:11:31	\N
234	16	1	t	2024-09-23 11:11:31	\N	2024-09-23 12:07:19	\N	2024-09-23 12:07:19	\N
235	16	3	t	2024-09-23 11:11:31	\N	2024-09-23 12:07:19	\N	2024-09-23 12:07:19	\N
236	16	4	t	2024-09-23 11:11:31	\N	2024-09-23 12:07:19	\N	2024-09-23 12:07:19	\N
237	16	5	t	2024-09-23 11:11:31	\N	2024-09-23 12:07:19	\N	2024-09-23 12:07:19	\N
238	16	7	t	2024-09-23 11:11:31	\N	2024-09-23 12:07:19	\N	2024-09-23 12:07:19	\N
239	16	8	t	2024-09-23 11:11:31	\N	2024-09-23 12:07:19	\N	2024-09-23 12:07:19	\N
240	16	2	t	2024-09-23 11:11:31	\N	2024-09-23 12:07:19	\N	2024-09-23 12:07:19	\N
241	16	9	t	2024-09-23 11:11:31	\N	2024-09-23 12:07:19	\N	2024-09-23 12:07:19	\N
242	16	19	t	2024-09-23 11:11:31	\N	2024-09-23 12:07:19	\N	2024-09-23 12:07:19	\N
243	16	25	t	2024-09-23 11:11:31	\N	2024-09-23 12:07:19	\N	2024-09-23 12:07:19	\N
244	16	31	t	2024-09-23 11:11:31	\N	2024-09-23 12:07:19	\N	2024-09-23 12:07:19	\N
245	16	1	t	2024-09-23 12:07:19	\N	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N
246	16	3	t	2024-09-23 12:07:19	\N	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N
247	16	4	t	2024-09-23 12:07:19	\N	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N
248	16	5	t	2024-09-23 12:07:19	\N	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N
249	16	7	t	2024-09-23 12:07:19	\N	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N
250	16	8	t	2024-09-23 12:07:19	\N	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N
251	16	2	t	2024-09-23 12:07:19	\N	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N
252	16	9	t	2024-09-23 12:07:19	\N	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N
253	16	13	t	2024-09-23 12:07:19	\N	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N
254	16	19	t	2024-09-23 12:07:19	\N	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N
255	16	25	t	2024-09-23 12:07:19	\N	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N
256	16	31	t	2024-09-23 12:07:19	\N	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N
257	16	1	t	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N	\N	\N
258	16	3	t	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N	\N	\N
259	16	4	t	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N	\N	\N
260	16	5	t	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N	\N	\N
261	16	7	t	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N	\N	\N
262	16	8	t	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N	\N	\N
263	16	2	t	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N	\N	\N
264	16	9	t	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N	\N	\N
265	16	19	t	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N	\N	\N
266	16	31	t	2024-09-23 14:51:34	\N	2024-09-23 14:51:34	\N	\N	\N
\.


--
-- TOC entry 3101 (class 0 OID 16443)
-- Dependencies: 214
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, description, is_enabled) FROM stdin;
2	Data Entry	\N	\N	2024-03-19 03:34:54	\N	\N	\N	\N	t
1	Super User	\N	\N	2024-03-19 03:35:19	\N	\N	\N	Admin aplikasi BankData	t
15	Kepala Bidang PBMD	2024-05-08 15:11:19	\N	2024-05-08 15:11:19	\N	\N	\N	\N	t
14	Data Entry PBMD	2024-05-08 15:05:30	\N	2024-05-08 15:11:30	\N	\N	\N	Bidang Pengelola Barang Milik Daerah BKAD	t
16	Data Entry PPKL	2024-09-23 11:10:13	1	2024-09-23 14:51:34	21	\N	\N	Pengendalian Pencemaran dan Kerusakan Lingkungan	t
\.


--
-- TOC entry 3107 (class 0 OID 16466)
-- Dependencies: 220
-- Data for Name: user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_groups (id, fullname, email, phone, img_main, is_enabled, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, nickname) FROM stdin;
3	Bidang Pengelola Barang Milik Daerah - Badan Keuangan & Aset Daerah Kabupaten Katingan	bkad@katingankab.go.id	0	/storage//user-group//user-group-2.png	t	\N	\N	2024-09-23 11:04:46	1	\N	\N	PBMD-BKAD
20	Dinas Lingkungan Hidup Kabupaten Katingan	labdlhkatingan@gmail.com	0	/storage//user-group//user-group-20.png	t	2024-09-23 11:00:09	1	2024-10-11 14:07:15	21	\N	\N	DLH
1	Dinas Komunikasi Informatika Statistik dan Persandian Kabupaten Katingan	diskominfostandi@katingankab.go.id	\N	/storage//user-group//user-group-1.png	t	\N	\N	2024-05-02 13:54:16	\N	\N	\N	DISKOMINFO
2	Badan Keuangan & Aset Daerah Kabupaten Katingan	bkad@katingankab.go.id	\N	/storage//user-group//user-group-2.png	t	\N	\N	2024-05-02 13:54:09	\N	\N	\N	BKAD
\.


--
-- TOC entry 3093 (class 0 OID 16395)
-- Dependencies: 206
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role_id, user_group_id, img_main, is_enabled, created_by, updated_by) FROM stdin;
2	BankData SAdmin	superuser@mail.com	\N	$2y$12$p90ySrLSjnDCWjAjGbN3v.kh6ls8IzjRIXAzNcnyCIBdKw0dJXxse	8nBcxbgyzo7vMLNMMlLUh9Zunq9R3Zy2ytgobTHr57Oq4GBYsB6dJQfOFlTW	2024-03-12 04:29:49	2024-03-20 08:12:44	1	1	\N	t	1	\N
19	Silvina Apriyati	apriyatisilvina@gmail.com	\N	$2y$12$2Mx9Qr7qBv/M8Bu30/6yuuKXsfXOTMvoFSVbzqVxDgPJy2TyyaHIS	\N	2024-05-08 15:06:24	2024-05-08 15:06:24	14	3	\N	t	1	\N
21	Marika Eka Yunika	labdlhkatingan@gmail.com	\N	$2y$12$e4YeeBxu0TgElhVMLWEu.O97VVDiUDo9Doa2b2DYazJl9p8u0HRqy	z2XDVJztWQXg6rqENg9Gurj6snfVK5XDdSAmiQy7Wu2r92v4e98WFVVUcZGk	2024-09-23 11:12:09	2024-09-23 11:12:09	16	20	\N	t	\N	\N
20	Kepala Bidang PBMD	bidpbmd@katingankab.go.id	\N	$2y$12$EyxoqdkvhDt.Lef2s9HY4e5tICz6Y7qwhoHp9uK2Zi1C7stenB8PS	7KLxZYlLejeQFKZ8QmFLU4ppqcrkEiQxxU9zYZbGF0g4KZUGvjuKIQXyMTEk	2024-05-08 15:12:16	2024-05-16 10:15:53	15	3	\N	t	1	20
1	Evelline Krst - Developer	ev.attoff@gmail.com	\N	$2y$12$1DOXS5iOTU6zei2de.8wPu6ZnNrz02Fx.91hjfgB4PEpXKpqyViRK	0c6Xy3goBP6s2iCIZf7f2KlRQRSLdCjcMDs8oG8IO0AX7h7KUFTbxE7bpjuT	2024-03-07 13:50:57	2024-03-07 13:50:57	1	1	\N	t	\N	\N
\.


--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 230
-- Name: dynamic_inputs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dynamic_inputs_id_seq', 10, true);


--
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 208
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3145 (class 0 OID 0)
-- Dependencies: 227
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 139, true);


--
-- TOC entry 3146 (class 0 OID 0)
-- Dependencies: 232
-- Name: keywords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.keywords_id_seq', 42, true);


--
-- TOC entry 3147 (class 0 OID 0)
-- Dependencies: 228
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_id_seq', 284, true);


--
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 217
-- Name: menu_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_actions_id_seq', 36, true);


--
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 213
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menus_id_seq', 8, true);


--
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 203
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 4, true);


--
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 223
-- Name: options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.options_id_seq', 38, true);


--
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 210
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 219
-- Name: role_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_permissions_id_seq', 266, true);


--
-- TOC entry 3154 (class 0 OID 0)
-- Dependencies: 218
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 16, true);


--
-- TOC entry 3155 (class 0 OID 0)
-- Dependencies: 221
-- Name: user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_groups_id_seq', 20, true);


--
-- TOC entry 3156 (class 0 OID 0)
-- Dependencies: 205
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 21, true);


--
-- TOC entry 2961 (class 2606 OID 16567)
-- Name: dynamic_inputs dynamic_inputs_for_file_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamic_inputs
    ADD CONSTRAINT dynamic_inputs_for_file_pkey PRIMARY KEY (id);


--
-- TOC entry 2934 (class 2606 OID 16419)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 2936 (class 2606 OID 16421)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 2959 (class 2606 OID 16551)
-- Name: file_sharings file_sharings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_sharings
    ADD CONSTRAINT file_sharings_pkey PRIMARY KEY (id);


--
-- TOC entry 2955 (class 2606 OID 16514)
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- TOC entry 2963 (class 2606 OID 16577)
-- Name: keywords keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keywords
    ADD CONSTRAINT keywords_pkey PRIMARY KEY (id);


--
-- TOC entry 2957 (class 2606 OID 16522)
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- TOC entry 2947 (class 2606 OID 16453)
-- Name: menu_actions menu_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_actions
    ADD CONSTRAINT menu_actions_pkey PRIMARY KEY (id);


--
-- TOC entry 2943 (class 2606 OID 16440)
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- TOC entry 2926 (class 2606 OID 16392)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2953 (class 2606 OID 16493)
-- Name: options options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);


--
-- TOC entry 2932 (class 2606 OID 16407)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 2938 (class 2606 OID 16432)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2940 (class 2606 OID 16435)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 2949 (class 2606 OID 16459)
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2945 (class 2606 OID 16447)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2951 (class 2606 OID 16474)
-- Name: user_groups user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2928 (class 2606 OID 16402)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 2930 (class 2606 OID 16400)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2941 (class 1259 OID 16433)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-10-22 15:40:32

--
-- PostgreSQL database dump complete
--

