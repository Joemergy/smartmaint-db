--
-- PostgreSQL database dump
--

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


--
-- TOC entry 5072 (class 0 OID 82745)
-- Dependencies: 241


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


--
-- TOC entry 5082 (class 0 OID 82830)
-- Dependencies: 251


--
-- TOC entry 5078 (class 0 OID 82787)
-- Dependencies: 247


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

