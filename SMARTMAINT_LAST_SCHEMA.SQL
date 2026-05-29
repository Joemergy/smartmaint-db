--
-- PostgreSQL database dump
--

\restrict QiWjqqDkh6USup5kObD5PZ0gQRAU0pQzn6vu99yqG1QiI1cWIzphiP6E42chJdi

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-05-21 17:40:54

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 74914)
-- Name: smartmaint; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA smartmaint;


ALTER SCHEMA smartmaint OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 260 (class 1259 OID 82908)
-- Name: demo_registros; Type: TABLE; Schema: smartmaint; Owner: postgres
--

CREATE TABLE smartmaint.demo_registros (
    id bigint NOT NULL,
    nombre_solicitante character varying(255),
    empresa_solicitada character varying(255),
    ip_solicitante character varying(255),
    fecha_solicitud timestamp without time zone
);


ALTER TABLE smartmaint.demo_registros OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 82907)
-- Name: demo_registros_id_seq; Type: SEQUENCE; Schema: smartmaint; Owner: postgres
--

CREATE SEQUENCE smartmaint.demo_registros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE smartmaint.demo_registros_id_seq OWNER TO postgres;

--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 259
-- Name: demo_registros_id_seq; Type: SEQUENCE OWNED BY; Schema: smartmaint; Owner: postgres
--

ALTER SEQUENCE smartmaint.demo_registros_id_seq OWNED BY smartmaint.demo_registros.id;


--
-- TOC entry 245 (class 1259 OID 82770)
-- Name: empresas; Type: TABLE; Schema: smartmaint; Owner: postgres
--

CREATE TABLE smartmaint.empresas (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    correo character varying(100) NOT NULL,
    sector character varying(50) NOT NULL,
    plan character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    activa boolean DEFAULT false NOT NULL,
    token character varying(255)
);


ALTER TABLE smartmaint.empresas OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 82769)
-- Name: empresas_id_seq; Type: SEQUENCE; Schema: smartmaint; Owner: postgres
--

CREATE SEQUENCE smartmaint.empresas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE smartmaint.empresas_id_seq OWNER TO postgres;

--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 244
-- Name: empresas_id_seq; Type: SEQUENCE OWNED BY; Schema: smartmaint; Owner: postgres
--

ALTER SEQUENCE smartmaint.empresas_id_seq OWNED BY smartmaint.empresas.id;


--
-- TOC entry 249 (class 1259 OID 82815)
-- Name: equipos; Type: TABLE; Schema: smartmaint; Owner: postgres
--

CREATE TABLE smartmaint.equipos (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL,
    tipo character varying(30),
    ubicacion character varying(50),
    categoria character varying(30),
    descripcion character varying(120),
    created_at timestamp without time zone DEFAULT now(),
    empresa_id bigint NOT NULL
);


ALTER TABLE smartmaint.equipos OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 82814)
-- Name: equipos_id_seq; Type: SEQUENCE; Schema: smartmaint; Owner: postgres
--

CREATE SEQUENCE smartmaint.equipos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE smartmaint.equipos_id_seq OWNER TO postgres;

--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 248
-- Name: equipos_id_seq; Type: SEQUENCE OWNED BY; Schema: smartmaint; Owner: postgres
--

ALTER SEQUENCE smartmaint.equipos_id_seq OWNED BY smartmaint.equipos.id;


--
-- TOC entry 239 (class 1259 OID 82735)
-- Name: flyway_schema_history; Type: TABLE; Schema: smartmaint; Owner: postgres
--

CREATE TABLE smartmaint.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE smartmaint.flyway_schema_history OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 82857)
-- Name: nota_tarea; Type: TABLE; Schema: smartmaint; Owner: postgres
--

CREATE TABLE smartmaint.nota_tarea (
    id bigint NOT NULL,
    tarea_id bigint NOT NULL,
    autor_id bigint,
    autor_nombre character varying(150),
    texto text NOT NULL,
    fecha_creacion timestamp without time zone NOT NULL
);


ALTER TABLE smartmaint.nota_tarea OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 82856)
-- Name: nota_tarea_id_seq; Type: SEQUENCE; Schema: smartmaint; Owner: postgres
--

CREATE SEQUENCE smartmaint.nota_tarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE smartmaint.nota_tarea_id_seq OWNER TO postgres;

--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 253
-- Name: nota_tarea_id_seq; Type: SEQUENCE OWNED BY; Schema: smartmaint; Owner: postgres
--

ALTER SEQUENCE smartmaint.nota_tarea_id_seq OWNED BY smartmaint.nota_tarea.id;


--
-- TOC entry 256 (class 1259 OID 82877)
-- Name: notificaciones; Type: TABLE; Schema: smartmaint; Owner: postgres
--

CREATE TABLE smartmaint.notificaciones (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    mensaje character varying(255) NOT NULL,
    fecha timestamp without time zone NOT NULL,
    leido boolean DEFAULT false NOT NULL
);


ALTER TABLE smartmaint.notificaciones OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 82876)
-- Name: notificaciones_id_seq; Type: SEQUENCE; Schema: smartmaint; Owner: postgres
--

CREATE SEQUENCE smartmaint.notificaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE smartmaint.notificaciones_id_seq OWNER TO postgres;

--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 255
-- Name: notificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: smartmaint; Owner: postgres
--

ALTER SEQUENCE smartmaint.notificaciones_id_seq OWNED BY smartmaint.notificaciones.id;


--
-- TOC entry 241 (class 1259 OID 82745)
-- Name: refresh_tokens; Type: TABLE; Schema: smartmaint; Owner: postgres
--

CREATE TABLE smartmaint.refresh_tokens (
    id bigint NOT NULL,
    token character varying(512) NOT NULL,
    correo character varying(150) NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    revoked boolean DEFAULT false NOT NULL
);


ALTER TABLE smartmaint.refresh_tokens OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 82744)
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: smartmaint; Owner: postgres
--

CREATE SEQUENCE smartmaint.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE smartmaint.refresh_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 240
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: smartmaint; Owner: postgres
--

ALTER SEQUENCE smartmaint.refresh_tokens_id_seq OWNED BY smartmaint.refresh_tokens.id;


--
-- TOC entry 243 (class 1259 OID 82761)
-- Name: roles; Type: TABLE; Schema: smartmaint; Owner: postgres
--

CREATE TABLE smartmaint.roles (
    id bigint NOT NULL,
    nombre character varying(20) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE smartmaint.roles OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 82760)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: smartmaint; Owner: postgres
--

CREATE SEQUENCE smartmaint.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE smartmaint.roles_id_seq OWNER TO postgres;

--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 242
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: smartmaint; Owner: postgres
--

ALTER SEQUENCE smartmaint.roles_id_seq OWNED BY smartmaint.roles.id;


--
-- TOC entry 252 (class 1259 OID 82848)
-- Name: tarea_archivos; Type: TABLE; Schema: smartmaint; Owner: postgres
--

CREATE TABLE smartmaint.tarea_archivos (
    tarea_id bigint NOT NULL,
    archivo character varying(255)
);


ALTER TABLE smartmaint.tarea_archivos OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 82891)
-- Name: tarea_audit_log; Type: TABLE; Schema: smartmaint; Owner: postgres
--

CREATE TABLE smartmaint.tarea_audit_log (
    id bigint NOT NULL,
    tarea_id bigint NOT NULL,
    actor_correo character varying(150),
    accion character varying(40) NOT NULL,
    estado_anterior character varying(30),
    estado_nuevo character varying(30),
    detalle character varying(500),
    creado_en timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE smartmaint.tarea_audit_log OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 82890)
-- Name: tarea_audit_log_id_seq; Type: SEQUENCE; Schema: smartmaint; Owner: postgres
--

CREATE SEQUENCE smartmaint.tarea_audit_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE smartmaint.tarea_audit_log_id_seq OWNER TO postgres;

--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 257
-- Name: tarea_audit_log_id_seq; Type: SEQUENCE OWNED BY; Schema: smartmaint; Owner: postgres
--

ALTER SEQUENCE smartmaint.tarea_audit_log_id_seq OWNED BY smartmaint.tarea_audit_log.id;


--
-- TOC entry 251 (class 1259 OID 82830)
-- Name: tareas; Type: TABLE; Schema: smartmaint; Owner: postgres
--

CREATE TABLE smartmaint.tareas (
    id bigint NOT NULL,
    estado character varying(20) NOT NULL,
    titulo character varying(100) NOT NULL,
    descripcion text,
    nota_tecnica text,
    fecha_inicio timestamp without time zone NOT NULL,
    fecha_cierre timestamp without time zone,
    categoria character varying(30),
    nombre_maquina character varying(50) NOT NULL,
    id_maquina character varying(255),
    ubicacion character varying(50),
    id_colaborador character varying(50),
    nombre_colaborador character varying(100),
    correo_colaborador character varying(100),
    grupal boolean,
    observaciones text,
    prioridad character varying(20),
    usuario_id bigint
);


ALTER TABLE smartmaint.tareas OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 82829)
-- Name: tareas_id_seq; Type: SEQUENCE; Schema: smartmaint; Owner: postgres
--

CREATE SEQUENCE smartmaint.tareas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE smartmaint.tareas_id_seq OWNER TO postgres;

--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 250
-- Name: tareas_id_seq; Type: SEQUENCE OWNED BY; Schema: smartmaint; Owner: postgres
--

ALTER SEQUENCE smartmaint.tareas_id_seq OWNED BY smartmaint.tareas.id;


--
-- TOC entry 247 (class 1259 OID 82787)
-- Name: usuarios; Type: TABLE; Schema: smartmaint; Owner: postgres
--

CREATE TABLE smartmaint.usuarios (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL,
    correo character varying(50) NOT NULL,
    contrasena character varying(255) NOT NULL,
    rol_id bigint NOT NULL,
    empresa_id bigint NOT NULL,
    activo boolean DEFAULT true NOT NULL,
    id_colaborador character varying(50) NOT NULL,
    cargo character varying(100) NOT NULL,
    area character varying(100) NOT NULL,
    telefono character varying(30) NOT NULL,
    fecha_ingreso date,
    direccion character varying(255),
    foto_perfil character varying(255),
    debe_cambiar_contrasena boolean DEFAULT false NOT NULL,
    demo boolean DEFAULT false NOT NULL,
    expira_en timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE smartmaint.usuarios OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 82786)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: smartmaint; Owner: postgres
--

CREATE SEQUENCE smartmaint.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE smartmaint.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 246
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: smartmaint; Owner: postgres
--

ALTER SEQUENCE smartmaint.usuarios_id_seq OWNED BY smartmaint.usuarios.id;


--
-- TOC entry 4861 (class 2604 OID 82911)
-- Name: demo_registros id; Type: DEFAULT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.demo_registros ALTER COLUMN id SET DEFAULT nextval('smartmaint.demo_registros_id_seq'::regclass);


--
-- TOC entry 4846 (class 2604 OID 82773)
-- Name: empresas id; Type: DEFAULT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.empresas ALTER COLUMN id SET DEFAULT nextval('smartmaint.empresas_id_seq'::regclass);


--
-- TOC entry 4853 (class 2604 OID 82818)
-- Name: equipos id; Type: DEFAULT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.equipos ALTER COLUMN id SET DEFAULT nextval('smartmaint.equipos_id_seq'::regclass);


--
-- TOC entry 4856 (class 2604 OID 82860)
-- Name: nota_tarea id; Type: DEFAULT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.nota_tarea ALTER COLUMN id SET DEFAULT nextval('smartmaint.nota_tarea_id_seq'::regclass);


--
-- TOC entry 4857 (class 2604 OID 82880)
-- Name: notificaciones id; Type: DEFAULT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.notificaciones ALTER COLUMN id SET DEFAULT nextval('smartmaint.notificaciones_id_seq'::regclass);


--
-- TOC entry 4842 (class 2604 OID 82748)
-- Name: refresh_tokens id; Type: DEFAULT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('smartmaint.refresh_tokens_id_seq'::regclass);


--
-- TOC entry 4845 (class 2604 OID 82764)
-- Name: roles id; Type: DEFAULT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.roles ALTER COLUMN id SET DEFAULT nextval('smartmaint.roles_id_seq'::regclass);


--
-- TOC entry 4859 (class 2604 OID 82894)
-- Name: tarea_audit_log id; Type: DEFAULT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.tarea_audit_log ALTER COLUMN id SET DEFAULT nextval('smartmaint.tarea_audit_log_id_seq'::regclass);


--
-- TOC entry 4855 (class 2604 OID 82833)
-- Name: tareas id; Type: DEFAULT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.tareas ALTER COLUMN id SET DEFAULT nextval('smartmaint.tareas_id_seq'::regclass);


--
-- TOC entry 4849 (class 2604 OID 82790)
-- Name: usuarios id; Type: DEFAULT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.usuarios ALTER COLUMN id SET DEFAULT nextval('smartmaint.usuarios_id_seq'::regclass);


--
-- TOC entry 5091 (class 0 OID 82908)
-- Dependencies: 260
-- Data for Name: demo_registros; Type: TABLE DATA; Schema: smartmaint; Owner: postgres
--

COPY smartmaint.demo_registros (id, nombre_solicitante, empresa_solicitada, ip_solicitante, fecha_solicitud) FROM stdin;
\.


--
-- TOC entry 5076 (class 0 OID 82770)
-- Dependencies: 245
-- Data for Name: empresas; Type: TABLE DATA; Schema: smartmaint; Owner: postgres
--

COPY smartmaint.empresas (id, nombre, correo, sector, plan, created_at, activa, token) FROM stdin;
2	Empresa Demo	demo@smartmaint.com	Tecnología	MENSUAL	2026-05-19 18:39:34.564888	t	\N
\.


--
-- TOC entry 5080 (class 0 OID 82815)
-- Dependencies: 249
-- Data for Name: equipos; Type: TABLE DATA; Schema: smartmaint; Owner: postgres
--

COPY smartmaint.equipos (id, nombre, tipo, ubicacion, categoria, descripcion, created_at, empresa_id) FROM stdin;
\.


--
-- TOC entry 5070 (class 0 OID 82735)
-- Dependencies: 239
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: smartmaint; Owner: postgres
--

COPY smartmaint.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	40	create refresh tokens	SQL	V40__create_refresh_tokens.sql	999391754	postgres	2026-05-19 17:30:01.807811	46	t
2	41	create schema	SQL	V41__create_schema.sql	-1137137503	postgres	2026-05-19 17:30:01.885886	20	t
3	42	create roles	SQL	V42__create_roles.sql	1870128679	postgres	2026-05-19 17:30:01.915988	9	t
4	43	create empresas	SQL	V43__create_empresas.sql	-174931429	postgres	2026-05-19 17:30:01.931939	12	t
5	44	create usuarios	SQL	V44__create_usuarios.sql	291411704	postgres	2026-05-19 17:30:01.950496	35	t
6	45	create equipos	SQL	V45__create_equipos.sql	-2094117628	postgres	2026-05-19 17:30:01.992385	8	t
7	46	create tareas	SQL	V46__create_tareas.sql	-1892123207	postgres	2026-05-19 17:30:02.006662	16	t
8	47	create tarea archivos	SQL	V47__create_tarea_archivos.sql	-499065695	postgres	2026-05-19 17:30:02.03357	2	t
9	48	create nota tarea	SQL	V48__create_nota_tarea.sql	-1350398143	postgres	2026-05-19 17:30:02.040887	8	t
10	49	create notificaciones	SQL	V49__create_notificaciones.sql	-1122216105	postgres	2026-05-19 17:30:02.056256	8	t
11	50	create tarea audit log	SQL	V50__create_tarea_audit_log.sql	-1024751893	postgres	2026-05-19 17:30:02.071337	10	t
12	51	create demo registros	SQL	V51__create_demo_registros.sql	536618010	postgres	2026-05-19 17:30:02.085895	9	t
\.


--
-- TOC entry 5085 (class 0 OID 82857)
-- Dependencies: 254
-- Data for Name: nota_tarea; Type: TABLE DATA; Schema: smartmaint; Owner: postgres
--

COPY smartmaint.nota_tarea (id, tarea_id, autor_id, autor_nombre, texto, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 5087 (class 0 OID 82877)
-- Dependencies: 256
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: smartmaint; Owner: postgres
--

COPY smartmaint.notificaciones (id, usuario_id, mensaje, fecha, leido) FROM stdin;
1	7	Se te asignó una nueva tarea #1: Generar cambios en formulas para optimizar el consumo y costo asociado a su usabilidad	2026-05-20 08:09:42.485132	f
2	7	Se te asignó una nueva tarea #2: Limpiar base de datos EXTERNALS	2026-05-20 08:12:24.595867	f
3	7	Se te asignó una nueva tarea #3: NA	2026-05-20 08:15:28.755505	f
4	7	Tu tarea #2 'Limpiar base de datos EXTERNALS' pasó de 'Pendiente' a 'Completado'	2026-05-20 08:50:07.379937	f
5	7	Tu tarea #2 'Limpiar base de datos EXTERNALS' pasó de 'Completado' a 'Archivado'	2026-05-20 08:50:11.163983	f
6	7	Tu tarea #1 'Generar cambios en formulas para optimizar el consumo y costo asociado a su usabilidad' pasó de 'Pendiente' a 'Archivado'	2026-05-20 08:50:19.41255	f
7	8	El colaborador Usuario cambió el estado de la tarea #3 'NA' de 'Completado' a 'Pendiente'	2026-05-20 15:58:45.44475	f
8	8	El colaborador Usuario cambió el estado de la tarea #3 'NA' de 'Pendiente' a 'En proceso'	2026-05-20 15:58:50.458463	f
9	8	El colaborador Usuario cambió el estado de la tarea #3 'NA' de 'En proceso' a 'Completado'	2026-05-20 15:58:54.430448	f
10	8	El colaborador Usuario cambió el estado de la tarea #3 'NA' de 'Completado' a 'Pendiente'	2026-05-20 15:58:56.355335	f
11	8	El colaborador Usuario cambió el estado de la tarea #3 'NA' de 'Pendiente' a 'En proceso'	2026-05-20 17:50:06.32692	f
12	8	El colaborador Usuario cambió el estado de la tarea #3 'NA' de 'En proceso' a 'Completado'	2026-05-20 17:50:09.886064	f
13	8	El colaborador Usuario cambió el estado de la tarea #3 'NA' de 'Completado' a 'En proceso'	2026-05-20 17:55:06.481439	f
14	8	El colaborador Usuario cambió el estado de la tarea #3 'NA' de 'En proceso' a 'Pendiente'	2026-05-20 17:55:07.786389	f
15	8	El colaborador Usuario cambió el estado de la tarea #3 'NA' de 'Pendiente' a 'En proceso'	2026-05-20 18:01:03.027404	f
16	8	El colaborador Usuario cambió el estado de la tarea #3 'NA' de 'En proceso' a 'Completado'	2026-05-20 18:01:05.234645	f
17	8	El colaborador Usuario cambió el estado de la tarea #3 'NA' de 'Completado' a 'Archivado'	2026-05-20 18:27:30.782719	f
18	7	Se te asignó una nueva tarea #4: Crear en Power Bi un reportes de ventas semanal con automatización	2026-05-20 18:30:45.367186	f
19	8	El colaborador Usuario cambió el estado de la tarea #4 'Crear en Power Bi un reportes de ventas semanal con automatización' de 'Pendiente' a 'En proceso'	2026-05-21 15:06:16.82909	f
20	8	El colaborador Usuario cambió el estado de la tarea #4 'Crear en Power Bi un reportes de ventas semanal con automatización' de 'Pendiente' a 'Completado'	2026-05-21 15:06:16.834088	f
\.


--
-- TOC entry 5072 (class 0 OID 82745)
-- Dependencies: 241
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: smartmaint; Owner: postgres
--

COPY smartmaint.refresh_tokens (id, token, correo, expires_at, created_at, revoked) FROM stdin;
1	8538be3d-c094-46cb-ae26-09f0781b2a4d	admin@smartmaint.com	2026-06-18 20:22:11.934775	2026-05-19 20:22:11.934775	f
2	5228e14b-af6f-43b1-a1e5-8804f6950dda	admin@smartmaint.com	2026-06-18 20:22:21.438952	2026-05-19 20:22:21.437959	f
3	114fae36-0f83-4a9f-b37d-68aee85acd0f	admin@smartmaint.com	2026-06-18 20:25:34.815807	2026-05-19 20:25:34.814809	f
4	1d3da7e6-d0a2-413a-8bf7-b9c576c6fe38	admin@smartmaint.com	2026-06-18 20:46:43.853363	2026-05-19 20:46:43.852361	f
5	728621d2-136c-43d4-b172-531282b52ab1	admin@smartmaint.com	2026-06-18 20:46:55.586847	2026-05-19 20:46:55.586847	f
6	81db142d-6ff9-4661-89fa-b36992960f1d	admin@smartmaint.com	2026-06-18 20:49:09.300336	2026-05-19 20:49:09.299331	f
7	5532f9dc-932d-4f61-963c-fefe95c2b716	admin@smartmaint.com	2026-06-18 20:49:24.838763	2026-05-19 20:49:24.837762	f
8	562f3fc3-80b7-4d82-8846-ab414ddf3ccc	admin@smartmaint.com	2026-06-18 20:49:54.115666	2026-05-19 20:49:54.115666	f
9	059002c5-360f-4017-a542-005350638b53	admin@smartmaint.com	2026-06-18 20:50:19.359789	2026-05-19 20:50:19.359789	f
10	8c9cc0dd-ff78-4b0c-991f-c62e4bd70346	admin@smartmaint.com	2026-06-18 20:50:25.570014	2026-05-19 20:50:25.570014	f
11	b4009308-0981-425a-8c0f-ae0f7f538480	admin@smartmaint.com	2026-06-18 20:50:35.627583	2026-05-19 20:50:35.627583	f
12	3a8f2c24-a649-40a1-8f7f-2275bde5850f	admin@smartmaint.com	2026-06-18 21:38:54.331553	2026-05-19 21:38:54.331553	f
13	add39c7c-7618-4126-a590-0ddd53bb9379	admin@smartmaint.com	2026-06-18 21:42:15.338529	2026-05-19 21:42:15.335529	f
15	a8e11779-abe8-4d6d-a121-046cefe93b21	admin@smartmaint.com	2026-06-18 22:47:26.434669	2026-05-19 22:47:26.433681	f
18	5f8d2440-25f1-4b8b-acf6-a7ed16063560	admin@smartmaint.com	2026-06-18 23:48:46.63268	2026-05-19 23:48:46.631679	f
52	64de7f77-1b5c-4a0f-abb1-2062e1cc7b31	admin@smartmaint.com	2026-06-19 08:08:32.224366	2026-05-20 08:08:32.224366	f
53	138d249c-e3c5-40b6-9414-f434a40f1fb5	admin@smartmaint.com	2026-06-19 08:29:06.912423	2026-05-20 08:29:06.906054	f
56	6b2850c4-0170-4c6f-88b6-f7f1d040e9bd	usuario@smartmaint.com	2026-06-19 11:57:56.902601	2026-05-20 11:57:56.9006	f
58	611e240d-789a-41fe-966f-ec955e3412e2	usuario@smartmaint.com	2026-06-19 12:05:10.738442	2026-05-20 12:05:10.738442	f
61	58c6ec19-1d73-4b47-9295-3f359321b51e	usuario@smartmaint.com	2026-06-19 12:33:15.138896	2026-05-20 12:33:15.138008	f
63	d15a36af-5c8d-4a30-8839-2a6d0b53329e	admin@smartmaint.com	2026-06-19 12:48:07.767325	2026-05-20 12:48:07.766327	f
64	cb07aa46-1b62-4dcf-93c8-f778a7b2fab2	usuario@smartmaint.com	2026-06-19 14:45:47.771598	2026-05-20 14:45:47.770598	f
65	7068fc94-a74d-4ba1-8f43-bbec8e329e48	usuario@smartmaint.com	2026-06-19 15:58:27.167734	2026-05-20 15:58:27.167734	f
66	b9cbe299-c876-4a6c-8b79-620efc8abdfd	admin@smartmaint.com	2026-06-19 16:18:21.024511	2026-05-20 16:18:20.988516	f
67	484dbd22-9947-4968-9a31-9de16acd64be	usuario@smartmaint.com	2026-06-19 16:45:01.380312	2026-05-20 16:45:01.376312	f
68	d6777ceb-6ee6-4e3a-a9d5-c719b6be9364	usuario@smartmaint.com	2026-06-19 16:48:07.066838	2026-05-20 16:48:07.066838	f
69	154738b1-7209-4460-9d3c-2b139b73f222	usuario@smartmaint.com	2026-06-19 17:43:24.558445	2026-05-20 17:43:24.557474	f
70	50c98100-8d9b-4271-96e1-d69b94d92f26	usuario@smartmaint.com	2026-06-19 17:58:31.832362	2026-05-20 17:58:31.832362	f
72	e6373b4e-1283-41db-ab94-03ce805567ae	admin@smartmaint.com	2026-06-19 18:28:17.648581	2026-05-20 18:28:17.647581	f
73	8c281f21-e541-4fe9-a132-7f13d668e224	usuario@smartmaint.com	2026-06-20 10:24:17.747904	2026-05-21 10:24:17.747904	t
74	57620a2c-2e09-4fbe-9ba9-324fd2150436	admin@smartmaint.com	2026-06-20 10:25:13.210389	2026-05-21 10:25:13.210389	f
75	1bf3ab7e-a0d7-4303-8822-40831b76fac1	usuario@smartmaint.com	2026-06-20 10:36:28.807271	2026-05-21 10:36:28.80527	f
76	7a6850e0-96a1-4278-b347-39189d9d44a8	usuario@smartmaint.com	2026-06-20 10:43:12.471859	2026-05-21 10:43:12.470857	f
77	14eec369-2880-4ddb-a826-767635658e2c	admin@smartmaint.com	2026-06-20 10:44:43.416398	2026-05-21 10:44:43.416398	f
78	6bf84c3b-aecd-47e9-8a41-7783b38cf278	usuario@smartmaint.com	2026-06-20 10:50:31.606778	2026-05-21 10:50:31.598767	t
79	9aa23624-a149-407b-9e4e-d354169d32a1	admin@smartmaint.com	2026-06-20 10:52:56.923825	2026-05-21 10:52:56.922824	f
80	aeb30451-7789-40ec-93ae-a38125d1f720	usuario@smartmaint.com	2026-06-20 12:45:13.536219	2026-05-21 12:45:13.534224	f
81	a90d929f-ba64-4c2d-a4e4-67596df14f85	usuario@smartmaint.com	2026-06-20 15:03:39.388663	2026-05-21 15:03:39.388663	f
82	a75b0e79-0b30-4ccc-993e-7518b31140bf	usuario@smartmaint.com	2026-06-20 15:20:04.489793	2026-05-21 15:20:04.489793	f
83	5036b770-434f-4241-b85e-683627ea09af	usuario@smartmaint.com	2026-06-20 17:08:23.836165	2026-05-21 17:08:23.831352	f
\.


--
-- TOC entry 5074 (class 0 OID 82761)
-- Dependencies: 243
-- Data for Name: roles; Type: TABLE DATA; Schema: smartmaint; Owner: postgres
--

COPY smartmaint.roles (id, nombre, created_at, updated_at) FROM stdin;
1	ADMIN	2026-05-19 18:08:40.871117	\N
2	SUPERADMIN	2026-05-19 18:40:02.969198	\N
3	USUARIO	2026-05-19 23:00:16.308688	2026-05-19 23:00:16.308688
\.


--
-- TOC entry 5083 (class 0 OID 82848)
-- Dependencies: 252
-- Data for Name: tarea_archivos; Type: TABLE DATA; Schema: smartmaint; Owner: postgres
--

COPY smartmaint.tarea_archivos (tarea_id, archivo) FROM stdin;
\.


--
-- TOC entry 5089 (class 0 OID 82891)
-- Dependencies: 258
-- Data for Name: tarea_audit_log; Type: TABLE DATA; Schema: smartmaint; Owner: postgres
--

COPY smartmaint.tarea_audit_log (id, tarea_id, actor_correo, accion, estado_anterior, estado_nuevo, detalle, creado_en) FROM stdin;
1	1		CREAR		Pendiente	Tarea creada	2026-05-20 08:09:42.469295
2	2		CREAR		Pendiente	Tarea creada	2026-05-20 08:12:24.589313
3	3		CREAR		Pendiente	Tarea creada	2026-05-20 08:15:28.743196
4	1		ACTUALIZAR	Pendiente	Pendiente	Actualizacion de campos de tarea	2026-05-20 08:16:02.495184
5	2	admin@smartmaint.com	CAMBIAR_ESTADO	Pendiente	Completado	Cambio de estado	2026-05-20 08:50:07.333402
6	2	admin@smartmaint.com	CAMBIAR_ESTADO	Completado	Archivado	Cambio de estado	2026-05-20 08:50:11.149961
7	1	admin@smartmaint.com	CAMBIAR_ESTADO	Pendiente	Archivado	Cambio de estado	2026-05-20 08:50:19.408032
8	3	usuario@smartmaint.com	CAMBIAR_ESTADO	Pendiente	En proceso	Cambio de estado	2026-05-20 10:10:47.524383
9	3	usuario@smartmaint.com	CAMBIAR_ESTADO	En proceso	Completado	Cambio de estado	2026-05-20 10:15:36.34962
10	3	usuario@smartmaint.com	CAMBIAR_ESTADO	Completado	Pendiente	Cambio de estado	2026-05-20 15:58:45.398731
11	3	usuario@smartmaint.com	CAMBIAR_ESTADO	Pendiente	En proceso	Cambio de estado	2026-05-20 15:58:50.441465
12	3	usuario@smartmaint.com	CAMBIAR_ESTADO	En proceso	Completado	Cambio de estado	2026-05-20 15:58:54.414438
13	3	usuario@smartmaint.com	CAMBIAR_ESTADO	Completado	Pendiente	Cambio de estado	2026-05-20 15:58:56.342332
14	3	usuario@smartmaint.com	CAMBIAR_ESTADO	Pendiente	En proceso	Cambio de estado	2026-05-20 17:50:06.127339
15	3	usuario@smartmaint.com	CAMBIAR_ESTADO	En proceso	Completado	Cambio de estado	2026-05-20 17:50:09.86368
16	3	usuario@smartmaint.com	CAMBIAR_ESTADO	Completado	En proceso	Cambio de estado	2026-05-20 17:55:06.430713
17	3	usuario@smartmaint.com	CAMBIAR_ESTADO	En proceso	Pendiente	Cambio de estado	2026-05-20 17:55:07.777983
18	3	usuario@smartmaint.com	CAMBIAR_ESTADO	Pendiente	En proceso	Cambio de estado	2026-05-20 18:01:02.924687
19	3	usuario@smartmaint.com	CAMBIAR_ESTADO	En proceso	Completado	Cambio de estado	2026-05-20 18:01:05.22114
20	3	usuario@smartmaint.com	CAMBIAR_ESTADO	Completado	Archivado	Cambio de estado	2026-05-20 18:27:30.680889
21	4		CREAR		Pendiente	Tarea creada	2026-05-20 18:30:45.357652
22	4	usuario@smartmaint.com	CAMBIAR_ESTADO	Pendiente	Completado	Cambio de estado	2026-05-21 15:06:16.092089
23	4	usuario@smartmaint.com	CAMBIAR_ESTADO	Pendiente	En proceso	Cambio de estado	2026-05-21 15:06:16.089089
\.


--
-- TOC entry 5082 (class 0 OID 82830)
-- Dependencies: 251
-- Data for Name: tareas; Type: TABLE DATA; Schema: smartmaint; Owner: postgres
--

COPY smartmaint.tareas (id, estado, titulo, descripcion, nota_tecnica, fecha_inicio, fecha_cierre, categoria, nombre_maquina, id_maquina, ubicacion, id_colaborador, nombre_colaborador, correo_colaborador, grupal, observaciones, prioridad, usuario_id) FROM stdin;
2	Archivado	Limpiar base de datos EXTERNALS	NA	NA	2026-05-20 13:15:00	\N	administrativo	NA	NA	NA	USR001	Usuario	usuario@smartmaint.com	f	NA	\N	\N
1	Archivado	Generar cambios en formulas para optimizar el consumo y costo asociado a su usabilidad	NA	GENERAR REPORTE	2026-05-20 13:30:00	\N	administrativo	NA	NA	NA	USR001	Usuario	usuario@smartmaint.com	f	NA	\N	\N
3	Archivado	NA	NA	NA	2026-05-20 13:31:00	\N	administrativo	NA	NA	NA	USR001	Usuario	usuario@smartmaint.com	f	NA	\N	\N
4	Completado	Crear en Power Bi un reportes de ventas semanal con automatización	Notificar cada uno de los cambios efectuados luego de la entrega del dashboard al jefe inmediato	NA	2026-05-21 23:30:00	\N	administrativo	NA	NA	NA	USR001	Usuario	usuario@smartmaint.com	f	NA	\N	\N
\.


--
-- TOC entry 5078 (class 0 OID 82787)
-- Dependencies: 247
-- Data for Name: usuarios; Type: TABLE DATA; Schema: smartmaint; Owner: postgres
--

COPY smartmaint.usuarios (id, nombre, correo, contrasena, rol_id, empresa_id, activo, id_colaborador, cargo, area, telefono, fecha_ingreso, direccion, foto_perfil, debe_cambiar_contrasena, demo, expira_en, created_at, updated_at) FROM stdin;
5	Administrador	admin@smartmaint.com	$2a$12$1mjKFNQaLIVJu8xNqxcIfuFrhZYbIXTl5o3V/vFvOvpTC4zM93ZV6	2	2	t	ADM001	SUPER ADMIN	TI	3000000000	\N	\N	\N	f	f	\N	2026-05-19 18:40:41.47531	2026-05-19 18:43:13.307528
7	Usuario	usuario@smartmaint.com	$2a$12$1mjKFNQaLIVJu8xNqxcIfuFrhZYbIXTl5o3V/vFvOvpTC4zM93ZV6	3	2	t	USR001	OPERARIO	Mantenimiento	3000000002	\N	\N	\N	f	f	\N	2026-05-19 23:06:16.786416	2026-05-19 23:06:16.786416
8	Administrador General	admin_general@smartmaint.com	$2a$10$hashDeTuPasswordEnBCrypt	1	2	t	ADM002	ADMIN	TI	3000000001	\N	\N	\N	f	f	\N	2026-05-20 13:12:30.773841	\N
\.


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 259
-- Name: demo_registros_id_seq; Type: SEQUENCE SET; Schema: smartmaint; Owner: postgres
--

SELECT pg_catalog.setval('smartmaint.demo_registros_id_seq', 1, false);


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 244
-- Name: empresas_id_seq; Type: SEQUENCE SET; Schema: smartmaint; Owner: postgres
--

SELECT pg_catalog.setval('smartmaint.empresas_id_seq', 2, true);


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 248
-- Name: equipos_id_seq; Type: SEQUENCE SET; Schema: smartmaint; Owner: postgres
--

SELECT pg_catalog.setval('smartmaint.equipos_id_seq', 1, false);


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 253
-- Name: nota_tarea_id_seq; Type: SEQUENCE SET; Schema: smartmaint; Owner: postgres
--

SELECT pg_catalog.setval('smartmaint.nota_tarea_id_seq', 1, false);


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 255
-- Name: notificaciones_id_seq; Type: SEQUENCE SET; Schema: smartmaint; Owner: postgres
--

SELECT pg_catalog.setval('smartmaint.notificaciones_id_seq', 20, true);


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 240
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: smartmaint; Owner: postgres
--

SELECT pg_catalog.setval('smartmaint.refresh_tokens_id_seq', 83, true);


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 242
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: smartmaint; Owner: postgres
--

SELECT pg_catalog.setval('smartmaint.roles_id_seq', 3, true);


--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 257
-- Name: tarea_audit_log_id_seq; Type: SEQUENCE SET; Schema: smartmaint; Owner: postgres
--

SELECT pg_catalog.setval('smartmaint.tarea_audit_log_id_seq', 23, true);


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 250
-- Name: tareas_id_seq; Type: SEQUENCE SET; Schema: smartmaint; Owner: postgres
--

SELECT pg_catalog.setval('smartmaint.tareas_id_seq', 4, true);


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 246
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: smartmaint; Owner: postgres
--

SELECT pg_catalog.setval('smartmaint.usuarios_id_seq', 8, true);


--
-- TOC entry 4914 (class 2606 OID 82915)
-- Name: demo_registros demo_registros_pkey; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.demo_registros
    ADD CONSTRAINT demo_registros_pkey PRIMARY KEY (id);


--
-- TOC entry 4877 (class 2606 OID 82783)
-- Name: empresas empresas_correo_key; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.empresas
    ADD CONSTRAINT empresas_correo_key UNIQUE (correo);


--
-- TOC entry 4879 (class 2606 OID 82781)
-- Name: empresas empresas_nombre_key; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.empresas
    ADD CONSTRAINT empresas_nombre_key UNIQUE (nombre);


--
-- TOC entry 4881 (class 2606 OID 82779)
-- Name: empresas empresas_pkey; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (id);


--
-- TOC entry 4883 (class 2606 OID 82785)
-- Name: empresas empresas_token_key; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.empresas
    ADD CONSTRAINT empresas_token_key UNIQUE (token);


--
-- TOC entry 4893 (class 2606 OID 82821)
-- Name: equipos equipos_pkey; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.equipos
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (id);


--
-- TOC entry 4863 (class 2606 OID 82742)
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 4905 (class 2606 OID 82864)
-- Name: nota_tarea nota_tarea_pkey; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.nota_tarea
    ADD CONSTRAINT nota_tarea_pkey PRIMARY KEY (id);


--
-- TOC entry 4908 (class 2606 OID 82883)
-- Name: notificaciones notificaciones_pkey; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 4869 (class 2606 OID 82754)
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4871 (class 2606 OID 82756)
-- Name: refresh_tokens refresh_tokens_token_key; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_key UNIQUE (token);


--
-- TOC entry 4873 (class 2606 OID 82768)
-- Name: roles roles_nombre_key; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.roles
    ADD CONSTRAINT roles_nombre_key UNIQUE (nombre);


--
-- TOC entry 4875 (class 2606 OID 82766)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4912 (class 2606 OID 82899)
-- Name: tarea_audit_log tarea_audit_log_pkey; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.tarea_audit_log
    ADD CONSTRAINT tarea_audit_log_pkey PRIMARY KEY (id);


--
-- TOC entry 4902 (class 2606 OID 82837)
-- Name: tareas tareas_pkey; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.tareas
    ADD CONSTRAINT tareas_pkey PRIMARY KEY (id);


--
-- TOC entry 4895 (class 2606 OID 82823)
-- Name: equipos uk_equipo_empresa_nombre; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.equipos
    ADD CONSTRAINT uk_equipo_empresa_nombre UNIQUE (empresa_id, nombre);


--
-- TOC entry 4887 (class 2606 OID 82799)
-- Name: usuarios usuarios_correo_key; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);


--
-- TOC entry 4889 (class 2606 OID 82801)
-- Name: usuarios usuarios_id_colaborador_key; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.usuarios
    ADD CONSTRAINT usuarios_id_colaborador_key UNIQUE (id_colaborador);


--
-- TOC entry 4891 (class 2606 OID 82797)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4864 (class 1259 OID 82743)
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: smartmaint; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON smartmaint.flyway_schema_history USING btree (success);


--
-- TOC entry 4903 (class 1259 OID 82875)
-- Name: idx_nota_tarea_tarea_fecha; Type: INDEX; Schema: smartmaint; Owner: postgres
--

CREATE INDEX idx_nota_tarea_tarea_fecha ON smartmaint.nota_tarea USING btree (tarea_id, fecha_creacion);


--
-- TOC entry 4906 (class 1259 OID 82889)
-- Name: idx_notificaciones_usuario_leido_fecha; Type: INDEX; Schema: smartmaint; Owner: postgres
--

CREATE INDEX idx_notificaciones_usuario_leido_fecha ON smartmaint.notificaciones USING btree (usuario_id, leido, fecha DESC);


--
-- TOC entry 4865 (class 1259 OID 82758)
-- Name: idx_rt_correo; Type: INDEX; Schema: smartmaint; Owner: postgres
--

CREATE INDEX idx_rt_correo ON smartmaint.refresh_tokens USING btree (correo);


--
-- TOC entry 4866 (class 1259 OID 82759)
-- Name: idx_rt_expires; Type: INDEX; Schema: smartmaint; Owner: postgres
--

CREATE INDEX idx_rt_expires ON smartmaint.refresh_tokens USING btree (expires_at);


--
-- TOC entry 4867 (class 1259 OID 82757)
-- Name: idx_rt_token; Type: INDEX; Schema: smartmaint; Owner: postgres
--

CREATE INDEX idx_rt_token ON smartmaint.refresh_tokens USING btree (token);


--
-- TOC entry 4909 (class 1259 OID 82906)
-- Name: idx_tarea_audit_creado_en; Type: INDEX; Schema: smartmaint; Owner: postgres
--

CREATE INDEX idx_tarea_audit_creado_en ON smartmaint.tarea_audit_log USING btree (creado_en DESC);


--
-- TOC entry 4910 (class 1259 OID 82905)
-- Name: idx_tarea_audit_tarea_id; Type: INDEX; Schema: smartmaint; Owner: postgres
--

CREATE INDEX idx_tarea_audit_tarea_id ON smartmaint.tarea_audit_log USING btree (tarea_id);


--
-- TOC entry 4896 (class 1259 OID 82844)
-- Name: idx_tareas_correo_colaborador; Type: INDEX; Schema: smartmaint; Owner: postgres
--

CREATE INDEX idx_tareas_correo_colaborador ON smartmaint.tareas USING btree (correo_colaborador);


--
-- TOC entry 4897 (class 1259 OID 82843)
-- Name: idx_tareas_estado; Type: INDEX; Schema: smartmaint; Owner: postgres
--

CREATE INDEX idx_tareas_estado ON smartmaint.tareas USING btree (estado);


--
-- TOC entry 4898 (class 1259 OID 82846)
-- Name: idx_tareas_fecha_cierre; Type: INDEX; Schema: smartmaint; Owner: postgres
--

CREATE INDEX idx_tareas_fecha_cierre ON smartmaint.tareas USING btree (fecha_cierre DESC);


--
-- TOC entry 4899 (class 1259 OID 82845)
-- Name: idx_tareas_fecha_inicio; Type: INDEX; Schema: smartmaint; Owner: postgres
--

CREATE INDEX idx_tareas_fecha_inicio ON smartmaint.tareas USING btree (fecha_inicio DESC);


--
-- TOC entry 4900 (class 1259 OID 82847)
-- Name: idx_tareas_usuario_id; Type: INDEX; Schema: smartmaint; Owner: postgres
--

CREATE INDEX idx_tareas_usuario_id ON smartmaint.tareas USING btree (usuario_id);


--
-- TOC entry 4884 (class 1259 OID 82813)
-- Name: idx_usuarios_demo_expira_en; Type: INDEX; Schema: smartmaint; Owner: postgres
--

CREATE INDEX idx_usuarios_demo_expira_en ON smartmaint.usuarios USING btree (demo, expira_en);


--
-- TOC entry 4885 (class 1259 OID 82812)
-- Name: idx_usuarios_empresa_rol; Type: INDEX; Schema: smartmaint; Owner: postgres
--

CREATE INDEX idx_usuarios_empresa_rol ON smartmaint.usuarios USING btree (empresa_id, rol_id);


--
-- TOC entry 4917 (class 2606 OID 82824)
-- Name: equipos fk_equipos_empresa; Type: FK CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.equipos
    ADD CONSTRAINT fk_equipos_empresa FOREIGN KEY (empresa_id) REFERENCES smartmaint.empresas(id);


--
-- TOC entry 4920 (class 2606 OID 82870)
-- Name: nota_tarea fk_nota_tarea_autor; Type: FK CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.nota_tarea
    ADD CONSTRAINT fk_nota_tarea_autor FOREIGN KEY (autor_id) REFERENCES smartmaint.usuarios(id);


--
-- TOC entry 4921 (class 2606 OID 82865)
-- Name: nota_tarea fk_nota_tarea_tarea; Type: FK CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.nota_tarea
    ADD CONSTRAINT fk_nota_tarea_tarea FOREIGN KEY (tarea_id) REFERENCES smartmaint.tareas(id);


--
-- TOC entry 4922 (class 2606 OID 82884)
-- Name: notificaciones fk_notificaciones_usuario; Type: FK CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.notificaciones
    ADD CONSTRAINT fk_notificaciones_usuario FOREIGN KEY (usuario_id) REFERENCES smartmaint.usuarios(id);


--
-- TOC entry 4919 (class 2606 OID 82851)
-- Name: tarea_archivos fk_tarea_archivos_tarea; Type: FK CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.tarea_archivos
    ADD CONSTRAINT fk_tarea_archivos_tarea FOREIGN KEY (tarea_id) REFERENCES smartmaint.tareas(id);


--
-- TOC entry 4923 (class 2606 OID 82900)
-- Name: tarea_audit_log fk_tarea_audit_log_tarea; Type: FK CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.tarea_audit_log
    ADD CONSTRAINT fk_tarea_audit_log_tarea FOREIGN KEY (tarea_id) REFERENCES smartmaint.tareas(id);


--
-- TOC entry 4918 (class 2606 OID 82838)
-- Name: tareas fk_tareas_usuario; Type: FK CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.tareas
    ADD CONSTRAINT fk_tareas_usuario FOREIGN KEY (usuario_id) REFERENCES smartmaint.usuarios(id);


--
-- TOC entry 4915 (class 2606 OID 82807)
-- Name: usuarios fk_usuarios_empresa; Type: FK CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.usuarios
    ADD CONSTRAINT fk_usuarios_empresa FOREIGN KEY (empresa_id) REFERENCES smartmaint.empresas(id);


--
-- TOC entry 4916 (class 2606 OID 82802)
-- Name: usuarios fk_usuarios_rol; Type: FK CONSTRAINT; Schema: smartmaint; Owner: postgres
--

ALTER TABLE ONLY smartmaint.usuarios
    ADD CONSTRAINT fk_usuarios_rol FOREIGN KEY (rol_id) REFERENCES smartmaint.roles(id);


-- Completed on 2026-05-21 17:40:55

--
-- PostgreSQL database dump complete
--

\unrestrict QiWjqqDkh6USup5kObD5PZ0gQRAU0pQzn6vu99yqG1QiI1cWIzphiP6E42chJdi

