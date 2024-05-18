--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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

--
-- Name: sos_rs_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "sos_rs_db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE "sos_rs_db" OWNER TO postgres;

\connect -reuse-previous=on "dbname='sos_rs_db'"

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: AccessLevel; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."AccessLevel" AS ENUM (
    'User',
    'Staff',
    'DistributionCenter',
    'Admin'
);


ALTER TYPE public."AccessLevel" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: category_supplies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_supplies (
    id text NOT NULL,
    name text NOT NULL,
    created_at character varying(32) NOT NULL,
    updated_at character varying(32)
);


ALTER TABLE public.category_supplies OWNER TO postgres;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id text NOT NULL,
    user_id text NOT NULL,
    ip text,
    user_agent text,
    active boolean DEFAULT true NOT NULL,
    created_at character varying(32) NOT NULL,
    updated_at character varying(32)
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: shelter_managers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shelter_managers (
    shelter_id text NOT NULL,
    user_id text NOT NULL,
    created_at character varying(32) NOT NULL,
    updated_at character varying(32)
);


ALTER TABLE public.shelter_managers OWNER TO postgres;

--
-- Name: shelter_supplies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shelter_supplies (
    shelter_id text NOT NULL,
    supply_id text NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    created_at character varying(32) NOT NULL,
    updated_at character varying(32),
    quantity integer
);


ALTER TABLE public.shelter_supplies OWNER TO postgres;

--
-- Name: shelters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shelters (
    id text NOT NULL,
    pix text,
    address text NOT NULL,
    pet_friendly boolean,
    sheltered_people integer,
    capacity integer,
    contact text,
    created_at character varying(32) NOT NULL,
    updated_at character varying(32),
    name text NOT NULL,
    priority_sum integer DEFAULT 0 NOT NULL,
    latitude double precision,
    longitude double precision,
    verified boolean DEFAULT false NOT NULL,
    city text,
    neighbourhood text,
    street text,
    street_number text,
    zip_code text
);


ALTER TABLE public.shelters OWNER TO postgres;

--
-- Name: supplies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplies (
    id text NOT NULL,
    supply_category_id text NOT NULL,
    name text NOT NULL,
    created_at character varying(32) NOT NULL,
    updated_at character varying(32)
);


ALTER TABLE public.supplies OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id text NOT NULL,
    name text NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    phone text NOT NULL,
    created_at character varying(32) NOT NULL,
    updated_at character varying(32),
    "accessLevel" public."AccessLevel" DEFAULT 'User'::public."AccessLevel" NOT NULL,
    "lastName" text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
46c9f6d8-b1fa-4cad-b084-c394c1103816	c8b1aed5a604b5f70b7440c98703857c365836ec548b6207adf903c2b10a793c	2024-05-07 20:52:15.3848+00	20240507205058_	\N	\N	2024-05-07 20:52:14.752248+00	1
c32e2d26-2a88-4e86-9a5f-a71cc6835b15	bf6e10172d502fbb5e0f47bfc1c625ca9aa98f4693f02ae3e78e911ea26c88c2	2024-05-05 20:22:17.431799+00	20240505182421_	\N	\N	2024-05-05 20:22:16.656578+00	1
de1113f6-6956-4bbb-be3a-006df5d471f6	e331666e7c4172383cbae7c33f491c106bb463398f642fdc8a33236d49a354a5	2024-05-05 20:22:18.279294+00	20240505185353_	\N	\N	2024-05-05 20:22:17.672062+00	1
49230062-1cce-43af-b064-f860ad5e58b4	ba809dc40dfa8e87ef0a0ade7486fa798a2f4cdbfde26c83812434080ffa766b	2024-05-05 20:22:19.140315+00	20240505185534_	\N	\N	2024-05-05 20:22:18.523559+00	1
ebc8b56d-8830-4cbc-bfd7-41e1a8272698	a0605cded7bdd04d0b01de01ad3fdc50325cbfc8490bae7945890d6ceeb23bfb	2024-05-05 20:22:20.703463+00	20240505190155_	\N	\N	2024-05-05 20:22:19.401583+00	1
61c031f3-dea8-4d01-9817-5f1bd7a7a7a2	03488ccbbafc2b3deb2577b10676cfd45c9568d5f0d897924ef08083e6541ce6	2024-05-05 20:22:21.5937+00	20240505191728_	\N	\N	2024-05-05 20:22:20.981103+00	1
f8586b60-915b-42ac-89c0-0babe258f2ae	5e72eaf177fe5b8226d367c357eeb963a39b5a60234dfa68fde9b494d90f0ade	2024-05-05 20:22:22.44449+00	20240505201711_	\N	\N	2024-05-05 20:22:21.836043+00	1
096073cd-fef1-4746-8b0f-0c3e7fcd321b	797a68ad2122eefd89adaa253dd7f400f624e195632d9385ee6bb95469a43a52	2024-05-05 20:32:02.271858+00	20240505203201_	\N	\N	2024-05-05 20:32:01.662749+00	1
9c95b187-db79-499d-8190-c9e796a80298	44d800d051566b499ccffb4e4295ba13385862a1cb8aae391040e4bc793346e9	2024-05-05 22:20:49.258657+00	20240505222048_	\N	\N	2024-05-05 22:20:48.643942+00	1
c919ae19-6a32-4baf-8f79-ce0903214d47	72ffaab9d43d1a6992cee20847ff8a47cd2e73ac79f6e18c2d846741b3450aff	2024-05-05 22:23:19.772977+00	20240505222318_	\N	\N	2024-05-05 22:23:19.157387+00	1
7428d514-1f2e-49cf-a654-7479e5abbf15	1e53cc353bcc7f971c7b00915eaecef56c80b26bf87249a112419406f6238a59	2024-05-05 23:32:31.056485+00	20240505224712_	\N	\N	2024-05-05 23:32:31.04685+00	1
49852d2a-8ca5-4b21-8414-969ccd7997d8	59bc37eb4d6004154538c9b838b475a7b87b298e7a77965fd30f84fa23a7d502	2024-05-05 23:32:31.065232+00	20240505225104_20240505222318	\N	\N	2024-05-05 23:32:31.057939+00	1
963af559-0efe-4730-8ae2-7806dd51ddf3	f4a3543948a2d97a169859bc21722f472efe714784a8490fa6ebfbe1c8001e5f	2024-05-06 02:56:06.420701+00	20240506015214_	\N	\N	2024-05-06 02:56:05.808613+00	1
5989ce82-3898-4048-b954-d237e4e047f7	4f4f1ec52fa8dbc4b6c750eceba181324a52f074494803f85de8b0a7273855be	2024-05-06 02:56:07.287433+00	20240506021537_	\N	\N	2024-05-06 02:56:06.668098+00	1
3b71321e-f5fc-442e-8559-4f8e3c5bb79d	58383ab8e1dec08ab30dec98485ba408225a22107fff4745aefbc1168f182f3a	2024-05-06 20:14:26.109428+00	20240506195247_	\N	\N	2024-05-06 20:14:25.497555+00	1
3c3c6995-9d75-402a-b83b-78a9137a10a5	f8932266f963540cfd2f4125333fe1cc3977a5c97b200f91919eee11d76d878b	2024-05-14 03:31:07.662342+00	20240512005246_	\N	\N	2024-05-14 03:31:07.646932+00	1
f73cd1ed-a4f6-4684-8cee-a6d04eeb7cd1	ae49a07be38b3fe5f46a256884a00ef7282ac902a5a86a23f632acdb98b392e7	2024-05-08 16:16:12.773259+00	20240507221950_	\N	\N	2024-05-08 16:16:12.147752+00	1
f2a3063f-0202-42f4-a3ee-c0245b7da718	84793831ae6d961a645b723faf8a0312f25e2f8bab459cf47696241368aa60ff	2024-05-08 16:16:13.646475+00	20240508022250_	\N	\N	2024-05-08 16:16:13.023073+00	1
672d83b9-d210-45fd-97d9-ed38e82dfb4e	fee95684300f7e10edbbcec94ee0d43704c4b640bd46244b28e58b38f97eccff	2024-05-08 16:16:14.527603+00	20240508041443_	\N	\N	2024-05-08 16:16:13.897884+00	1
36d67440-3fad-4a69-b48e-f8aa48c3fb54	1e53cc353bcc7f971c7b00915eaecef56c80b26bf87249a112419406f6238a59	2024-05-08 16:16:15.407624+00	20240508050213_	\N	\N	2024-05-08 16:16:14.776221+00	1
6eb4f6df-f362-43fc-a827-ddf3cbf1ccc6	59bc37eb4d6004154538c9b838b475a7b87b298e7a77965fd30f84fa23a7d502	2024-05-08 16:16:16.281169+00	20240508150340_	\N	\N	2024-05-08 16:16:15.658073+00	1
b1592165-e1ad-4cb0-b146-de7320e584cf	8a9306b1c14b59dd3d156d487bc8a52b2a22b32f35781bca71b0ac5e8309e8de	2024-05-08 19:40:09.371735+00	20240508193500_	\N	\N	2024-05-08 19:40:09.366882+00	1
68513453-6506-41fa-9a61-f09225a9a0e7	2868b0e2e187860c495ad8205d5bfed81b6611970394ddf32e591aae06d1bc66	2024-05-11 07:20:00.593597+00	20240509235041_	\N	\N	2024-05-11 07:20:00.584234+00	1
1953feb0-e176-4b92-bc67-6a844f0715d4	e98fae8e9c8742addf0d9c23bd940d4b3a07eb202580af065e5a849364715cdf	2024-05-11 07:20:00.612695+00	20240510225124_	\N	\N	2024-05-11 07:20:00.596504+00	1
0fbf9119-52ac-4b6d-9738-a006e009fda9	3fb6ff2216dbc51d2aae5c32e2cdd87554bf636a29fd16c7b0db6b55adb2100f	2024-05-11 07:20:00.639406+00	20240511054108_	\N	\N	2024-05-11 07:20:00.621067+00	1
\.


--
-- Data for Name: category_supplies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category_supplies (id, name, created_at, updated_at) FROM stdin;
5c9b6767-5310-461b-977b-906fe16370ae	Medicamentos	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
03fdb0f2-6b50-4895-b970-5793cad80c86	Cuidados com Animais	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
b3a81a9d-a964-4413-9a33-974a3b4673d1	Especialistas e Profissionais	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
60d6808e-9d13-484d-84a4-2ca35d42b3a6	Acomodações e Descanso	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
fd1f74c4-6723-4ffe-8657-773a943e65c4	Equipamentos de Emergência	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntariado	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
037ac262-4f35-42e0-83e1-4cdcceedb39c	Itens Descartáveis	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
718d5be3-69c3-4216-97f1-12b690d0eb97	Higiene Pessoal	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Alimentos e Água	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
5d50d3cf-4e36-4639-813d-d43de8886ac8	Material de Limpeza	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Vestuário	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
05583098-5f2e-44e2-b874-452ec86d9d3e	Veículos de Resgate e Transporte	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
8200759f-067f-4fda-8947-ff5896929fcd	Cosméticos	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
80111414-1c1d-4566-ba6f-1373a53997ac	Serviços	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
d7627977-1c42-48a8-abe5-45422ddc97df	Proteção para crianças	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Outros	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
be0e4018-ca46-44cd-b814-7681ba98c51a	Mobílias	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
4f95853f-d5e1-487d-8086-6ddfaf2bbab7	Eletrodomésticos e Eletrônicos	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
c117dd37-82ab-43a6-bf66-d97acef97f6e	Entretenimento	2024-05-05T00:00:00.000Z	2024-05-05T00:00:00.000Z
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip, user_agent, active, created_at, updated_at) FROM stdin;
bf4d3674-55aa-4000-8c7f-4fbd30fa5fab	e0306bc0-8c29-429a-bbd2-384f48d4f993	170.254.163.15	insomnia/2023.5.8	f	2024-05-05T22:05:22.444Z	2024-05-05T22:06:32.598Z
012eb684-199a-46b9-b91d-a9fe23a2a8b8	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	insomnia/2023.5.8	f	2024-05-05T22:06:32.601Z	2024-05-06T03:08:34.356Z
6df8301d-82b8-486f-9af0-e8b91ec531c8	e0306bc0-8c29-429a-bbd2-384f48d4f993	170.254.163.15	insomnia/2023.5.8	f	2024-05-06T03:08:34.360Z	2024-05-06T03:10:00.908Z
3bf10d5a-98f8-4581-ad1f-7bef6e77f84e	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	insomnia/2023.5.8	f	2024-05-06T03:10:00.911Z	2024-05-06T15:42:05.794Z
5b57e32b-f18e-428d-91dc-8e0e5cf437c7	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	insomnia/2023.5.8	f	2024-05-06T15:42:05.798Z	2024-05-06T18:06:09.741Z
32cf5965-4329-49a6-8276-9e6697a676f9	e82f476a-1574-4dd2-a4c4-1c1f0117db12	191.57.26.196	insomnia/2023.5.8	f	2024-05-06T18:06:09.744Z	2024-05-07T01:03:55.645Z
e3179211-2b57-4a75-9f17-2cab508e36f1	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	insomnia/2023.5.8	f	2024-05-07T01:03:55.649Z	2024-05-07T01:11:22.228Z
40e585ac-6384-4b18-83f9-ee444547e069	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	insomnia/2023.5.8	f	2024-05-07T01:11:22.232Z	2024-05-07T16:14:38.161Z
0ab6c8c9-ebf7-4182-ab8f-559efeaeedc8	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	insomnia/2023.5.8	f	2024-05-07T16:14:38.165Z	2024-05-08T16:30:28.002Z
060b6423-29d7-43f8-a937-96e7897a8d6a	e0306bc0-8c29-429a-bbd2-384f48d4f993	170.254.163.15	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-08T16:30:28.007Z	2024-05-08T16:30:49.333Z
ba9979e3-e4f9-489a-9267-6e5ebed2b5a3	90d1d707-3b34-4c9d-a025-b26dcc035304	179.105.123.239	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-08T16:30:49.337Z	2024-05-08T16:34:57.998Z
bfded2e2-0e7b-41ed-8e1e-81e452779d2f	90d1d707-3b34-4c9d-a025-b26dcc035304	189.47.42.201	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:125.0) Gecko/20100101 Firefox/125.0	f	2024-05-08T16:34:58.004Z	2024-05-08T16:48:24.920Z
f1ab5ffe-f8ea-47fb-b8f8-f95d0d14719f	e82f476a-1574-4dd2-a4c4-1c1f0117db12	179.105.123.239	insomnia/2023.5.8	f	2024-05-08T16:48:24.923Z	2024-05-08T16:53:48.041Z
b5ad099b-6a12-4b1b-9b4c-7d612705676d	e82f476a-1574-4dd2-a4c4-1c1f0117db12	179.105.123.239	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-08T16:53:48.045Z	2024-05-08T16:54:12.058Z
2f74141e-151c-45a9-a2a7-cdbff57d13ce	90d1d707-3b34-4c9d-a025-b26dcc035304	189.47.42.201	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:125.0) Gecko/20100101 Firefox/125.0	f	2024-05-08T16:54:12.062Z	2024-05-08T22:04:11.701Z
7faae62d-c872-4778-bbee-7c4de0f0b9e4	29805419-78ec-435f-9fb3-41f3102d9b4d	186.210.88.123	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-08T22:04:11.705Z	2024-05-08T22:13:41.480Z
10e4b7ff-fca7-4d0b-b877-c140d942dd6b	29805419-78ec-435f-9fb3-41f3102d9b4d	186.210.88.123	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-08T22:13:41.484Z	2024-05-09T00:13:37.400Z
c215ee64-42d2-42c5-a8de-3437bce4458d	e82f476a-1574-4dd2-a4c4-1c1f0117db12	170.254.163.15	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-09T00:13:37.405Z	2024-05-09T00:14:22.067Z
e2426f51-419e-43ea-99fb-0755f0359eec	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-09T00:14:22.072Z	2024-05-09T00:14:49.151Z
685a8be6-b437-4282-913f-f1f34aa77813	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-09T00:14:49.154Z	2024-05-09T00:15:49.374Z
99e2567b-1810-4eda-8e68-2e25d7e86b38	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-09T00:15:49.378Z	2024-05-09T01:21:39.577Z
86270813-eed4-4d9d-97e2-6c08980effc2	e0306bc0-8c29-429a-bbd2-384f48d4f993	170.254.163.15	insomnia/2023.5.8	f	2024-05-09T01:21:39.582Z	2024-05-09T01:23:48.672Z
b5a08de2-0d5b-458f-be8e-d2ddce5dd537	493c1562-bfbb-416f-80fd-934170127c1e	170.254.163.15	insomnia/2023.5.8	f	2024-05-09T01:23:48.675Z	2024-05-09T01:25:02.070Z
38168d05-d731-4b72-86ae-30e404ff6d68	e0306bc0-8c29-429a-bbd2-384f48d4f993	170.254.163.15	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-09T01:25:02.083Z	2024-05-09T01:37:58.641Z
7aa0729d-52b7-4336-a153-0d0ad825e55d	493c1562-bfbb-416f-80fd-934170127c1e	177.193.246.40	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-09T01:37:58.644Z	2024-05-09T04:01:21.313Z
26c05068-4a25-4d90-a5c7-59b744090ca4	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-09T16:19:00.340Z	2024-05-09T17:56:21.823Z
585007ff-fb7f-4172-bccb-ca7bc27fc850	90d1d707-3b34-4c9d-a025-b26dcc035304	189.63.161.197	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-09T11:31:23.416Z	2024-05-09T16:19:00.331Z
a60e162c-46cf-4882-ac78-86769d77bdc3	e0306bc0-8c29-429a-bbd2-384f48d4f993	170.254.163.15	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-09T17:56:21.827Z	2024-05-10T13:22:52.780Z
8a5b02d1-bf6f-44f1-a55c-290a226c35d2	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-10T13:22:52.785Z	2024-05-10T14:05:25.536Z
c49b1edd-d958-4895-8667-d48ce9fc5607	493c1562-bfbb-416f-80fd-934170127c1e	186.214.113.216	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-10T14:05:25.543Z	2024-05-10T15:26:24.802Z
76737c68-ea0b-4901-8f0c-a7a14d21f70e	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-10T15:26:24.808Z	2024-05-10T18:40:00.315Z
1c6f52c7-68c4-4cff-ad49-8fd5c774a9e4	90d1d707-3b34-4c9d-a025-b26dcc035304	187.44.121.233	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:125.0) Gecko/20100101 Firefox/125.0	f	2024-05-10T18:40:00.327Z	2024-05-11T00:51:15.732Z
42acf8ac-965e-40b9-9949-03e9ea8dd565	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-11T00:51:15.736Z	2024-05-11T01:20:31.731Z
d7360d50-6de4-4cb5-a80d-8c7721b190b4	e0306bc0-8c29-429a-bbd2-384f48d4f993	170.239.192.50	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-11T01:20:31.739Z	2024-05-11T02:36:12.895Z
514e28b1-1cf1-4bea-b77f-e04a5ae0fb33	493c1562-bfbb-416f-80fd-934170127c1e	179.219.150.86	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1	f	2024-05-11T02:36:12.899Z	2024-05-11T07:21:59.195Z
5aaf37a7-fe6d-4af2-948e-afa7dc7724b3	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-11T07:21:59.204Z	2024-05-11T07:29:07.567Z
f15737be-6c43-4b6f-bede-80a4c41179f8	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-11T07:29:07.571Z	2024-05-11T07:35:26.221Z
212bd9a6-eed0-4e41-8ba9-c8fd7c564363	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-11T07:35:26.225Z	2024-05-11T12:40:35.734Z
7d798a1f-5004-4403-a0c1-6f82a10f9910	493c1562-bfbb-416f-80fd-934170127c1e	177.174.193.104	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1	f	2024-05-11T12:40:35.742Z	2024-05-11T13:31:31.898Z
89025c30-fb27-4e51-9445-4d5249174b12	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-11T13:31:31.902Z	2024-05-11T13:40:08.057Z
8443a775-d12f-4198-88db-436df3f97437	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-11T13:40:08.061Z	2024-05-11T13:43:17.267Z
d74d9c19-ad42-446c-b9b4-ed17c78130b3	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-11T13:43:17.270Z	2024-05-11T13:45:24.723Z
4d698dda-8e12-4e37-b840-cc82f3fe8259	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-11T13:45:24.728Z	2024-05-11T13:51:06.582Z
c68de713-a8d8-4fdc-997e-8a27bd7dd349	2a59c526-6ee4-4cb6-acbb-3d4968203153	152.243.166.180	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0	f	2024-05-11T13:51:06.586Z	2024-05-11T14:45:48.408Z
bc5f3a9e-a2e3-4537-84e1-af4ff7a3056b	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-11T14:45:48.414Z	2024-05-11T17:47:21.719Z
48ba173c-ae08-484f-a41b-e4173d6ec6cb	e0306bc0-8c29-429a-bbd2-384f48d4f993	170.254.163.15	insomnia/2023.5.8	f	2024-05-11T17:47:21.723Z	2024-05-11T17:52:32.740Z
48ad1665-0934-4011-9938-3d721fc73c46	a8a90d10-897f-4696-9be0-4943cd0dc63a	189.6.237.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-11T17:52:32.744Z	2024-05-11T17:54:32.453Z
75f49c96-75b6-4557-8e39-6cdc8088b733	e9095154-c23b-4b58-9bcd-d86b2f178d7a	170.254.163.15	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-11T17:54:32.455Z	2024-05-11T18:00:17.152Z
e9b2d5d4-86dc-4a37-b115-cae186d4b435	e9095154-c23b-4b58-9bcd-d86b2f178d7a	179.219.41.163	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-11T18:00:17.157Z	2024-05-11T18:03:56.514Z
5d06b230-46fd-4773-b4db-77f8abc338c4	a8a90d10-897f-4696-9be0-4943cd0dc63a	189.6.237.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-11T18:03:56.519Z	2024-05-11T19:10:17.309Z
983fec15-9cfa-425e-b0ed-87f8882fdb52	e0306bc0-8c29-429a-bbd2-384f48d4f993	170.254.163.15	insomnia/2023.5.8	f	2024-05-11T19:10:17.313Z	2024-05-11T19:15:39.543Z
ec1932c1-ee49-49fa-9bcb-ba033a1e234a	a8a90d10-897f-4696-9be0-4943cd0dc63a	189.6.237.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-11T19:15:39.550Z	2024-05-11T20:17:23.546Z
99bf7efc-8c7d-4061-b604-18752e599796	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-11T20:17:23.551Z	2024-05-11T20:19:20.221Z
f5410160-82ac-418f-b565-d327ecd5b62c	a8a90d10-897f-4696-9be0-4943cd0dc63a	189.6.237.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-11T20:19:20.226Z	2024-05-11T20:19:39.983Z
05042189-d864-4464-97b7-b36d9ac65ad8	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-11T20:19:39.987Z	2024-05-11T20:28:22.796Z
845f06c8-5565-44f2-bd52-90110f03af97	a8a90d10-897f-4696-9be0-4943cd0dc63a	189.6.237.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-11T20:28:22.800Z	2024-05-11T20:51:18.694Z
546ef350-bb44-4897-995a-f2edd2a20d6f	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-11T20:51:18.698Z	2024-05-11T20:55:21.618Z
069da14e-30a3-4b79-b9c6-08ce1558afba	a8a90d10-897f-4696-9be0-4943cd0dc63a	189.6.237.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-11T20:55:21.622Z	2024-05-11T20:55:50.406Z
3fff50d6-ae8d-4cba-b4b7-d388a6da10bc	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-11T20:55:50.412Z	2024-05-11T21:27:06.894Z
8dd7da3f-51ac-45f6-ae97-64e296d73bbc	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-11T21:27:06.899Z	2024-05-11T21:34:10.790Z
454df15c-eaad-4e6d-b888-22a1fa7f4b28	a8a90d10-897f-4696-9be0-4943cd0dc63a	189.6.237.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-11T21:34:10.794Z	2024-05-11T21:45:58.316Z
57b0593c-b8e5-41e1-8899-e678b91d73a9	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-11T21:45:58.322Z	2024-05-11T21:53:59.723Z
1f241b51-5066-41a2-a677-57f1ae9c93b3	a8a90d10-897f-4696-9be0-4943cd0dc63a	189.6.237.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-11T21:53:59.727Z	2024-05-11T22:19:36.330Z
a0b1a7bc-37bb-483d-b503-45d4ed2757ab	43287099-3523-4e0a-8919-cae4f31e221e	189.6.213.90	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1	f	2024-05-11T22:19:36.335Z	2024-05-11T22:20:50.452Z
5d07d8ac-daa1-4073-b771-581e6aa529dc	677e7772-788a-4aed-b4da-268b00117a2d	189.6.248.120	Mozilla/5.0 (iPhone; CPU iPhone OS 15_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Mobile/15E148 Safari/604.1	f	2024-05-11T22:20:50.456Z	2024-05-11T22:44:12.815Z
b1ac8b88-811e-4f0b-9cf3-9fe82dfeac2b	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-11T22:44:12.821Z	2024-05-11T22:52:50.435Z
77290ebc-bcea-44f8-a647-7a438595b080	677e7772-788a-4aed-b4da-268b00117a2d	189.6.248.120	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-11T22:52:50.440Z	2024-05-11T23:09:08.385Z
f09cffdb-b717-47bf-a31b-c8a26a440bb4	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-11T23:09:08.389Z	2024-05-11T23:23:31.507Z
f5683ae3-1fa1-411b-af2d-acc508f5ce1f	43287099-3523-4e0a-8919-cae4f31e221e	189.6.213.90	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0	f	2024-05-11T23:23:31.511Z	2024-05-11T23:24:21.652Z
2782496d-a141-4d60-8bef-678b52fc071e	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-11T23:24:21.656Z	2024-05-11T23:32:49.185Z
f29a74b2-2168-4ada-a6a1-ad0e8de028e6	2a59c526-6ee4-4cb6-acbb-3d4968203153	152.243.166.180	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0	f	2024-05-11T23:32:49.192Z	2024-05-11T23:58:45.052Z
8d797cc5-84c9-44dc-890e-f0588f548de4	677e7772-788a-4aed-b4da-268b00117a2d	189.6.248.120	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-11T23:58:45.056Z	2024-05-11T23:59:45.289Z
5df98db8-1dcc-4d27-bba4-1d654a3bc6d8	677e7772-788a-4aed-b4da-268b00117a2d	189.6.248.120	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-11T23:59:45.293Z	2024-05-12T00:08:45.438Z
a7b812d4-a9e7-46dc-b89c-5cb5f8380ac2	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T00:08:45.442Z	2024-05-12T01:55:29.904Z
46aab444-b91d-476b-ad5d-29db2de0ad9b	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T01:55:29.912Z	2024-05-12T01:55:57.615Z
9d5f607a-1a84-4c03-a27a-70cbca773f86	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T01:55:57.631Z	2024-05-12T02:45:44.604Z
5f49956b-cce8-4351-91e2-fee4d66e7e43	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-12T02:45:44.608Z	2024-05-12T02:48:20.685Z
16302389-2b4c-4f42-bcbb-d818abd3de65	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T02:48:20.690Z	2024-05-12T03:03:04.149Z
f526069d-af74-40a5-8634-07f1a17983ac	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T03:03:04.154Z	2024-05-12T03:37:52.223Z
f87d6922-19da-4b99-813e-230041fe09b5	43287099-3523-4e0a-8919-cae4f31e221e	189.6.213.90	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0	f	2024-05-12T03:37:52.230Z	2024-05-12T03:52:44.573Z
2d8015dd-6466-4894-b03d-1831d10494bf	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T03:52:44.577Z	2024-05-12T11:47:13.636Z
7670f31d-0269-4ee4-8e49-ced32583b69a	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1	f	2024-05-12T11:47:13.640Z	2024-05-12T13:19:26.427Z
62fee409-3862-4834-82f9-5dbe54d31e89	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T13:19:26.431Z	2024-05-12T13:58:12.582Z
1af6f1b4-2965-493c-ac0f-ca6e7ecf33c3	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T13:58:12.586Z	2024-05-12T14:00:19.580Z
40bcea5f-a184-49de-bd51-67610a1c47a8	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T14:00:19.586Z	2024-05-12T14:03:41.591Z
8205d677-8eac-4b93-b395-0382df6ed486	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T14:03:41.595Z	2024-05-12T14:06:43.986Z
a415a0fc-cab0-47b2-bd79-6f52e975705c	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T14:06:43.991Z	2024-05-12T14:21:54.351Z
d3b41abf-67dd-4055-b38e-7f50a5a73961	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T14:21:54.355Z	2024-05-12T14:27:58.404Z
78c4bbd6-4c2e-4d38-bde8-6eb446b8dc25	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T14:27:58.411Z	2024-05-12T14:39:34.778Z
916031d6-5a77-4d5b-851f-0133da9b5725	43287099-3523-4e0a-8919-cae4f31e221e	189.6.213.90	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0	f	2024-05-12T14:39:34.782Z	2024-05-12T14:44:20.501Z
baef58c1-f4be-4398-8fd1-2d1fead70127	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T14:44:20.509Z	2024-05-12T15:28:27.857Z
8e5647fc-36a5-4eab-bda6-f4056d08c102	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T15:28:27.863Z	2024-05-12T15:59:56.956Z
f742dfb2-7f58-446f-b27e-584f246a385c	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T15:59:56.961Z	2024-05-12T16:10:12.780Z
872be88c-fc21-4361-a0e7-959e818afb64	677e7772-788a-4aed-b4da-268b00117a2d	177.174.202.201	Mozilla/5.0 (iPhone; CPU iPhone OS 15_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Mobile/15E148 Safari/604.1	f	2024-05-12T16:10:12.784Z	2024-05-12T16:16:17.761Z
117e8bd7-340c-4cfc-8997-a71e64719e87	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T16:16:17.765Z	2024-05-12T16:51:23.369Z
8e1f64b7-dce5-4930-b338-176f661ab112	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T16:51:23.373Z	2024-05-12T16:59:09.186Z
c87c46d1-8b2e-433e-876c-59a9de8a9329	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T16:59:09.191Z	2024-05-12T17:04:24.350Z
080f0bd4-ce88-4c4f-8021-594912951201	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T17:04:24.358Z	2024-05-12T18:12:08.213Z
3825da1b-9a10-459d-bca0-af18f95c2b95	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T18:12:08.217Z	2024-05-12T18:13:09.641Z
5e2b5ffb-ced1-401b-a9c1-589fd4b3ef7f	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T18:13:09.644Z	2024-05-12T18:16:26.159Z
f704618a-9225-4043-9f54-03840350cc8a	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T18:16:26.163Z	2024-05-12T18:19:02.043Z
b0f6d101-a8a5-44ff-8f5e-30a811be7a04	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T18:19:02.053Z	2024-05-12T18:19:35.207Z
cbc1724d-1758-41e5-b7f0-e4f64de07343	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T18:19:35.211Z	2024-05-12T18:20:16.553Z
5e317fd7-fca1-4b74-9569-9014f1321193	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T18:20:16.557Z	2024-05-12T18:20:30.976Z
de94c9a9-64e7-416e-90a5-2207b5c4f604	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T18:20:30.982Z	2024-05-12T18:21:15.102Z
f128fd37-1e6a-4470-811f-6e053d3f3293	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T18:21:15.105Z	2024-05-12T18:25:13.690Z
6b498df9-c1f6-480e-8639-525ac1bd8817	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T18:25:13.694Z	2024-05-12T18:26:46.741Z
d39bac2c-bc7a-441e-8f9a-b025133c64f7	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T18:26:46.746Z	2024-05-12T18:28:40.262Z
f35ad639-9f02-4dee-951e-dec3bf7149f3	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T18:28:40.265Z	2024-05-12T18:30:02.355Z
caea25c0-a4c3-4ae9-ba1a-1e4ff37b225b	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T18:30:02.362Z	2024-05-12T18:30:17.138Z
e2a5b086-aed7-45fb-a5d4-4c77699db942	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T18:30:17.144Z	2024-05-12T18:31:06.183Z
4b3c8649-de70-4913-b8f2-1059d8b7f997	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T18:31:06.191Z	2024-05-12T18:37:30.043Z
8af32922-c437-4af7-bcd7-a8590cd28eca	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T18:37:30.068Z	2024-05-12T18:40:49.529Z
cd08db4b-3aef-49b5-b6ae-3667e816cc39	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T18:40:49.533Z	2024-05-12T19:03:05.354Z
f42c75c8-7045-4ce8-bfc7-f0d6978d7ac6	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T19:03:05.358Z	2024-05-12T19:05:18.904Z
c36f7493-f9d2-4f00-9d0a-58239c34c85a	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T19:05:18.908Z	2024-05-12T19:10:46.142Z
6165ec0e-8716-47c7-b5a8-bdda8de3642f	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T19:10:46.150Z	2024-05-12T19:31:55.226Z
4029375e-c724-4a10-b792-de27fbcd50f7	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T19:31:55.233Z	2024-05-12T19:38:15.951Z
70759d02-6568-4df0-959f-1d144f09423f	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T19:38:15.956Z	2024-05-12T19:40:22.113Z
7f8bf9c6-dc51-4afa-9d47-79f59bc855a5	43287099-3523-4e0a-8919-cae4f31e221e	189.6.213.90	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1	f	2024-05-12T19:40:22.117Z	2024-05-12T20:01:48.524Z
520dcf12-1cbb-4417-a5ab-6f9c323a6b1a	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T20:01:48.529Z	2024-05-12T20:26:40.099Z
77367e1e-76bf-49bd-b065-a6f829eeb656	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T20:26:40.103Z	2024-05-12T20:32:53.613Z
4f8c95d8-3418-4523-83b9-58d2f35a563d	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T20:32:53.620Z	2024-05-12T20:34:20.369Z
495c2d46-2806-43bf-a76c-c1da2d1cfea0	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T20:34:20.373Z	2024-05-12T20:34:42.403Z
c12543f9-dfc4-4929-b262-709176f5a5a5	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T20:34:42.406Z	2024-05-12T20:34:48.408Z
14c420b3-e13c-4826-acc7-a5f919503566	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T20:34:48.412Z	2024-05-12T20:35:02.410Z
6bc17bbc-ffec-40e6-a7ad-9dbaf6cf9c3b	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T20:35:02.413Z	2024-05-12T20:35:24.142Z
602df35e-de1a-43d9-a002-207bfc897af4	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T20:35:24.146Z	2024-05-12T21:03:28.166Z
abf16c86-5318-4294-bffb-d31544e6fb6d	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T21:03:28.170Z	2024-05-12T21:10:13.249Z
18c98e18-8011-4781-95a4-89b94b104496	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-12T21:10:13.253Z	2024-05-12T21:10:45.471Z
9c8ce4ef-2f34-4719-9edc-542e7ff5518e	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T21:10:45.474Z	2024-05-12T21:12:12.176Z
6585efea-b02a-4abd-bad4-33d404f4cf4a	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-12T21:12:12.180Z	2024-05-12T21:42:30.332Z
3401252a-3089-454c-9627-9fdc5e018642	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-12T21:42:30.350Z	2024-05-12T22:24:13.469Z
e6dd7cc6-d98e-4b3e-91b2-938257c98cd3	a8a90d10-897f-4696-9be0-4943cd0dc63a	189.6.237.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-12T22:24:13.473Z	2024-05-12T23:38:30.051Z
dda43897-6224-466a-b573-a134f61b8d33	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.239	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-12T23:38:30.062Z	2024-05-13T00:02:55.231Z
2428b1a6-426f-45a4-960d-c6ed1bb884cc	a8a90d10-897f-4696-9be0-4943cd0dc63a	189.6.237.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-13T00:02:55.235Z	2024-05-13T00:50:09.570Z
3233848d-581f-45b4-ba26-be4297a35d82	43287099-3523-4e0a-8919-cae4f31e221e	179.68.10.204	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1	f	2024-05-13T00:50:09.577Z	2024-05-13T00:52:52.383Z
dacca638-3a73-4e80-a35d-d48f12f44929	a8a90d10-897f-4696-9be0-4943cd0dc63a	189.6.237.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-13T00:52:52.386Z	2024-05-13T05:08:40.863Z
a4bfe04a-0067-44f9-9a10-a63db23296a9	2a59c526-6ee4-4cb6-acbb-3d4968203153	177.99.103.215	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T05:08:40.867Z	2024-05-13T05:11:24.744Z
fc645fba-e7c0-45d2-951c-175c3a382b89	493c1562-bfbb-416f-80fd-934170127c1e	177.99.103.215	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T05:11:24.749Z	2024-05-13T05:15:10.642Z
628e0a90-308f-46e9-a3cf-1cf65bf20dcd	493c1562-bfbb-416f-80fd-934170127c1e	177.99.103.215	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T05:15:10.645Z	2024-05-13T05:18:31.851Z
0d0fb306-fedb-49bf-abda-96cc257755f3	493c1562-bfbb-416f-80fd-934170127c1e	177.99.103.215	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T05:18:31.854Z	2024-05-13T11:41:09.096Z
7ebadfac-7e5e-4bf2-bf04-804f09f0e98c	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.237	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-13T11:41:09.101Z	2024-05-13T12:01:25.891Z
bb47db7a-67eb-467b-ae2c-8b2b3761adfb	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T12:01:25.895Z	2024-05-13T12:14:13.371Z
05d38830-1d8a-44ea-85ce-2ec7e69bca15	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T12:14:13.376Z	2024-05-13T12:32:30.141Z
a6bacb7c-0cf1-4060-9770-0fd4c5a7cfa3	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/124.0.6367.111 Mobile/15E148 Safari/604.1	f	2024-05-13T12:32:30.149Z	2024-05-13T12:50:28.734Z
ec66494a-6c8d-4a8d-9016-a74b32bca8b1	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T12:50:28.739Z	2024-05-13T14:11:13.556Z
21a02a5e-20f6-4660-8b79-69c05b3bc607	677e7772-788a-4aed-b4da-268b00117a2d	189.6.248.120	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T14:11:13.561Z	2024-05-13T14:23:22.494Z
50b87827-3893-4eac-a2a7-434827438682	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T14:23:22.498Z	2024-05-13T15:11:36.920Z
58d846fe-fb44-45b9-8178-511ccedc0862	f9076897-55f3-42ba-9b97-d5f59da236cc	201.7.143.68	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0	f	2024-05-13T15:11:36.925Z	2024-05-13T15:43:26.834Z
6d9c4dca-7c68-44db-ba20-947ed05bb64b	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T15:43:26.838Z	2024-05-13T15:46:24.818Z
9a9a6dae-9f2a-4f8c-8b7e-2a23f09adda0	a8a90d10-897f-4696-9be0-4943cd0dc63a	189.6.237.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-13T15:46:24.825Z	2024-05-13T16:28:02.995Z
d1914830-9f54-453d-9e93-50a7d66f3675	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T16:28:03.005Z	2024-05-13T18:02:23.590Z
609bc958-2fb3-4701-b2e0-9d4f73a35ef3	a8a90d10-897f-4696-9be0-4943cd0dc63a	189.6.237.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-13T18:02:23.597Z	2024-05-13T18:03:44.961Z
51be5505-89bd-48eb-a33b-6ccf90c39154	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T18:03:44.966Z	2024-05-13T18:28:27.604Z
bc94e7e6-edc1-4884-91a7-02ba486be9bb	a8a90d10-897f-4696-9be0-4943cd0dc63a	189.6.237.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-13T18:28:27.608Z	2024-05-13T18:41:25.696Z
33b33761-619d-4a43-ae63-23d60e8dfa2c	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.182.75.149	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T18:41:25.700Z	2024-05-13T20:47:00.909Z
48afe623-8dc4-409e-be4c-579b897e9ac7	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T20:47:00.915Z	2024-05-13T20:52:16.789Z
8b758ea0-6111-4e30-9745-49ff080db90d	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T20:52:16.794Z	2024-05-13T21:37:02.688Z
d4f535e4-874d-40ac-9b9e-7e457f8b34b8	a8a90d10-897f-4696-9be0-4943cd0dc63a	189.6.237.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-13T21:37:02.692Z	2024-05-13T22:22:33.622Z
15d0e275-fb59-4dee-b3e4-9c9e5a726849	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-13T22:22:33.626Z	2024-05-13T23:44:13.762Z
335d8201-0959-4afa-b8ef-ca9c5f2a6902	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1	f	2024-05-13T23:44:13.767Z	2024-05-13T23:47:54.742Z
bcf2ebdb-e1c9-4c4f-95ab-28ef9ac6fab1	f9076897-55f3-42ba-9b97-d5f59da236cc	201.7.143.68	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0	f	2024-05-13T23:47:54.746Z	2024-05-13T23:48:15.070Z
bf41ef6a-0ab2-4a64-8036-df8d41c5e677	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1	f	2024-05-13T23:48:15.075Z	2024-05-14T00:55:51.203Z
374f49ca-8091-4f8c-9219-f58a9764d894	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-14T00:55:51.207Z	2024-05-14T01:33:45.993Z
87cf3d6d-0efa-495d-8a5f-7d1c47f71261	2a59c526-6ee4-4cb6-acbb-3d4968203153	152.243.166.180	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0	f	2024-05-14T01:33:45.997Z	2024-05-14T01:52:26.436Z
58315ddd-b5ce-43ff-baca-af53f13e179c	b76d69fe-a01e-4e09-9a7b-d8e2f2be6778	177.99.103.215	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-14T01:52:26.444Z	2024-05-14T02:13:33.935Z
5c162bc1-448f-4967-8147-dc237ac8790a	29805419-78ec-435f-9fb3-41f3102d9b4d	189.30.247.188	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-14T02:13:33.939Z	2024-05-14T02:16:33.348Z
afd9946d-6790-4ec3-916d-1e5e4319b167	b76d69fe-a01e-4e09-9a7b-d8e2f2be6778	177.99.103.215	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-14T02:16:33.353Z	2024-05-14T02:21:39.629Z
21dda567-1bec-473e-91a9-21d3f7bb9633	677e7772-788a-4aed-b4da-268b00117a2d	177.99.103.215	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-14T02:21:39.641Z	2024-05-14T02:48:48.965Z
f3cb7d6b-e8f2-4fb4-8229-8c684ba9f3c8	0bffa8f5-1e8d-455a-bd72-19ab9cc3f18c	177.57.144.185	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-14T02:48:48.969Z	2024-05-14T12:24:37.575Z
cbea4ba7-d0a9-46af-9399-614b24692669	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-14T12:24:37.579Z	2024-05-14T12:32:33.442Z
ca2139ef-d794-4cd6-859d-4ded18c8046f	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-14T12:32:33.446Z	2024-05-14T13:24:40.957Z
d5cd10dd-4824-4748-a06e-7b133e397e40	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.237	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-14T13:24:40.968Z	2024-05-14T13:25:46.459Z
3a8d51d5-01e2-4972-b3fc-021e58a5cecd	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1	f	2024-05-14T13:25:46.463Z	2024-05-14T13:25:58.162Z
ce9e11bf-4cf4-4244-a21c-8c78fe606ff7	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.237	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-14T13:25:58.168Z	2024-05-14T13:27:14.436Z
a2e1a6e7-9a38-4615-b245-f8a9dab71e29	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1	f	2024-05-14T13:27:14.440Z	2024-05-14T13:27:44.742Z
c6f9ff92-11c3-4e9e-906a-575f322737f2	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.237	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-14T13:27:44.745Z	2024-05-14T13:29:49.612Z
9ae71676-ca61-4bf9-9380-090f7c6c872b	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-14T13:29:49.616Z	2024-05-14T13:30:40.078Z
b253c5af-9a7b-498f-a195-b87fb5836338	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.237	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-14T13:30:40.082Z	2024-05-14T13:43:47.282Z
363ff34f-762e-4793-a438-b39b8eb68842	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-14T13:43:47.285Z	2024-05-14T14:32:25.162Z
4de7bee6-4fa9-40ad-b626-1dbe808fed8c	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.237	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-14T14:32:25.166Z	2024-05-14T14:32:34.427Z
a9e9c745-401e-4ec1-a107-b99b4dfb012e	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-14T14:32:34.429Z	2024-05-14T14:33:16.514Z
f437da09-0849-4eb7-bdce-fdf256c1fecf	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.237	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-14T14:33:16.518Z	2024-05-14T14:35:50.936Z
267a4b3a-efc5-4408-8f6f-6a9f91ab4d29	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	f	2024-05-14T14:35:50.941Z	2024-05-14T14:37:58.127Z
135bd730-ce9c-408d-8647-b20a8203aaaf	a8a90d10-897f-4696-9be0-4943cd0dc63a	186.214.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	t	2024-05-14T14:37:58.131Z	\N
baa0cc41-4227-448f-9540-dde67385d75a	e82f476a-1574-4dd2-a4c4-1c1f0117db12	131.255.22.237	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	t	2024-05-14T14:38:08.031Z	\N
197f3b14-b92b-4534-8ba7-e6fdb1d0b5ec	677e7772-788a-4aed-b4da-268b00117a2d	189.6.248.120	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	t	2024-05-14T14:41:13.610Z	\N
03222987-f64b-4edc-af4d-a947cd43dafb	c46ed8c7-8b31-477b-9a90-a1abc9f43371	201.54.155.31	Mozilla/5.0 (X11; CrOS x86_64 14541.0.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-14T15:12:53.359Z	2024-05-14T17:43:08.901Z
873ef447-36da-4854-99ad-d83d09e6599c	c46ed8c7-8b31-477b-9a90-a1abc9f43371	201.54.155.31	Mozilla/5.0 (X11; CrOS x86_64 14541.0.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	t	2024-05-14T17:43:08.905Z	\N
b0ae07ec-788d-4f09-a413-506e16eef447	0bffa8f5-1e8d-455a-bd72-19ab9cc3f18c	201.54.159.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-14T17:39:12.272Z	2024-05-14T19:35:21.620Z
b5a21c41-8482-492e-bba3-5bb03eac93c5	0bffa8f5-1e8d-455a-bd72-19ab9cc3f18c	201.54.159.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	f	2024-05-14T19:35:21.625Z	2024-05-14T20:48:14.034Z
62492442-b16d-4468-9de7-d196f7661b35	84ba4031-5d2a-4d08-92c4-d408b1fc9a01	179.176.68.123	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	t	2024-05-14T21:02:34.631Z	\N
5ab36ec1-2c14-41e6-8133-f18cf0a074a1	0bffa8f5-1e8d-455a-bd72-19ab9cc3f18c	179.68.25.191	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36	f	2024-05-14T20:48:14.038Z	2024-05-14T23:54:37.198Z
6876e156-5cd6-4c86-bb55-5505ff14b39e	0bffa8f5-1e8d-455a-bd72-19ab9cc3f18c	201.54.159.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	t	2024-05-14T23:54:37.202Z	\N
\.


--
-- Data for Name: shelter_managers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shelter_managers (shelter_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: shelter_supplies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shelter_supplies (shelter_id, supply_id, priority, created_at, updated_at, quantity) FROM stdin;
7f21ccc7-d1de-4a23-b710-260761213000	38f84d3e-7f75-46a7-ad35-080b277112ac	100	2024-05-13T02:12:17.741Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-13T02:17:15.271Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	e162ec59-91e5-4621-8a2a-05848cd0f368	10	2024-05-13T02:53:20.840Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	a736cad0-9135-4ac2-bb96-d40350b52658	10	2024-05-10T01:29:13.005Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	f013501e-e9ea-478f-af0d-648f96244b14	100	2024-05-13T02:54:13.877Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	22d6eaff-3933-418f-9287-7e45c300bfad	10	2024-05-13T02:56:54.158Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	0b0cc909-bb05-4234-a005-0a8bbde9ecd8	10	2024-05-08T16:45:08.740Z	2024-05-11T18:23:47.317Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	c2e9e058-dc82-4466-b3c1-fba6796e36a6	10	2024-05-10T01:30:34.636Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	66616847-1e8e-4ea3-bb70-a02aa8b7a33c	10	2024-05-13T02:57:50.390Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	cdac9413-68ad-4382-9be0-b8a5877b5d8c	10	2024-05-10T01:47:34.776Z	\N	\N
a473d415-e5bd-4293-94de-040ac36fd39d	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	100	2024-05-10T01:58:26.353Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	2cd15597-9745-43a5-bbe9-84f9c467b45d	100	2024-05-13T02:58:13.468Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	0bac5a5c-e260-41eb-806e-46397862d868	100	2024-05-13T02:58:56.192Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	ef90a8b3-a3f1-42b9-bcca-81c496e641fc	100	2024-05-13T02:59:22.199Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	dfbf27f0-d560-4aea-aba6-532a6346b994	100	2024-05-10T12:12:15.957Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	a6bf37fb-1ae0-4682-881f-a213db5b4323	10	2024-05-13T03:01:32.405Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	cbe1445b-256b-4d93-8829-6a1fda8f526c	0	2024-05-11T16:03:34.889Z	2024-05-13T15:57:36.535Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	d1af0c2b-4e1f-4cbe-9f97-722264b50722	0	2024-05-13T02:45:56.630Z	2024-05-14T21:47:12.524Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	6942f871-6e35-4eeb-a3ff-8edc8959aa22	0	2024-05-13T02:44:56.741Z	2024-05-13T21:43:35.727Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-13T02:53:10.887Z	2024-05-14T00:48:57.069Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	5aac6b69-af17-4c0e-b0d0-1621211bc14c	0	2024-05-11T15:38:41.285Z	2024-05-14T10:28:52.577Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	d8b0c9ec-39a1-44e4-9ccf-36b439e39368	0	2024-05-13T02:56:10.580Z	2024-05-14T13:22:29.294Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	112f1380-ebef-4697-87e8-7cb8a1e05cf7	0	2024-05-13T02:53:42.280Z	2024-05-14T13:21:19.060Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	8a241182-20e5-4340-be5e-53cce9a4667d	0	2024-05-13T02:54:50.029Z	2024-05-14T13:22:00.166Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	689c1d43-a7ee-4b95-97df-1558fbfcb863	0	2024-05-13T02:56:31.446Z	2024-05-14T13:22:46.347Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	71f5fc2f-29f2-430c-86f5-79b33f4f825e	0	2024-05-13T03:00:37.763Z	2024-05-14T13:31:21.028Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	ea2c6721-693d-496e-8442-a2381d48430b	0	2024-05-12T15:58:19.157Z	2024-05-14T15:07:40.231Z	\N
765a9b71-222f-425d-8eed-4ff5b8559d9f	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-11T15:41:17.161Z	2024-05-11T15:41:19.969Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	9cc1b7be-8b64-46f0-9d23-4103b9851257	0	2024-05-12T16:00:55.742Z	2024-05-14T15:09:00.515Z	\N
765a9b71-222f-425d-8eed-4ff5b8559d9f	0eb81d00-fdee-4740-9070-bf23874d35a9	10	2024-05-11T15:41:37.071Z	\N	\N
765a9b71-222f-425d-8eed-4ff5b8559d9f	bd2a5ee3-0fc6-4777-b4d1-4bb38ebbd0d4	10	2024-05-11T15:41:40.854Z	\N	\N
765a9b71-222f-425d-8eed-4ff5b8559d9f	c957dded-1e08-4e25-a2f8-80d111aef57b	10	2024-05-11T15:41:45.255Z	\N	\N
765a9b71-222f-425d-8eed-4ff5b8559d9f	59904744-08b6-4c32-b82d-b21f8c96bdaf	10	2024-05-11T15:42:33.149Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	063d43f1-9f08-4943-8f82-b51aa4e49924	0	2024-05-13T02:41:59.212Z	2024-05-14T21:45:22.677Z	\N
8476856d-1438-442e-8344-3f31db1d4e1b	8df22c40-25d7-4f96-8bc6-0fe734f948d3	100	2024-05-14T22:37:55.171Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	d8b0c9ec-39a1-44e4-9ccf-36b439e39368	10	2024-05-11T15:54:11.150Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	f013501e-e9ea-478f-af0d-648f96244b14	10	2024-05-11T15:58:59.351Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	1beaa417-91ee-4ccc-b779-a4c2a5a81807	10	2024-05-11T15:59:05.702Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-11T15:59:14.313Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	cd9c4c7a-b1d1-4b85-9a90-a1968b1dc420	100	2024-05-11T16:00:54.026Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	4ae6c9da-c2d7-4381-a309-a938b0258122	10	2024-05-11T16:00:58.851Z	\N	\N
79f05644-27f7-4e06-908b-1611d4b477ed	faa1f789-94e9-4d9a-89cc-fcf29e20a51d	100	2024-05-11T16:01:26.394Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	01750893-db86-4171-8c01-a41b61309a5d	100	2024-05-14T22:38:20.620Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	5ee91e2e-a7c2-449a-bb80-ac78b28b3767	100	2024-05-14T22:38:31.309Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	1606cc85-7ef0-4864-8cf1-15e9722a8115	10	2024-05-11T16:02:56.291Z	\N	\N
79f05644-27f7-4e06-908b-1611d4b477ed	0fc4d439-3e5d-460d-aefb-c54583690db3	100	2024-05-11T16:03:07.272Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	4bd475d3-779b-45bb-b9f9-7a6052bc41fb	10	2024-05-11T16:03:15.354Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	100	2024-05-14T22:38:37.299Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	3edb0a60-0bbf-4332-9fd1-8de317091fca	100	2024-05-14T22:38:54.035Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	b7e47f23-8750-42b6-820c-2497ecb85c55	100	2024-05-14T22:42:25.230Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	29a5dd12-fba3-49db-8c3a-13f706d195d7	100	2024-05-14T22:46:23.724Z	\N	\N
ba9f9dcc-193d-486f-9c80-536bd6fda875	6ebdfdfa-c7b7-42c3-972c-a15b921d4e66	100	2024-05-14T23:08:34.618Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	0fe671e5-1f19-4370-ae9d-8e49afa92aba	100	2024-05-12T15:58:20.374Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	caa77bd6-4cf9-44a5-aa24-2e68c899081a	100	2024-05-13T02:13:15.579Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	eadb6611-5c04-4050-9be4-fd2b4eacd182	10	2024-05-10T01:29:45.375Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	0	2024-05-13T02:17:26.080Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	100	2024-05-13T02:17:48.534Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	66a98038-4588-431c-814d-0c440c4683af	0	2024-05-11T16:00:34.659Z	2024-05-13T20:02:49.051Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	38939273-b35e-49bf-b84f-0a04f747d44e	0	2024-05-08T16:43:40.245Z	2024-05-14T10:28:21.627Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	13a4afa8-2b27-43c2-8ac1-0a2b29ce7832	0	2024-05-08T16:39:53.440Z	2024-05-14T10:31:02.477Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	b66abcc8-33e7-4476-b725-a34f7dc90585	0	2024-05-08T16:38:25.716Z	2024-05-14T10:33:00.472Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	4c4b59cc-d639-4952-87e3-107c61c2a673	0	2024-05-12T15:58:45.478Z	2024-05-14T15:10:52.135Z	\N
8476856d-1438-442e-8344-3f31db1d4e1b	d34f6cfc-a2d4-4456-8f61-9f3daae702a2	100	2024-05-14T22:40:56.402Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	172c7042-1a1a-4ed0-9cd7-9f818efde80a	10	2024-05-10T01:36:15.954Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	79039fe7-7ae3-410a-913e-49cd816aeca1	100	2024-05-14T22:42:59.098Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	a01832c8-765b-4e22-b421-b15a6d533a01	100	2024-05-14T22:44:58.551Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-10T01:43:12.157Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	14ce7f98-2cb3-46ce-bc13-d0f420c5921c	100	2024-05-14T22:45:09.137Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	51df415f-3624-4066-ab38-25d6101e7c5a	100	2024-05-14T22:45:20.391Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	5d5ba6d2-2853-4b3c-aecb-5f86a8e75707	100	2024-05-14T22:45:43.299Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	12b9119d-04f0-4ec6-990c-76a28f0dcb82	100	2024-05-14T22:45:57.266Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	c777f376-391c-4bff-b548-e19a8bf34ad6	100	2024-05-14T22:46:13.999Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	fcffd019-56c9-4949-8a10-6b6f5104291c	10	2024-05-10T01:45:15.014Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	15c5deb2-4734-430f-8d16-1dacd80e0295	100	2024-05-14T22:47:42.951Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	4ae4acec-ee0d-40f3-931c-37759e97ecff	100	2024-05-10T01:52:04.575Z	\N	\N
a473d415-e5bd-4293-94de-040ac36fd39d	f013501e-e9ea-478f-af0d-648f96244b14	100	2024-05-10T01:58:33.048Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	caa77bd6-4cf9-44a5-aa24-2e68c899081a	100	2024-05-14T22:48:29.792Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	01794c4c-0038-4330-a478-0d10c85fb2d0	100	2024-05-14T22:48:39.520Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	2b72c607-f5b6-4907-88e9-1a2d50045b18	100	2024-05-14T22:48:50.522Z	\N	\N
a473d415-e5bd-4293-94de-040ac36fd39d	52bd1913-9ae1-413d-8258-205049df62e6	100	2024-05-10T01:58:39.675Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	a736cad0-9135-4ac2-bb96-d40350b52658	100	2024-05-14T22:48:57.999Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	3bb8fb06-b376-4489-80fe-59826066e849	100	2024-05-14T22:49:09.882Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	6c8684ed-85ad-49c0-a76e-cb34e7538f4d	100	2024-05-14T22:49:19.061Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	48b8392c-9bcf-4b94-abff-33b565af4edd	100	2024-05-14T22:49:29.093Z	\N	\N
a473d415-e5bd-4293-94de-040ac36fd39d	dc359231-d372-495a-a9e0-2bbd47965809	100	2024-05-10T02:00:31.574Z	\N	\N
765a9b71-222f-425d-8eed-4ff5b8559d9f	799e9f43-b5e8-4484-be33-09c442390253	10	2024-05-11T15:40:41.220Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	14bb5f33-7c73-441d-a3b6-27fd7348dce3	100	2024-05-12T15:58:42.172Z	\N	\N
765a9b71-222f-425d-8eed-4ff5b8559d9f	ace11dbc-d8fc-4d92-8692-72534bdee8be	10	2024-05-11T15:42:02.545Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	38f84d3e-7f75-46a7-ad35-080b277112ac	10	2024-05-11T15:56:41.930Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	100	2024-05-11T15:56:21.018Z	2024-05-11T15:56:46.483Z	\N
806120c1-8d63-4f67-9351-eb3253cad789	8c4ed7fa-8b92-492e-bf05-94d2fd4f5016	10	2024-05-11T15:57:26.607Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	79c7f357-2e62-4ab9-8152-de7165e6dae6	10	2024-05-11T15:57:32.788Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	84cad0e5-c559-471b-8fc3-de467afc4685	100	2024-05-11T15:57:49.633Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	112f1380-ebef-4697-87e8-7cb8a1e05cf7	10	2024-05-11T15:58:23.072Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	100	2024-05-11T15:58:36.985Z	\N	\N
5207fb6b-af7d-4842-8a19-6ae75f13d3c6	5dce43b9-05a8-43d6-a679-80ac421846d8	10	2024-05-11T16:00:08.930Z	\N	\N
5207fb6b-af7d-4842-8a19-6ae75f13d3c6	b903d733-7b7e-413b-96b5-b9772d84c3df	10	2024-05-11T16:00:23.139Z	\N	\N
5207fb6b-af7d-4842-8a19-6ae75f13d3c6	d276802d-0992-4f87-b5fa-04e5ee6a10c1	10	2024-05-11T16:00:46.925Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	10	2024-05-11T16:01:42.615Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	10	2024-05-11T16:02:01.710Z	\N	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	4eb7c42e-8499-438d-9298-3ca063eca896	100	2024-05-12T16:08:32.024Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	03df84a0-a3a2-42ff-b299-a9b30ffb52bd	0	2024-05-13T02:47:51.129Z	2024-05-13T21:40:29.748Z	\N
765a9b71-222f-425d-8eed-4ff5b8559d9f	bbca6f5f-96e5-4329-8a54-c0a618d5f99e	10	2024-05-11T15:42:07.768Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	02db1cee-b5a4-45e9-ad0b-bb22cada46f8	0	2024-05-08T16:39:14.697Z	2024-05-14T10:29:31.988Z	\N
765a9b71-222f-425d-8eed-4ff5b8559d9f	73fbacb1-0736-49ec-8873-80ddd65608a2	10	2024-05-11T15:42:49.205Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	c957dded-1e08-4e25-a2f8-80d111aef57b	0	2024-05-13T02:42:41.066Z	2024-05-14T21:39:54.930Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	3810ff6f-2c32-4a64-a1c6-37be86fdaec6	0	2024-05-13T02:46:08.547Z	2024-05-14T21:44:38.870Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	a75e630a-4b6f-4b5e-b013-12770df0a6f8	10	2024-05-10T01:37:00.650Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	2b72c607-f5b6-4907-88e9-1a2d50045b18	10	2024-05-10T01:39:26.031Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	10	2024-05-10T01:42:19.288Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	761e4265-2f75-46a2-8cf3-16b8a5a69963	0	2024-05-13T02:46:50.393Z	2024-05-14T21:45:50.123Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	a08d8756-9721-40b8-8146-07bec3bbed9b	0	2024-05-13T02:43:40.025Z	2024-05-14T21:47:16.542Z	\N
a473d415-e5bd-4293-94de-040ac36fd39d	32c8b84b-f427-472b-91fb-150008246e85	100	2024-05-10T01:57:13.824Z	\N	\N
a473d415-e5bd-4293-94de-040ac36fd39d	8f000e6a-c3cf-43ea-a947-f5df7150caa4	100	2024-05-10T01:57:49.360Z	\N	\N
a473d415-e5bd-4293-94de-040ac36fd39d	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	100	2024-05-10T01:58:08.950Z	\N	\N
a473d415-e5bd-4293-94de-040ac36fd39d	367ed746-6c87-41d9-a29e-bf3540360ccf	100	2024-05-10T01:58:21.667Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	c096c90d-0710-4804-801c-e5a2b8d14e6f	0	2024-05-13T02:45:12.344Z	2024-05-14T22:00:19.753Z	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	f8ba58b3-6549-49b7-b400-81ce225d365d	100	2024-05-14T22:49:42.340Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	caa77bd6-4cf9-44a5-aa24-2e68c899081a	100	2024-05-10T02:05:42.105Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	11c6d26d-d148-49c7-bcfd-cf2ce6be4022	100	2024-05-14T22:49:55.530Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	26b02d43-3025-4538-8484-afb26c44a010	100	2024-05-14T22:50:05.079Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	af26cae5-8bae-420c-8052-782b9598fded	100	2024-05-10T02:10:16.150Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	3982cd82-d50b-4d04-8f31-8f29bf7735d3	10	2024-05-12T16:01:47.906Z	2024-05-15T00:45:29.018Z	\N
b818a598-5d62-46cf-867c-ece997cb5856	2b72c607-f5b6-4907-88e9-1a2d50045b18	10	2024-05-10T23:42:58.960Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	a736cad0-9135-4ac2-bb96-d40350b52658	10	2024-05-10T23:47:02.845Z	\N	\N
a473d415-e5bd-4293-94de-040ac36fd39d	e4bedb60-5d9c-4cc6-8ba7-f93d890c6cec	100	2024-05-08T16:55:40.680Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	52bd1913-9ae1-413d-8258-205049df62e6	100	2024-05-13T02:54:22.858Z	\N	\N
4cbfb685-56b5-4e1f-89f9-52c180540e73	2477f44f-2324-4eec-a191-10ad25b564e9	100	2024-05-08T17:07:05.786Z	\N	\N
4cbfb685-56b5-4e1f-89f9-52c180540e73	7396a7d2-dd6c-4b9f-a3ac-9a477dc6d2c3	100	2024-05-08T17:07:31.597Z	\N	\N
4cbfb685-56b5-4e1f-89f9-52c180540e73	d52b7643-1731-48cb-9859-797c159d67b7	100	2024-05-08T17:07:45.473Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	8e596eea-5ab7-480b-a22f-2af852198a92	0	2024-05-08T18:05:38.456Z	2024-05-13T03:12:23.773Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	20117fd1-1e8a-4c29-9cf4-855a11fc9030	0	2024-05-08T18:04:48.452Z	2024-05-13T03:14:16.189Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	7d8f08bd-0994-433f-890d-29690027bf6a	0	2024-05-12T16:28:07.610Z	2024-05-13T14:49:19.377Z	\N
a473d415-e5bd-4293-94de-040ac36fd39d	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	10	2024-05-10T01:59:07.568Z	\N	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	e332e031-a18e-4407-81e9-660530260e64	0	2024-05-12T16:54:17.222Z	2024-05-13T15:16:55.032Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	ffc9891b-43d3-4134-8e9c-7ada4690d076	0	2024-05-13T02:54:00.836Z	2024-05-14T13:21:28.608Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	ca0ef946-0de3-47a2-a0cb-df72de35aeec	0	2024-05-13T02:54:36.187Z	2024-05-14T13:21:50.740Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	7982a520-ecc8-4cf9-a8be-2bd40550bd31	0	2024-05-13T02:55:06.230Z	2024-05-14T13:22:09.336Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	0d3f2a26-0bec-4cee-9c9b-62b7dd53345c	0	2024-05-13T02:48:25.846Z	2024-05-14T21:44:23.379Z	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-08T17:34:31.380Z	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	4e578b85-f185-4a4d-aed5-5d43f0c05afb	100	2024-05-14T23:10:22.386Z	\N	\N
8c675091-a9c1-485f-84d4-9f33b55d2d8f	e87c2f41-f417-4ee0-b818-9adfe7c790e9	10	2024-05-14T23:17:53.215Z	\N	\N
8c675091-a9c1-485f-84d4-9f33b55d2d8f	51727155-6b86-4777-865e-f7b85eba83ea	10	2024-05-14T23:18:14.697Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	46862e71-22b7-4023-ba93-2936050c6f9f	100	2024-05-10T02:40:39.789Z	\N	\N
129532a9-2d3b-4e30-a35e-950836dbda0e	6ebdfdfa-c7b7-42c3-972c-a15b921d4e66	10	2024-05-14T23:34:38.914Z	\N	\N
129532a9-2d3b-4e30-a35e-950836dbda0e	5e4b4b53-a13b-483c-a783-5576e0225d82	100	2024-05-14T23:37:13.514Z	\N	\N
7ab41d9b-d98d-45ba-a5b8-cc9e9e81a2c3	d01c1d11-e401-4151-b0ec-52c26ce54b32	100	2024-05-14T23:37:26.009Z	\N	\N
7ab41d9b-d98d-45ba-a5b8-cc9e9e81a2c3	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-14T23:38:57.427Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	88fa7edf-2f9d-43e9-b983-86aa6fc63374	10	2024-05-10T23:42:38.686Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	5880fcb0-dd0e-4681-b97d-a1f501152fc6	10	2024-05-10T23:42:44.945Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	723e8686-19d8-4b51-a250-e05885d9e081	10	2024-05-10T23:43:46.837Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	8b2c49f5-c34f-4ac9-abb0-5810c10e3dcb	10	2024-05-10T23:44:00.313Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	b15fee1e-5c89-4b46-a5b2-fb1991f57c13	10	2024-05-11T15:46:23.285Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	ea2c6721-693d-496e-8442-a2381d48430b	10	2024-05-10T23:48:47.862Z	\N	\N
7ab41d9b-d98d-45ba-a5b8-cc9e9e81a2c3	ed0e5e53-3cc8-498b-a62a-f7d3a115d0c6	0	2024-05-14T23:38:34.976Z	2024-05-14T23:39:06.208Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	68c9670c-99fb-438a-8169-66cc1ce66313	0	2024-05-14T23:42:25.879Z	2024-05-14T23:42:42.032Z	\N
806120c1-8d63-4f67-9351-eb3253cad789	69732c83-e2ee-481f-b4c5-e55932e8d51f	10	2024-05-11T15:49:22.387Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	a736cad0-9135-4ac2-bb96-d40350b52658	10	2024-05-11T15:51:31.356Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	be3edd3b-5dff-496b-9f1f-07bd0907d6a7	10	2024-05-11T15:56:10.241Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	46862e71-22b7-4023-ba93-2936050c6f9f	100	2024-05-11T15:56:37.225Z	2024-05-11T15:56:54.077Z	\N
d036b8ca-85d1-449f-b032-922497874543	063d43f1-9f08-4943-8f82-b51aa4e49924	10	2024-05-11T16:00:11.713Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	1bae9ae8-c59e-430c-b7e0-176e307d4a99	100	2024-05-12T16:15:40.030Z	2024-05-12T16:15:46.898Z	\N
62a17be9-a744-42a6-a7dd-8ce2872c56c8	053d6422-e791-474c-9820-90252e04da58	10	2024-05-12T16:25:08.876Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	dc359231-d372-495a-a9e0-2bbd47965809	10	2024-05-12T16:27:32.436Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	bebcebf5-673a-49af-a02b-168c11dd0dd9	10	2024-05-12T16:27:44.751Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	c8ce7a65-be98-4e38-beaa-b9907dc003e9	10	2024-05-12T16:27:52.547Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	dfbf27f0-d560-4aea-aba6-532a6346b994	10	2024-05-12T16:29:55.774Z	\N	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	634649db-5f8b-47b8-a034-f3a78c53dbfe	100	2024-05-12T16:35:15.272Z	\N	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-12T16:54:00.125Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	60a6078f-6aa7-43b1-acf7-660c25bd221e	10	2024-05-13T02:57:17.914Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-13T03:00:53.292Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	9815d990-5db6-4875-9dfa-1197812a9bfa	100	2024-05-13T03:07:58.032Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	2fe71172-ab32-490e-91ae-0ec727bd3d52	100	2024-05-13T03:08:40.285Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	1cbeb09b-1870-4cbb-ac44-c3d850745958	100	2024-05-13T03:09:01.648Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	45d237c3-1423-40ba-ae56-665d7fb95f6c	100	2024-05-13T03:11:44.946Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	100	2024-05-13T03:12:13.268Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	faeac6fc-4c69-4e2b-9b15-b47e85af78ba	100	2024-05-13T03:13:02.534Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	31420dbb-f6a3-443b-89c1-05344b195408	100	2024-05-13T03:17:42.228Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	e30c8efd-29f1-4414-9f5e-080b7e1f6fa3	10	2024-05-13T03:18:26.254Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	63245717-adcb-473a-bfb0-1530e637bb7d	100	2024-05-13T03:18:27.259Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	6e71e6ec-9335-4db3-a0bd-4cfc3bed41f9	10	2024-05-13T03:18:30.649Z	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	3622021b-0727-4d94-97ae-3c264a032621	100	2024-05-13T03:19:52.283Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	100	2024-05-13T03:19:59.638Z	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	7be88738-a1ec-46ff-af28-01cdba37440a	10	2024-05-13T03:20:03.564Z	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	14274ddb-ffb6-429c-9aa2-e68ece7d1ab9	100	2024-05-13T03:20:34.086Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	634649db-5f8b-47b8-a034-f3a78c53dbfe	10	2024-05-09T01:12:31.969Z	\N	\N
4503dfb5-e361-444e-92c2-f8b4409e3ca2	5e3faa0a-8bf7-4182-b057-cec38d4bed2d	10	2024-05-09T01:20:22.800Z	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	1824b541-2769-4c99-8589-ceee946d7181	100	2024-05-13T03:21:00.746Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	61a8eb1b-7e23-43bd-8ad2-edc43843314b	10	2024-05-13T03:27:31.692Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	d01c1d11-e401-4151-b0ec-52c26ce54b32	1	2024-05-12T16:26:40.454Z	2024-05-14T18:28:36.279Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	5a68adc5-f0cc-44f6-99e4-12cd88662d08	0	2024-05-12T16:28:50.479Z	2024-05-13T14:49:57.543Z	\N
8c675091-a9c1-485f-84d4-9f33b55d2d8f	460c72c0-b362-4fe8-a7e8-06aabe57cccd	10	2024-05-14T23:17:15.681Z	\N	\N
8c675091-a9c1-485f-84d4-9f33b55d2d8f	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	10	2024-05-14T23:17:38.637Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	0	2024-05-12T16:26:53.808Z	2024-05-13T14:44:56.875Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	a8c18a44-ec60-4a19-8e96-785c49de9630	0	2024-05-12T16:28:21.928Z	2024-05-13T14:47:03.560Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	dd65466a-5978-4879-80b8-be543d285774	0	2024-05-12T16:29:20.369Z	2024-05-13T14:48:27.530Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	a4f73ff7-1c89-42b8-84d2-8983e7b7fd6d	0	2024-05-12T16:28:41.287Z	2024-05-13T14:48:59.259Z	\N
c082783c-12d1-4174-9e59-276a5c647079	799e9f43-b5e8-4484-be33-09c442390253	0	2024-05-11T16:03:22.598Z	2024-05-13T15:46:33.611Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	4d57d380-9335-4127-83fc-a54c7feeb0aa	0	2024-05-13T03:04:25.187Z	2024-05-14T13:31:48.845Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	09fa01c2-c48c-4d7d-b910-adc3109dc041	0	2024-05-12T16:27:23.792Z	2024-05-14T18:26:26.624Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-12T16:26:46.718Z	2024-05-14T18:28:09.468Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	66a98038-4588-431c-814d-0c440c4683af	10	2024-05-12T16:27:00.389Z	2024-05-14T18:28:26.589Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	d98b2225-e6b9-4ba5-9085-ccdcc1d56af9	100	2024-05-10T02:52:16.728Z	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	799e9f43-b5e8-4484-be33-09c442390253	100	2024-05-12T16:17:11.260Z	\N	\N
62a17be9-a744-42a6-a7dd-8ce2872c56c8	ef206d20-b798-4215-bebb-e53afd8f4a69	10	2024-05-12T16:24:00.798Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	367ed746-6c87-41d9-a29e-bf3540360ccf	10	2024-05-10T22:13:34.010Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	6b1d5955-578e-4b7c-a66a-118060c94901	10	2024-05-11T16:02:11.468Z	\N	\N
62a17be9-a744-42a6-a7dd-8ce2872c56c8	e99b7beb-668d-45f0-b368-6fad52f284a5	10	2024-05-12T16:24:12.304Z	\N	\N
62a17be9-a744-42a6-a7dd-8ce2872c56c8	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-12T16:24:19.370Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	2c0eabfd-5c22-4174-b93d-b814a7706b9e	10	2024-05-12T16:26:30.373Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	e4e767ff-be22-4c15-99a3-fac2b97683df	10	2024-05-12T16:27:08.347Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-12T16:27:15.443Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	53e92ec3-dfcb-4ac2-adf4-0fd1fa963756	10	2024-05-12T16:28:58.356Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	21c26bde-bccb-45c2-b21f-41fb00a1fb2d	100	2024-05-13T03:01:49.551Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	e99b7beb-668d-45f0-b368-6fad52f284a5	100	2024-05-13T03:03:06.495Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	0c91997a-e357-4fad-a220-7ed67d9d4100	100	2024-05-13T03:03:47.296Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	ef549295-5ce6-485d-8383-458f9e6437bb	10	2024-05-08T17:22:40.778Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	3a2b4c6a-9e59-4f3a-be7b-c8399bb3a201	100	2024-05-13T03:05:14.139Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	04a2d64b-69c0-4f6b-8975-4d41b4f43327	10	2024-05-13T03:05:57.835Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	da31cce8-8f58-4e67-b299-b42991224a79	100	2024-05-13T03:09:49.304Z	\N	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	7fe4cd2a-9bec-419a-aaae-aa89761c5566	100	2024-05-12T16:30:07.865Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	fedbbfb1-777d-4914-b6fd-184e9de0e7e5	100	2024-05-13T03:10:33.667Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	f3eb355a-4868-48af-befc-38a8a565c8e4	10	2024-05-13T03:11:11.429Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	26b02d43-3025-4538-8484-afb26c44a010	100	2024-05-13T03:12:30.130Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	b8086ace-c3c7-4fa5-905f-ad1d4e64e990	1	2024-05-12T16:30:16.311Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	9ef89eb7-35f7-43bb-86ac-4d5df6516fbe	0	2024-05-13T03:15:04.932Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	689c1d43-a7ee-4b95-97df-1558fbfcb863	100	2024-05-10T02:53:37.950Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	c8ce7a65-be98-4e38-beaa-b9907dc003e9	100	2024-05-10T02:53:44.254Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	e162ec59-91e5-4621-8a2a-05848cd0f368	0	2024-05-13T03:15:20.715Z	2024-05-13T03:15:24.271Z	\N
d036b8ca-85d1-449f-b032-922497874543	55bf190c-f2eb-4f80-89f0-76dec0843ad4	10	2024-05-11T16:02:28.027Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	c905ca5a-0564-4d2a-b9b9-585cbce1cc62	10	2024-05-11T16:02:45.646Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	367ed746-6c87-41d9-a29e-bf3540360ccf	0	2024-05-13T03:15:27.759Z	2024-05-13T03:15:31.062Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	bd742c5e-9257-4f16-a572-b4571d98db90	10	2024-05-13T03:20:45.365Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	8550fcc0-103c-46ee-a632-7cbb45f1b74a	100	2024-05-13T03:21:35.690Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	aa2abcfe-f957-46e6-89b7-73810b3dfcf6	10	2024-05-09T01:44:15.310Z	2024-05-11T22:10:16.617Z	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	0d0b7439-82c1-4030-8d40-3dd94753eb40	100	2024-05-12T16:30:16.512Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	7a841996-d096-4752-b071-263d1166fcbc	100	2024-05-13T03:22:29.477Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	3810ff6f-2c32-4a64-a1c6-37be86fdaec6	10	2024-05-13T03:22:48.802Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	8812cea7-01bc-4c7f-892d-cd0071589195	10	2024-05-13T03:30:17.408Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	f74837d7-d4b4-4224-be14-a6d0df76ea8f	10	2024-05-12T16:35:11.536Z	2024-05-12T23:21:04.356Z	\N
4503dfb5-e361-444e-92c2-f8b4409e3ca2	7b1ffe8e-6cb1-46b9-b85c-dcb380da4aa4	0	2024-05-09T01:20:48.481Z	2024-05-13T18:00:07.505Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	4e619f2b-0e02-4842-8b1d-410ff44038cd	0	2024-05-10T02:54:10.243Z	2024-05-14T00:49:15.921Z	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	f33825fd-e6b0-47bb-80c0-80aef8a42e19	0	2024-05-14T23:30:34.683Z	2024-05-14T23:30:41.552Z	\N
4f9d5e9b-43eb-4ba7-919b-4be27e988a79	eb2b3f21-b0e6-45fd-914a-7d6c82b1747b	10	2024-05-14T23:32:39.788Z	\N	\N
4f9d5e9b-43eb-4ba7-919b-4be27e988a79	8a5acec2-0892-4d50-95f1-9518a094ede0	0	2024-05-14T23:33:08.689Z	\N	\N
129532a9-2d3b-4e30-a35e-950836dbda0e	ffcb9277-8ecb-44b6-9e5f-ac2a6811e65d	0	2024-05-14T23:34:22.996Z	\N	\N
129532a9-2d3b-4e30-a35e-950836dbda0e	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-14T23:34:53.393Z	\N	\N
129532a9-2d3b-4e30-a35e-950836dbda0e	52bd1913-9ae1-413d-8258-205049df62e6	100	2024-05-14T23:35:11.207Z	\N	\N
129532a9-2d3b-4e30-a35e-950836dbda0e	f013501e-e9ea-478f-af0d-648f96244b14	100	2024-05-14T23:35:23.018Z	\N	\N
129532a9-2d3b-4e30-a35e-950836dbda0e	b813d3b5-bf55-443b-b1a4-be3d426af4e9	100	2024-05-14T23:35:46.678Z	\N	\N
7ab41d9b-d98d-45ba-a5b8-cc9e9e81a2c3	799e9f43-b5e8-4484-be33-09c442390253	100	2024-05-14T23:38:20.502Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	634649db-5f8b-47b8-a034-f3a78c53dbfe	0	2024-05-13T03:07:08.826Z	2024-05-14T23:39:26.723Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	180bed77-0c81-45d1-be29-b094c8263533	10	2024-05-13T03:30:50.656Z	\N	\N
8e112d66-6e72-4f17-9fab-7c778b191302	58c7d1c9-8e7f-4d68-8ede-da32a40500bc	10	2024-05-08T17:42:02.577Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	9ef89eb7-35f7-43bb-86ac-4d5df6516fbe	0	2024-05-13T05:20:33.351Z	2024-05-14T10:31:54.411Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	7b1ffe8e-6cb1-46b9-b85c-dcb380da4aa4	0	2024-05-13T05:20:07.302Z	2024-05-14T10:40:39.118Z	\N
7ab41d9b-d98d-45ba-a5b8-cc9e9e81a2c3	1a91ad10-10e2-4d05-8727-69f724f076f2	10	2024-05-14T23:37:38.782Z	\N	\N
7ab41d9b-d98d-45ba-a5b8-cc9e9e81a2c3	450614ac-762f-4109-bc13-d8c72066abc7	1	2024-05-14T23:37:53.070Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	ddd006a5-eac6-44de-ad77-b9386f25ef9c	10	2024-05-09T02:14:59.076Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	9798cd10-1d06-42a0-921b-83e17b91a90c	10	2024-05-09T02:15:37.235Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	7d8f08bd-0994-433f-890d-29690027bf6a	100	2024-05-14T23:53:53.856Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	0eb81d00-fdee-4740-9070-bf23874d35a9	10	2024-05-09T02:17:10.722Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	8e5bab94-d594-46dd-a855-7675f5d8231f	10	2024-05-09T02:17:24.055Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	c4976a72-788e-4360-ad86-bb4939bebcc2	10	2024-05-09T02:17:52.441Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	6763caea-7b53-466a-a9b3-40ebfac0f9bb	10	2024-05-09T02:18:17.641Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	f3eb355a-4868-48af-befc-38a8a565c8e4	10	2024-05-09T02:18:46.824Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	48b8392c-9bcf-4b94-abff-33b565af4edd	100	2024-05-14T23:54:18.390Z	\N	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	ef206d20-b798-4215-bebb-e53afd8f4a69	10	2024-05-12T16:54:48.991Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	578824f0-d728-4f59-8a73-763fd55cd08e	100	2024-05-14T23:54:34.249Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	ef206d20-b798-4215-bebb-e53afd8f4a69	10	2024-05-11T16:03:45.192Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	6bca959f-afc2-434e-a716-c6ce6fe71b70	100	2024-05-14T23:54:47.923Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	8b670613-fb90-465c-b3e3-b48f4cc27c70	10	2024-05-11T16:03:49.746Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	01794c4c-0038-4330-a478-0d10c85fb2d0	100	2024-05-14T23:55:00.826Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	0eb81d00-fdee-4740-9070-bf23874d35a9	10	2024-05-11T16:05:44.832Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	bd2a5ee3-0fc6-4777-b4d1-4bb38ebbd0d4	10	2024-05-11T16:05:57.636Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	f1570b6d-f756-493e-a151-115f51f1e747	10	2024-05-11T16:06:44.702Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	287b133c-72d1-4a8e-9cc9-0e8077149204	100	2024-05-14T23:56:15.527Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	1174922e-fe33-4f48-b3dc-12f61af89e90	100	2024-05-14T23:56:25.904Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	82fe2a73-a292-488d-b227-3302bd06496d	100	2024-05-14T23:56:37.458Z	\N	\N
77a0f4cc-a62d-44bb-bba2-058d1d006d0a	f9e4ebb7-1f4d-4a20-b18c-9d5e4d3984a0	10	2024-05-14T23:57:02.740Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	bf17bf73-7164-4331-b4ce-b3db7c44fadb	100	2024-05-14T23:57:05.381Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	053d6422-e791-474c-9820-90252e04da58	100	2024-05-14T23:57:16.024Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	f1b74773-b106-4ac4-81e3-57de81858b7e	0	2024-05-14T23:58:16.984Z	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	a01832c8-765b-4e22-b421-b15a6d533a01	100	2024-05-15T00:36:21.594Z	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	c4e94a84-f6d2-48a3-a391-8c2491cc8b21	100	2024-05-15T00:36:39.208Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	e6e9ccb4-6608-49b3-bc7a-fabc4e6fdff4	10	2024-05-15T00:45:22.053Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	324fc117-cf6b-4367-a7f1-8eb595c01377	10	2024-05-15T00:47:16.898Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	651af48c-91c0-42c1-8bed-c61264c53eb0	10	2024-05-15T00:48:02.719Z	\N	\N
8e112d66-6e72-4f17-9fab-7c778b191302	cbe1445b-256b-4d93-8829-6a1fda8f526c	10	2024-05-08T17:40:52.432Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	3f9591df-328d-467f-b556-0872762b09a8	0	2024-05-08T18:05:49.582Z	2024-05-13T03:12:00.961Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	1ca48fb5-6df6-4884-ac61-9c9760041ee1	0	2024-05-08T18:07:36.218Z	2024-05-13T03:13:53.973Z	\N
97ef5b90-6f9b-4adb-bd07-086e7330b745	3edbdcb6-ff0a-4de4-b5c9-24c30de29132	10	2024-05-13T05:57:06.056Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-09T02:13:37.421Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	99d42576-350e-4fd5-b319-34aa2f8532e6	10	2024-05-09T02:14:11.316Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	c2d8b7f0-b0cc-4d81-b935-77c12baa9b0e	100	2024-05-14T23:55:19.946Z	\N	\N
7d5e29af-7d5f-41a9-afaf-8e2135dd69c4	43a27a70-3ed5-4a3d-8428-623810c3f717	10	2024-05-08T18:11:38.374Z	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	770fd1b3-e792-4127-88f9-7d7a47224363	100	2024-05-08T18:15:28.864Z	\N	\N
5207fb6b-af7d-4842-8a19-6ae75f13d3c6	caa77bd6-4cf9-44a5-aa24-2e68c899081a	100	2024-05-09T02:26:49.879Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	3bb8fb06-b376-4489-80fe-59826066e849	100	2024-05-14T23:55:35.209Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	a736cad0-9135-4ac2-bb96-d40350b52658	100	2024-05-14T23:55:47.817Z	\N	\N
5207fb6b-af7d-4842-8a19-6ae75f13d3c6	62bd5d05-ba37-497a-a1a1-56795813790d	100	2024-05-09T02:28:42.622Z	\N	\N
5207fb6b-af7d-4842-8a19-6ae75f13d3c6	7982a520-ecc8-4cf9-a8be-2bd40550bd31	100	2024-05-09T02:33:41.625Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	8e5bab94-d594-46dd-a855-7675f5d8231f	100	2024-05-14T23:57:32.504Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	b2d2741f-bfc6-4a0b-b6bf-79b7f3b19b02	100	2024-05-14T23:57:53.284Z	\N	\N
5207fb6b-af7d-4842-8a19-6ae75f13d3c6	49e5686b-1fe3-42bd-b667-729ca65cd778	10	2024-05-09T12:41:50.138Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	85132717-39a0-41bb-8409-6ecf6ec77019	100	2024-05-14T23:58:27.748Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	c1e4ef3f-0d86-418f-9d9f-05f028246bed	10	2024-05-11T16:04:07.349Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	c8ce7a65-be98-4e38-beaa-b9907dc003e9	100	2024-05-11T16:04:26.221Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	6b3962b3-33dd-422e-bdda-35dbe0afa554	100	2024-05-11T16:04:43.355Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	02d596a5-c59c-48fc-833f-02a9e567a312	10	2024-05-11T16:07:04.658Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	b1d8f194-15ac-4490-b062-d45434d41966	10	2024-05-11T16:11:42.452Z	\N	\N
7d5e29af-7d5f-41a9-afaf-8e2135dd69c4	606a9ed3-b5f7-4d63-8da9-c65adf0a927a	10	2024-05-08T18:11:44.312Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	10	2024-05-09T02:13:55.212Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	b15fee1e-5c89-4b46-a5b2-fb1991f57c13	10	2024-05-09T02:15:54.239Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	4c170954-1c43-4928-9014-d3b057e4a5ca	10	2024-05-09T02:17:36.008Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	2d2a7f10-0aa2-4c87-b5a8-3441cb569f10	10	2024-05-09T02:18:34.315Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	a9c5cfe0-a05c-4e45-b38a-f5db5f837304	10	2024-05-09T02:18:59.875Z	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	10	2024-05-09T12:12:39.815Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	b3dbcd74-cbaa-45af-852c-a0433220aa2a	0	2024-05-13T07:23:25.413Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	0	2024-05-13T07:23:38.148Z	\N	\N
250721c8-c11f-4fe0-939a-d7742cbebf31	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-13T07:23:08.228Z	2024-05-13T07:23:39.150Z	\N
14b58682-3c64-42fa-a61a-827f913fc174	11c6d26d-d148-49c7-bcfd-cf2ce6be4022	10	2024-05-13T07:26:52.287Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	cbe1445b-256b-4d93-8829-6a1fda8f526c	100	2024-05-10T11:23:34.880Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	496185c5-16e8-4576-9778-0514ca727dbc	10	2024-05-11T16:07:38.681Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	c7493f68-4e46-453d-9bf0-36fff3189bf7	0	2024-05-11T16:33:50.956Z	2024-05-13T17:12:20.030Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	e966d8d8-9212-49c6-a1c2-385a61edab45	0	2024-05-11T16:34:05.501Z	2024-05-13T17:12:27.770Z	\N
a78d2791-be16-4736-89ae-17a5c6e22936	01794c4c-0038-4330-a478-0d10c85fb2d0	0	2024-05-12T17:42:36.961Z	2024-05-14T00:40:21.238Z	\N
d036b8ca-85d1-449f-b032-922497874543	3ce35ddd-0dac-41f9-88a9-27a509c5df0b	100	2024-05-11T16:23:33.676Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	a736cad0-9135-4ac2-bb96-d40350b52658	100	2024-05-11T16:25:37.236Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	3bb8fb06-b376-4489-80fe-59826066e849	100	2024-05-11T16:28:50.686Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	4c4b59cc-d639-4952-87e3-107c61c2a673	100	2024-05-11T16:30:15.686Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	1ddc00de-781a-49ed-bddd-bdc7b24d5231	100	2024-05-11T16:32:18.095Z	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	cc5459a2-9b43-486b-8c3f-99c507c68562	0	2024-05-12T17:43:01.717Z	2024-05-14T00:40:43.534Z	\N
d036b8ca-85d1-449f-b032-922497874543	f92f19df-fcfc-4187-ba73-3457c765e71a	10	2024-05-11T16:34:30.962Z	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	52808a2f-f878-4f2d-8c8d-17c2861358e8	0	2024-05-12T17:43:11.035Z	2024-05-14T00:40:50.826Z	\N
d036b8ca-85d1-449f-b032-922497874543	83c733cc-e2b0-4d93-990e-e2e05bf5187c	10	2024-05-11T16:35:49.106Z	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	329ef2f3-32ec-4987-8089-c7f02ffd7aaf	0	2024-05-12T17:43:19.289Z	2024-05-14T00:40:57.015Z	\N
a78d2791-be16-4736-89ae-17a5c6e22936	3bb8fb06-b376-4489-80fe-59826066e849	0	2024-05-12T17:42:28.788Z	2024-05-14T00:41:48.293Z	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	d01c1d11-e401-4151-b0ec-52c26ce54b32	100	2024-05-15T00:45:46.682Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	6d451ef8-e962-423c-8fc8-5fb0eb848766	10	2024-05-15T00:46:01.068Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	01794c4c-0038-4330-a478-0d10c85fb2d0	100	2024-05-11T16:41:57.512Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	5a68adc5-f0cc-44f6-99e4-12cd88662d08	10	2024-05-15T00:46:12.949Z	\N	\N
777e7126-a5a6-4a40-89f8-ab6f0e13ba46	30afd32d-4464-488e-a212-e4b9ad9ea5bc	10	2024-05-11T16:42:10.591Z	\N	\N
777e7126-a5a6-4a40-89f8-ab6f0e13ba46	2218d1d3-1131-4597-b242-adc85848d351	100	2024-05-11T16:42:58.414Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	e8c4291e-0cbf-44f5-8a68-408f87f203c8	10	2024-05-15T00:46:46.292Z	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	3edb0a60-0bbf-4332-9fd1-8de317091fca	100	2024-05-12T17:33:11.044Z	2024-05-12T17:34:40.049Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	242ff884-0ac2-47a1-850e-cf1829423692	0	2024-05-12T15:58:33.101Z	2024-05-15T00:50:14.001Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	2df34cb2-b419-4cd9-bac0-fee998327fd6	0	2024-05-15T00:45:12.141Z	2024-05-15T00:55:08.810Z	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	3f4a6357-7a1b-4c64-a48b-7c6136e3f472	10	2024-05-15T00:58:03.946Z	\N	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	cdc6895e-3653-4d75-b48d-e55d8062343a	100	2024-05-15T00:58:33.769Z	\N	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	7ec537b7-31aa-4a4e-9fba-4ef922665767	10	2024-05-15T00:58:46.257Z	\N	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	c7493f68-4e46-453d-9bf0-36fff3189bf7	10	2024-05-15T01:00:41.074Z	\N	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	9b5e0298-63d9-49b6-ad1d-c912aac2d437	10	2024-05-15T01:00:48.833Z	\N	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	053d6422-e791-474c-9820-90252e04da58	10	2024-05-15T01:10:09.470Z	\N	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	063d43f1-9f08-4943-8f82-b51aa4e49924	10	2024-05-15T01:10:31.246Z	\N	\N
76fdc594-6a28-4d80-8ac5-c2a37ff05f27	df954afb-bd57-422c-ab70-de3787cb7880	100	2024-05-15T01:10:51.573Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	9ee6fd99-6604-438c-a3cc-15d2c7f997ed	10	2024-05-15T01:11:45.352Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	1f136e6b-3881-4341-b169-5a4ec852c888	100	2024-05-15T01:14:38.916Z	\N	\N
70084b0f-4b01-431e-a2bf-ee85df1da7cd	86cad6e9-5244-4991-9340-eed4798547ae	10	2024-05-15T01:24:24.671Z	\N	\N
70084b0f-4b01-431e-a2bf-ee85df1da7cd	dfbf27f0-d560-4aea-aba6-532a6346b994	10	2024-05-15T01:24:39.655Z	\N	\N
70084b0f-4b01-431e-a2bf-ee85df1da7cd	4ce2c392-ee74-49d4-a339-4903ebeb6a1f	10	2024-05-15T01:25:37.670Z	\N	\N
70084b0f-4b01-431e-a2bf-ee85df1da7cd	2f6dc320-55e1-4832-8fce-a7ddf9ee661a	10	2024-05-15T01:27:03.167Z	\N	\N
70084b0f-4b01-431e-a2bf-ee85df1da7cd	5f805e7a-39fc-4759-936c-9a0097a5b8a6	10	2024-05-15T01:27:24.826Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	6347a939-ad2c-458e-a097-17fdb7ef34b1	100	2024-05-15T01:28:44.396Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	edcb4032-d028-48ee-9811-b6004b277877	10	2024-05-15T01:29:55.003Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	7982a520-ecc8-4cf9-a8be-2bd40550bd31	100	2024-05-15T01:30:21.574Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	c1e4ef3f-0d86-418f-9d9f-05f028246bed	10	2024-05-15T01:31:27.882Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	8a241182-20e5-4340-be5e-53cce9a4667d	0	2024-05-13T08:12:27.530Z	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-12T17:44:04.655Z	2024-05-14T00:38:43.447Z	\N
a78d2791-be16-4736-89ae-17a5c6e22936	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	0	2024-05-12T17:43:43.058Z	2024-05-14T00:41:10.430Z	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	242ff884-0ac2-47a1-850e-cf1829423692	10	2024-05-15T00:57:05.125Z	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	dd565638-4773-4712-91e1-4a3478c8fa6a	10	2024-05-08T18:23:48.790Z	\N	\N
5207fb6b-af7d-4842-8a19-6ae75f13d3c6	6ecf5b89-427f-420d-b208-b1affbdb6dd1	100	2024-05-09T02:26:33.189Z	\N	\N
5207fb6b-af7d-4842-8a19-6ae75f13d3c6	4ae4acec-ee0d-40f3-931c-37759e97ecff	100	2024-05-09T02:27:06.875Z	\N	\N
5207fb6b-af7d-4842-8a19-6ae75f13d3c6	27493e1f-4f5c-4149-aabf-9c4f6697a35f	100	2024-05-09T02:27:19.059Z	\N	\N
5207fb6b-af7d-4842-8a19-6ae75f13d3c6	c905ca5a-0564-4d2a-b9b9-585cbce1cc62	10	2024-05-09T02:27:36.678Z	\N	\N
5207fb6b-af7d-4842-8a19-6ae75f13d3c6	689c1d43-a7ee-4b95-97df-1558fbfcb863	100	2024-05-09T02:28:04.333Z	\N	\N
5207fb6b-af7d-4842-8a19-6ae75f13d3c6	d2123a82-91a0-4f30-896b-61ee15ade670	100	2024-05-09T02:28:29.003Z	\N	\N
5207fb6b-af7d-4842-8a19-6ae75f13d3c6	2df34cb2-b419-4cd9-bac0-fee998327fd6	100	2024-05-09T02:29:03.817Z	\N	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	377fdec9-9b17-4086-8986-3e04508c4917	10	2024-05-15T00:57:17.473Z	\N	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	8df22c40-25d7-4f96-8bc6-0fe734f948d3	10	2024-05-15T00:57:27.812Z	\N	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	bff6f569-ddb2-455f-a4e9-202182a4c940	10	2024-05-15T00:57:52.665Z	\N	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	945268c6-faf9-4b7b-a8b1-b016bd2dd0dd	10	2024-05-15T00:59:15.517Z	\N	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	a28f63c9-cd42-40fc-ac77-ca5c73d26439	10	2024-05-15T00:59:28.537Z	\N	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	88336b36-ddc0-40dc-9615-0ad868418e8f	10	2024-05-15T00:59:54.617Z	\N	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	f74837d7-d4b4-4224-be14-a6d0df76ea8f	10	2024-05-15T01:00:10.129Z	\N	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	b2f1c6ff-93dc-4d8d-8365-36bcfc0eb1fd	10	2024-05-15T01:00:22.857Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	c957dded-1e08-4e25-a2f8-80d111aef57b	10	2024-05-11T16:08:03.182Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-11T16:12:27.827Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	5e4b4b53-a13b-483c-a783-5576e0225d82	100	2024-05-11T16:20:09.879Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	32c8b84b-f427-472b-91fb-150008246e85	100	2024-05-11T16:23:46.867Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	21d0b947-aabf-445d-8622-464875e4b937	100	2024-05-11T16:25:01.635Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	172c7042-1a1a-4ed0-9cd7-9f818efde80a	100	2024-05-11T16:26:58.838Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	e22bf0ca-5fef-46f2-bc54-a3b627d41080	100	2024-05-11T16:27:29.182Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	ea2c6721-693d-496e-8442-a2381d48430b	100	2024-05-11T16:28:24.269Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	cbe1445b-256b-4d93-8829-6a1fda8f526c	100	2024-05-11T16:29:32.475Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	8c4ed7fa-8b92-492e-bf05-94d2fd4f5016	100	2024-05-15T01:13:06.567Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	a736cad0-9135-4ac2-bb96-d40350b52658	0	2024-05-11T19:53:10.967Z	2024-05-15T01:16:33.574Z	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	0fa75023-eb3b-47a6-b535-d14dfb8c139f	100	2024-05-15T01:18:04.060Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	fd79a476-6a50-4389-a496-ca34724ff38e	10	2024-05-11T16:39:27.530Z	\N	\N
777e7126-a5a6-4a40-89f8-ab6f0e13ba46	7f9d1ef1-8ebe-4c57-a931-a3e45caa5794	100	2024-05-11T16:44:22.184Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	100	2024-05-11T16:49:14.685Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	c4e94a84-f6d2-48a3-a391-8c2491cc8b21	100	2024-05-11T17:00:35.251Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	8f000e6a-c3cf-43ea-a947-f5df7150caa4	100	2024-05-11T17:01:40.309Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	3704be1c-459a-4c7d-a18c-34dfd3a1c6cd	100	2024-05-11T17:01:52.433Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-11T17:02:04.047Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	c1e4ef3f-0d86-418f-9d9f-05f028246bed	100	2024-05-11T17:19:59.518Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	43a27a70-3ed5-4a3d-8428-623810c3f717	10	2024-05-11T17:46:13.856Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	14bb5f33-7c73-441d-a3b6-27fd7348dce3	10	2024-05-11T17:46:18.231Z	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	5e4b4b53-a13b-483c-a783-5576e0225d82	100	2024-05-12T17:43:59.481Z	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	01d3d6df-cd76-4f62-9c39-ddd968a9a634	1	2024-05-11T17:49:29.069Z	2024-05-12T02:03:10.036Z	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	dddc18c7-f4d7-43d6-9007-40599f10cc16	100	2024-05-11T17:03:20.230Z	2024-05-12T19:59:30.742Z	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	c6d02d83-82c5-49b6-ab56-a877f9d51e41	100	2024-05-08T18:48:57.681Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	31420dbb-f6a3-443b-89c1-05344b195408	0	2024-05-08T18:37:33.199Z	2024-05-13T03:12:46.483Z	\N
51077fad-c591-4849-b1d7-08d05faeec96	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-09T03:20:35.722Z	\N	\N
51077fad-c591-4849-b1d7-08d05faeec96	52634f35-73b2-4c60-99c9-1ec886f6e4b3	10	2024-05-09T03:20:50.595Z	\N	\N
51077fad-c591-4849-b1d7-08d05faeec96	69732c83-e2ee-481f-b4c5-e55932e8d51f	10	2024-05-09T03:21:03.587Z	\N	\N
51077fad-c591-4849-b1d7-08d05faeec96	caa77bd6-4cf9-44a5-aa24-2e68c899081a	10	2024-05-09T03:21:13.518Z	\N	\N
94eb5d46-85cf-4915-a8f9-e10bf77e401d	860776d6-b97a-431f-b089-faee9ca777bc	0	2024-05-13T09:30:36.030Z	2024-05-13T16:01:38.025Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	4bd475d3-779b-45bb-b9f9-7a6052bc41fb	0	2024-05-08T18:49:06.914Z	2024-05-13T16:28:37.497Z	\N
f2884cd5-1f02-43b0-a7ed-77254b8a8c5f	46862e71-22b7-4023-ba93-2936050c6f9f	10	2024-05-10T07:33:41.807Z	\N	\N
f2884cd5-1f02-43b0-a7ed-77254b8a8c5f	5a4901b0-14eb-4c88-92ff-bb82aff88094	10	2024-05-10T07:34:01.836Z	\N	\N
f2884cd5-1f02-43b0-a7ed-77254b8a8c5f	4bd475d3-779b-45bb-b9f9-7a6052bc41fb	10	2024-05-10T07:34:09.701Z	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	599bee49-16ea-4ea6-9a4a-ae3043926417	0	2024-05-12T17:43:26.580Z	2024-05-14T00:41:04.024Z	\N
d036b8ca-85d1-449f-b032-922497874543	92aa3e09-f5bc-4645-bad3-7f13d40043fc	10	2024-05-11T16:22:40.956Z	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	caa77bd6-4cf9-44a5-aa24-2e68c899081a	0	2024-05-12T17:42:51.965Z	2024-05-14T01:34:05.805Z	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	367ed746-6c87-41d9-a29e-bf3540360ccf	100	2024-05-15T01:12:51.950Z	\N	\N
70084b0f-4b01-431e-a2bf-ee85df1da7cd	2c98279b-bbd2-4645-96a3-51edb69cf509	10	2024-05-15T01:23:53.351Z	\N	\N
70084b0f-4b01-431e-a2bf-ee85df1da7cd	2a8e82ce-897c-4ce2-a611-1c5cbbb562d5	10	2024-05-15T01:26:15.853Z	\N	\N
70084b0f-4b01-431e-a2bf-ee85df1da7cd	1174922e-fe33-4f48-b3dc-12f61af89e90	10	2024-05-15T01:26:31.902Z	\N	\N
70084b0f-4b01-431e-a2bf-ee85df1da7cd	387fbf07-bb94-4471-9db3-f6a2eec3e772	10	2024-05-15T01:26:43.899Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-15T01:29:16.303Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	52808a2f-f878-4f2d-8c8d-17c2861358e8	100	2024-05-15T01:34:42.544Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-15T01:35:00.860Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	9fa75236-5a40-4ee2-89ae-feb9934ef0c2	100	2024-05-15T01:39:58.656Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	15121282-bdc8-4096-845b-974401b2e6aa	100	2024-05-15T01:40:56.922Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	a8ae4a1f-bc8d-4d48-a5ec-ebf618e93781	100	2024-05-15T01:43:31.958Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	c20019f9-5d76-42b2-b993-73a62a2c7f6d	10	2024-05-15T01:46:00.895Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	6614f568-a5dc-4d13-90b8-8e5563088e9d	100	2024-05-15T01:48:38.444Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	1d3bbf0a-b9d6-4766-884c-5dbcf5f941e2	100	2024-05-15T01:53:19.028Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	689c1d43-a7ee-4b95-97df-1558fbfcb863	100	2024-05-08T18:50:05.953Z	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	81c95bb4-5c9e-4d4a-b1cb-0dbcf89781a0	100	2024-05-12T17:44:14.479Z	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	e162ec59-91e5-4621-8a2a-05848cd0f368	100	2024-05-12T17:44:26.167Z	\N	\N
d5f1b990-bc50-4564-bb05-ae52af1b56b3	caa77bd6-4cf9-44a5-aa24-2e68c899081a	10	2024-05-08T19:04:40.854Z	\N	\N
d5f1b990-bc50-4564-bb05-ae52af1b56b3	2d93e34c-6997-499e-b4f6-6cd7bbcf8602	10	2024-05-08T19:05:11.407Z	\N	\N
51077fad-c591-4849-b1d7-08d05faeec96	8b2c49f5-c34f-4ac9-abb0-5810c10e3dcb	10	2024-05-09T03:21:20.880Z	\N	\N
51077fad-c591-4849-b1d7-08d05faeec96	6ecf5b89-427f-420d-b208-b1affbdb6dd1	10	2024-05-09T03:21:27.741Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	1824b541-2769-4c99-8589-ceee946d7181	0	2024-05-08T18:41:16.833Z	2024-05-13T03:11:44.735Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	ef549295-5ce6-485d-8383-458f9e6437bb	10	2024-05-13T11:54:38.439Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	324fc117-cf6b-4367-a7f1-8eb595c01377	100	2024-05-12T18:03:28.429Z	\N	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	1ddc00de-781a-49ed-bddd-bdc7b24d5231	10	2024-05-13T12:11:30.309Z	\N	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	10	2024-05-13T12:24:51.607Z	\N	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	7982a520-ecc8-4cf9-a8be-2bd40550bd31	10	2024-05-13T12:25:44.976Z	\N	\N
78dd3306-5706-4f9f-b23d-3ab41a2beba2	5cac0471-262c-4408-8fd7-00e99f5a9869	10	2024-05-09T04:12:26.978Z	\N	\N
78dd3306-5706-4f9f-b23d-3ab41a2beba2	ecfa6079-84f1-41f8-a86f-cf0e133a135e	10	2024-05-09T04:12:37.766Z	\N	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	1d2b769c-5dfe-41ae-aec9-03266ff78cb5	10	2024-05-13T12:28:35.065Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	13a4afa8-2b27-43c2-8ac1-0a2b29ce7832	10	2024-05-12T18:06:34.556Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	15129370-e9f5-4797-87cf-225625bc7642	10	2024-05-12T18:06:52.162Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	001e3bdc-a463-4cea-a4f1-6bb36cd67d5f	100	2024-05-12T18:07:10.528Z	\N	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	c096c90d-0710-4804-801c-e5a2b8d14e6f	10	2024-05-13T12:29:01.973Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	91c1ee8c-c4bc-4858-86cb-c47b80846004	100	2024-05-12T18:07:26.632Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	0fa75023-eb3b-47a6-b535-d14dfb8c139f	100	2024-05-12T18:08:47.940Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	460c72c0-b362-4fe8-a7e8-06aabe57cccd	100	2024-05-09T04:26:04.287Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	7d0f8cf5-9f10-4822-bcde-6b94d1738065	100	2024-05-09T04:26:18.421Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	4e619f2b-0e02-4842-8b1d-410ff44038cd	0	2024-05-09T05:13:24.587Z	2024-05-13T16:29:18.408Z	\N
71e40554-3191-4481-ab4b-9d83b897b17e	92542ce7-d1b9-4da5-9c93-38698fd0f042	100	2024-05-09T04:26:35.828Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	b02cec28-dac2-42ec-a552-0558f598fa51	0	2024-05-09T05:17:17.122Z	2024-05-13T16:43:32.100Z	\N
71e40554-3191-4481-ab4b-9d83b897b17e	bc029ecf-f1db-4d05-b032-a87b79985300	10	2024-05-09T04:26:58.762Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	3ee51ac3-056c-4e53-9062-93df16dac1b3	10	2024-05-09T04:27:06.812Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	fb2766d8-4f6f-4615-a4ec-56ab17622a06	0	2024-05-09T05:13:02.586Z	2024-05-13T16:45:16.057Z	\N
71e40554-3191-4481-ab4b-9d83b897b17e	eb01d39b-e347-4a3f-a0ea-f59f916a2236	10	2024-05-09T04:27:34.708Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	dd65466a-5978-4879-80b8-be543d285774	10	2024-05-12T18:09:28.339Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	460c72c0-b362-4fe8-a7e8-06aabe57cccd	0	2024-05-09T05:14:12.723Z	2024-05-13T16:49:19.945Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	36b4a759-d476-4904-ab8e-475404bb564a	0	2024-05-09T05:11:25.912Z	2024-05-13T16:49:44.980Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	d4a48129-b591-4504-a205-589bd90bd350	0	2024-05-09T05:11:44.216Z	2024-05-13T16:49:55.792Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	73fbacb1-0736-49ec-8873-80ddd65608a2	0	2024-05-09T05:15:26.041Z	2024-05-13T16:50:10.944Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	fea081c1-7939-4516-97a5-f2cd49177577	0	2024-05-09T05:12:10.040Z	2024-05-13T16:50:20.794Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	0b0cc909-bb05-4234-a005-0a8bbde9ecd8	0	2024-05-09T05:14:25.934Z	2024-05-13T16:58:00.331Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	f3eb355a-4868-48af-befc-38a8a565c8e4	0	2024-05-09T05:13:56.236Z	2024-05-13T17:04:19.417Z	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	d7169b4a-e0ef-469b-8427-f2191ebe432b	100	2024-05-09T04:56:46.359Z	\N	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	f78c85b4-fcac-4854-970b-d80f201d5aa3	100	2024-05-09T04:57:03.425Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	599bee49-16ea-4ea6-9a4a-ae3043926417	0	2024-05-09T05:15:12.322Z	2024-05-13T17:04:33.742Z	\N
f2884cd5-1f02-43b0-a7ed-77254b8a8c5f	fd79a476-6a50-4389-a496-ca34724ff38e	10	2024-05-10T07:35:02.570Z	\N	\N
f2884cd5-1f02-43b0-a7ed-77254b8a8c5f	8a491c1d-0a91-4135-b7f7-85a460eb44ba	10	2024-05-10T07:35:36.873Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	770fd1b3-e792-4127-88f9-7d7a47224363	100	2024-05-11T16:23:04.414Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	96015ec9-b6d9-4ab2-9bac-b2e8375bb6b5	100	2024-05-11T16:23:16.269Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	7d861778-7335-4765-90b7-e57ef5a9799f	0	2024-05-12T18:09:02.948Z	2024-05-14T15:56:39.221Z	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	1ab617ae-01e8-412d-a0c2-9fbea777d832	10	2024-05-15T01:32:36.795Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	88b8e542-7cbe-4175-a37e-30bf2c58c6ce	10	2024-05-15T01:32:42.608Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	27411da6-fbb8-41a1-aaf2-54588452c9b4	10	2024-05-15T01:32:54.089Z	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	3e85a0d3-2717-44bb-8b4b-8ce1a0d2374d	100	2024-05-08T18:42:18.381Z	\N	\N
f2884cd5-1f02-43b0-a7ed-77254b8a8c5f	50272a9e-53dc-4e57-a56b-57f226b22933	1	2024-05-10T07:36:24.455Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	5770494e-2cbb-435f-ba4d-048a90c9e0bc	10	2024-05-08T18:49:32.471Z	\N	\N
d5f1b990-bc50-4564-bb05-ae52af1b56b3	b7349827-482c-4c5c-b0eb-7627a8380c16	100	2024-05-08T19:02:10.110Z	\N	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	950a9045-f3c3-42d7-bf59-d42c5ef42d29	100	2024-05-13T11:57:30.402Z	\N	\N
d5f1b990-bc50-4564-bb05-ae52af1b56b3	4ae4acec-ee0d-40f3-931c-37759e97ecff	10	2024-05-08T19:04:18.577Z	\N	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	721ae863-981f-4184-ad2d-e0b0b5d7647e	100	2024-05-13T11:58:02.723Z	\N	\N
d5f1b990-bc50-4564-bb05-ae52af1b56b3	9af075ac-8d39-4843-8907-02ccb6b5910b	0	2024-05-08T19:10:00.805Z	2024-05-13T14:42:25.466Z	\N
51077fad-c591-4849-b1d7-08d05faeec96	4ae4acec-ee0d-40f3-931c-37759e97ecff	10	2024-05-09T03:21:39.932Z	\N	\N
51077fad-c591-4849-b1d7-08d05faeec96	a736cad0-9135-4ac2-bb96-d40350b52658	10	2024-05-09T03:21:47.201Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	2d93e34c-6997-499e-b4f6-6cd7bbcf8602	10	2024-05-12T18:01:15.346Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	ea2c6721-693d-496e-8442-a2381d48430b	10	2024-05-12T18:01:30.052Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	329ef2f3-32ec-4987-8089-c7f02ffd7aaf	10	2024-05-12T18:01:47.297Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	03ce9af4-367a-4ff3-be16-8014eb017f2f	10	2024-05-12T18:02:12.049Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	63884b8e-600b-4c94-948c-1e39365223c4	100	2024-05-12T18:03:45.546Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	86cad6e9-5244-4991-9340-eed4798547ae	100	2024-05-12T18:06:02.028Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	ddd006a5-eac6-44de-ad77-b9386f25ef9c	10	2024-05-12T18:06:13.564Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	5a68adc5-f0cc-44f6-99e4-12cd88662d08	10	2024-05-12T18:10:10.800Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	1174922e-fe33-4f48-b3dc-12f61af89e90	10	2024-05-12T18:10:27.180Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	9ef7585a-4ac6-4602-b155-70543434a547	10	2024-05-12T18:10:34.239Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	04a2d64b-69c0-4f6b-8975-4d41b4f43327	100	2024-05-12T18:10:47.285Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	38028f59-3dc9-4556-a56a-7d2fbb7ed895	100	2024-05-12T18:11:07.918Z	\N	\N
c76f0f3a-38ae-4f5c-ba05-59f894c25304	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-12T18:12:13.318Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	c51c47b6-4fad-45d6-9d30-f2b9c98f76f5	10	2024-05-15T01:33:33.589Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	e8c4291e-0cbf-44f5-8a68-408f87f203c8	10	2024-05-15T01:34:02.607Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	0774d214-1b04-4d83-90bb-bf30662b9a5a	10	2024-05-15T01:34:33.084Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	799e9f43-b5e8-4484-be33-09c442390253	100	2024-05-12T18:13:07.603Z	\N	\N
c76f0f3a-38ae-4f5c-ba05-59f894c25304	e3f24520-666e-47d0-ad10-73a9110b3ad4	10	2024-05-12T18:13:11.805Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	e99b7beb-668d-45f0-b368-6fad52f284a5	100	2024-05-12T18:13:16.719Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	100	2024-05-12T18:13:19.933Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	36294c41-22ed-4750-afdd-ce758eff8a26	10	2024-05-12T18:13:30.777Z	\N	\N
c76f0f3a-38ae-4f5c-ba05-59f894c25304	fc763265-b328-4fa5-9975-307e97ec35ca	10	2024-05-12T18:13:31.131Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	e4bedb60-5d9c-4cc6-8ba7-f93d890c6cec	10	2024-05-12T18:13:40.062Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	79039fe7-7ae3-410a-913e-49cd816aeca1	10	2024-05-12T18:13:45.093Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	ea2c6721-693d-496e-8442-a2381d48430b	100	2024-05-15T01:36:36.108Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	32c65e0d-592c-4003-b071-bb11449e6de8	100	2024-05-15T01:37:23.213Z	\N	\N
d0b27e7f-9ef1-4fbe-a15a-36af6ad2eaa9	a46e43f3-6678-402a-93de-efa7f8d42006	10	2024-05-12T18:23:28.186Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	b3f244b6-07e4-41d2-ace6-a3e2fc93281b	100	2024-05-15T01:41:34.813Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	7d8f08bd-0994-433f-890d-29690027bf6a	100	2024-05-15T01:42:23.042Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	8df22c40-25d7-4f96-8bc6-0fe734f948d3	100	2024-05-12T18:35:47.937Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	1	2024-05-12T18:38:16.318Z	\N	\N
135f566a-8664-4a28-8667-76873f0dc18e	ae3c2c9b-44da-4c00-9755-74880c3f9da1	10	2024-05-12T18:41:49.414Z	\N	\N
135f566a-8664-4a28-8667-76873f0dc18e	6f0169e7-5ca9-4bbc-83f8-78cea1443551	10	2024-05-12T18:42:18.303Z	\N	\N
135f566a-8664-4a28-8667-76873f0dc18e	af26cae5-8bae-420c-8052-782b9598fded	10	2024-05-12T18:42:39.538Z	\N	\N
fed7abfb-e144-4dc9-858c-647b97a74c58	c777f376-391c-4bff-b548-e19a8bf34ad6	10	2024-05-12T18:44:01.787Z	\N	\N
f728ff4a-886d-498b-913c-54fd349920bb	0676bbe1-5bb4-4bd1-94b6-7a5038ecd41e	10	2024-05-12T19:11:46.473Z	\N	\N
f728ff4a-886d-498b-913c-54fd349920bb	e82f2b29-1394-4325-a728-f3dd20f1c6bf	10	2024-05-12T19:12:05.020Z	\N	\N
f728ff4a-886d-498b-913c-54fd349920bb	38939273-b35e-49bf-b84f-0a04f747d44e	10	2024-05-12T19:12:16.631Z	\N	\N
f728ff4a-886d-498b-913c-54fd349920bb	bebcebf5-673a-49af-a02b-168c11dd0dd9	10	2024-05-12T19:12:48.071Z	\N	\N
d5f1b990-bc50-4564-bb05-ae52af1b56b3	4124cef6-ffc1-40b7-8cb0-8b4a89dab6f2	10	2024-05-08T19:04:26.544Z	2024-05-12T21:32:36.359Z	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	f9ae8487-c283-437c-a42c-d5cc4b6ed388	100	2024-05-08T18:50:39.003Z	\N	\N
f2884cd5-1f02-43b0-a7ed-77254b8a8c5f	8ec08775-c401-4a5e-b52d-681cc468601c	100	2024-05-10T09:28:26.045Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	d8b0c9ec-39a1-44e4-9ccf-36b439e39368	100	2024-05-08T18:51:12.014Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	f94729df-e289-49d8-b55c-19ebdbfd783c	10	2024-05-12T18:04:01.469Z	\N	\N
d5f1b990-bc50-4564-bb05-ae52af1b56b3	f8ba58b3-6549-49b7-b400-81ce225d365d	10	2024-05-08T19:04:32.181Z	\N	\N
d5f1b990-bc50-4564-bb05-ae52af1b56b3	01794c4c-0038-4330-a478-0d10c85fb2d0	10	2024-05-08T19:04:48.066Z	\N	\N
d5f1b990-bc50-4564-bb05-ae52af1b56b3	bcd499a9-ddd9-479e-a057-c9f058178eaf	10	2024-05-08T19:05:05.589Z	\N	\N
d5f1b990-bc50-4564-bb05-ae52af1b56b3	8b2c49f5-c34f-4ac9-abb0-5810c10e3dcb	10	2024-05-08T19:05:18.159Z	\N	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	6c8684ed-85ad-49c0-a76e-cb34e7538f4d	10	2024-05-13T12:11:02.671Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	6ebdfdfa-c7b7-42c3-972c-a15b921d4e66	0	2024-05-13T12:11:07.171Z	\N	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	69732c83-e2ee-481f-b4c5-e55932e8d51f	10	2024-05-13T12:11:13.104Z	\N	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	367ed746-6c87-41d9-a29e-bf3540360ccf	10	2024-05-13T12:11:52.105Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	924e9906-692e-460a-bfe4-de2a6c33a5f1	100	2024-05-12T18:04:14.576Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	b813d3b5-bf55-443b-b1a4-be3d426af4e9	100	2024-05-12T18:04:41.809Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	27493e1f-4f5c-4149-aabf-9c4f6697a35f	100	2024-05-15T01:47:51.038Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	6ecf6803-0257-45eb-975d-ce7f8ea98f1e	100	2024-05-12T18:05:16.917Z	2024-05-12T18:05:22.827Z	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	1	2024-05-13T12:12:34.109Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	27411da6-fbb8-41a1-aaf2-54588452c9b4	100	2024-05-12T18:05:37.530Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	9717b995-f922-4e7e-970b-c0275d597c01	10	2024-05-12T18:08:13.577Z	\N	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	01d3d6df-cd76-4f62-9c39-ddd968a9a634	1	2024-05-13T12:12:59.524Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	03df84a0-a3a2-42ff-b299-a9b30ffb52bd	100	2024-05-12T18:08:35.200Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	715fb8d2-6acd-4b2b-8164-79de7fef3fec	100	2024-05-12T18:09:10.078Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	158fb67d-00f8-4752-be65-4108101bdd7f	10	2024-05-12T18:09:42.549Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	2b408b16-8dbc-41df-b3c8-7efb18d462b7	100	2024-05-09T04:24:27.829Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	1822d9b2-10f4-4e0d-a39a-b987ed707fae	100	2024-05-09T04:24:41.715Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	d4bfdb7f-b11d-405d-99c6-99c135eb89d4	100	2024-05-09T04:24:52.711Z	\N	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	1	2024-05-13T12:13:15.113Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	410ee4d8-32eb-4f30-8b89-175ad8252c4b	10	2024-05-09T04:25:27.631Z	\N	\N
c76f0f3a-38ae-4f5c-ba05-59f894c25304	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	10	2024-05-12T18:10:54.787Z	\N	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	e162ec59-91e5-4621-8a2a-05848cd0f368	10	2024-05-13T12:25:06.251Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	19237243-240d-4b13-b4b5-1cc2ae01571d	0	2024-05-12T18:09:29.442Z	2024-05-14T15:55:02.055Z	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	c4e94a84-f6d2-48a3-a391-8c2491cc8b21	10	2024-05-13T12:25:14.034Z	\N	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	5facb97a-2e27-4ddf-bbde-0aeed05bb262	10	2024-05-13T12:25:28.984Z	\N	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	5a4901b0-14eb-4c88-92ff-bb82aff88094	10	2024-05-13T12:25:55.153Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	f78c85b4-fcac-4854-970b-d80f201d5aa3	0	2024-05-13T12:26:42.095Z	\N	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	2a088703-bffe-491a-8e62-4c9f796024d1	10	2024-05-13T12:33:39.651Z	\N	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	0d0b7439-82c1-4030-8d40-3dd94753eb40	10	2024-05-13T12:34:27.507Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	65bc4ea4-a0db-4ac4-b343-b9d587be224b	100	2024-05-13T12:41:09.428Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	f8ba58b3-6549-49b7-b400-81ce225d365d	100	2024-05-13T12:44:25.004Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	e3f884bd-3dc5-480f-8bfe-c0be33d26f43	100	2024-05-13T12:44:38.515Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	552e881e-ed4a-414b-914e-36a0dd85d0a4	100	2024-05-13T12:44:50.403Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	88fa7edf-2f9d-43e9-b983-86aa6fc63374	100	2024-05-13T12:45:18.763Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	5880fcb0-dd0e-4681-b97d-a1f501152fc6	100	2024-05-13T12:45:24.207Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	fe6cc6f1-779b-46d5-aa3f-7f57e08fecfa	10	2024-05-13T12:45:48.038Z	\N	\N
777e7126-a5a6-4a40-89f8-ab6f0e13ba46	0bac5a5c-e260-41eb-806e-46397862d868	100	2024-05-11T16:38:05.087Z	\N	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	a736cad0-9135-4ac2-bb96-d40350b52658	0	2024-05-13T12:11:39.572Z	2024-05-13T15:59:10.081Z	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	01794c4c-0038-4330-a478-0d10c85fb2d0	10	2024-05-13T12:10:48.795Z	2024-05-13T15:59:24.724Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	b813d3b5-bf55-443b-b1a4-be3d426af4e9	0	2024-05-11T16:34:44.368Z	2024-05-13T17:08:28.480Z	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	00a3e128-7af5-4fbd-aa99-ae33e46124fc	0	2024-05-12T18:10:17.860Z	2024-05-14T15:55:22.335Z	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	01794c4c-0038-4330-a478-0d10c85fb2d0	0	2024-05-12T18:08:33.534Z	2024-05-14T15:55:56.633Z	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	2c98279b-bbd2-4645-96a3-51edb69cf509	0	2024-05-12T18:08:45.178Z	2024-05-14T15:56:53.332Z	\N
777e7126-a5a6-4a40-89f8-ab6f0e13ba46	dfbf27f0-d560-4aea-aba6-532a6346b994	10	2024-05-11T16:41:09.981Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	0d0b7439-82c1-4030-8d40-3dd94753eb40	100	2024-05-13T12:26:10.212Z	2024-05-14T17:39:10.488Z	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-09T20:44:53.713Z	2024-05-12T15:14:37.679Z	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	352af921-b2eb-4ca8-9775-5f124c622d6b	10	2024-05-09T20:48:25.455Z	2024-05-12T15:16:16.090Z	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	36b4a759-d476-4904-ab8e-475404bb564a	100	2024-05-09T04:53:17.234Z	\N	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	66a98038-4588-431c-814d-0c440c4683af	1	2024-05-13T12:12:48.999Z	\N	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	8b2c49f5-c34f-4ac9-abb0-5810c10e3dcb	1	2024-05-13T12:13:29.633Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	fc763265-b328-4fa5-9975-307e97ec35ca	0	2024-05-10T10:57:50.491Z	2024-05-14T10:39:52.378Z	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	1e82efdb-7aaf-4f66-adfa-beb849657760	100	2024-05-15T01:50:51.657Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	340e35f2-a28c-4c48-a114-2e7339c7c735	100	2024-05-15T01:51:37.956Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	100	2024-05-15T01:52:32.521Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	5360ddf0-2cef-4ed6-9097-7b6ad85de3c9	100	2024-05-12T18:11:14.702Z	\N	\N
c76f0f3a-38ae-4f5c-ba05-59f894c25304	fea081c1-7939-4516-97a5-f2cd49177577	10	2024-05-12T18:11:21.842Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	100	2024-05-12T18:11:36.319Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	d01c1d11-e401-4151-b0ec-52c26ce54b32	1	2024-05-12T18:14:39.399Z	\N	\N
d0b27e7f-9ef1-4fbe-a15a-36af6ad2eaa9	ef206d20-b798-4215-bebb-e53afd8f4a69	10	2024-05-12T18:23:18.441Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	65bc4ea4-a0db-4ac4-b343-b9d587be224b	10	2024-05-12T18:28:10.447Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	85132717-39a0-41bb-8409-6ecf6ec77019	10	2024-05-11T16:49:39.205Z	2024-05-13T00:15:38.026Z	\N
c76f0f3a-38ae-4f5c-ba05-59f894c25304	580c2fac-3c42-48d2-b79b-2fbc7b6fc7b0	10	2024-05-12T18:11:53.676Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	0eb6f7b8-4a6c-4e0d-a518-bfdf5c46fa22	0	2024-05-11T16:49:57.944Z	2024-05-14T13:34:18.185Z	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	f1b74773-b106-4ac4-81e3-57de81858b7e	100	2024-05-15T01:55:56.004Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	62bd5d05-ba37-497a-a1a1-56795813790d	100	2024-05-08T19:32:05.993Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	2b408b16-8dbc-41df-b3c8-7efb18d462b7	10	2024-05-09T05:12:16.691Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	3e85a0d3-2717-44bb-8b4b-8ce1a0d2374d	10	2024-05-13T12:38:51.252Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	e1d9baf6-5014-468f-9549-2b1853767835	0	2024-05-10T01:36:42.550Z	2024-05-13T13:06:17.039Z	\N
446e4dc9-c485-47bb-8f49-3107c097e735	39bc837b-b026-4a73-b987-efbba14a889f	0	2024-05-08T19:32:43.456Z	2024-05-13T13:31:29.373Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	eb1d5056-8b9b-455d-a179-172a747e3f20	0	2024-05-09T05:10:01.628Z	2024-05-13T16:39:45.042Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	43a27a70-3ed5-4a3d-8428-623810c3f717	0	2024-05-09T05:12:28.369Z	2024-05-13T16:49:33.119Z	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	a9b67a55-6742-4c3f-98ad-af8a69c05686	10	2024-05-11T16:48:16.157Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	e577da2f-4900-45db-8d72-9b45cd5cd8c1	0	2024-05-09T05:11:57.863Z	2024-05-13T16:50:35.543Z	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	931206af-51cc-4484-9948-109051aca4d5	100	2024-05-15T01:57:44.650Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	d98b2225-e6b9-4ba5-9085-ccdcc1d56af9	0	2024-05-09T05:12:44.140Z	2024-05-13T16:51:14.936Z	\N
d036b8ca-85d1-449f-b032-922497874543	258deaa1-d4c1-4e51-9a29-9883f68d506d	100	2024-05-11T16:49:44.585Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	2fe71172-ab32-490e-91ae-0ec727bd3d52	100	2024-05-11T16:50:00.564Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	04293a65-283f-4b8d-b7ab-aec478bba1b4	100	2024-05-11T16:50:20.193Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	d1a27ea2-0281-4c95-9154-6509ede0f2dd	100	2024-05-11T16:50:35.070Z	\N	\N
d036b8ca-85d1-449f-b032-922497874543	fcffd019-56c9-4949-8a10-6b6f5104291c	100	2024-05-11T16:50:45.297Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	04d628e5-8b14-42af-bbcd-800af7328d7b	100	2024-05-11T17:01:49.565Z	\N	\N
c76f0f3a-38ae-4f5c-ba05-59f894c25304	dbcb6fc3-02b4-4e31-8924-ed56f0e6ecc1	10	2024-05-12T18:12:33.913Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	c4976a72-788e-4360-ad86-bb4939bebcc2	100	2024-05-15T01:58:17.216Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	fcc2aee3-3a74-45a7-a590-961a2f78050d	100	2024-05-12T18:12:58.540Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	ef206d20-b798-4215-bebb-e53afd8f4a69	10	2024-05-12T18:13:37.884Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	b7349827-482c-4c5c-b0eb-7627a8380c16	10	2024-05-12T18:13:47.136Z	\N	\N
c76f0f3a-38ae-4f5c-ba05-59f894c25304	e162ec59-91e5-4621-8a2a-05848cd0f368	10	2024-05-12T18:13:51.285Z	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	7dafb07f-4bf3-46ce-8c1a-5750397b51c0	100	2024-05-12T18:17:07.052Z	\N	\N
d0b27e7f-9ef1-4fbe-a15a-36af6ad2eaa9	e4bedb60-5d9c-4cc6-8ba7-f93d890c6cec	10	2024-05-12T18:23:20.695Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	aa2abcfe-f957-46e6-89b7-73810b3dfcf6	0	2024-05-09T05:16:28.472Z	2024-05-13T17:06:22.480Z	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	053d6422-e791-474c-9820-90252e04da58	100	2024-05-12T18:13:58.183Z	2024-05-13T19:54:30.079Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	5a68adc5-f0cc-44f6-99e4-12cd88662d08	0	2024-05-12T18:34:27.114Z	2024-05-14T10:30:40.587Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	7dafb07f-4bf3-46ce-8c1a-5750397b51c0	0	2024-05-12T18:29:30.490Z	2024-05-14T10:35:59.997Z	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	e82f2b29-1394-4325-a728-f3dd20f1c6bf	0	2024-05-11T16:49:09.002Z	2024-05-14T13:23:38.854Z	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	30afd32d-4464-488e-a212-e4b9ad9ea5bc	0	2024-05-11T16:50:28.253Z	2024-05-14T13:27:03.014Z	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	dfbf27f0-d560-4aea-aba6-532a6346b994	0	2024-05-11T16:50:19.603Z	2024-05-14T13:27:15.588Z	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	18b45eb3-755c-4d38-a974-2857f6b30638	10	2024-05-12T18:35:07.857Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	5aac6b69-af17-4c0e-b0d0-1621211bc14c	100	2024-05-08T19:32:42.425Z	\N	\N
efaaacc6-4553-4070-992c-73cc8d23bb1f	770fd1b3-e792-4127-88f9-7d7a47224363	10	2024-05-09T06:56:07.158Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	b8598db7-a21f-4bba-8ed4-d0317b0a5df8	100	2024-05-13T12:42:50.902Z	2024-05-13T12:43:00.731Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	f3eb355a-4868-48af-befc-38a8a565c8e4	100	2024-05-13T12:43:48.843Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	876548db-d180-4083-96ba-cddcb86134b0	10	2024-05-13T12:47:14.097Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	1ddc00de-781a-49ed-bddd-bdc7b24d5231	0	2024-05-13T12:44:05.595Z	2024-05-13T12:49:33.761Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	974734e0-3a85-47e5-92bb-a7eb378c3c93	0	2024-05-13T12:42:14.689Z	2024-05-13T13:04:06.152Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	7e221be5-cacb-4b5d-96b7-4d0b65d04295	0	2024-05-10T11:05:43.598Z	2024-05-14T10:33:20.616Z	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	4c170954-1c43-4928-9014-d3b057e4a5ca	0	2024-05-11T17:27:53.891Z	2024-05-14T15:54:12.535Z	\N
52a79ef7-7e8d-4478-9ef9-a06899483809	d52b7643-1731-48cb-9859-797c159d67b7	100	2024-05-11T17:45:06.202Z	\N	\N
52a79ef7-7e8d-4478-9ef9-a06899483809	edcb4032-d028-48ee-9811-b6004b277877	100	2024-05-11T17:45:30.563Z	\N	\N
792ef61b-0f2d-4b0f-9f10-41bbe3327bdf	46862e71-22b7-4023-ba93-2936050c6f9f	0	2024-05-12T18:50:22.885Z	2024-05-14T17:23:01.096Z	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	17319b12-0d9f-4d54-b516-3a1d2c0ff396	10	2024-05-11T17:47:03.306Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	63b4f328-50d6-45a8-9780-2e795efffaa6	10	2024-05-11T17:47:58.255Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	d01c1d11-e401-4151-b0ec-52c26ce54b32	1	2024-05-11T17:48:11.722Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	e1075af4-70c1-4124-b93b-20149f24e57b	10	2024-05-11T17:05:15.814Z	2024-05-11T18:52:14.809Z	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	84f83b15-aa13-4b74-8c81-b769f429a6db	1	2024-05-12T18:38:41.949Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	09fa01c2-c48c-4d7d-b910-adc3109dc041	1	2024-05-12T18:39:28.883Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	01d3d6df-cd76-4f62-9c39-ddd968a9a634	100	2024-05-13T12:43:37.082Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	1c5dde39-a7d9-4a17-82a4-6b4e43f25b6c	100	2024-05-13T12:45:02.683Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	31ed387d-9786-44eb-88fb-3e19e00ba53a	10	2024-05-08T19:35:59.882Z	\N	\N
d8944c64-cd5a-43e8-b6de-01f8a9f01174	8b2c49f5-c34f-4ac9-abb0-5810c10e3dcb	10	2024-05-09T09:42:44.531Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	1976695e-a2d4-46c5-afa8-438094954f48	10	2024-05-13T12:45:58.830Z	\N	\N
d8944c64-cd5a-43e8-b6de-01f8a9f01174	352af921-b2eb-4ca8-9775-5f124c622d6b	10	2024-05-09T09:46:33.486Z	\N	\N
d8944c64-cd5a-43e8-b6de-01f8a9f01174	e99b7beb-668d-45f0-b368-6fad52f284a5	10	2024-05-09T09:47:03.233Z	\N	\N
d8944c64-cd5a-43e8-b6de-01f8a9f01174	4bd475d3-779b-45bb-b9f9-7a6052bc41fb	10	2024-05-09T09:47:18.501Z	\N	\N
d8944c64-cd5a-43e8-b6de-01f8a9f01174	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-09T09:48:15.819Z	\N	\N
869b95a8-67c2-41b5-b322-2d01c485e644	2d93e34c-6997-499e-b4f6-6cd7bbcf8602	10	2024-05-09T10:29:35.886Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	0774d214-1b04-4d83-90bb-bf30662b9a5a	10	2024-05-13T12:46:38.036Z	\N	\N
869b95a8-67c2-41b5-b322-2d01c485e644	59ce1afa-2583-4810-b726-e8fa4c7e5464	100	2024-05-09T10:30:16.522Z	\N	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	053d6422-e791-474c-9820-90252e04da58	10	2024-05-13T12:46:44.914Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	b903d733-7b7e-413b-96b5-b9772d84c3df	10	2024-05-13T12:46:58.315Z	\N	\N
869b95a8-67c2-41b5-b322-2d01c485e644	cc0b7c15-55bd-426c-9637-12db360bc034	100	2024-05-09T10:31:56.247Z	\N	\N
869b95a8-67c2-41b5-b322-2d01c485e644	4206e979-d31c-4306-b9cf-bac8abb1b7ba	100	2024-05-09T10:32:11.517Z	\N	\N
869b95a8-67c2-41b5-b322-2d01c485e644	e99b7beb-668d-45f0-b368-6fad52f284a5	10	2024-05-09T10:33:14.343Z	\N	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	5e3faa0a-8bf7-4182-b057-cec38d4bed2d	10	2024-05-13T12:47:07.950Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	bc43d2f6-7c4f-4d38-8269-b66b085fcb8a	10	2024-05-13T12:48:29.673Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	4124cef6-ffc1-40b7-8cb0-8b4a89dab6f2	10	2024-05-13T12:48:42.685Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	52808a2f-f878-4f2d-8c8d-17c2861358e8	10	2024-05-13T12:49:01.467Z	\N	\N
1160eeed-e587-420f-a3a1-fe11e59fb32b	770fd1b3-e792-4127-88f9-7d7a47224363	100	2024-05-09T10:40:11.759Z	\N	\N
1160eeed-e587-420f-a3a1-fe11e59fb32b	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-09T10:40:22.541Z	\N	\N
1160eeed-e587-420f-a3a1-fe11e59fb32b	924e9906-692e-460a-bfe4-de2a6c33a5f1	100	2024-05-09T10:40:40.236Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	32c65e0d-592c-4003-b071-bb11449e6de8	100	2024-05-13T12:49:10.603Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	10	2024-05-13T12:49:10.622Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	4505e4ab-6789-4612-acdf-8d3c492476ea	10	2024-05-13T12:49:21.212Z	\N	\N
d8944c64-cd5a-43e8-b6de-01f8a9f01174	24857c6e-7fe5-45e8-9cc5-c5858390c06d	100	2024-05-09T15:39:10.712Z	\N	\N
d8944c64-cd5a-43e8-b6de-01f8a9f01174	6ecf5b89-427f-420d-b208-b1affbdb6dd1	100	2024-05-09T15:39:19.102Z	\N	\N
d8944c64-cd5a-43e8-b6de-01f8a9f01174	ea69d128-1dd3-49de-8b6e-df772a2ad9a7	100	2024-05-09T15:39:26.216Z	\N	\N
d8944c64-cd5a-43e8-b6de-01f8a9f01174	4ae4acec-ee0d-40f3-931c-37759e97ecff	100	2024-05-09T15:39:53.837Z	\N	\N
d8944c64-cd5a-43e8-b6de-01f8a9f01174	599bee49-16ea-4ea6-9a4a-ae3043926417	100	2024-05-09T15:40:11.740Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	d52b7643-1731-48cb-9859-797c159d67b7	10	2024-05-13T12:49:28.644Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	5f805e7a-39fc-4759-936c-9a0097a5b8a6	10	2024-05-10T12:11:18.438Z	\N	\N
1ed38a8a-2217-4b3f-b838-f63b8af2e2fc	99d42576-350e-4fd5-b319-34aa2f8532e6	10	2024-05-10T12:32:27.574Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	62bd5d05-ba37-497a-a1a1-56795813790d	100	2024-05-10T12:59:25.235Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	4ae4acec-ee0d-40f3-931c-37759e97ecff	10	2024-05-10T13:00:41.716Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	2fe71172-ab32-490e-91ae-0ec727bd3d52	100	2024-05-10T13:01:25.867Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-10T13:01:39.291Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	99d42576-350e-4fd5-b319-34aa2f8532e6	10	2024-05-10T13:02:07.230Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	9c28c037-b76a-443a-9e9d-33312e926174	100	2024-05-10T22:11:46.506Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	0fc4d439-3e5d-460d-aefb-c54583690db3	10	2024-05-13T12:49:40.477Z	\N	\N
792ef61b-0f2d-4b0f-9f10-41bbe3327bdf	324fc117-cf6b-4367-a7f1-8eb595c01377	0	2024-05-12T18:50:46.886Z	2024-05-14T17:51:54.237Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	1174922e-fe33-4f48-b3dc-12f61af89e90	10	2024-05-10T12:09:45.756Z	2024-05-13T19:21:37.755Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	945b1d7a-17ac-4646-92ef-018669cee133	0	2024-05-12T18:56:28.031Z	2024-05-14T12:58:42.113Z	\N
792ef61b-0f2d-4b0f-9f10-41bbe3327bdf	dc359231-d372-495a-a9e0-2bbd47965809	0	2024-05-12T18:50:36.240Z	2024-05-14T17:52:08.574Z	\N
806120c1-8d63-4f67-9351-eb3253cad789	b43c65c7-d321-4b29-9536-7e40bfd01300	100	2024-05-11T17:11:37.301Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	945b1d7a-17ac-4646-92ef-018669cee133	0	2024-05-08T19:38:13.935Z	2024-05-14T18:38:42.337Z	\N
135f566a-8664-4a28-8667-76873f0dc18e	86cad6e9-5244-4991-9340-eed4798547ae	10	2024-05-12T18:41:17.978Z	\N	\N
135f566a-8664-4a28-8667-76873f0dc18e	3453dec4-2fa0-4a3d-a053-0af80abdc82c	10	2024-05-12T18:41:31.957Z	\N	\N
135f566a-8664-4a28-8667-76873f0dc18e	1ddc00de-781a-49ed-bddd-bdc7b24d5231	10	2024-05-12T18:42:05.693Z	\N	\N
135f566a-8664-4a28-8667-76873f0dc18e	911f55b0-51f3-47ec-b80f-23fee83a5d72	10	2024-05-12T18:42:30.967Z	\N	\N
135f566a-8664-4a28-8667-76873f0dc18e	15129370-e9f5-4797-87cf-225625bc7642	10	2024-05-12T18:42:55.600Z	\N	\N
fed7abfb-e144-4dc9-858c-647b97a74c58	77dd7bcd-f06b-4b11-8ae3-22cf778065e5	10	2024-05-12T18:44:43.009Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	e22bf0ca-5fef-46f2-bc54-a3b627d41080	100	2024-05-12T18:58:25.228Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	69a463f6-2a70-4736-98ff-a63127c968ef	10	2024-05-13T12:46:18.450Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-13T12:46:28.852Z	\N	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	6347a939-ad2c-458e-a097-17fdb7ef34b1	10	2024-05-13T12:47:20.520Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	38554698-fae0-469c-b8c5-e07cbadf4f30	10	2024-05-08T19:35:30.642Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	30afd32d-4464-488e-a212-e4b9ad9ea5bc	10	2024-05-08T19:37:17.120Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	8c4ed7fa-8b92-492e-bf05-94d2fd4f5016	10	2024-05-08T19:38:29.032Z	\N	\N
d8944c64-cd5a-43e8-b6de-01f8a9f01174	eb1d5056-8b9b-455d-a179-172a747e3f20	10	2024-05-09T09:49:20.093Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	daeef31b-be12-4950-9d5d-039103a3e257	100	2024-05-13T12:47:29.974Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	6374669b-f8a0-433b-a6af-349529a9e31a	10	2024-05-13T12:47:33.115Z	\N	\N
d8944c64-cd5a-43e8-b6de-01f8a9f01174	27493e1f-4f5c-4149-aabf-9c4f6697a35f	10	2024-05-09T09:49:57.392Z	\N	\N
869b95a8-67c2-41b5-b322-2d01c485e644	e577da2f-4900-45db-8d72-9b45cd5cd8c1	100	2024-05-09T10:31:15.494Z	\N	\N
869b95a8-67c2-41b5-b322-2d01c485e644	8550fcc0-103c-46ee-a632-7cbb45f1b74a	100	2024-05-09T10:33:57.127Z	\N	\N
869b95a8-67c2-41b5-b322-2d01c485e644	f94729df-e289-49d8-b55c-19ebdbfd783c	10	2024-05-09T10:35:03.398Z	\N	\N
869b95a8-67c2-41b5-b322-2d01c485e644	bb08b985-ca7c-4143-8550-dad6b11e6e31	100	2024-05-09T10:38:28.769Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	377fdec9-9b17-4086-8986-3e04508c4917	10	2024-05-13T12:47:42.267Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	73c4e7cb-adf7-4d83-b013-d2643bf92697	10	2024-05-13T12:47:58.045Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	8cecd68c-96df-49c9-a31f-364684470302	100	2024-05-13T12:48:10.202Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	d055e235-2b2a-4fc6-8648-ea099aa15a33	10	2024-05-13T12:48:15.410Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	970603df-a58e-4cbf-94f1-4aff2c5743a1	100	2024-05-10T12:09:07.471Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	03cb9712-4f2d-420a-b280-f760e0dac839	10	2024-05-10T12:10:08.294Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	1bcc741b-ea23-434a-bd52-b2d878369a49	10	2024-05-10T12:10:21.862Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	ba4466e9-61e1-4f84-8e98-7dda7b416e1b	10	2024-05-10T12:11:02.339Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	2b6abce0-4abb-4341-b6e5-960d73ca6645	10	2024-05-13T12:48:53.073Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	e72b98da-d578-40c6-b666-4ee0165207e1	10	2024-05-13T12:50:00.673Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	20b573c6-d94f-456e-9f0b-d1cb9ad609b9	10	2024-05-13T12:50:42.710Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	11e28579-d5fc-4738-803b-86c9f144d807	10	2024-05-13T12:50:58.592Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	bfc24026-7f89-4a46-b9d3-b5ea5046d2d9	10	2024-05-13T12:51:32.438Z	\N	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-13T12:52:59.624Z	\N	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	c7493f68-4e46-453d-9bf0-36fff3189bf7	10	2024-05-13T12:53:17.803Z	\N	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	3edb0a60-0bbf-4332-9fd1-8de317091fca	10	2024-05-13T12:53:40.844Z	\N	\N
52a79ef7-7e8d-4478-9ef9-a06899483809	65437ee2-7b21-4796-a360-9ad17c50aef5	10	2024-05-11T17:44:53.224Z	\N	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	799e9f43-b5e8-4484-be33-09c442390253	10	2024-05-13T12:54:18.754Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	5aac6b69-af17-4c0e-b0d0-1621211bc14c	10	2024-05-11T17:46:02.514Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	10	2024-05-11T17:54:40.187Z	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	1822d9b2-10f4-4e0d-a39a-b987ed707fae	100	2024-05-11T17:54:50.206Z	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	7d0f8cf5-9f10-4822-bcde-6b94d1738065	100	2024-05-11T17:55:37.357Z	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	2a088703-bffe-491a-8e62-4c9f796024d1	100	2024-05-11T17:55:22.713Z	2024-05-11T17:56:06.638Z	\N
1901f957-605d-4709-b4a4-4e82f521b073	0fa75023-eb3b-47a6-b535-d14dfb8c139f	100	2024-05-11T17:56:08.337Z	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	61735e25-7502-4864-9a02-cbec10b78700	100	2024-05-11T17:56:21.252Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	49e5686b-1fe3-42bd-b667-729ca65cd778	10	2024-05-11T17:56:27.938Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-11T17:57:39.074Z	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	15121282-bdc8-4096-845b-974401b2e6aa	10	2024-05-11T17:58:23.115Z	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	c7493f68-4e46-453d-9bf0-36fff3189bf7	10	2024-05-11T18:02:26.205Z	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	9c17284c-d379-4b76-9d87-5c573b5eec6c	100	2024-05-11T18:05:06.630Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	6d503bcc-8fd1-4547-bd52-08f521913a16	10	2024-05-11T18:21:40.976Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	f33825fd-e6b0-47bb-80c0-80aef8a42e19	100	2024-05-13T13:02:16.057Z	2024-05-13T13:02:27.284Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	8c4ed7fa-8b92-492e-bf05-94d2fd4f5016	100	2024-05-13T13:05:28.885Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-13T13:06:19.713Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	a25f338f-1fed-4412-844a-7e16962eb051	100	2024-05-13T13:06:31.297Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	10	2024-05-13T13:06:58.672Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	9ee6fd99-6604-438c-a3cc-15d2c7f997ed	10	2024-05-13T13:07:22.390Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	a1c072fc-9a1d-4f28-a543-b6f21a7863c0	0	2024-05-08T19:35:37.014Z	2024-05-14T19:35:40.822Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	4f5dbb59-d5ca-4550-a6e6-6e62f8583198	0	2024-05-08T19:37:45.543Z	2024-05-14T19:38:46.006Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	ea2c6721-693d-496e-8442-a2381d48430b	100	2024-05-12T18:59:09.557Z	\N	\N
9791431f-042e-43e4-8c8d-05c50bd2db01	1a91ad10-10e2-4d05-8727-69f724f076f2	10	2024-05-11T18:08:52.763Z	2024-05-12T01:16:15.860Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	6763caea-7b53-466a-a9b3-40ebfac0f9bb	10	2024-05-08T19:38:43.452Z	\N	\N
869b95a8-67c2-41b5-b322-2d01c485e644	fea081c1-7939-4516-97a5-f2cd49177577	100	2024-05-09T10:37:57.229Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	3b7a9689-8c41-4090-9084-5b8e31a1d7d5	100	2024-05-10T12:58:48.033Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	59991d33-10e6-48af-be3e-274fa5960fc2	100	2024-05-10T12:59:06.726Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	258deaa1-d4c1-4e51-9a29-9883f68d506d	100	2024-05-10T13:01:21.855Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	e87c2f41-f417-4ee0-b818-9adfe7c790e9	100	2024-05-10T13:01:50.241Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	af26cae5-8bae-420c-8052-782b9598fded	100	2024-05-10T13:04:07.103Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	70ca14b1-0240-4bc7-902c-903fbe74da31	10	2024-05-10T13:04:20.185Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	001e3bdc-a463-4cea-a4f1-6bb36cd67d5f	10	2024-05-13T12:49:47.345Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	4eb7c42e-8499-438d-9298-3ca063eca896	10	2024-05-13T12:49:53.483Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	9a8a5c61-fc58-4505-a808-8d5024545ef7	10	2024-05-13T12:50:07.320Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	d3076d4b-a694-4325-b6bd-cf0753ee8605	10	2024-05-13T12:50:25.074Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	6bb91459-f5bb-4199-a447-3413c1b96573	10	2024-05-13T12:51:06.125Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	377fdec9-9b17-4086-8986-3e04508c4917	10	2024-05-13T12:51:45.210Z	\N	\N
52a79ef7-7e8d-4478-9ef9-a06899483809	460c72c0-b362-4fe8-a7e8-06aabe57cccd	100	2024-05-11T17:44:32.028Z	\N	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	e3f24520-666e-47d0-ad10-73a9110b3ad4	10	2024-05-13T12:52:09.262Z	\N	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-13T12:52:36.433Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	1a91ad10-10e2-4d05-8727-69f724f076f2	10	2024-05-11T17:50:55.160Z	\N	\N
5c3a2bbf-3603-4741-ae95-9d89a889351e	950a9045-f3c3-42d7-bf59-d42c5ef42d29	10	2024-05-13T12:53:05.476Z	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	d382afa7-cef6-4e16-89aa-22a5e20562e6	100	2024-05-11T18:00:50.942Z	\N	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	10	2024-05-13T12:53:55.621Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	3edb0a60-0bbf-4332-9fd1-8de317091fca	100	2024-05-13T12:56:53.862Z	\N	\N
f728ff4a-886d-498b-913c-54fd349920bb	65d76d06-ff09-40b5-8df8-ead5c4cabe2e	10	2024-05-12T19:13:12.522Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	3b38eca1-e08a-451f-aa40-d2138daa2b08	10	2024-05-13T12:59:32.994Z	\N	\N
811c8995-d14b-45c7-b0a5-e4cbff92abe6	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	10	2024-05-11T18:11:38.522Z	\N	\N
811c8995-d14b-45c7-b0a5-e4cbff92abe6	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-11T18:11:44.729Z	\N	\N
811c8995-d14b-45c7-b0a5-e4cbff92abe6	e87c2f41-f417-4ee0-b818-9adfe7c790e9	10	2024-05-11T18:12:02.960Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	27c3707c-4a0b-4b43-8f8c-1b4bba103aa9	0	2024-05-13T13:00:35.075Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	ef206d20-b798-4215-bebb-e53afd8f4a69	10	2024-05-11T18:15:38.537Z	2024-05-12T20:52:11.327Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	c905ca5a-0564-4d2a-b9b9-585cbce1cc62	100	2024-05-13T13:04:38.981Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	9c28c037-b76a-443a-9e9d-33312e926174	10	2024-05-13T13:10:47.079Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	cdac9413-68ad-4382-9be0-b8a5877b5d8c	100	2024-05-13T13:11:13.126Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	15129370-e9f5-4797-87cf-225625bc7642	10	2024-05-13T13:11:22.537Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	5aac6b69-af17-4c0e-b0d0-1621211bc14c	10	2024-05-11T18:15:19.488Z	2024-05-11T21:58:42.838Z	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	172c7042-1a1a-4ed0-9cd7-9f818efde80a	10	2024-05-13T13:11:57.229Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	6e71e6ec-9335-4db3-a0bd-4cfc3bed41f9	100	2024-05-13T13:12:36.798Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	294b5457-2501-434a-8b58-b386256e4f04	100	2024-05-13T13:12:51.028Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	d8c5a353-d026-4fd4-b1f3-2bcf2f75b921	10	2024-05-13T13:14:05.583Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	f94729df-e289-49d8-b55c-19ebdbfd783c	0	2024-05-13T13:31:58.692Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	2ac83258-0e18-4373-9edc-d78286bc955c	0	2024-05-13T13:01:03.077Z	2024-05-13T13:32:58.302Z	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	13a4afa8-2b27-43c2-8ac1-0a2b29ce7832	0	2024-05-13T13:11:00.370Z	2024-05-13T13:45:39.904Z	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	ffc9891b-43d3-4134-8e9c-7ada4690d076	10	2024-05-13T13:48:08.751Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	1f136e6b-3881-4341-b169-5a4ec852c888	100	2024-05-13T13:46:31.623Z	2024-05-13T20:24:10.549Z	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	367ed746-6c87-41d9-a29e-bf3540360ccf	100	2024-05-13T13:46:37.640Z	2024-05-13T20:24:37.058Z	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	100	2024-05-13T13:46:51.170Z	2024-05-13T20:24:42.300Z	\N
446e4dc9-c485-47bb-8f49-3107c097e735	86cad6e9-5244-4991-9340-eed4798547ae	0	2024-05-13T13:01:15.272Z	2024-05-14T09:27:32.000Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	eb01d39b-e347-4a3f-a0ea-f59f916a2236	0	2024-05-13T13:15:23.434Z	2024-05-14T10:38:08.537Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	47cc3a3a-c887-4c02-8f08-410010ea15b4	0	2024-05-08T19:36:22.118Z	2024-05-14T19:31:01.774Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	8550fcc0-103c-46ee-a632-7cbb45f1b74a	0	2024-05-08T19:36:30.976Z	2024-05-14T19:40:13.683Z	\N
446e4dc9-c485-47bb-8f49-3107c097e735	25f492ea-fb52-4085-929c-6a53ee6a0537	0	2024-05-13T13:27:32.286Z	2024-05-14T21:52:47.210Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	5c6aa175-602e-44c1-90b1-5bf8b7915df7	10	2024-05-08T19:36:36.394Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	b00827d0-bac9-4338-8afd-7fae5a79612f	10	2024-05-08T19:36:45.967Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	01750893-db86-4171-8c01-a41b61309a5d	100	2024-05-13T12:57:51.122Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-09T11:49:04.662Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	59ce1afa-2583-4810-b726-e8fa4c7e5464	10	2024-05-09T11:49:50.306Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	f51bc934-80c1-4fb6-858f-38f701e88dd9	10	2024-05-09T11:50:06.221Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	27493e1f-4f5c-4149-aabf-9c4f6697a35f	10	2024-05-10T13:00:16.112Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	873f0443-1ed1-4044-ae2e-da17f59ddfc0	100	2024-05-10T13:01:10.125Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	f94729df-e289-49d8-b55c-19ebdbfd783c	100	2024-05-13T13:05:52.041Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	6347a939-ad2c-458e-a097-17fdb7ef34b1	10	2024-05-11T17:54:32.549Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	18b45eb3-755c-4d38-a974-2857f6b30638	10	2024-05-11T17:56:13.492Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	24e95cd1-71cf-406f-b256-80ce535f8e65	10	2024-05-11T17:58:30.469Z	\N	\N
811c8995-d14b-45c7-b0a5-e4cbff92abe6	4c170954-1c43-4928-9014-d3b057e4a5ca	10	2024-05-11T18:11:55.585Z	\N	\N
811c8995-d14b-45c7-b0a5-e4cbff92abe6	8ec08775-c401-4a5e-b52d-681cc468601c	10	2024-05-11T18:12:09.583Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	f013501e-e9ea-478f-af0d-648f96244b14	10	2024-05-13T13:06:09.829Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	799e9f43-b5e8-4484-be33-09c442390253	100	2024-05-13T13:07:04.236Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	c6995a7c-5298-490e-af14-8feaaedc3e7b	10	2024-05-13T13:07:11.376Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	9ee6fd99-6604-438c-a3cc-15d2c7f997ed	100	2024-05-13T13:07:50.388Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	d4a48129-b591-4504-a205-589bd90bd350	100	2024-05-13T13:08:02.531Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	1c2f0ea6-85c2-4b10-9028-568a751d2690	100	2024-05-13T13:09:39.249Z	2024-05-13T13:09:51.809Z	\N
446e4dc9-c485-47bb-8f49-3107c097e735	c84192e1-0605-4b6f-8302-99aa29116f1f	0	2024-05-13T13:00:59.021Z	2024-05-13T13:32:48.309Z	\N
52a79ef7-7e8d-4478-9ef9-a06899483809	b7349827-482c-4c5c-b0eb-7627a8380c16	0	2024-05-11T17:44:44.415Z	2024-05-13T17:19:31.564Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	689c1d43-a7ee-4b95-97df-1558fbfcb863	0	2024-05-10T19:49:18.854Z	2024-05-14T10:27:33.789Z	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	112f1380-ebef-4697-87e8-7cb8a1e05cf7	100	2024-05-12T19:21:13.870Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	100	2024-05-12T19:21:40.328Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	6ebdfdfa-c7b7-42c3-972c-a15b921d4e66	0	2024-05-12T19:17:55.911Z	2024-05-14T13:15:01.132Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	c1e4ef3f-0d86-418f-9d9f-05f028246bed	100	2024-05-13T13:05:55.665Z	2024-05-14T14:02:49.023Z	\N
446e4dc9-c485-47bb-8f49-3107c097e735	04293a65-283f-4b8d-b7ab-aec478bba1b4	0	2024-05-13T13:00:11.087Z	2024-05-14T21:52:16.689Z	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	9b92c2b9-8478-41da-9f2b-043ac372d20d	100	2024-05-12T19:23:30.622Z	2024-05-12T20:01:04.877Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	c8642f4a-7ee0-49a7-aec8-e18eab2e2c69	100	2024-05-13T13:07:27.109Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-13T13:07:53.276Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	10ce0297-ae31-49b4-9a0c-bb164cd19353	100	2024-05-13T13:08:06.937Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	fbe933e1-c88c-4ec8-9a83-4cd88ceefcb6	10	2024-05-13T13:08:39.823Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	36b4a759-d476-4904-ab8e-475404bb564a	10	2024-05-09T11:50:45.032Z	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	463b2006-ff25-4d63-8b79-17666b4b4d02	0	2024-05-13T13:08:47.003Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	dc359231-d372-495a-a9e0-2bbd47965809	10	2024-05-13T13:08:55.866Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	d5bee376-7afa-40f0-8b05-77f984e6c12a	10	2024-05-13T13:09:48.315Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	70ca14b1-0240-4bc7-902c-903fbe74da31	10	2024-05-13T13:10:10.817Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	9815d990-5db6-4875-9dfa-1197812a9bfa	100	2024-05-13T13:10:24.437Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	81b2e05e-41cf-4bb0-96c2-a622640e6f85	10	2024-05-12T19:45:28.664Z	2024-05-14T16:22:14.584Z	\N
1901f957-605d-4709-b4a4-4e82f521b073	3aaefd40-754e-434d-b4af-180fdd60174c	10	2024-05-11T18:24:39.437Z	\N	\N
1901f957-605d-4709-b4a4-4e82f521b073	fa855264-b42a-4559-b976-1a55f6ee9d9b	100	2024-05-11T18:25:20.938Z	\N	\N
f2474450-56fd-4f80-b189-0eb91c5c54f5	0b36b132-05b8-421d-b1b1-955c4b96f520	10	2024-05-11T18:25:52.672Z	2024-05-12T18:51:39.133Z	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	e904d182-a778-4fac-94fb-61cfc5b6a8ba	100	2024-05-12T19:22:10.875Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	5e19dcf8-680f-4755-a69f-be4080c95e6f	10	2024-05-12T19:41:42.248Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	3982cd82-d50b-4d04-8f31-8f29bf7735d3	10	2024-05-10T13:37:10.257Z	2024-05-11T23:15:16.319Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	329ef2f3-32ec-4987-8089-c7f02ffd7aaf	10	2024-05-12T19:46:01.198Z	\N	\N
9e78210f-f25a-419c-abeb-341e562a2584	fedbbfb1-777d-4914-b6fd-184e9de0e7e5	10	2024-05-12T19:50:36.578Z	\N	\N
9e78210f-f25a-419c-abeb-341e562a2584	676c22c2-00f3-4f6a-a833-f1d5f5c3b54f	10	2024-05-12T19:51:07.895Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	62365799-1047-4107-bbc7-473df401eadb	100	2024-05-12T19:55:39.608Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	2f918372-5531-4e84-90a5-4520583e738c	100	2024-05-12T19:56:25.308Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	7137cf53-9bea-4a5f-a70b-c2ae81202d90	100	2024-05-12T19:56:49.150Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-12T19:57:16.568Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	58f96d4b-1e5c-43a8-a202-8deb9d6ae422	100	2024-05-12T19:57:36.911Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	88fa7edf-2f9d-43e9-b983-86aa6fc63374	100	2024-05-12T19:59:44.427Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	5aad0adb-f132-45f7-b2bb-248f3d8dfacf	100	2024-05-12T20:00:18.186Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	a736cad0-9135-4ac2-bb96-d40350b52658	100	2024-05-12T20:00:27.097Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	b1d8f194-15ac-4490-b062-d45434d41966	100	2024-05-12T20:00:45.882Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	1aa1cd13-4803-4871-8bd6-a8006a6cf52a	100	2024-05-11T18:22:34.711Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	258deaa1-d4c1-4e51-9a29-9883f68d506d	0	2024-05-13T13:29:57.872Z	2024-05-13T13:33:50.227Z	\N
446e4dc9-c485-47bb-8f49-3107c097e735	7f8e851f-d072-469a-bf7c-1d04b14b18b4	0	2024-05-13T13:24:58.162Z	2024-05-13T13:33:58.237Z	\N
fbe32f25-fa62-422d-823d-f388000f47d4	f013501e-e9ea-478f-af0d-648f96244b14	10	2024-05-11T18:23:40.218Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	b3b04603-b2a8-4178-a12c-606177a04178	0	2024-05-13T13:28:25.761Z	2024-05-14T09:27:27.186Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	a1e9e0d1-cf48-4f52-8f41-cc24e44a9cce	0	2024-05-11T18:24:12.353Z	2024-05-14T10:31:42.411Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	6f0169e7-5ca9-4bbc-83f8-78cea1443551	0	2024-05-11T18:26:11.704Z	2024-05-14T10:38:35.627Z	\N
1901f957-605d-4709-b4a4-4e82f521b073	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	100	2024-05-11T18:26:09.590Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	f3eb355a-4868-48af-befc-38a8a565c8e4	0	2024-05-11T18:26:20.954Z	2024-05-14T10:42:49.916Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	3875894c-baf3-48c4-8932-059914a6e27c	0	2024-05-08T19:39:04.881Z	2024-05-14T19:32:29.159Z	\N
446e4dc9-c485-47bb-8f49-3107c097e735	bdf7609e-a731-4480-874a-7ed5a8de5627	0	2024-05-13T13:26:15.807Z	2024-05-14T21:54:15.366Z	\N
fbe32f25-fa62-422d-823d-f388000f47d4	51727155-6b86-4777-865e-f7b85eba83ea	10	2024-05-11T18:23:16.324Z	2024-05-12T19:06:32.010Z	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	d0699992-1962-4d21-97a5-63b7781f5440	100	2024-05-12T19:26:44.325Z	2024-05-12T19:26:59.173Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	118fd9a6-3082-41a6-9f88-1fe24bf59b00	10	2024-05-12T19:42:19.458Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	e3f884bd-3dc5-480f-8bfe-c0be33d26f43	100	2024-05-11T18:24:20.693Z	2024-05-12T21:08:21.271Z	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	13a4afa8-2b27-43c2-8ac1-0a2b29ce7832	10	2024-05-09T11:51:51.134Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	abe67b83-3fdc-4e39-82ec-a15c49630b4d	10	2024-05-09T11:52:02.193Z	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	460c72c0-b362-4fe8-a7e8-06aabe57cccd	100	2024-05-09T12:10:45.836Z	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	fcfdeaeb-0760-4f93-bac9-76b804551ce9	10	2024-05-09T12:14:05.411Z	\N	\N
911c231d-a09d-4b3e-b199-78854be2cb58	6d451ef8-e962-423c-8fc8-5fb0eb848766	1	2024-05-09T12:17:37.759Z	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	21d0b947-aabf-445d-8622-464875e4b937	100	2024-05-09T12:18:20.924Z	\N	\N
911c231d-a09d-4b3e-b199-78854be2cb58	460c72c0-b362-4fe8-a7e8-06aabe57cccd	1	2024-05-09T12:18:25.076Z	\N	\N
911c231d-a09d-4b3e-b199-78854be2cb58	dbcb6fc3-02b4-4e31-8924-ed56f0e6ecc1	10	2024-05-09T12:23:53.782Z	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	79c7f357-2e62-4ab9-8152-de7165e6dae6	10	2024-05-09T12:25:31.050Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	6a220720-6fa3-42cc-8101-621da51b521f	10	2024-05-13T13:25:59.352Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	c31acdf4-e0c4-44a1-b95f-ac267fa6b75f	0	2024-05-13T13:25:32.779Z	2024-05-13T13:34:06.488Z	\N
9f8257b0-4777-4f31-ba93-f83f0a02de41	950a9045-f3c3-42d7-bf59-d42c5ef42d29	100	2024-05-11T18:30:36.500Z	2024-05-13T14:10:14.058Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	776fde8c-1579-4b59-824e-a74bd1eb7018	0	2024-05-12T19:50:46.433Z	2024-05-14T15:07:07.423Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	d034ab5c-92ef-4847-9014-b5114b17cc66	0	2024-05-12T19:42:46.055Z	2024-05-14T15:09:17.729Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	8e5bab94-d594-46dd-a855-7675f5d8231f	0	2024-05-08T19:39:24.131Z	2024-05-14T19:33:35.323Z	\N
446e4dc9-c485-47bb-8f49-3107c097e735	035742b7-9725-4001-b32d-982b6b0890e5	0	2024-05-13T13:29:10.218Z	2024-05-14T21:52:29.588Z	\N
1901f957-605d-4709-b4a4-4e82f521b073	e15b969f-d5fe-48cf-80ea-443be9dc5785	10	2024-05-11T18:28:28.859Z	\N	\N
1901f957-605d-4709-b4a4-4e82f521b073	1fde16af-ef8a-4686-b021-cafc1c5179cf	100	2024-05-11T18:30:38.204Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	46bd3422-75e0-4d67-b492-97f0e14dd403	10	2024-05-09T11:53:14.317Z	\N	\N
1901f957-605d-4709-b4a4-4e82f521b073	84d5b5f4-3c06-4b70-946e-dd258278c7b2	10	2024-05-11T18:36:45.619Z	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-13T13:37:12.090Z	2024-05-13T13:37:27.531Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	09024c0a-be30-49c8-a5f9-9d779af6e0c7	0	2024-05-08T19:40:34.170Z	2024-05-14T19:19:06.936Z	\N
446e4dc9-c485-47bb-8f49-3107c097e735	e3ec602e-3c71-479d-9e13-e69f28d32122	0	2024-05-13T13:33:38.153Z	2024-05-14T21:52:11.875Z	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	cbe1445b-256b-4d93-8829-6a1fda8f526c	10	2024-05-11T18:49:28.895Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	dfbf27f0-d560-4aea-aba6-532a6346b994	10	2024-05-11T18:52:47.321Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	b15fee1e-5c89-4b46-a5b2-fb1991f57c13	100	2024-05-11T18:49:15.060Z	2024-05-11T18:53:34.464Z	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	53e92ec3-dfcb-4ac2-adf4-0fd1fa963756	100	2024-05-11T18:53:47.449Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	3edb0a60-0bbf-4332-9fd1-8de317091fca	10	2024-05-11T18:54:29.663Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	9ee6fd99-6604-438c-a3cc-15d2c7f997ed	10	2024-05-11T18:57:26.398Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	10	2024-05-11T16:38:06.957Z	2024-05-12T20:23:48.207Z	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	46862e71-22b7-4023-ba93-2936050c6f9f	10	2024-05-11T19:16:43.800Z	\N	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-11T19:16:50.680Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	83c7d111-7d55-4bf4-b61d-8fa5fbcfb012	10	2024-05-12T19:43:13.843Z	2024-05-12T19:43:17.686Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	2b6abce0-4abb-4341-b6e5-960d73ca6645	10	2024-05-12T19:46:15.258Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	24e95cd1-71cf-406f-b256-80ce535f8e65	100	2024-05-12T19:54:23.077Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	f06d81a9-4cbd-4543-a79c-cdd9d02e553b	10	2024-05-12T19:57:06.592Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	0774d214-1b04-4d83-90bb-bf30662b9a5a	10	2024-05-12T19:57:50.632Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	100	2024-05-12T19:58:01.096Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	6f6a3e0c-d8c8-468f-b8d2-13370a988b72	100	2024-05-12T19:57:58.472Z	2024-05-12T19:58:15.221Z	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	60a6078f-6aa7-43b1-acf7-660c25bd221e	10	2024-05-12T19:58:24.347Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	053d6422-e791-474c-9820-90252e04da58	100	2024-05-12T19:58:24.929Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	81b2e05e-41cf-4bb0-96c2-a622640e6f85	10	2024-05-12T19:58:36.471Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	25d8225d-5de2-491b-ad28-9cd05df3ca78	100	2024-05-12T19:58:38.402Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	d03c6c8e-efc7-450b-9300-ade4cdcfced9	100	2024-05-12T19:58:53.023Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	a25f338f-1fed-4412-844a-7e16962eb051	100	2024-05-12T20:01:39.319Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	e9199d5b-b091-4c0f-a1ae-614a6089eb30	100	2024-05-12T20:02:08.037Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	be7369e0-e867-4443-948e-49b2a2b075b4	100	2024-05-12T20:02:29.197Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	ea854ef5-7ef7-48ca-9d4b-570cbf0c545f	100	2024-05-12T20:04:48.481Z	2024-05-12T20:04:54.595Z	\N
8ca0918c-d4ab-4afe-aaca-acc1d963ca80	5aac6b69-af17-4c0e-b0d0-1621211bc14c	10	2024-05-12T20:05:11.872Z	\N	\N
8ca0918c-d4ab-4afe-aaca-acc1d963ca80	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-12T20:05:43.899Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	1ddc00de-781a-49ed-bddd-bdc7b24d5231	10	2024-05-11T19:14:05.462Z	2024-05-12T20:25:09.618Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	cbe1445b-256b-4d93-8829-6a1fda8f526c	10	2024-05-08T19:42:23.953Z	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	6a220720-6fa3-42cc-8101-621da51b521f	100	2024-05-09T12:11:25.584Z	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	2b408b16-8dbc-41df-b3c8-7efb18d462b7	100	2024-05-09T12:11:34.699Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	112f1380-ebef-4697-87e8-7cb8a1e05cf7	100	2024-05-13T13:50:16.432Z	\N	\N
3c25886c-39e0-482b-9b3e-cd1e7e59249c	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-11T18:38:17.184Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	27c3707c-4a0b-4b43-8f8c-1b4bba103aa9	100	2024-05-12T19:58:39.573Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	100	2024-05-13T13:47:13.670Z	2024-05-13T20:23:51.101Z	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	d382afa7-cef6-4e16-89aa-22a5e20562e6	100	2024-05-13T13:46:22.674Z	2024-05-14T03:58:47.042Z	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	4ae6c9da-c2d7-4381-a309-a938b0258122	100	2024-05-12T19:59:03.282Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	c4976a72-788e-4360-ad86-bb4939bebcc2	0	2024-05-08T19:41:02.350Z	2024-05-14T19:34:47.616Z	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	5880fcb0-dd0e-4681-b97d-a1f501152fc6	100	2024-05-12T19:59:49.128Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	3a040ebd-225f-4f0c-934c-5b14399fbd4f	100	2024-05-12T19:59:51.259Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	dfbf27f0-d560-4aea-aba6-532a6346b994	100	2024-05-12T20:00:07.276Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	42b139ee-4c4b-4714-ab0c-bd92689d6260	100	2024-05-12T20:00:58.938Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	4ae4acec-ee0d-40f3-931c-37759e97ecff	10	2024-05-08T19:42:07.204Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	69732c83-e2ee-481f-b4c5-e55932e8d51f	100	2024-05-10T01:51:31.331Z	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-08T19:47:50.425Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	5facb97a-2e27-4ddf-bbde-0aeed05bb262	100	2024-05-13T13:51:27.677Z	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	39bc837b-b026-4a73-b987-efbba14a889f	10	2024-05-08T19:50:49.392Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	ca0ef946-0de3-47a2-a0cb-df72de35aeec	10	2024-05-13T14:37:58.775Z	\N	\N
09e1c5fe-c4a4-442d-a638-94f55fcc5be0	6c8684ed-85ad-49c0-a76e-cb34e7538f4d	10	2024-05-13T14:50:47.960Z	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	fd54a76a-cdb9-4543-9df6-24baa384e38c	10	2024-05-09T12:12:18.566Z	\N	\N
09e1c5fe-c4a4-442d-a638-94f55fcc5be0	48b8392c-9bcf-4b94-abff-33b565af4edd	100	2024-05-13T14:52:17.806Z	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	ff30edb6-ad8b-4b10-80ba-da7d2ef786f7	10	2024-05-09T12:14:47.081Z	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	7ec537b7-31aa-4a4e-9fba-4ef922665767	10	2024-05-09T12:15:02.310Z	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-09T12:15:21.872Z	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	10	2024-05-09T12:15:33.462Z	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	cc4fe301-5eaa-4792-bfd0-33ee4f4a64ad	10	2024-05-09T12:16:47.954Z	\N	\N
911c231d-a09d-4b3e-b199-78854be2cb58	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-09T12:17:11.132Z	\N	\N
911c231d-a09d-4b3e-b199-78854be2cb58	3ee51ac3-056c-4e53-9062-93df16dac1b3	1	2024-05-09T12:20:17.997Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	73d62b87-49ae-48d7-9001-868839648b25	10	2024-05-09T12:33:10.468Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	4ae4acec-ee0d-40f3-931c-37759e97ecff	100	2024-05-09T12:33:25.128Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	2b72c607-f5b6-4907-88e9-1a2d50045b18	10	2024-05-09T12:33:37.424Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	58c7d1c9-8e7f-4d68-8ede-da32a40500bc	10	2024-05-09T12:33:44.992Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	25d8225d-5de2-491b-ad28-9cd05df3ca78	10	2024-05-09T12:35:09.415Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	4b7e6463-949e-4a9a-8198-0ee4245a63df	100	2024-05-09T12:35:38.383Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	770fd1b3-e792-4127-88f9-7d7a47224363	100	2024-05-09T12:36:22.056Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	dd6c8774-52ca-4c3f-9125-06ad4b0e2747	10	2024-05-09T12:37:16.751Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	112f1380-ebef-4697-87e8-7cb8a1e05cf7	10	2024-05-09T12:50:54.550Z	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	f94729df-e289-49d8-b55c-19ebdbfd783c	100	2024-05-09T12:59:10.165Z	\N	\N
09e1c5fe-c4a4-442d-a638-94f55fcc5be0	daeef31b-be12-4950-9d5d-039103a3e257	100	2024-05-13T14:52:39.451Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	ea854ef5-7ef7-48ca-9d4b-570cbf0c545f	100	2024-05-12T20:02:03.704Z	\N	\N
09e1c5fe-c4a4-442d-a638-94f55fcc5be0	8c4ed7fa-8b92-492e-bf05-94d2fd4f5016	100	2024-05-13T14:53:03.773Z	\N	\N
09e1c5fe-c4a4-442d-a638-94f55fcc5be0	ea2c6721-693d-496e-8442-a2381d48430b	100	2024-05-13T14:53:27.486Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	93191078-a8ff-426a-9d67-8725626ad31d	100	2024-05-12T20:03:42.491Z	\N	\N
09e1c5fe-c4a4-442d-a638-94f55fcc5be0	340e35f2-a28c-4c48-a114-2e7339c7c735	100	2024-05-13T14:53:51.554Z	\N	\N
3c25886c-39e0-482b-9b3e-cd1e7e59249c	d3b07a6a-3b36-4bf3-a4dd-2bfeaace33bc	0	2024-05-11T18:39:46.477Z	2024-05-13T15:35:13.234Z	\N
3c25886c-39e0-482b-9b3e-cd1e7e59249c	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-11T18:38:22.162Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	6deba02c-b927-4d0b-bdae-8af35430e787	100	2024-05-12T20:02:45.951Z	2024-05-12T20:03:27.138Z	\N
3c25886c-39e0-482b-9b3e-cd1e7e59249c	81476608-e806-4a25-ad0f-c976bb29dd31	0	2024-05-11T18:38:45.907Z	2024-05-13T15:35:43.469Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	0	2024-05-13T14:45:56.971Z	2024-05-13T18:20:06.325Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	52808a2f-f878-4f2d-8c8d-17c2861358e8	0	2024-05-13T14:46:41.729Z	2024-05-14T18:27:09.092Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	919d8585-40a8-45e9-b619-b9e7a7ba20ea	0	2024-05-08T19:41:35.050Z	2024-05-14T18:47:47.630Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	58c7d1c9-8e7f-4d68-8ede-da32a40500bc	0	2024-05-08T19:41:55.907Z	2024-05-14T18:56:13.801Z	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	f75e7cd2-be77-4358-b281-90a943e1d983	100	2024-05-10T15:27:59.071Z	\N	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	92aa3e09-f5bc-4645-bad3-7f13d40043fc	100	2024-05-10T15:28:26.918Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	ace11dbc-d8fc-4d92-8692-72534bdee8be	100	2024-05-09T12:47:29.063Z	2024-05-11T13:39:32.317Z	\N
3c25886c-39e0-482b-9b3e-cd1e7e59249c	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-11T18:38:29.297Z	\N	\N
3c25886c-39e0-482b-9b3e-cd1e7e59249c	5e4b4b53-a13b-483c-a783-5576e0225d82	10	2024-05-11T18:40:21.257Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	caa77bd6-4cf9-44a5-aa24-2e68c899081a	100	2024-05-10T14:32:35.947Z	2024-05-12T15:41:30.153Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	12b9119d-04f0-4ec6-990c-76a28f0dcb82	10	2024-05-10T15:22:52.035Z	2024-05-12T15:05:17.461Z	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	cc5459a2-9b43-486b-8c3f-99c507c68562	10	2024-05-09T12:13:32.405Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	79c7f357-2e62-4ab9-8152-de7165e6dae6	10	2024-05-13T13:51:44.754Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	edcb4032-d028-48ee-9811-b6004b277877	100	2024-05-13T13:52:31.986Z	\N	\N
905820e1-6281-4e21-8ec5-9f501a9bae42	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-08T20:03:06.322Z	\N	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	100	2024-05-08T20:08:42.754Z	\N	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	5aac6b69-af17-4c0e-b0d0-1621211bc14c	100	2024-05-08T20:09:51.943Z	\N	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	fcc2aee3-3a74-45a7-a590-961a2f78050d	100	2024-05-08T20:11:15.685Z	\N	\N
5c3a2bbf-3603-4741-ae95-9d89a889351e	7dafb07f-4bf3-46ce-8c1a-5750397b51c0	10	2024-05-13T13:56:25.519Z	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	d382afa7-cef6-4e16-89aa-22a5e20562e6	10	2024-05-09T12:16:27.889Z	\N	\N
911c231d-a09d-4b3e-b199-78854be2cb58	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	10	2024-05-09T12:17:05.916Z	\N	\N
911c231d-a09d-4b3e-b199-78854be2cb58	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	10	2024-05-09T12:17:19.890Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	b2cddf26-7859-498f-95a0-76ef177196a5	100	2024-05-12T20:04:23.459Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	13f53b5e-8aa5-4212-999e-3da835a5b1d8	100	2024-05-12T20:06:26.848Z	\N	\N
911c231d-a09d-4b3e-b199-78854be2cb58	43a27a70-3ed5-4a3d-8428-623810c3f717	1	2024-05-09T12:18:43.502Z	\N	\N
911c231d-a09d-4b3e-b199-78854be2cb58	14bb5f33-7c73-441d-a3b6-27fd7348dce3	1	2024-05-09T12:19:20.776Z	\N	\N
911c231d-a09d-4b3e-b199-78854be2cb58	1beeba95-3034-4e3b-b332-fde4a0b09258	1	2024-05-09T12:19:30.505Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	10	2024-05-08T20:44:53.146Z	\N	\N
79f05644-27f7-4e06-908b-1611d4b477ed	001e3bdc-a463-4cea-a4f1-6bb36cd67d5f	100	2024-05-09T16:59:16.914Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-08T20:29:30.920Z	2024-05-11T18:23:43.858Z	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	61c906b1-396f-4221-8637-7096bc08a004	10	2024-05-11T18:46:23.131Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	31744df9-e04a-443f-a78f-3b9be14e7adf	10	2024-05-11T18:50:23.467Z	\N	\N
911c231d-a09d-4b3e-b199-78854be2cb58	606a9ed3-b5f7-4d63-8da9-c65adf0a927a	1	2024-05-09T12:18:52.207Z	\N	\N
911c231d-a09d-4b3e-b199-78854be2cb58	410ee4d8-32eb-4f30-8b89-175ad8252c4b	10	2024-05-09T12:19:09.511Z	\N	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	100	2024-05-08T20:07:37.746Z	\N	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	47cc3a3a-c887-4c02-8f08-410010ea15b4	100	2024-05-08T20:07:49.464Z	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	455ae326-aa31-4776-91d0-0aa0893660fd	100	2024-05-13T14:10:15.492Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	860776d6-b97a-431f-b089-faee9ca777bc	10	2024-05-08T20:20:35.260Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	f76cd266-64e7-4968-854b-6308be0fe2a5	10	2024-05-08T20:20:46.284Z	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	51727155-6b86-4777-865e-f7b85eba83ea	100	2024-05-13T14:10:24.694Z	\N	\N
911c231d-a09d-4b3e-b199-78854be2cb58	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	1	2024-05-09T12:22:55.304Z	\N	\N
911c231d-a09d-4b3e-b199-78854be2cb58	2d2a7f10-0aa2-4c87-b5a8-3441cb569f10	10	2024-05-09T12:23:33.699Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	043739b5-1191-46b2-9ee0-4838838464cf	10	2024-05-09T12:34:52.122Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	fd54a76a-cdb9-4543-9df6-24baa384e38c	10	2024-05-09T12:36:02.407Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	3f9591df-328d-467f-b556-0872762b09a8	100	2024-05-09T12:36:54.192Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	b0d79d6a-8f8a-4341-b23b-5ff455a1d6ce	100	2024-05-09T12:39:12.036Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	1ddc00de-781a-49ed-bddd-bdc7b24d5231	10	2024-05-09T12:51:55.293Z	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	73d62b87-49ae-48d7-9001-868839648b25	100	2024-05-13T14:11:09.321Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	01794c4c-0038-4330-a478-0d10c85fb2d0	100	2024-05-13T14:14:13.753Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	cd66b753-ee1e-414f-8975-0881b9d636b2	100	2024-05-12T20:06:53.003Z	2024-05-12T20:07:01.765Z	\N
c5272267-663c-482f-9007-1c1688b017c2	3a9fc3a5-6dcb-423f-812e-3175b59ea51c	100	2024-05-13T14:14:16.949Z	2024-05-13T14:14:21.089Z	\N
c5272267-663c-482f-9007-1c1688b017c2	27493e1f-4f5c-4149-aabf-9c4f6697a35f	100	2024-05-13T14:14:39.840Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	e966d8d8-9212-49c6-a1c2-385a61edab45	10	2024-05-13T14:15:10.429Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	c7493f68-4e46-453d-9bf0-36fff3189bf7	10	2024-05-13T14:15:16.553Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	c2d8b7f0-b0cc-4d81-b935-77c12baa9b0e	100	2024-05-13T14:15:44.955Z	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	b9368d94-0425-4b23-ada4-66f8986f7368	0	2024-05-11T18:46:30.488Z	2024-05-13T16:12:10.436Z	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	87d09650-d0e9-4203-867e-b6e167a1171b	0	2024-05-11T18:46:02.059Z	2024-05-13T16:12:29.958Z	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	5aac6b69-af17-4c0e-b0d0-1621211bc14c	0	2024-05-11T18:46:36.296Z	2024-05-13T16:13:13.133Z	\N
fd2d679b-4e9c-45e3-a8e2-4f4db15b7555	ef206d20-b798-4215-bebb-e53afd8f4a69	10	2024-05-12T20:08:49.486Z	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	6f0169e7-5ca9-4bbc-83f8-78cea1443551	0	2024-05-12T18:56:39.982Z	2024-05-13T17:54:57.888Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	0	2024-05-11T18:56:36.831Z	2024-05-13T18:15:38.934Z	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-11T18:49:39.254Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	03cb9712-4f2d-420a-b280-f760e0dac839	10	2024-05-11T18:49:47.742Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	6fae2ee9-649c-44e0-b07d-be18bc295d5a	10	2024-05-11T18:50:09.729Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	133878fc-7cf2-49a2-b6a9-1407c6e64602	10	2024-05-11T18:50:54.986Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	52b5339a-b922-4d1a-9e58-b4a614cf5369	10	2024-05-11T18:51:07.944Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	dfbf27f0-d560-4aea-aba6-532a6346b994	0	2024-05-11T19:03:36.995Z	2024-05-14T09:27:21.351Z	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	4ff95cea-fbd8-4b79-8fde-04173c44b400	10	2024-05-11T18:51:58.061Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	b813d3b5-bf55-443b-b1a4-be3d426af4e9	10	2024-05-11T18:52:58.627Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	15129370-e9f5-4797-87cf-225625bc7642	10	2024-05-11T18:53:09.743Z	\N	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	8b52634a-b86a-404c-b75e-947944b30430	10	2024-05-11T19:08:42.657Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	fa855264-b42a-4559-b976-1a55f6ee9d9b	100	2024-05-11T18:49:01.163Z	2024-05-11T18:53:20.277Z	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	6ee709d9-f990-41e3-9f92-a75f8d5e4855	10	2024-05-11T18:54:33.501Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	2d93e34c-6997-499e-b4f6-6cd7bbcf8602	100	2024-05-11T19:02:28.214Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	b813d3b5-bf55-443b-b1a4-be3d426af4e9	100	2024-05-11T19:03:45.352Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	689c1d43-a7ee-4b95-97df-1558fbfcb863	0	2024-05-11T18:48:19.547Z	2024-05-14T15:10:00.826Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	bedefc40-5ec1-469a-88fa-b17736d0dfe1	0	2024-05-13T14:10:41.103Z	2024-05-14T12:58:12.965Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	100	2024-05-11T16:35:10.431Z	2024-05-14T13:04:04.741Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	4bccd468-7b89-49f0-93d5-c761ff91c6fb	100	2024-05-11T19:10:04.965Z	\N	\N
d2059fef-d21d-4eea-b57f-959aad6fc556	63245717-adcb-473a-bfb0-1530e637bb7d	100	2024-05-11T19:13:14.873Z	\N	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-11T19:16:27.600Z	\N	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	e87c2f41-f417-4ee0-b818-9adfe7c790e9	10	2024-05-11T19:16:33.924Z	\N	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	d25db3bc-0812-4d28-a03f-ff51419cf15d	10	2024-05-08T20:07:12.837Z	\N	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	8e596eea-5ab7-480b-a22f-2af852198a92	100	2024-05-08T20:07:21.673Z	\N	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	b9368d94-0425-4b23-ada4-66f8986f7368	100	2024-05-08T20:08:00.601Z	\N	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	1b45a959-c141-4d5b-a112-49cc10985fa1	100	2024-05-08T20:08:21.930Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	f1afbf07-cd33-409c-b735-aac7f0b36fbc	10	2024-05-09T12:34:02.086Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	8003eb41-3cc3-4c75-a408-db2001513071	10	2024-05-09T12:34:20.326Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	abf86d41-3ba4-4dde-b0ac-3468fe06ba87	10	2024-05-09T12:35:28.871Z	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	f9e4ebb7-1f4d-4a20-b18c-9d5e4d3984a0	100	2024-05-13T14:10:49.253Z	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	cf61184d-0ffb-4443-9a63-231432a3bed1	100	2024-05-13T14:10:52.255Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	bea72070-859a-4327-8bd8-dba0a8ada786	100	2024-05-13T14:13:50.558Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	6347a939-ad2c-458e-a097-17fdb7ef34b1	10	2024-05-11T18:52:27.867Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	1ff95ef9-1d26-473f-9b56-0e2152b9a681	10	2024-05-13T14:15:33.993Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	4c4b59cc-d639-4952-87e3-107c61c2a673	100	2024-05-13T14:15:37.994Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	8ffbd7b9-7097-44b3-9a88-5dad7e78f3bc	10	2024-05-13T14:15:50.314Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	f8ba58b3-6549-49b7-b400-81ce225d365d	100	2024-05-13T14:15:54.879Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	81b2e05e-41cf-4bb0-96c2-a622640e6f85	100	2024-05-11T19:02:16.756Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	bcd499a9-ddd9-479e-a057-c9f058178eaf	100	2024-05-11T19:02:36.513Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	100	2024-05-11T19:03:39.600Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	1976695e-a2d4-46c5-afa8-438094954f48	10	2024-05-13T14:38:31.639Z	\N	\N
d5f1b990-bc50-4564-bb05-ae52af1b56b3	c31acdf4-e0c4-44a1-b95f-ac267fa6b75f	10	2024-05-13T14:43:40.016Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-13T14:43:44.013Z	\N	\N
09e1c5fe-c4a4-442d-a638-94f55fcc5be0	37a627ee-d6f6-4f94-8edc-190c89a3f255	100	2024-05-13T14:51:31.534Z	\N	\N
09e1c5fe-c4a4-442d-a638-94f55fcc5be0	d01c1d11-e401-4151-b0ec-52c26ce54b32	100	2024-05-13T14:51:49.862Z	\N	\N
95f16afe-05a4-4a7d-bf61-8d11c8de7376	799e9f43-b5e8-4484-be33-09c442390253	0	2024-05-13T14:48:27.979Z	2024-05-13T15:01:54.379Z	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	1cb5b5ed-304f-4fcf-950a-b08827115a46	10	2024-05-11T19:20:15.498Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	3982cd82-d50b-4d04-8f31-8f29bf7735d3	10	2024-05-11T19:20:37.035Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	3875894c-baf3-48c4-8932-059914a6e27c	10	2024-05-11T19:20:48.336Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-11T19:20:56.287Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	c1e4ef3f-0d86-418f-9d9f-05f028246bed	100	2024-05-11T19:21:02.722Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	10	2024-05-11T19:22:56.765Z	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	6d915a63-c6ae-4d4a-a343-6752d0d68efd	0	2024-05-13T14:11:21.475Z	2024-05-14T12:57:46.073Z	\N
fd2d679b-4e9c-45e3-a8e2-4f4db15b7555	e4bedb60-5d9c-4cc6-8ba7-f93d890c6cec	10	2024-05-12T20:08:52.802Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	52b5339a-b922-4d1a-9e58-b4a614cf5369	0	2024-05-11T19:03:21.357Z	2024-05-14T21:53:01.335Z	\N
446e4dc9-c485-47bb-8f49-3107c097e735	4ff95cea-fbd8-4b79-8fde-04173c44b400	0	2024-05-11T19:03:27.981Z	2024-05-14T21:53:07.496Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	172c7042-1a1a-4ed0-9cd7-9f818efde80a	10	2024-05-11T19:13:35.038Z	2024-05-12T20:24:09.774Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	f6a73f85-9f36-454a-83bf-82fbe0b4f0d8	100	2024-05-13T14:11:38.310Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	e13ffed3-e5cb-48fb-a7a4-9a4358fc18ff	10	2024-05-09T12:39:29.712Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	f94729df-e289-49d8-b55c-19ebdbfd783c	100	2024-05-09T12:47:09.104Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	01794c4c-0038-4330-a478-0d10c85fb2d0	100	2024-05-09T12:50:37.163Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	dc359231-d372-495a-a9e0-2bbd47965809	0	2024-05-12T20:21:30.596Z	2024-05-13T17:12:07.563Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	14bb5f33-7c73-441d-a3b6-27fd7348dce3	0	2024-05-08T21:44:30.495Z	2024-05-14T10:37:17.547Z	\N
30266468-96d0-487e-b2df-65e0ab1095e3	a9c5cfe0-a05c-4e45-b38a-f5db5f837304	100	2024-05-09T12:58:59.424Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	a736cad0-9135-4ac2-bb96-d40350b52658	100	2024-05-09T14:03:18.631Z	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	63a59ee2-0622-4383-b74b-c3a8d4d484b3	100	2024-05-09T19:30:51.454Z	\N	\N
8e112d66-6e72-4f17-9fab-7c778b191302	924e9906-692e-460a-bfe4-de2a6c33a5f1	10	2024-05-08T20:59:45.012Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	e4e767ff-be22-4c15-99a3-fac2b97683df	10	2024-05-11T16:31:33.733Z	2024-05-12T20:20:13.124Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	e82f2b29-1394-4325-a728-f3dd20f1c6bf	10	2024-05-12T20:20:44.953Z	2024-05-12T20:20:47.775Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	ddfd8cc9-02db-4c9c-b59c-c4f03459607c	10	2024-05-12T20:21:16.048Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	09fa01c2-c48c-4d7d-b910-adc3109dc041	10	2024-05-12T20:21:23.262Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	bf6f8778-d7d2-4d3b-8703-99de5e3caa5e	10	2024-05-12T20:22:38.490Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	770fd1b3-e792-4127-88f9-7d7a47224363	10	2024-05-12T20:22:45.407Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	21d0b947-aabf-445d-8622-464875e4b937	10	2024-05-12T20:23:23.112Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	1b45a959-c141-4d5b-a112-49cc10985fa1	10	2024-05-12T20:24:40.989Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	120fdccb-4ea6-4c03-a144-a80a55e9a070	100	2024-05-13T14:37:14.095Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	edcb4032-d028-48ee-9811-b6004b277877	10	2024-05-13T14:37:46.125Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	9815d990-5db6-4875-9dfa-1197812a9bfa	10	2024-05-13T14:41:35.371Z	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	93e6682e-6c2a-40aa-a18a-df386c244d3d	0	2024-05-13T14:40:02.281Z	2024-05-13T14:43:38.395Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	d276802d-0992-4f87-b5fa-04e5ee6a10c1	10	2024-05-13T14:47:38.401Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	9af075ac-8d39-4843-8907-02ccb6b5910b	100	2024-05-13T14:48:05.434Z	\N	\N
09e1c5fe-c4a4-442d-a638-94f55fcc5be0	2df34cb2-b419-4cd9-bac0-fee998327fd6	100	2024-05-13T14:52:54.698Z	\N	\N
09e1c5fe-c4a4-442d-a638-94f55fcc5be0	81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	100	2024-05-13T14:53:11.230Z	\N	\N
09e1c5fe-c4a4-442d-a638-94f55fcc5be0	552e881e-ed4a-414b-914e-36a0dd85d0a4	100	2024-05-13T14:53:18.398Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	04156fe1-e392-4283-a919-1e25908dbec1	0	2024-05-12T20:21:06.787Z	2024-05-13T17:08:21.801Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	0eb81d00-fdee-4740-9070-bf23874d35a9	0	2024-05-12T20:20:34.101Z	2024-05-13T17:08:31.873Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	bd2a5ee3-0fc6-4777-b4d1-4bb38ebbd0d4	0	2024-05-12T20:20:29.521Z	2024-05-13T17:08:36.271Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	f1570b6d-f756-493e-a151-115f51f1e747	0	2024-05-12T20:20:24.958Z	2024-05-13T17:08:40.829Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	2c493101-799b-406c-9943-3cc8a75370f0	0	2024-05-12T20:19:31.446Z	2024-05-13T17:09:26.768Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	66a98038-4588-431c-814d-0c440c4683af	0	2024-05-12T20:19:34.132Z	2024-05-13T17:09:30.710Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	5dce43b9-05a8-43d6-a679-80ac421846d8	0	2024-05-12T20:20:54.142Z	2024-05-13T17:10:41.514Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	063d43f1-9f08-4943-8f82-b51aa4e49924	0	2024-05-12T20:36:02.033Z	2024-05-13T18:10:11.359Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	8f000e6a-c3cf-43ea-a947-f5df7150caa4	0	2024-05-12T21:09:13.027Z	2024-05-14T10:40:10.459Z	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	eb1d5056-8b9b-455d-a179-172a747e3f20	10	2024-05-10T15:18:24.549Z	\N	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	f8ba58b3-6549-49b7-b400-81ce225d365d	10	2024-05-10T15:19:22.754Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-12T20:35:53.803Z	2024-05-14T12:30:03.000Z	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	caa77bd6-4cf9-44a5-aa24-2e68c899081a	10	2024-05-10T15:20:08.123Z	\N	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	01794c4c-0038-4330-a478-0d10c85fb2d0	10	2024-05-10T15:20:23.145Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	329ef2f3-32ec-4987-8089-c7f02ffd7aaf	0	2024-05-13T14:47:23.982Z	2024-05-14T18:26:56.458Z	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	21da2418-e978-41cb-90a8-d7e677b4d577	100	2024-05-10T15:27:40.583Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	b59e4cc1-39fb-4cd4-b426-4b6d38067fe7	10	2024-05-11T19:22:07.321Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	96015ec9-b6d9-4ab2-9bac-b2e8375bb6b5	100	2024-05-12T20:47:45.504Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	b355c6b7-f9c9-4b2f-92a2-bb7f8adeb790	10	2024-05-12T20:20:05.337Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-12T20:20:58.640Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	1beeba95-3034-4e3b-b332-fde4a0b09258	10	2024-05-12T20:21:49.396Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	65d76d06-ff09-40b5-8df8-ead5c4cabe2e	10	2024-05-12T20:22:52.513Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	8f000e6a-c3cf-43ea-a947-f5df7150caa4	10	2024-05-12T20:22:59.232Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	46862e71-22b7-4023-ba93-2936050c6f9f	10	2024-05-12T20:23:07.702Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	007f0871-0767-4fbb-87d4-c4a36618a63e	10	2024-05-12T20:23:20.566Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	50272a9e-53dc-4e57-a56b-57f226b22933	10	2024-05-12T20:23:35.393Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	a4f73ff7-1c89-42b8-84d2-8983e7b7fd6d	10	2024-05-11T19:17:32.309Z	2024-05-12T20:24:00.362Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	367ed746-6c87-41d9-a29e-bf3540360ccf	10	2024-05-12T20:35:47.024Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	b355c6b7-f9c9-4b2f-92a2-bb7f8adeb790	10	2024-05-12T20:36:37.157Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	69a463f6-2a70-4736-98ff-a63127c968ef	100	2024-05-12T20:47:49.728Z	\N	\N
8e112d66-6e72-4f17-9fab-7c778b191302	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-08T21:00:08.186Z	\N	\N
09e1c5fe-c4a4-442d-a638-94f55fcc5be0	1de79252-6c13-466b-ba1a-2e9c009fbfaa	100	2024-05-13T14:54:14.253Z	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	84cad0e5-c559-471b-8fc3-de467afc4685	100	2024-05-08T22:10:24.588Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	65a4c3ee-0d66-48c0-9324-950134da1d29	10	2024-05-08T22:16:50.189Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	f94729df-e289-49d8-b55c-19ebdbfd783c	100	2024-05-08T22:21:11.799Z	\N	\N
09e1c5fe-c4a4-442d-a638-94f55fcc5be0	dfcde5dc-2359-47d8-9652-ec4606472bbe	100	2024-05-13T14:54:46.255Z	\N	\N
95f16afe-05a4-4a7d-bf61-8d11c8de7376	d01c1d11-e401-4151-b0ec-52c26ce54b32	0	2024-05-13T14:58:49.558Z	\N	\N
95f16afe-05a4-4a7d-bf61-8d11c8de7376	873f0443-1ed1-4044-ae2e-da17f59ddfc0	0	2024-05-13T14:55:52.022Z	2024-05-13T15:00:45.819Z	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	1114f512-17b1-4c26-927e-5d9888029183	0	2024-05-13T15:20:28.019Z	2024-05-15T01:34:41.406Z	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	799e9f43-b5e8-4484-be33-09c442390253	10	2024-05-13T15:14:54.647Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	876548db-d180-4083-96ba-cddcb86134b0	0	2024-05-13T15:19:07.068Z	2024-05-15T01:36:24.734Z	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	bd2a5ee3-0fc6-4777-b4d1-4bb38ebbd0d4	10	2024-05-13T15:10:52.879Z	\N	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	c957dded-1e08-4e25-a2f8-80d111aef57b	10	2024-05-13T15:11:14.913Z	\N	\N
7648c991-9c53-4950-ac44-824ae0d8e1c7	a9b67a55-6742-4c3f-98ad-af8a69c05686	100	2024-05-13T15:05:43.216Z	2024-05-13T15:11:29.698Z	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	8b2c49f5-c34f-4ac9-abb0-5810c10e3dcb	10	2024-05-10T15:19:32.759Z	\N	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	2b72c607-f5b6-4907-88e9-1a2d50045b18	10	2024-05-10T15:19:44.673Z	\N	\N
7648c991-9c53-4950-ac44-824ae0d8e1c7	40c59877-4ebe-4c3f-bd87-ea8236ea6cff	0	2024-05-13T15:12:08.297Z	2024-05-13T15:12:16.083Z	\N
7648c991-9c53-4950-ac44-824ae0d8e1c7	5d7dee46-9a08-4faf-adf8-5b341231f09a	100	2024-05-13T15:12:44.171Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	945b1d7a-17ac-4646-92ef-018669cee133	10	2024-05-13T15:12:58.341Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	6e627e3f-e598-4b53-b47f-e5ddabca9f1d	0	2024-05-13T15:14:49.896Z	2024-05-13T15:17:51.993Z	\N
40217bba-4f81-4dda-a5e6-a01fc4acad82	770fd1b3-e792-4127-88f9-7d7a47224363	10	2024-05-10T15:23:47.151Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	f013501e-e9ea-478f-af0d-648f96244b14	10	2024-05-13T15:19:39.631Z	\N	\N
40d34be2-9c8a-41df-b86b-3c9909c0da47	8b01dadc-9350-4968-a95d-cf7790c62021	0	2024-05-13T15:20:55.358Z	\N	\N
40d34be2-9c8a-41df-b86b-3c9909c0da47	dd17b384-d3a2-416c-bbc7-85002af4092a	10	2024-05-13T15:21:12.793Z	2024-05-13T15:23:52.025Z	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	799e9f43-b5e8-4484-be33-09c442390253	100	2024-05-13T15:24:23.742Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	47f6a9ff-9285-4814-8697-29045eb4ac49	0	2024-05-13T15:10:06.114Z	2024-05-13T15:28:37.223Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	e82f2b29-1394-4325-a728-f3dd20f1c6bf	0	2024-05-12T20:36:59.613Z	2024-05-13T18:20:06.901Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	1d02a2b6-3aed-4dd4-acd1-27acb87856f3	0	2024-05-12T20:37:30.725Z	2024-05-13T18:56:17.432Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	5d5ba6d2-2853-4b3c-aecb-5f86a8e75707	0	2024-05-13T15:04:10.929Z	2024-05-13T22:58:30.884Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	9e6662ae-0354-4bf7-a7cc-457bbe6ffe6e	0	2024-05-13T15:04:18.874Z	2024-05-13T22:59:52.697Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	52bd1913-9ae1-413d-8258-205049df62e6	0	2024-05-13T15:19:30.367Z	2024-05-14T10:26:25.818Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	0bac5a5c-e260-41eb-806e-46397862d868	0	2024-05-13T15:20:03.063Z	2024-05-14T10:31:15.267Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	5dce43b9-05a8-43d6-a679-80ac421846d8	0	2024-05-12T21:04:26.215Z	2024-05-14T10:36:45.657Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	b9368d94-0425-4b23-ada4-66f8986f7368	0	2024-05-12T20:37:43.354Z	2024-05-14T13:26:32.274Z	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	b8086ace-c3c7-4fa5-905f-ad1d4e64e990	1	2024-05-11T19:18:57.424Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	1beaa417-91ee-4ccc-b779-a4c2a5a81807	10	2024-05-11T19:20:30.814Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	45d237c3-1423-40ba-ae56-665d7fb95f6c	10	2024-05-11T19:22:39.576Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-11T19:22:46.506Z	2024-05-11T19:22:49.115Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	01794c4c-0038-4330-a478-0d10c85fb2d0	10	2024-05-12T20:24:57.248Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	6347a939-ad2c-458e-a097-17fdb7ef34b1	10	2024-05-08T22:24:52.275Z	2024-05-11T22:15:05.002Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	a1e9e0d1-cf48-4f52-8f41-cc24e44a9cce	10	2024-05-12T20:25:15.302Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	4c4b59cc-d639-4952-87e3-107c61c2a673	10	2024-05-12T20:25:21.936Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	b813d3b5-bf55-443b-b1a4-be3d426af4e9	10	2024-05-12T20:36:47.494Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	e4bedb60-5d9c-4cc6-8ba7-f93d890c6cec	10	2024-05-12T20:52:06.433Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	dbcb6fc3-02b4-4e31-8924-ed56f0e6ecc1	10	2024-05-12T20:53:37.322Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	6ad8b08c-2457-45aa-8589-013e0b73d0a4	10	2024-05-12T20:54:19.062Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	3ff4dd29-40d6-47ae-8e61-e441b36d6166	10	2024-05-12T20:54:26.738Z	\N	\N
70084b0f-4b01-431e-a2bf-ee85df1da7cd	ae3c2c9b-44da-4c00-9755-74880c3f9da1	10	2024-05-12T21:08:44.654Z	\N	\N
52a79ef7-7e8d-4478-9ef9-a06899483809	770fd1b3-e792-4127-88f9-7d7a47224363	100	2024-05-12T21:08:57.533Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	cbe1445b-256b-4d93-8829-6a1fda8f526c	10	2024-05-12T21:13:12.510Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	3bb8fb06-b376-4489-80fe-59826066e849	10	2024-05-12T21:13:36.785Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	4c4b59cc-d639-4952-87e3-107c61c2a673	10	2024-05-11T14:16:02.140Z	2024-05-12T21:13:49.016Z	\N
99459d98-6e1d-470d-b060-edcc76744227	ae3c2c9b-44da-4c00-9755-74880c3f9da1	10	2024-05-12T21:13:59.002Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	2472c739-1444-45de-bdde-3941a67a473e	100	2024-05-08T21:33:28.913Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	1e6622ef-802b-4be0-982e-88f13dfd88df	100	2024-05-08T21:34:14.467Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	e95f427a-d290-44f2-a54b-81a6e3847252	10	2024-05-08T21:49:57.141Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	3ce35ddd-0dac-41f9-88a9-27a509c5df0b	0	2024-05-13T15:23:24.982Z	2024-05-15T01:29:03.381Z	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	2b408b16-8dbc-41df-b3c8-7efb18d462b7	100	2024-05-08T22:11:26.453Z	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	b7349827-482c-4c5c-b0eb-7627a8380c16	100	2024-05-08T22:11:58.774Z	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	4fe297e6-4d45-445e-93a1-0f59f9fb5d68	100	2024-05-08T22:12:17.405Z	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	100	2024-05-08T22:12:34.566Z	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	3875894c-baf3-48c4-8932-059914a6e27c	100	2024-05-08T22:12:55.666Z	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	927feebd-0ad5-4b70-aa85-e813941b6498	10	2024-05-08T22:14:07.742Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	b2f1c6ff-93dc-4d8d-8365-36bcfc0eb1fd	10	2024-05-08T22:17:27.582Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	74dc7f47-7298-418b-9b5b-04c47914721b	10	2024-05-08T22:20:04.603Z	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	c905ca5a-0564-4d2a-b9b9-585cbce1cc62	10	2024-05-08T22:46:40.885Z	\N	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	af969f99-eb8a-48be-89a8-028dc76417ad	10	2024-05-10T15:31:44.333Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	f1afbf07-cd33-409c-b735-aac7f0b36fbc	100	2024-05-13T15:06:15.481Z	\N	\N
7648c991-9c53-4950-ac44-824ae0d8e1c7	31420dbb-f6a3-443b-89c1-05344b195408	100	2024-05-13T15:06:54.995Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	4bccd468-7b89-49f0-93d5-c761ff91c6fb	0	2024-05-13T15:21:59.516Z	2024-05-15T01:37:39.382Z	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	85255f2d-f774-48bb-aeec-66b711ebcd2c	10	2024-05-13T15:13:48.601Z	\N	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	af26cae5-8bae-420c-8052-782b9598fded	10	2024-05-13T15:15:07.462Z	\N	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	73d62b87-49ae-48d7-9001-868839648b25	10	2024-05-13T15:15:25.119Z	\N	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	d001c64f-33b0-4d50-a8c1-1b62084c6e00	10	2024-05-13T15:15:39.186Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	100	2024-05-11T19:27:34.082Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	e4bedb60-5d9c-4cc6-8ba7-f93d890c6cec	10	2024-05-11T19:30:38.664Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	460c72c0-b362-4fe8-a7e8-06aabe57cccd	10	2024-05-11T19:31:37.999Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-11T19:31:45.401Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	39854bdb-bb2e-4dc4-a08e-d1fc9c280ebb	10	2024-05-11T19:31:51.917Z	\N	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	a9c5cfe0-a05c-4e45-b38a-f5db5f837304	10	2024-05-13T15:15:55.469Z	\N	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	4c170954-1c43-4928-9014-d3b057e4a5ca	10	2024-05-13T15:16:09.840Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	063d43f1-9f08-4943-8f82-b51aa4e49924	10	2024-05-10T14:30:03.023Z	2024-05-11T19:55:28.852Z	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	1976695e-a2d4-46c5-afa8-438094954f48	10	2024-05-13T15:16:59.781Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	8b2c49f5-c34f-4ac9-abb0-5810c10e3dcb	10	2024-05-12T20:25:03.767Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-13T15:17:31.824Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	24857c6e-7fe5-45e8-9cc5-c5858390c06d	10	2024-05-12T20:25:31.838Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	52634f35-73b2-4c60-99c9-1ec886f6e4b3	10	2024-05-12T20:36:25.152Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	5a68adc5-f0cc-44f6-99e4-12cd88662d08	100	2024-05-12T21:00:30.405Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	6347a939-ad2c-458e-a097-17fdb7ef34b1	10	2024-05-13T15:20:40.144Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	af969f99-eb8a-48be-89a8-028dc76417ad	10	2024-05-13T15:22:47.105Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	ab840b70-dabb-4815-a8d9-5122baf2d7e8	10	2024-05-13T15:23:56.984Z	2024-05-13T15:24:23.486Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	c4976a72-788e-4360-ad86-bb4939bebcc2	0	2024-05-13T15:05:23.539Z	2024-05-13T15:34:19.861Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	9553af2c-3c73-4c34-ab7f-1001c1c34e86	0	2024-05-13T15:08:17.721Z	2024-05-13T15:37:39.939Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	e4e767ff-be22-4c15-99a3-fac2b97683df	10	2024-05-08T16:41:05.601Z	2024-05-12T21:05:28.496Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	04a2d64b-69c0-4f6b-8975-4d41b4f43327	0	2024-05-13T15:20:39.806Z	2024-05-14T10:32:22.837Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	6d451ef8-e962-423c-8fc8-5fb0eb848766	0	2024-05-12T20:37:17.580Z	2024-05-13T18:19:54.515Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	65bc4ea4-a0db-4ac4-b343-b9d587be224b	10	2024-05-12T21:08:07.707Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	cc5459a2-9b43-486b-8c3f-99c507c68562	0	2024-05-12T20:38:03.174Z	2024-05-13T18:42:02.897Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	689c1d43-a7ee-4b95-97df-1558fbfcb863	100	2024-05-12T20:35:39.882Z	2024-05-13T18:54:11.478Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	ef206d20-b798-4215-bebb-e53afd8f4a69	0	2024-05-13T15:03:47.738Z	2024-05-13T22:58:42.648Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	a944ad5c-36b6-417f-aa37-7b8c6a825d01	0	2024-05-13T15:05:07.900Z	2024-05-13T22:59:15.114Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	8b52634a-b86a-404c-b75e-947944b30430	0	2024-05-13T15:05:01.162Z	2024-05-13T22:59:38.775Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	d2123a82-91a0-4f30-896b-61ee15ade670	0	2024-05-12T18:31:07.031Z	2024-05-14T10:28:10.697Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	4c170954-1c43-4928-9014-d3b057e4a5ca	0	2024-05-12T21:08:12.139Z	2024-05-14T10:41:13.760Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	79224f5f-e140-41f1-a6df-dc1313e11387	0	2024-05-13T15:14:35.185Z	2024-05-14T15:07:45.273Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	0fe9ff90-4190-4341-b775-986d9dd18bd5	0	2024-05-13T15:15:20.648Z	2024-05-14T15:16:19.328Z	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	d25db3bc-0812-4d28-a03f-ff51419cf15d	10	2024-05-08T22:17:52.957Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	7b1ffe8e-6cb1-46b9-b85c-dcb380da4aa4	10	2024-05-08T22:18:07.002Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	4c1473a9-f309-4417-ba8f-c89768cdccaf	10	2024-05-08T22:20:31.586Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	bd92845d-ebfc-4a62-94e8-881649dba98e	10	2024-05-08T23:20:02.867Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	edcb4032-d028-48ee-9811-b6004b277877	0	2024-05-08T23:14:42.521Z	2024-05-13T03:07:23.716Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	6b1d5955-578e-4b7c-a66a-118060c94901	0	2024-05-08T23:15:13.539Z	2024-05-13T03:07:42.798Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	761e4265-2f75-46a2-8cf3-16b8a5a69963	0	2024-05-08T23:13:45.849Z	2024-05-13T03:14:28.064Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	229f0eb8-0663-4ab0-b471-5028f1bf1e72	0	2024-05-13T15:02:27.899Z	2024-05-13T15:28:15.203Z	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	b813d3b5-bf55-443b-b1a4-be3d426af4e9	10	2024-05-13T15:10:35.688Z	\N	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	0eb81d00-fdee-4740-9070-bf23874d35a9	10	2024-05-13T15:10:44.149Z	\N	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	f1570b6d-f756-493e-a151-115f51f1e747	10	2024-05-13T15:11:00.025Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	12441ef6-2583-4e7e-9aae-8f3bf89147e6	10	2024-05-08T22:41:59.368Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	53743f4f-eded-4145-b56e-224eab9471ec	10	2024-05-08T22:42:17.450Z	\N	\N
7648c991-9c53-4950-ac44-824ae0d8e1c7	6e71e6ec-9335-4db3-a0bd-4cfc3bed41f9	0	2024-05-13T15:11:36.248Z	2024-05-13T15:11:40.589Z	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	f9e4ebb7-1f4d-4a20-b18c-9d5e4d3984a0	10	2024-05-13T15:11:42.957Z	\N	\N
7648c991-9c53-4950-ac44-824ae0d8e1c7	118cbd0b-c262-45d4-a8d6-0090cdb0842a	100	2024-05-13T15:05:58.113Z	2024-05-13T15:11:53.349Z	\N
7648c991-9c53-4950-ac44-824ae0d8e1c7	7dafb07f-4bf3-46ce-8c1a-5750397b51c0	100	2024-05-13T15:06:08.249Z	2024-05-13T15:12:00.722Z	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	941b36ba-5f4e-4651-90df-1eaa49bce90f	10	2024-05-13T15:12:03.704Z	\N	\N
7648c991-9c53-4950-ac44-824ae0d8e1c7	950a9045-f3c3-42d7-bf59-d42c5ef42d29	100	2024-05-13T15:12:28.161Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	cbe1445b-256b-4d93-8829-6a1fda8f526c	100	2024-05-09T11:10:17.680Z	2024-05-12T21:08:38.503Z	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	385050b1-969f-43b5-963d-2f5331f9a246	10	2024-05-13T15:12:38.930Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	4b7e6463-949e-4a9a-8198-0ee4245a63df	10	2024-05-08T23:04:12.752Z	\N	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-08T23:05:32.703Z	\N	\N
7648c991-9c53-4950-ac44-824ae0d8e1c7	28114a40-6489-4712-b5ba-5968b0fc8fd9	100	2024-05-13T15:12:39.222Z	\N	\N
7648c991-9c53-4950-ac44-824ae0d8e1c7	1de20395-c5ed-4f98-9090-166ffe118c11	100	2024-05-13T15:13:01.340Z	\N	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	d001c64f-33b0-4d50-a8c1-1b62084c6e00	10	2024-05-10T15:31:58.530Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	36b4a759-d476-4904-ab8e-475404bb564a	10	2024-05-13T15:29:01.722Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	cbb08cdc-a4ec-48d0-812e-66c0448cb12c	10	2024-05-13T15:16:51.395Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	b8598db7-a21f-4bba-8ed4-d0317b0a5df8	0	2024-05-13T15:16:12.190Z	2024-05-13T15:16:51.983Z	\N
52a79ef7-7e8d-4478-9ef9-a06899483809	96015ec9-b6d9-4ab2-9bac-b2e8375bb6b5	100	2024-05-12T21:09:00.120Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	15121282-bdc8-4096-845b-974401b2e6aa	10	2024-05-13T15:17:40.940Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	f33825fd-e6b0-47bb-80c0-80aef8a42e19	10	2024-05-13T15:16:31.296Z	2024-05-13T15:18:52.845Z	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	b43c65c7-d321-4b29-9536-7e40bfd01300	10	2024-05-13T15:25:16.009Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	21d0b947-aabf-445d-8622-464875e4b937	10	2024-05-13T15:29:29.345Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	6a220720-6fa3-42cc-8101-621da51b521f	10	2024-05-13T15:29:35.493Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-13T15:32:18.287Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-13T15:32:57.863Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	66a98038-4588-431c-814d-0c440c4683af	1	2024-05-13T15:33:17.598Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	84f83b15-aa13-4b74-8c81-b769f429a6db	1	2024-05-13T15:33:26.205Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	b813d3b5-bf55-443b-b1a4-be3d426af4e9	10	2024-05-13T15:33:53.314Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	0f0fffef-ec91-4dc1-b8ac-41d189b1b026	100	2024-05-13T15:34:54.567Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	e48d36c1-f6b4-47f4-9123-17681ed99941	10	2024-05-13T15:36:19.491Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	7ce8ca85-b7a2-47d3-a070-37bfba009ac0	100	2024-05-13T15:36:45.656Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	fcffd019-56c9-4949-8a10-6b6f5104291c	0	2024-05-13T15:11:01.929Z	2024-05-13T15:37:29.456Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	64398b22-667d-43c5-8b68-17010f9927eb	0	2024-05-13T15:03:55.701Z	2024-05-13T22:59:44.864Z	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	ac6f15cf-03fc-4676-9a54-0bb20529c7d2	100	2024-05-13T15:07:03.198Z	2024-05-14T00:18:24.727Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	f1570b6d-f756-493e-a151-115f51f1e747	0	2024-05-13T15:19:21.005Z	2024-05-14T10:27:46.338Z	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	919d8585-40a8-45e9-b619-b9e7a7ba20ea	100	2024-05-13T15:06:26.753Z	2024-05-14T00:18:17.557Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	ea2c6721-693d-496e-8442-a2381d48430b	0	2024-05-12T18:32:58.570Z	2024-05-14T10:28:34.497Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	6a220720-6fa3-42cc-8101-621da51b521f	10	2024-05-13T15:07:49.918Z	2024-05-14T13:29:10.977Z	\N
40d34be2-9c8a-41df-b86b-3c9909c0da47	5aac6b69-af17-4c0e-b0d0-1621211bc14c	0	2024-05-13T15:25:17.779Z	2024-05-14T13:56:21.209Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	2d3cf6fc-8424-47d6-8908-903526827010	10	2024-05-11T19:27:24.854Z	\N	\N
40d34be2-9c8a-41df-b86b-3c9909c0da47	2247cd19-88cd-47de-8d62-a003564f27f5	10	2024-05-13T15:24:24.198Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	869ed149-9375-4fac-a687-d5450b53ceb8	10	2024-05-13T15:25:29.597Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	3bc70d84-418a-4aee-bb4d-d14ce0091784	10	2024-05-08T22:44:03.389Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	84cad0e5-c559-471b-8fc3-de467afc4685	100	2024-05-08T22:46:04.411Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	324fc117-cf6b-4367-a7f1-8eb595c01377	10	2024-05-13T15:26:01.991Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	9e3aa905-3cfb-443a-adcb-e47cd09bf6d5	10	2024-05-13T15:30:16.747Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	f013501e-e9ea-478f-af0d-648f96244b14	10	2024-05-13T15:32:48.883Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	52808a2f-f878-4f2d-8c8d-17c2861358e8	10	2024-05-13T15:34:31.593Z	\N	\N
3c25886c-39e0-482b-9b3e-cd1e7e59249c	7ce8ca85-b7a2-47d3-a070-37bfba009ac0	100	2024-05-13T15:36:11.994Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	63245717-adcb-473a-bfb0-1530e637bb7d	0	2024-05-13T15:24:40.215Z	2024-05-13T15:36:50.460Z	\N
c082783c-12d1-4174-9e59-276a5c647079	2b6abce0-4abb-4341-b6e5-960d73ca6645	10	2024-05-13T15:37:21.400Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	13a4afa8-2b27-43c2-8ac1-0a2b29ce7832	10	2024-05-13T15:38:11.488Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	ca0612fa-aa62-42ec-b333-ea09d667e48a	10	2024-05-09T13:36:02.157Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	b59f42a7-43d1-4d00-bf37-ba68127a1d30	10	2024-05-13T15:39:30.120Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	e22bf0ca-5fef-46f2-bc54-a3b627d41080	100	2024-05-13T15:44:25.583Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	39bc837b-b026-4a73-b987-efbba14a889f	100	2024-05-09T13:50:31.656Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	61987ae1-ed89-4be5-8918-0beb83e5d46b	100	2024-05-08T23:07:52.196Z	\N	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	87269af6-7c90-4892-acdf-6369bab311b6	10	2024-05-13T15:53:16.146Z	\N	\N
2c90f265-1621-43ea-a523-d1417d410c53	e162ec59-91e5-4621-8a2a-05848cd0f368	100	2024-05-13T15:53:55.737Z	\N	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	0a8af7cc-f9a9-492c-a180-2396f595b277	10	2024-05-13T15:54:12.470Z	\N	\N
2c90f265-1621-43ea-a523-d1417d410c53	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	100	2024-05-13T15:54:14.539Z	\N	\N
2c90f265-1621-43ea-a523-d1417d410c53	689c1d43-a7ee-4b95-97df-1558fbfcb863	100	2024-05-13T15:54:28.354Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	dd565638-4773-4712-91e1-4a3478c8fa6a	10	2024-05-08T23:17:46.714Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	2fe71172-ab32-490e-91ae-0ec727bd3d52	10	2024-05-08T23:18:39.407Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	950a9045-f3c3-42d7-bf59-d42c5ef42d29	100	2024-05-12T21:12:17.087Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	bb08b985-ca7c-4143-8550-dad6b11e6e31	10	2024-05-13T16:15:39.117Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	7dafb07f-4bf3-46ce-8c1a-5750397b51c0	100	2024-05-12T21:12:23.167Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	18b45eb3-755c-4d38-a974-2857f6b30638	10	2024-05-13T16:15:59.768Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	ff30edb6-ad8b-4b10-80ba-da7d2ef786f7	100	2024-05-08T23:35:24.835Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	a9b67a55-6742-4c3f-98ad-af8a69c05686	100	2024-05-12T21:12:33.537Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	14bb5f33-7c73-441d-a3b6-27fd7348dce3	100	2024-05-08T23:45:11.271Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	ad9a4dad-3dc5-46b3-b387-889fc5b0b186	100	2024-05-08T23:45:30.421Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	61987ae1-ed89-4be5-8918-0beb83e5d46b	100	2024-05-08T23:45:33.013Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	8a6bee81-d3a5-4f61-abc0-a2f56977eb4d	100	2024-05-08T23:46:11.880Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	68c9670c-99fb-438a-8169-66cc1ce66313	100	2024-05-13T16:19:26.390Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	ddd88a43-eb5a-416a-9ed1-2be44c5982a8	0	2024-05-08T22:44:28.977Z	2024-05-14T19:33:15.664Z	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	47cc3a3a-c887-4c02-8f08-410010ea15b4	100	2024-05-08T23:49:42.589Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	100	2024-05-09T13:28:31.815Z	\N	\N
443935ee-51dc-4ad9-8b86-5198a555770a	24857c6e-7fe5-45e8-9cc5-c5858390c06d	10	2024-05-08T23:58:49.549Z	\N	\N
443935ee-51dc-4ad9-8b86-5198a555770a	8b2c49f5-c34f-4ac9-abb0-5810c10e3dcb	10	2024-05-08T23:59:03.880Z	\N	\N
443935ee-51dc-4ad9-8b86-5198a555770a	caa77bd6-4cf9-44a5-aa24-2e68c899081a	10	2024-05-08T23:59:24.258Z	\N	\N
443935ee-51dc-4ad9-8b86-5198a555770a	01794c4c-0038-4330-a478-0d10c85fb2d0	10	2024-05-08T23:59:33.269Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	84d5b5f4-3c06-4b70-946e-dd258278c7b2	10	2024-05-13T16:26:27.661Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	ebfbd0bc-1356-4086-9255-d5a2dcc7c660	10	2024-05-09T00:15:31.480Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	38939273-b35e-49bf-b84f-0a04f747d44e	10	2024-05-09T00:15:42.834Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	d4bfdb7f-b11d-405d-99c6-99c135eb89d4	100	2024-05-09T13:31:57.355Z	\N	\N
982ec984-0e94-4855-ad46-46403578216c	9717b995-f922-4e7e-970b-c0275d597c01	0	2024-05-13T16:20:06.010Z	2024-05-13T16:22:16.646Z	\N
aca9f2ce-5d63-4a82-9831-56218267f324	dd17b384-d3a2-416c-bbc7-85002af4092a	100	2024-05-09T13:32:46.124Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	1ca48fb5-6df6-4884-ac61-9c9760041ee1	10	2024-05-13T16:27:06.424Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	69732c83-e2ee-481f-b4c5-e55932e8d51f	0	2024-05-13T16:40:52.317Z	2024-05-14T15:02:02.658Z	\N
446e4dc9-c485-47bb-8f49-3107c097e735	27493e1f-4f5c-4149-aabf-9c4f6697a35f	10	2024-05-13T16:47:23.925Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	caa77bd6-4cf9-44a5-aa24-2e68c899081a	10	2024-05-13T16:47:35.010Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	01794c4c-0038-4330-a478-0d10c85fb2d0	0	2024-05-13T16:40:39.003Z	2024-05-14T14:56:11.077Z	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	634649db-5f8b-47b8-a034-f3a78c53dbfe	0	2024-05-13T16:16:26.780Z	2024-05-14T15:57:26.403Z	\N
8476856d-1438-442e-8344-3f31db1d4e1b	21d0b947-aabf-445d-8622-464875e4b937	10	2024-05-09T19:06:22.697Z	2024-05-11T23:17:52.394Z	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	770fd1b3-e792-4127-88f9-7d7a47224363	10	2024-05-08T22:56:08.549Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	3810ff6f-2c32-4a64-a1c6-37be86fdaec6	10	2024-05-08T22:56:19.596Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	e3f24520-666e-47d0-ad10-73a9110b3ad4	10	2024-05-13T15:24:49.127Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	6b1d5955-578e-4b7c-a66a-118060c94901	10	2024-05-09T13:22:54.037Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	79c7f357-2e62-4ab9-8152-de7165e6dae6	10	2024-05-09T13:23:13.593Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	a8ae4a1f-bc8d-4d48-a5ec-ebf618e93781	10	2024-05-09T13:23:52.573Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	924e9906-692e-460a-bfe4-de2a6c33a5f1	100	2024-05-09T13:28:08.415Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-09T13:28:45.304Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	8dcf60fe-758b-4137-93b6-cac321724df2	100	2024-05-09T13:33:46.665Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	4ae4acec-ee0d-40f3-931c-37759e97ecff	10	2024-05-09T13:34:26.265Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	83c733cc-e2b0-4d93-990e-e2e05bf5187c	10	2024-05-09T13:34:34.216Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	385c8377-a125-479c-8e96-f896a348320c	10	2024-05-09T13:37:16.920Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	fedbbfb1-777d-4914-b6fd-184e9de0e7e5	10	2024-05-13T15:25:44.476Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	59904744-08b6-4c32-b82d-b21f8c96bdaf	10	2024-05-13T15:26:26.049Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	fea081c1-7939-4516-97a5-f2cd49177577	100	2024-05-09T13:50:46.141Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	0b0cc909-bb05-4234-a005-0a8bbde9ecd8	10	2024-05-13T15:26:54.639Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	58c7d1c9-8e7f-4d68-8ede-da32a40500bc	100	2024-05-09T13:51:36.692Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	599bee49-16ea-4ea6-9a4a-ae3043926417	100	2024-05-09T13:51:39.044Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	655b4563-e2a3-4d27-a2fb-cf8fad8c91e4	10	2024-05-13T15:29:48.070Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	f1afbf07-cd33-409c-b735-aac7f0b36fbc	100	2024-05-09T13:51:59.614Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	60852499-daab-47a4-a8b1-330951fe3eb2	10	2024-05-13T15:32:07.656Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	6374669b-f8a0-433b-a6af-349529a9e31a	10	2024-05-13T15:35:06.797Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	a1e9e0d1-cf48-4f52-8f41-cc24e44a9cce	10	2024-05-11T19:41:57.215Z	\N	\N
3c25886c-39e0-482b-9b3e-cd1e7e59249c	460c72c0-b362-4fe8-a7e8-06aabe57cccd	10	2024-05-13T15:35:28.649Z	\N	\N
3c25886c-39e0-482b-9b3e-cd1e7e59249c	799e9f43-b5e8-4484-be33-09c442390253	100	2024-05-13T15:35:50.015Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	2a8e82ce-897c-4ce2-a611-1c5cbbb562d5	10	2024-05-13T15:37:36.209Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	b47dcd5b-0abe-44e1-bb92-d2b77e529edd	100	2024-05-13T15:42:07.767Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	10	2024-05-11T19:30:21.307Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	cbe1445b-256b-4d93-8829-6a1fda8f526c	10	2024-05-11T19:30:27.557Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	799e9f43-b5e8-4484-be33-09c442390253	10	2024-05-11T19:30:52.167Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-11T19:30:59.343Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	4c4b59cc-d639-4952-87e3-107c61c2a673	100	2024-05-13T15:44:36.984Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	f6a73f85-9f36-454a-83bf-82fbe0b4f0d8	0	2024-05-13T15:42:39.606Z	2024-05-13T15:45:39.598Z	\N
5577f295-484a-41bf-8b11-5848f060ee9e	b2595c5c-ffe8-4396-a2c8-ea6e4d8d4e6a	10	2024-05-13T15:45:44.994Z	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	fd79a476-6a50-4389-a496-ca34724ff38e	10	2024-05-13T15:46:37.917Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	48b8392c-9bcf-4b94-abff-33b565af4edd	0	2024-05-13T15:50:07.953Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	463b2006-ff25-4d63-8b79-17666b4b4d02	0	2024-05-13T15:50:14.695Z	\N	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	0fa75023-eb3b-47a6-b535-d14dfb8c139f	10	2024-05-13T15:52:21.552Z	\N	\N
2c90f265-1621-43ea-a523-d1417d410c53	053d6422-e791-474c-9820-90252e04da58	100	2024-05-13T15:54:38.445Z	\N	\N
2c90f265-1621-43ea-a523-d1417d410c53	9f8f90ad-55b1-4549-b4b8-2755c3eb1b10	100	2024-05-13T15:55:01.399Z	\N	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	0	2024-05-13T12:12:07.568Z	2024-05-13T15:58:58.708Z	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	78e9e9be-0d18-4553-9a6f-691462e8db06	10	2024-05-13T16:06:18.798Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	ef206d20-b798-4215-bebb-e53afd8f4a69	0	2024-05-11T19:30:34.408Z	2024-05-14T12:34:39.397Z	\N
cb747503-0761-4af5-877b-81dc93234425	1114f512-17b1-4c26-927e-5d9888029183	0	2024-05-11T19:31:05.136Z	2024-05-14T12:44:14.424Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	460c72c0-b362-4fe8-a7e8-06aabe57cccd	10	2024-05-13T15:09:49.820Z	2024-05-14T13:30:43.487Z	\N
14b58682-3c64-42fa-a61a-827f913fc174	3e85a0d3-2717-44bb-8b4b-8ce1a0d2374d	100	2024-05-12T21:12:36.653Z	\N	\N
99459d98-6e1d-470d-b060-edcc76744227	f9e4ebb7-1f4d-4a20-b18c-9d5e4d3984a0	10	2024-05-12T21:12:52.212Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	0676bbe1-5bb4-4bd1-94b6-7a5038ecd41e	10	2024-05-11T19:42:18.608Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	8b2c49f5-c34f-4ac9-abb0-5810c10e3dcb	0	2024-05-09T13:49:47.288Z	2024-05-14T16:23:02.166Z	\N
99459d98-6e1d-470d-b060-edcc76744227	8f528aeb-d345-42a8-b01f-48156c9d589f	10	2024-05-12T21:13:44.961Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	9717b995-f922-4e7e-970b-c0275d597c01	10	2024-05-11T19:50:57.008Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	463b2006-ff25-4d63-8b79-17666b4b4d02	10	2024-05-11T19:51:18.937Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	8ffbd7b9-7097-44b3-9a88-5dad7e78f3bc	10	2024-05-12T21:14:06.814Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	e22bf0ca-5fef-46f2-bc54-a3b627d41080	10	2024-05-12T21:14:13.746Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	7d861778-7335-4765-90b7-e57ef5a9799f	10	2024-05-12T21:14:21.993Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	ebaec0d9-c191-495b-88af-6949707ab812	100	2024-05-08T23:02:52.524Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	761e4265-2f75-46a2-8cf3-16b8a5a69963	100	2024-05-08T23:03:09.746Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	36b4a759-d476-4904-ab8e-475404bb564a	0	2024-05-08T23:15:42.382Z	2024-05-13T03:10:18.317Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	b813d3b5-bf55-443b-b1a4-be3d426af4e9	0	2024-05-08T23:03:16.614Z	2024-05-13T14:59:16.008Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	abf86d41-3ba4-4dde-b0ac-3468fe06ba87	10	2024-05-08T23:04:52.004Z	\N	\N
46a75d17-ebd9-4c36-b242-0d9aaaede3ab	799e9f43-b5e8-4484-be33-09c442390253	100	2024-05-13T15:37:49.121Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	eadb6611-5c04-4050-9be4-fd2b4eacd182	10	2024-05-13T15:37:54.005Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	35a209cb-e678-4c4e-a274-217f7eab4221	10	2024-05-13T15:38:26.911Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	46862e71-22b7-4023-ba93-2936050c6f9f	0	2024-05-13T15:39:15.279Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	74a97d09-1b3c-4d33-9d1f-5272532daf53	10	2024-05-13T15:40:55.584Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	a0260dc1-83f1-4e9a-a2ed-48d011467d86	10	2024-05-13T15:42:15.493Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	96015ec9-b6d9-4ab2-9bac-b2e8375bb6b5	100	2024-05-13T15:42:35.813Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	ace11dbc-d8fc-4d92-8692-72534bdee8be	100	2024-05-08T23:10:02.389Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	77d2613d-eefe-41d5-a786-f6cfa582bb1e	100	2024-05-13T15:43:08.304Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	e8fa365a-302f-4903-9ff5-ff1d37a16ccf	1	2024-05-13T15:44:13.873Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	606a9ed3-b5f7-4d63-8da9-c65adf0a927a	10	2024-05-08T23:17:17.930Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	be7369e0-e867-4443-948e-49b2a2b075b4	10	2024-05-09T13:24:55.293Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	eb01d39b-e347-4a3f-a0ea-f59f916a2236	10	2024-05-09T13:26:59.554Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	7b1ffe8e-6cb1-46b9-b85c-dcb380da4aa4	100	2024-05-09T13:28:22.042Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	65a4c3ee-0d66-48c0-9324-950134da1d29	0	2024-05-13T15:42:42.747Z	2024-05-13T15:45:35.842Z	\N
aca9f2ce-5d63-4a82-9831-56218267f324	24857c6e-7fe5-45e8-9cc5-c5858390c06d	10	2024-05-09T13:34:02.336Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	c8642f4a-7ee0-49a7-aec8-e18eab2e2c69	10	2024-05-09T13:34:11.696Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-13T15:59:41.263Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	377fdec9-9b17-4086-8986-3e04508c4917	10	2024-05-09T13:48:29.204Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	faeac6fc-4c69-4e2b-9b15-b47e85af78ba	100	2024-05-13T16:02:41.560Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	b9368d94-0425-4b23-ada4-66f8986f7368	100	2024-05-09T13:48:39.668Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	770fd1b3-e792-4127-88f9-7d7a47224363	100	2024-05-13T16:07:35.076Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	219e46d3-688f-4021-b7b4-3a1ab5722aa1	100	2024-05-13T16:13:47.393Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	688d2abd-d8f4-4356-b9cc-db8148905b6f	10	2024-05-13T16:14:53.482Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	6b1d5955-578e-4b7c-a66a-118060c94901	0	2024-05-08T23:05:05.646Z	2024-05-13T17:16:54.098Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	d98b2225-e6b9-4ba5-9085-ccdcc1d56af9	0	2024-05-08T23:06:07.597Z	2024-05-13T17:19:06.821Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	fab30458-721d-4712-90d5-3c15e0e102e9	0	2024-05-09T13:48:48.515Z	2024-05-14T15:09:45.479Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	f1afbf07-cd33-409c-b735-aac7f0b36fbc	0	2024-05-09T13:48:53.484Z	2024-05-14T16:23:40.673Z	\N
cb747503-0761-4af5-877b-81dc93234425	2d2a7f10-0aa2-4c87-b5a8-3441cb569f10	10	2024-05-11T19:31:17.595Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	1bcc741b-ea23-434a-bd52-b2d878369a49	10	2024-05-12T21:14:36.089Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	59ce1afa-2583-4810-b726-e8fa4c7e5464	100	2024-05-08T23:34:43.325Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	0	2024-05-12T21:15:23.878Z	2024-05-13T07:24:48.312Z	\N
aca9f2ce-5d63-4a82-9831-56218267f324	d7169b4a-e0ef-469b-8427-f2191ebe432b	100	2024-05-08T23:45:24.340Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	329ef2f3-32ec-4987-8089-c7f02ffd7aaf	10	2024-05-13T16:13:16.674Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	311fefbe-063e-4fe9-af1f-3afd0fb2e6fb	10	2024-05-09T13:35:37.181Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	9dfdc7a5-d7cc-450e-9549-f35c7be8a91c	100	2024-05-09T13:38:31.040Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	52808a2f-f878-4f2d-8c8d-17c2861358e8	10	2024-05-13T16:14:26.875Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	128514c2-90c9-4ab1-9ba8-47a02e780ecc	10	2024-05-13T16:28:10.701Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	b66abcc8-33e7-4476-b725-a34f7dc90585	10	2024-05-13T16:28:23.685Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	c8ce7a65-be98-4e38-beaa-b9907dc003e9	10	2024-05-13T16:28:36.779Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	01794c4c-0038-4330-a478-0d10c85fb2d0	10	2024-05-13T16:29:26.387Z	\N	\N
51077fad-c591-4849-b1d7-08d05faeec96	f51bc934-80c1-4fb6-858f-38f701e88dd9	10	2024-05-08T23:54:57.396Z	\N	\N
51077fad-c591-4849-b1d7-08d05faeec96	c31acdf4-e0c4-44a1-b95f-ac267fa6b75f	10	2024-05-08T23:55:22.503Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	85132717-39a0-41bb-8409-6ecf6ec77019	10	2024-05-13T16:29:37.340Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	c4e94a84-f6d2-48a3-a391-8c2491cc8b21	10	2024-05-13T16:39:02.596Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	b8598db7-a21f-4bba-8ed4-d0317b0a5df8	10	2024-05-13T16:39:21.927Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	6deba02c-b927-4d0b-bdae-8af35430e787	10	2024-05-13T16:40:12.333Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	a4f73ff7-1c89-42b8-84d2-8983e7b7fd6d	10	2024-05-13T16:48:10.731Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	c2d8b7f0-b0cc-4d81-b935-77c12baa9b0e	10	2024-05-13T16:48:21.998Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	4c4b59cc-d639-4952-87e3-107c61c2a673	10	2024-05-13T16:48:32.486Z	\N	\N
79f05644-27f7-4e06-908b-1611d4b477ed	876548db-d180-4083-96ba-cddcb86134b0	100	2024-05-13T16:57:51.776Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	44c1015d-a43a-45b9-a4b9-7eee0d764c45	10	2024-05-13T17:02:06.979Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	63884b8e-600b-4c94-948c-1e39365223c4	10	2024-05-13T17:02:55.127Z	\N	\N
1160eeed-e587-420f-a3a1-fe11e59fb32b	460c72c0-b362-4fe8-a7e8-06aabe57cccd	100	2024-05-13T17:03:17.108Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	f60d21dd-2b8c-4528-91cb-7435c7075850	10	2024-05-13T17:03:39.568Z	\N	\N
1160eeed-e587-420f-a3a1-fe11e59fb32b	da31cce8-8f58-4e67-b299-b42991224a79	10	2024-05-13T17:03:41.797Z	\N	\N
1160eeed-e587-420f-a3a1-fe11e59fb32b	f94729df-e289-49d8-b55c-19ebdbfd783c	10	2024-05-13T17:04:14.344Z	\N	\N
1160eeed-e587-420f-a3a1-fe11e59fb32b	a3b72470-8acf-43e6-a60e-e81685fb330d	10	2024-05-13T17:04:28.360Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	ad9a4dad-3dc5-46b3-b387-889fc5b0b186	10	2024-05-13T17:04:53.269Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	d98b2225-e6b9-4ba5-9085-ccdcc1d56af9	10	2024-05-13T17:05:03.318Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	8ef123b0-d60f-49b5-b4ef-1e015247b760	10	2024-05-13T17:05:13.965Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	01750893-db86-4171-8c01-a41b61309a5d	10	2024-05-13T17:05:38.455Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	2d3cf6fc-8424-47d6-8908-903526827010	0	2024-05-13T17:05:30.366Z	2024-05-13T17:05:47.165Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	af26cae5-8bae-420c-8052-782b9598fded	10	2024-05-13T17:06:09.443Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	2c98279b-bbd2-4645-96a3-51edb69cf509	10	2024-05-13T17:06:28.795Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	69732c83-e2ee-481f-b4c5-e55932e8d51f	10	2024-05-13T17:06:55.068Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	c38e4aa6-bc90-4592-ae7d-95d93de12ec4	10	2024-05-11T19:42:38.540Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	c096c90d-0710-4804-801c-e5a2b8d14e6f	10	2024-05-11T19:43:24.126Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	172c7042-1a1a-4ed0-9cd7-9f818efde80a	10	2024-05-11T19:43:44.743Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	d7169b4a-e0ef-469b-8427-f2191ebe432b	10	2024-05-11T19:44:07.131Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	ace11dbc-d8fc-4d92-8692-72534bdee8be	10	2024-05-11T19:44:31.283Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	39854bdb-bb2e-4dc4-a08e-d1fc9c280ebb	10	2024-05-11T19:44:41.793Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	6942f871-6e35-4eeb-a3ff-8edc8959aa22	10	2024-05-11T19:45:00.269Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-11T19:45:04.525Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	6b1d5955-578e-4b7c-a66a-118060c94901	10	2024-05-11T19:45:20.909Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	5aac6b69-af17-4c0e-b0d0-1621211bc14c	10	2024-05-11T19:45:31.110Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	7ec537b7-31aa-4a4e-9fba-4ef922665767	100	2024-05-13T17:07:52.364Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	b8598db7-a21f-4bba-8ed4-d0317b0a5df8	0	2024-05-13T17:00:36.456Z	2024-05-13T17:10:54.594Z	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	af26cae5-8bae-420c-8052-782b9598fded	100	2024-05-13T17:18:39.761Z	\N	\N
97ef5b90-6f9b-4adb-bd07-086e7330b745	6e71e6ec-9335-4db3-a0bd-4cfc3bed41f9	10	2024-05-11T19:49:16.829Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	e85a86ec-1e72-4318-ab4b-3c4faadbec45	10	2024-05-11T19:51:37.990Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	7d861778-7335-4765-90b7-e57ef5a9799f	10	2024-05-11T19:52:36.662Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	f33825fd-e6b0-47bb-80c0-80aef8a42e19	0	2024-05-13T16:39:24.687Z	2024-05-14T15:07:34.656Z	\N
14b58682-3c64-42fa-a61a-827f913fc174	5a68adc5-f0cc-44f6-99e4-12cd88662d08	10	2024-05-12T21:14:42.152Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	61987ae1-ed89-4be5-8918-0beb83e5d46b	10	2024-05-12T21:15:46.904Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-09T00:15:57.446Z	\N	\N
51077fad-c591-4849-b1d7-08d05faeec96	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-09T03:20:20.783Z	\N	\N
51077fad-c591-4849-b1d7-08d05faeec96	50272a9e-53dc-4e57-a56b-57f226b22933	10	2024-05-08T23:56:33.555Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	10	2024-05-09T13:49:10.718Z	2024-05-12T19:46:52.270Z	\N
51077fad-c591-4849-b1d7-08d05faeec96	8550fcc0-103c-46ee-a632-7cbb45f1b74a	10	2024-05-08T23:57:26.701Z	\N	\N
51077fad-c591-4849-b1d7-08d05faeec96	13a4afa8-2b27-43c2-8ac1-0a2b29ce7832	10	2024-05-08T23:57:43.087Z	\N	\N
982ec984-0e94-4855-ad46-46403578216c	edcb4032-d028-48ee-9811-b6004b277877	10	2024-05-13T16:19:27.433Z	\N	\N
982ec984-0e94-4855-ad46-46403578216c	2ac83258-0e18-4373-9edc-d78286bc955c	10	2024-05-13T16:19:40.840Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	a736cad0-9135-4ac2-bb96-d40350b52658	10	2024-05-13T16:47:58.902Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	46862e71-22b7-4023-ba93-2936050c6f9f	10	2024-05-09T00:13:11.137Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	63884b8e-600b-4c94-948c-1e39365223c4	10	2024-05-09T00:14:37.170Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	7982a520-ecc8-4cf9-a8be-2bd40550bd31	10	2024-05-09T00:14:59.608Z	\N	\N
982ec984-0e94-4855-ad46-46403578216c	caa77bd6-4cf9-44a5-aa24-2e68c899081a	0	2024-05-13T16:19:41.777Z	2024-05-13T16:22:08.301Z	\N
353f8450-1885-4b98-a243-01a19593d1fd	7a841996-d096-4752-b071-263d1166fcbc	10	2024-05-13T16:26:43.911Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-13T16:28:46.293Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	cbe1445b-256b-4d93-8829-6a1fda8f526c	100	2024-05-09T13:49:54.074Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	37b6d4e1-224f-4fa5-a39a-efc511bab38a	100	2024-05-09T13:50:18.618Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	25f492ea-fb52-4085-929c-6a53ee6a0537	10	2024-05-13T16:29:01.437Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	caa77bd6-4cf9-44a5-aa24-2e68c899081a	10	2024-05-13T16:29:14.766Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	4ae4acec-ee0d-40f3-931c-37759e97ecff	100	2024-05-09T13:51:29.645Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	115de606-b9d6-475b-953b-d838d8783dd6	100	2024-05-09T13:51:50.721Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	f92f19df-fcfc-4187-ba73-3457c765e71a	10	2024-05-11T19:42:58.718Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	460c72c0-b362-4fe8-a7e8-06aabe57cccd	10	2024-05-11T19:43:47.964Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	d001c64f-33b0-4d50-a8c1-1b62084c6e00	10	2024-05-13T16:29:59.491Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	39bc837b-b026-4a73-b987-efbba14a889f	10	2024-05-13T16:30:12.577Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	974734e0-3a85-47e5-92bb-a7eb378c3c93	0	2024-05-13T16:39:28.007Z	2024-05-14T15:07:38.058Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	cb69b4b0-b164-43ed-ad6e-c0c3ca3ad93e	10	2024-05-13T16:40:00.910Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	69732c83-e2ee-481f-b4c5-e55932e8d51f	10	2024-05-13T16:47:12.566Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	11c6d26d-d148-49c7-bcfd-cf2ce6be4022	10	2024-05-13T16:49:15.038Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	6ebdfdfa-c7b7-42c3-972c-a15b921d4e66	0	2024-05-13T16:21:58.273Z	2024-05-13T16:59:06.682Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	ab840b70-dabb-4815-a8d9-5122baf2d7e8	10	2024-05-13T17:02:23.398Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	ab8709c7-2655-4f0f-b1bc-68363acf5f87	0	2024-05-13T17:03:13.087Z	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	7a841996-d096-4752-b071-263d1166fcbc	10	2024-05-10T17:35:21.348Z	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	8f528aeb-d345-42a8-b01f-48156c9d589f	10	2024-05-10T17:35:37.116Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	5e3faa0a-8bf7-4182-b057-cec38d4bed2d	10	2024-05-13T17:03:52.916Z	\N	\N
1160eeed-e587-420f-a3a1-fe11e59fb32b	3b38eca1-e08a-451f-aa40-d2138daa2b08	0	2024-05-13T17:02:52.441Z	2024-05-13T17:05:52.142Z	\N
982ec984-0e94-4855-ad46-46403578216c	e332e031-a18e-4407-81e9-660530260e64	0	2024-05-13T16:18:57.657Z	2024-05-13T23:00:50.345Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	52634f35-73b2-4c60-99c9-1ec886f6e4b3	0	2024-05-13T16:56:57.242Z	2024-05-13T18:50:33.858Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	a1e9e0d1-cf48-4f52-8f41-cc24e44a9cce	0	2024-05-13T16:40:58.855Z	2024-05-14T15:02:55.081Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	ab8709c7-2655-4f0f-b1bc-68363acf5f87	0	2024-05-09T13:51:28.112Z	2024-05-14T15:03:15.844Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	6763caea-7b53-466a-a9b3-40ebfac0f9bb	0	2024-05-13T16:39:44.063Z	2024-05-14T15:06:14.918Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	d001c64f-33b0-4d50-a8c1-1b62084c6e00	0	2024-05-13T16:39:47.654Z	2024-05-14T15:06:18.240Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	eb1d5056-8b9b-455d-a179-172a747e3f20	0	2024-05-09T13:50:14.292Z	2024-05-14T15:09:27.419Z	\N
2c6837d0-3795-4f58-aace-3d099c600b36	dddc18c7-f4d7-43d6-9007-40599f10cc16	100	2024-05-10T16:30:27.516Z	2024-05-11T14:38:22.557Z	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	0bd6022d-21b2-47d1-8a71-1f679b62541c	10	2024-05-11T19:44:12.966Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	55020e2d-1413-46ab-9b94-b31d48f87bd4	10	2024-05-11T19:44:17.539Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	bbca6f5f-96e5-4329-8a54-c0a618d5f99e	10	2024-05-11T19:44:28.685Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	6347a939-ad2c-458e-a097-17fdb7ef34b1	10	2024-05-11T19:44:48.894Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-11T19:44:57.259Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	fa855264-b42a-4559-b976-1a55f6ee9d9b	10	2024-05-11T19:45:38.127Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	dc359231-d372-495a-a9e0-2bbd47965809	10	2024-05-11T19:45:44.701Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-11T19:45:59.704Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	ae3c2c9b-44da-4c00-9755-74880c3f9da1	10	2024-05-11T19:46:18.908Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	8812cea7-01bc-4c7f-892d-cd0071589195	10	2024-05-12T21:15:01.724Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	01794c4c-0038-4330-a478-0d10c85fb2d0	10	2024-05-13T16:47:43.496Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	ddd88a43-eb5a-416a-9ed1-2be44c5982a8	0	2024-05-09T13:50:03.128Z	2024-05-14T13:25:07.648Z	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	1b45a959-c141-4d5b-a112-49cc10985fa1	100	2024-05-09T13:51:21.661Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	7baf0c84-7658-4f5d-829a-36f6194c154f	10	2024-05-09T13:51:14.378Z	2024-05-14T15:02:15.833Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	cc5459a2-9b43-486b-8c3f-99c507c68562	0	2024-05-09T13:50:50.118Z	2024-05-14T15:03:51.087Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	f92f19df-fcfc-4187-ba73-3457c765e71a	0	2024-05-09T13:50:44.826Z	2024-05-14T15:04:10.458Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	fcc2aee3-3a74-45a7-a590-961a2f78050d	0	2024-05-09T13:49:55.328Z	2024-05-14T15:04:23.081Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	8df22c40-25d7-4f96-8bc6-0fe734f948d3	0	2024-05-09T13:50:56.261Z	2024-05-14T16:22:46.974Z	\N
2c6837d0-3795-4f58-aace-3d099c600b36	8ec08775-c401-4a5e-b52d-681cc468601c	10	2024-05-10T16:30:46.604Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	1ddc00de-781a-49ed-bddd-bdc7b24d5231	10	2024-05-10T22:15:33.600Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	eb1d5056-8b9b-455d-a179-172a747e3f20	10	2024-05-11T19:47:56.464Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-12T21:15:32.847Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	10	2024-05-13T17:00:50.516Z	\N	\N
6c0b51d2-584d-4db3-a7a7-e1a52829c257	899285d0-a01e-4307-9fc0-78c1268ee129	10	2024-05-10T16:44:03.920Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	38ce9b58-53ff-4a90-a73d-2c869c07a5b3	0	2024-05-13T17:08:37.657Z	2024-05-13T17:08:50.581Z	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	cc5459a2-9b43-486b-8c3f-99c507c68562	100	2024-05-13T17:09:11.500Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	f33825fd-e6b0-47bb-80c0-80aef8a42e19	0	2024-05-13T17:00:29.188Z	2024-05-13T17:10:51.551Z	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	1ddc00de-781a-49ed-bddd-bdc7b24d5231	10	2024-05-11T19:56:02.203Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	edcb4032-d028-48ee-9811-b6004b277877	0	2024-05-08T23:03:50.687Z	2024-05-13T17:16:02.296Z	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	21da2418-e978-41cb-90a8-d7e677b4d577	10	2024-05-11T20:02:41.816Z	\N	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	10	2024-05-11T20:02:49.307Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	723e8686-19d8-4b51-a250-e05885d9e081	100	2024-05-11T20:05:32.141Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	24e95cd1-71cf-406f-b256-80ce535f8e65	100	2024-05-11T20:06:09.055Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	d001c64f-33b0-4d50-a8c1-1b62084c6e00	10	2024-05-12T20:01:57.486Z	2024-05-12T21:48:43.656Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	6763caea-7b53-466a-a9b3-40ebfac0f9bb	0	2024-05-12T21:55:10.495Z	2024-05-14T10:37:54.567Z	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	6cc30b69-59f6-4eb5-bae8-dc681541cca4	100	2024-05-09T13:53:40.106Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	2b72c607-f5b6-4907-88e9-1a2d50045b18	100	2024-05-09T14:04:05.900Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	3a9fc3a5-6dcb-423f-812e-3175b59ea51c	100	2024-05-09T14:05:28.988Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	128514c2-90c9-4ab1-9ba8-47a02e780ecc	100	2024-05-09T14:06:00.380Z	\N	\N
79f05644-27f7-4e06-908b-1611d4b477ed	fe6cc6f1-779b-46d5-aa3f-7f57e08fecfa	0	2024-05-12T22:07:11.255Z	2024-05-13T16:58:33.712Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	1f136e6b-3881-4341-b169-5a4ec852c888	0	2024-05-13T17:02:48.768Z	2024-05-13T17:04:03.152Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	49269442-ab56-4023-be4f-9201c8ade196	10	2024-05-13T17:04:32.491Z	\N	\N
7d5e29af-7d5f-41a9-afaf-8e2135dd69c4	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-09T14:51:19.129Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	12c780fb-9a09-4c15-bc5f-d93d5ea1177b	10	2024-05-10T17:29:20.575Z	2024-05-11T15:43:07.809Z	\N
1160eeed-e587-420f-a3a1-fe11e59fb32b	5e3faa0a-8bf7-4182-b057-cec38d4bed2d	0	2024-05-13T17:04:59.745Z	2024-05-13T17:05:27.461Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	053d6422-e791-474c-9820-90252e04da58	0	2024-05-12T14:22:17.630Z	2024-05-14T10:33:38.217Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	3edb0a60-0bbf-4332-9fd1-8de317091fca	10	2024-05-13T17:05:41.369Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	5aac6b69-af17-4c0e-b0d0-1621211bc14c	10	2024-05-13T17:05:56.033Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	e3f884bd-3dc5-480f-8bfe-c0be33d26f43	10	2024-05-13T17:06:38.716Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	8ffbd7b9-7097-44b3-9a88-5dad7e78f3bc	10	2024-05-13T17:07:20.486Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	599bee49-16ea-4ea6-9a4a-ae3043926417	100	2024-05-13T17:08:17.907Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	c0c07df3-6215-4b07-8240-f462315ec075	0	2024-05-12T21:58:05.287Z	2024-05-14T10:27:17.338Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	5aac6b69-af17-4c0e-b0d0-1621211bc14c	100	2024-05-12T22:03:43.213Z	2024-05-13T17:18:28.616Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-13T17:08:55.472Z	2024-05-13T18:50:27.635Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	6c8684ed-85ad-49c0-a76e-cb34e7538f4d	0	2024-05-12T21:08:48.394Z	2024-05-14T10:30:26.138Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	f74837d7-d4b4-4224-be14-a6d0df76ea8f	0	2024-05-12T21:57:16.613Z	2024-05-14T10:31:27.017Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	580c2fac-3c42-48d2-b79b-2fbc7b6fc7b0	0	2024-05-12T21:53:26.473Z	2024-05-14T10:37:29.627Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	2477f44f-2324-4eec-a191-10ad25b564e9	0	2024-05-12T21:56:55.643Z	2024-05-14T10:40:51.351Z	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	5703a677-4bf8-42fb-a66b-e9c29b50e4fe	10	2024-05-11T19:59:53.648Z	\N	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	1d02a2b6-3aed-4dd4-acd1-27acb87856f3	10	2024-05-11T20:00:27.969Z	\N	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	27f24e80-5a77-4a37-82d2-91005886f79e	10	2024-05-11T20:00:57.772Z	\N	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	5397e56a-a55f-459d-b24b-64c117581feb	10	2024-05-11T20:01:32.044Z	\N	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	edcb4032-d028-48ee-9811-b6004b277877	10	2024-05-11T20:01:41.460Z	\N	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	321d9059-1be7-4d23-a279-7d4e6072a548	10	2024-05-11T20:02:30.887Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	ca9bc34e-c208-4a72-a365-408377a89314	0	2024-05-12T21:57:08.935Z	2024-05-14T10:42:25.920Z	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	bd742c5e-9257-4f16-a572-b4571d98db90	0	2024-05-13T17:04:13.136Z	2024-05-14T13:04:21.508Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	b7d18ff2-d390-46e0-8cb2-d6bcfe27e7b6	1	2024-05-12T21:53:12.139Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	ae3c2c9b-44da-4c00-9755-74880c3f9da1	10	2024-05-12T21:54:35.839Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	38939273-b35e-49bf-b84f-0a04f747d44e	10	2024-05-12T21:54:48.017Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	e82f2b29-1394-4325-a728-f3dd20f1c6bf	10	2024-05-12T21:55:10.757Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	10	2024-05-12T21:55:33.286Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	2d2a7f10-0aa2-4c87-b5a8-3441cb569f10	10	2024-05-12T21:55:59.797Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	39bc837b-b026-4a73-b987-efbba14a889f	100	2024-05-12T21:56:17.881Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	c31acdf4-e0c4-44a1-b95f-ac267fa6b75f	10	2024-05-12T21:56:18.529Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	73fbacb1-0736-49ec-8873-80ddd65608a2	10	2024-05-12T21:56:31.437Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	e9199d5b-b091-4c0f-a1ae-614a6089eb30	10	2024-05-12T21:57:07.279Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	b1d8f194-15ac-4490-b062-d45434d41966	10	2024-05-12T21:57:18.442Z	\N	\N
049e2453-5a88-471c-ae79-a798e08e3371	b813d3b5-bf55-443b-b1a4-be3d426af4e9	10	2024-05-12T21:58:48.656Z	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	4a963962-95d1-4da2-8260-73d167422452	10	2024-05-12T22:00:21.335Z	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	87569fc9-dfaf-477d-b4c7-e34a80b7bfd4	10	2024-05-12T22:00:29.315Z	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	84d5b5f4-3c06-4b70-946e-dd258278c7b2	10	2024-05-12T22:01:07.107Z	\N	\N
79f05644-27f7-4e06-908b-1611d4b477ed	e3f24520-666e-47d0-ad10-73a9110b3ad4	100	2024-05-12T22:01:25.597Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	465e690a-4ac3-4e71-a35a-d8305acb93fc	0	2024-05-09T16:08:20.744Z	2024-05-13T03:33:11.251Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	0bd6022d-21b2-47d1-8a71-1f679b62541c	0	2024-05-13T17:21:25.661Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	5880fcb0-dd0e-4681-b97d-a1f501152fc6	100	2024-05-09T14:04:47.499Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	88fa7edf-2f9d-43e9-b983-86aa6fc63374	100	2024-05-09T14:05:06.620Z	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	24e95cd1-71cf-406f-b256-80ce535f8e65	100	2024-05-10T17:34:11.945Z	2024-05-13T17:52:43.597Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	2b408b16-8dbc-41df-b3c8-7efb18d462b7	0	2024-05-09T16:00:38.436Z	2024-05-13T19:21:55.637Z	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	8ec08775-c401-4a5e-b52d-681cc468601c	100	2024-05-11T20:01:48.511Z	2024-05-13T21:52:52.987Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	0	2024-05-12T21:50:50.416Z	2024-05-14T10:26:46.619Z	\N
7d5e29af-7d5f-41a9-afaf-8e2135dd69c4	9721c6b8-9405-4236-a98e-b41ea3484d2e	100	2024-05-09T14:49:58.775Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	6b3962b3-33dd-422e-bdda-35dbe0afa554	0	2024-05-12T21:57:33.096Z	2024-05-14T10:26:56.428Z	\N
d8944c64-cd5a-43e8-b6de-01f8a9f01174	47cc3a3a-c887-4c02-8f08-410010ea15b4	100	2024-05-09T15:37:57.527Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	21d0b947-aabf-445d-8622-464875e4b937	10	2024-05-09T16:01:03.274Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	1822d9b2-10f4-4e0d-a39a-b987ed707fae	10	2024-05-09T16:02:46.107Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	fcc2aee3-3a74-45a7-a590-961a2f78050d	0	2024-05-12T21:54:09.011Z	2024-05-14T10:28:43.546Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	91c1ee8c-c4bc-4858-86cb-c47b80846004	0	2024-05-12T21:49:51.736Z	2024-05-14T10:33:42.697Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	869ed149-9375-4fac-a687-d5450b53ceb8	10	2024-05-09T16:15:47.176Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	fb004352-1213-42f9-a764-1f7a0cb34dd0	0	2024-05-12T21:52:16.473Z	2024-05-14T10:36:20.938Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	43a27a70-3ed5-4a3d-8428-623810c3f717	0	2024-05-12T22:17:50.136Z	2024-05-14T10:37:42.186Z	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	49269442-ab56-4023-be4f-9201c8ade196	10	2024-05-09T16:23:05.543Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	61735e25-7502-4864-9a02-cbec10b78700	0	2024-05-10T17:33:45.538Z	2024-05-14T15:07:59.244Z	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	a3b72470-8acf-43e6-a60e-e81685fb330d	10	2024-05-10T17:30:41.924Z	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	63884b8e-600b-4c94-948c-1e39365223c4	10	2024-05-10T17:32:12.593Z	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	4c1473a9-f309-4417-ba8f-c89768cdccaf	10	2024-05-10T17:34:22.532Z	\N	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	a9b67a55-6742-4c3f-98ad-af8a69c05686	10	2024-05-11T19:59:18.899Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	9af075ac-8d39-4843-8907-02ccb6b5910b	10	2024-05-11T20:00:47.193Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	40e27c43-ea54-4bc0-a0b6-3fefc08fec26	10	2024-05-11T20:09:47.171Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	3b7a9689-8c41-4090-9084-5b8e31a1d7d5	10	2024-05-11T20:10:00.157Z	\N	\N
2c90f265-1621-43ea-a523-d1417d410c53	78e9e9be-0d18-4553-9a6f-691462e8db06	100	2024-05-11T20:09:08.505Z	2024-05-12T14:30:48.448Z	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	aa508257-4477-47e7-8c39-77b8b39fe8bb	10	2024-05-12T21:59:39.659Z	\N	\N
79f05644-27f7-4e06-908b-1611d4b477ed	f94729df-e289-49d8-b55c-19ebdbfd783c	100	2024-05-12T22:01:53.490Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	e332e031-a18e-4407-81e9-660530260e64	0	2024-05-12T22:04:40.399Z	2024-05-13T17:17:54.350Z	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	7961a39a-2493-4821-9dd1-c8c1f6592e5b	100	2024-05-13T17:22:30.492Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	85ef977c-f904-47de-bdfc-4c4a02ee09a1	100	2024-05-13T17:24:42.894Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	2cdfa6cc-5f3d-4858-a3ee-13f0a6c7eaf3	10	2024-05-13T17:25:18.320Z	\N	\N
7d5e29af-7d5f-41a9-afaf-8e2135dd69c4	6d915a63-c6ae-4d4a-a343-6752d0d68efd	100	2024-05-09T14:48:55.720Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	12c0a839-cec3-4991-827c-7448fbdf63e0	10	2024-05-13T17:25:37.868Z	\N	\N
7d5e29af-7d5f-41a9-afaf-8e2135dd69c4	e87c2f41-f417-4ee0-b818-9adfe7c790e9	10	2024-05-09T14:50:29.645Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-13T17:25:48.859Z	\N	\N
7d5e29af-7d5f-41a9-afaf-8e2135dd69c4	f74837d7-d4b4-4224-be14-a6d0df76ea8f	10	2024-05-09T14:53:14.163Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-11T20:21:20.012Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	3edb0a60-0bbf-4332-9fd1-8de317091fca	100	2024-05-13T17:26:05.462Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	fb004352-1213-42f9-a764-1f7a0cb34dd0	10	2024-05-13T17:26:06.829Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	3a7b0aad-01bf-4f9d-b420-78b0f1e625a5	100	2024-05-13T17:30:39.489Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	db326b44-ce02-443b-bbe1-deec70fa9a7b	100	2024-05-13T17:31:25.036Z	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	e1d9baf6-5014-468f-9549-2b1853767835	100	2024-05-10T17:34:27.302Z	2024-05-13T17:52:34.345Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	7982a520-ecc8-4cf9-a8be-2bd40550bd31	0	2024-05-11T20:18:35.738Z	2024-05-13T18:15:49.894Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	036aff85-2f8c-434b-87fd-35b46627c5ac	10	2024-05-11T20:15:16.249Z	2024-05-13T18:16:21.681Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	71f5fc2f-29f2-430c-86f5-79b33f4f825e	10	2024-05-11T20:19:04.068Z	2024-05-13T18:20:29.091Z	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	aa228cb7-d1cc-4304-86df-41971e73e607	10	2024-05-11T20:07:44.545Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	19b620fd-2c12-45dd-92c2-a44eff97ca23	10	2024-05-11T20:08:19.737Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	acfe9257-ddff-4600-97ec-b8b512dd6eee	10	2024-05-11T20:09:17.868Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	63b4f328-50d6-45a8-9780-2e795efffaa6	10	2024-05-11T20:09:27.080Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	edcb4032-d028-48ee-9811-b6004b277877	10	2024-05-11T20:10:04.114Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-12T22:03:31.504Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	367ed746-6c87-41d9-a29e-bf3540360ccf	10	2024-05-11T20:10:18.318Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	352af921-b2eb-4ca8-9775-5f124c622d6b	100	2024-05-11T20:14:10.348Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	6b1d5955-578e-4b7c-a66a-118060c94901	100	2024-05-11T20:14:26.331Z	\N	\N
79f05644-27f7-4e06-908b-1611d4b477ed	30afd32d-4464-488e-a212-e4b9ad9ea5bc	100	2024-05-12T22:04:24.577Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	63aacfa9-9d2d-45b3-90c5-c59af6de6f12	100	2024-05-11T20:19:45.767Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	5880fcb0-dd0e-4681-b97d-a1f501152fc6	10	2024-05-11T20:20:08.975Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	9c28c037-b76a-443a-9e9d-33312e926174	100	2024-05-11T20:20:21.364Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	01794c4c-0038-4330-a478-0d10c85fb2d0	10	2024-05-11T20:20:21.431Z	2024-05-11T20:20:23.734Z	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	51f89876-fee4-4887-a74d-351d12ca4c5e	10	2024-05-11T20:20:28.455Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	38f84d3e-7f75-46a7-ad35-080b277112ac	100	2024-05-11T20:20:30.334Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	8e5bab94-d594-46dd-a855-7675f5d8231f	100	2024-05-11T20:20:43.721Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	66a98038-4588-431c-814d-0c440c4683af	10	2024-05-11T20:20:48.182Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	c7493f68-4e46-453d-9bf0-36fff3189bf7	10	2024-05-11T20:20:58.202Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	d246ce3d-165b-462b-a2f5-e6234b505067	100	2024-05-11T20:21:00.241Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	10	2024-05-11T20:21:05.562Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	036aff85-2f8c-434b-87fd-35b46627c5ac	10	2024-05-11T20:21:33.660Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	cc5459a2-9b43-486b-8c3f-99c507c68562	10	2024-05-11T20:21:49.099Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	4bf4cd5b-4156-409b-a3ce-8b3f96366f7c	10	2024-05-11T20:22:21.738Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	831c20bd-c64f-4dbb-9b72-bd33b1ee9c5c	100	2024-05-11T20:21:47.171Z	2024-05-11T20:24:42.727Z	\N
2c90f265-1621-43ea-a523-d1417d410c53	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	10	2024-05-11T20:10:02.747Z	2024-05-12T14:28:22.855Z	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	5aac6b69-af17-4c0e-b0d0-1621211bc14c	100	2024-05-13T17:25:12.052Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	340e35f2-a28c-4c48-a114-2e7339c7c735	100	2024-05-13T17:25:25.354Z	\N	\N
78dd3306-5706-4f9f-b23d-3ab41a2beba2	8dcf60fe-758b-4137-93b6-cac321724df2	10	2024-05-09T15:42:15.214Z	\N	\N
78dd3306-5706-4f9f-b23d-3ab41a2beba2	b7349827-482c-4c5c-b0eb-7627a8380c16	10	2024-05-09T15:42:26.859Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	e1075af4-70c1-4124-b93b-20149f24e57b	100	2024-05-13T17:26:48.206Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	6b1d5955-578e-4b7c-a66a-118060c94901	10	2024-05-09T16:04:02.126Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	f040d5f7-db89-4068-a735-9c0082f30710	10	2024-05-09T16:04:44.548Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	7f8e851f-d072-469a-bf7c-1d04b14b18b4	10	2024-05-09T16:05:14.292Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	450614ac-762f-4109-bc13-d8c72066abc7	100	2024-05-13T17:28:49.816Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	100	2024-05-13T17:31:38.796Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	36b4a759-d476-4904-ab8e-475404bb564a	10	2024-05-09T16:14:54.846Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	1976695e-a2d4-46c5-afa8-438094954f48	100	2024-05-13T17:32:17.315Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	367ed746-6c87-41d9-a29e-bf3540360ccf	100	2024-05-13T17:32:41.511Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	46862e71-22b7-4023-ba93-2936050c6f9f	100	2024-05-13T17:33:03.039Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	d2123a82-91a0-4f30-896b-61ee15ade670	100	2024-05-13T17:33:13.817Z	\N	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	db326b44-ce02-443b-bbe1-deec70fa9a7b	10	2024-05-13T17:33:23.568Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	2c98279b-bbd2-4645-96a3-51edb69cf509	10	2024-05-10T01:29:58.802Z	\N	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	fe759238-aa02-4e06-94e5-cd2222df803b	10	2024-05-13T17:33:52.585Z	2024-05-13T17:33:59.678Z	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	0d3f2a26-0bec-4cee-9c9b-62b7dd53345c	100	2024-05-13T17:34:55.271Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	d8b0c9ec-39a1-44e4-9ccf-36b439e39368	100	2024-05-13T17:34:56.045Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	f013501e-e9ea-478f-af0d-648f96244b14	10	2024-05-10T18:49:33.722Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-10T18:49:40.965Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	f78c85b4-fcac-4854-970b-d80f201d5aa3	10	2024-05-10T18:50:02.732Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	5992e29f-0982-4f26-b0fd-7b44fc6c08fd	10	2024-05-10T18:52:29.032Z	\N	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	8e216fb9-2ce0-4804-9263-b29e8a1eeb71	100	2024-05-13T17:35:29.613Z	\N	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	0bac5a5c-e260-41eb-806e-46397862d868	10	2024-05-13T17:35:56.101Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	e13ffed3-e5cb-48fb-a7a4-9a4358fc18ff	100	2024-05-13T17:42:13.275Z	\N	\N
40306998-932b-4cb9-b593-1dfa7794b88c	799e9f43-b5e8-4484-be33-09c442390253	10	2024-05-13T17:43:32.879Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	100	2024-05-13T17:44:01.310Z	\N	\N
d5d9c052-3847-4ff4-bf83-f4feda281831	d25db3bc-0812-4d28-a03f-ff51419cf15d	10	2024-05-13T17:44:23.152Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	6f0169e7-5ca9-4bbc-83f8-78cea1443551	100	2024-05-11T20:14:33.032Z	\N	\N
d5d9c052-3847-4ff4-bf83-f4feda281831	bdf7609e-a731-4480-874a-7ed5a8de5627	10	2024-05-13T17:44:54.059Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	c8e0a4e5-963c-41b0-a9a0-dc814215cb7c	10	2024-05-11T20:15:57.696Z	\N	\N
d5d9c052-3847-4ff4-bf83-f4feda281831	112f1380-ebef-4697-87e8-7cb8a1e05cf7	10	2024-05-13T17:45:17.611Z	\N	\N
5daec969-8869-4121-bafc-1425731e6487	3ccc7bd1-183d-4f51-9044-a523376e1a58	10	2024-05-13T17:53:08.093Z	\N	\N
5daec969-8869-4121-bafc-1425731e6487	950a9045-f3c3-42d7-bf59-d42c5ef42d29	100	2024-05-13T17:55:48.419Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	38939273-b35e-49bf-b84f-0a04f747d44e	10	2024-05-11T20:14:43.772Z	2024-05-13T18:17:09.588Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	043739b5-1191-46b2-9ee0-4838838464cf	100	2024-05-11T20:18:08.458Z	\N	\N
792ef61b-0f2d-4b0f-9f10-41bbe3327bdf	b7eeeb89-0615-4af4-b284-51f3486c7c9e	0	2024-05-11T20:31:43.252Z	2024-05-14T18:21:35.345Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	df954afb-bd57-422c-ab70-de3787cb7880	100	2024-05-11T20:22:15.394Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	4682d405-9a3e-435d-bb33-e249f72935a5	10	2024-05-11T20:22:31.710Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	5e4b4b53-a13b-483c-a783-5576e0225d82	10	2024-05-11T20:23:54.545Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	3704be1c-459a-4c7d-a18c-34dfd3a1c6cd	10	2024-05-11T20:24:01.609Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	8f000e6a-c3cf-43ea-a947-f5df7150caa4	10	2024-05-11T20:24:30.923Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	f94729df-e289-49d8-b55c-19ebdbfd783c	10	2024-05-11T20:24:40.217Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	b8086ace-c3c7-4fa5-905f-ad1d4e64e990	10	2024-05-11T20:24:49.571Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	38ce9b58-53ff-4a90-a73d-2c869c07a5b3	100	2024-05-11T20:21:30.324Z	2024-05-11T20:24:54.122Z	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	50272a9e-53dc-4e57-a56b-57f226b22933	10	2024-05-11T20:25:06.849Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	e162ec59-91e5-4621-8a2a-05848cd0f368	10	2024-05-11T20:28:09.406Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	367ed746-6c87-41d9-a29e-bf3540360ccf	10	2024-05-11T20:28:31.411Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-11T20:28:43.313Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	9e66cff1-37e1-4631-8251-c7b03b287ada	10	2024-05-11T20:31:39.341Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	c1e4ef3f-0d86-418f-9d9f-05f028246bed	10	2024-05-11T20:32:47.495Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	b5edb6c0-dfe7-4a27-a6cb-182bb82acd29	10	2024-05-11T20:16:22.007Z	2024-05-11T23:11:44.102Z	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	1e034a7e-15d4-45a4-bf77-5695f066aff9	10	2024-05-11T20:14:42.662Z	2024-05-11T23:10:17.531Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	62bd5d05-ba37-497a-a1a1-56795813790d	0	2024-05-10T18:35:27.112Z	2024-05-13T17:16:42.976Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	d2123a82-91a0-4f30-896b-61ee15ade670	0	2024-05-10T18:35:55.822Z	2024-05-13T17:17:50.210Z	\N
d8944c64-cd5a-43e8-b6de-01f8a9f01174	63aacfa9-9d2d-45b3-90c5-c59af6de6f12	100	2024-05-09T15:38:10.681Z	\N	\N
1901f957-605d-4709-b4a4-4e82f521b073	770fd1b3-e792-4127-88f9-7d7a47224363	100	2024-05-13T17:25:36.643Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	d4a48129-b591-4504-a205-589bd90bd350	10	2024-05-09T16:02:15.767Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	01794c4c-0038-4330-a478-0d10c85fb2d0	100	2024-05-13T17:25:37.258Z	\N	\N
1901f957-605d-4709-b4a4-4e82f521b073	5e4b4b53-a13b-483c-a783-5576e0225d82	10	2024-05-13T17:25:56.321Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	45d237c3-1423-40ba-ae56-665d7fb95f6c	100	2024-05-13T17:27:11.682Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	15121282-bdc8-4096-845b-974401b2e6aa	10	2024-05-10T18:35:47.279Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	3848f679-2b54-42ae-a996-8048b2a2f0fc	0	2024-05-13T17:27:06.687Z	2024-05-13T17:28:03.796Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	10	2024-05-10T18:36:07.179Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	62bd5d05-ba37-497a-a1a1-56795813790d	10	2024-05-10T18:50:43.561Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	dfbf27f0-d560-4aea-aba6-532a6346b994	10	2024-05-10T18:54:45.223Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	2323bf86-445a-410d-89fc-01c6b2ea36ea	10	2024-05-10T18:55:11.542Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	1aa1cd13-4803-4871-8bd6-a8006a6cf52a	100	2024-05-13T17:29:24.201Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	b00827d0-bac9-4338-8afd-7fae5a79612f	100	2024-05-13T17:29:44.715Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	65437ee2-7b21-4796-a360-9ad17c50aef5	100	2024-05-13T17:29:59.471Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	324fc117-cf6b-4367-a7f1-8eb595c01377	100	2024-05-13T17:30:22.559Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	ada0b299-35c4-46cd-96fd-9d71b4cc0720	100	2024-05-13T17:31:13.421Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	c4976a72-788e-4360-ad86-bb4939bebcc2	100	2024-05-13T17:31:59.698Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	15121282-bdc8-4096-845b-974401b2e6aa	10	2024-05-10T19:17:20.188Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	8812cea7-01bc-4c7f-892d-cd0071589195	100	2024-05-13T17:32:51.240Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	0774d214-1b04-4d83-90bb-bf30662b9a5a	100	2024-05-13T17:33:28.474Z	\N	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	1822d9b2-10f4-4e0d-a39a-b987ed707fae	10	2024-05-13T17:35:07.348Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	b1d8f194-15ac-4490-b062-d45434d41966	100	2024-05-11T20:16:13.987Z	\N	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	dcd3f6fb-7b64-4fad-8da4-d57f83e30d5c	10	2024-05-13T17:35:19.451Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	e1b9a6e4-3375-4a3c-999b-9761065315c5	100	2024-05-13T17:36:04.324Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	115de606-b9d6-475b-953b-d838d8783dd6	10	2024-05-13T17:42:30.930Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	8f528aeb-d345-42a8-b01f-48156c9d589f	10	2024-05-13T17:42:44.106Z	\N	\N
b81b4e5c-798f-413d-a7cd-7ce1cfd397ee	dfbf27f0-d560-4aea-aba6-532a6346b994	100	2024-05-13T17:43:33.707Z	\N	\N
79f05644-27f7-4e06-908b-1611d4b477ed	ab74a1e0-5969-4d81-b28a-706ab2920afd	100	2024-05-12T22:06:12.015Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	3453dec4-2fa0-4a3d-a053-0af80abdc82c	100	2024-05-11T20:16:55.048Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	fedbbfb1-777d-4914-b6fd-184e9de0e7e5	0	2024-05-12T22:17:21.030Z	2024-05-14T10:32:04.338Z	\N
1a897e88-5092-4071-a4ae-94b887867191	a944ad5c-36b6-417f-aa37-7b8c6a825d01	100	2024-05-10T18:25:53.763Z	2024-05-14T15:18:58.196Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	b8db7c1c-a3ff-4eac-b14e-d0915bbd2270	100	2024-05-11T20:17:57.856Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	1fde16af-ef8a-4686-b021-cafc1c5179cf	100	2024-05-11T20:18:24.737Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	2af85206-62f0-48a7-b5f5-c889498c8b18	100	2024-05-11T20:19:20.955Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	bbdd5c64-f80e-4233-9928-7931fe5e3703	100	2024-05-11T20:19:30.475Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	af26cae5-8bae-420c-8052-782b9598fded	10	2024-05-11T20:19:47.178Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	e22bf0ca-5fef-46f2-bc54-a3b627d41080	10	2024-05-11T20:19:53.382Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	6c8684ed-85ad-49c0-a76e-cb34e7538f4d	10	2024-05-11T20:19:59.167Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	e3f884bd-3dc5-480f-8bfe-c0be33d26f43	10	2024-05-11T20:20:15.478Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	1ddc00de-781a-49ed-bddd-bdc7b24d5231	10	2024-05-11T20:20:35.482Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-11T20:21:14.469Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	83c7d111-7d55-4bf4-b61d-8fa5fbcfb012	10	2024-05-11T20:21:54.461Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	599bee49-16ea-4ea6-9a4a-ae3043926417	10	2024-05-11T20:22:01.452Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	10	2024-05-11T20:29:20.647Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	32c8b84b-f427-472b-91fb-150008246e85	100	2024-05-11T20:34:14.184Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	689c1d43-a7ee-4b95-97df-1558fbfcb863	100	2024-05-11T20:34:24.920Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	7e221be5-cacb-4b5d-96b7-4d0b65d04295	100	2024-05-11T20:35:09.246Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	cc5459a2-9b43-486b-8c3f-99c507c68562	10	2024-05-11T20:36:02.555Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	73fbacb1-0736-49ec-8873-80ddd65608a2	100	2024-05-11T20:36:57.734Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	835ed21d-0c9f-481c-bcfa-9f3235f88ad5	10	2024-05-11T20:16:59.459Z	2024-05-11T23:12:05.510Z	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	0d90cc33-ff13-420c-bfa3-2e155200aa07	10	2024-05-11T20:16:31.190Z	2024-05-11T23:11:53.478Z	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	7b1d884c-19e6-49a0-badc-e98dbd02de07	10	2024-05-11T20:16:02.092Z	2024-05-11T23:11:30.597Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	3ee51ac3-056c-4e53-9062-93df16dac1b3	10	2024-05-09T16:15:13.257Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	6614f568-a5dc-4d13-90b8-8e5563088e9d	10	2024-05-13T17:39:01.518Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	4c4b59cc-d639-4952-87e3-107c61c2a673	10	2024-05-13T17:39:13.776Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	8ffbd7b9-7097-44b3-9a88-5dad7e78f3bc	10	2024-05-13T17:39:17.804Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	46862e71-22b7-4023-ba93-2936050c6f9f	100	2024-05-13T17:43:01.197Z	\N	\N
b81b4e5c-798f-413d-a7cd-7ce1cfd397ee	2c0eabfd-5c22-4174-b93d-b814a7706b9e	100	2024-05-13T17:43:20.188Z	\N	\N
d5d9c052-3847-4ff4-bf83-f4feda281831	e4378f90-b675-45a1-8cad-d142a3e272cc	10	2024-05-13T17:46:27.086Z	\N	\N
d5d9c052-3847-4ff4-bf83-f4feda281831	139d16e8-b314-499a-925a-f725cef15e5b	10	2024-05-13T17:48:12.141Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	3b212543-48ca-43a5-9f42-20b506425a83	10	2024-05-13T18:07:47.378Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	e4e767ff-be22-4c15-99a3-fac2b97683df	10	2024-05-13T18:08:24.993Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	94701e72-8ebc-43e7-885a-9e2a810ad1e7	0	2024-05-11T20:22:35.248Z	2024-05-13T18:15:55.783Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	c905ca5a-0564-4d2a-b9b9-585cbce1cc62	10	2024-05-11T20:15:29.563Z	2024-05-13T18:16:08.256Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	0774d214-1b04-4d83-90bb-bf30662b9a5a	0	2024-05-11T20:20:10.946Z	2024-05-13T18:16:31.090Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	58f96d4b-1e5c-43a8-a202-8deb9d6ae422	100	2024-05-13T18:17:42.190Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	b2595c5c-ffe8-4396-a2c8-ea6e4d8d4e6a	10	2024-05-09T17:03:47.112Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	4c4b59cc-d639-4952-87e3-107c61c2a673	100	2024-05-13T18:18:28.303Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	fd54a76a-cdb9-4543-9df6-24baa384e38c	100	2024-05-13T18:18:56.121Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	180bed77-0c81-45d1-be29-b094c8263533	0	2024-05-13T18:08:52.232Z	2024-05-13T18:54:17.018Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	8812cea7-01bc-4c7f-892d-cd0071589195	0	2024-05-13T18:08:48.474Z	2024-05-13T18:54:20.441Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	6a220720-6fa3-42cc-8101-621da51b521f	0	2024-05-12T22:17:37.709Z	2024-05-14T10:36:56.925Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	a4dc501b-20a2-43c2-921a-392314316473	0	2024-05-12T22:17:29.404Z	2024-05-14T10:38:19.016Z	\N
792ef61b-0f2d-4b0f-9f10-41bbe3327bdf	84cad0e5-c559-471b-8fc3-de467afc4685	0	2024-05-11T20:31:50.552Z	2024-05-14T17:27:14.903Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	cd9c4c7a-b1d1-4b85-9a90-a1968b1dc420	100	2024-05-10T18:35:37.687Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	6aa9af23-caa5-40d6-b91d-ef297e5ec4f4	10	2024-05-11T20:24:24.274Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	377fdec9-9b17-4086-8986-3e04508c4917	10	2024-05-11T20:22:36.937Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	eb705387-0d48-4762-be63-4c281a8b1d8e	10	2024-05-11T20:22:51.758Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	cf61184d-0ffb-4443-9a63-231432a3bed1	10	2024-05-11T20:23:05.902Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	4fcbd1d7-d0dc-46a1-96a9-88199dc075f1	100	2024-05-11T20:23:09.126Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	2df34cb2-b419-4cd9-bac0-fee998327fd6	10	2024-05-11T20:23:11.115Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	10	2024-05-11T20:23:23.849Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	8c4ed7fa-8b92-492e-bf05-94d2fd4f5016	10	2024-05-11T20:23:28.738Z	2024-05-11T20:23:31.281Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	0c91997a-e357-4fad-a220-7ed67d9d4100	100	2024-05-11T20:23:36.152Z	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	d001c64f-33b0-4d50-a8c1-1b62084c6e00	10	2024-05-11T20:23:36.863Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	f013501e-e9ea-478f-af0d-648f96244b14	100	2024-05-11T20:29:06.668Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	52bd1913-9ae1-413d-8258-205049df62e6	100	2024-05-11T20:29:13.242Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	112f1380-ebef-4697-87e8-7cb8a1e05cf7	100	2024-05-11T20:29:34.618Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	7982a520-ecc8-4cf9-a8be-2bd40550bd31	10	2024-05-11T20:31:05.257Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	10	2024-05-11T20:31:55.502Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	2df34cb2-b419-4cd9-bac0-fee998327fd6	10	2024-05-11T20:32:05.430Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	10	2024-05-11T20:32:32.901Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	2ac83258-0e18-4373-9edc-d78286bc955c	10	2024-05-11T20:36:21.024Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	b813d3b5-bf55-443b-b1a4-be3d426af4e9	0	2024-05-12T22:27:10.948Z	2024-05-13T14:45:42.978Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	bc43d2f6-7c4f-4d38-8269-b66b085fcb8a	10	2024-05-12T22:28:04.919Z	2024-05-13T14:59:54.085Z	\N
c5272267-663c-482f-9007-1c1688b017c2	21d0b947-aabf-445d-8622-464875e4b937	100	2024-05-13T17:43:43.134Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	21da2418-e978-41cb-90a8-d7e677b4d577	100	2024-05-13T17:44:11.319Z	\N	\N
d5d9c052-3847-4ff4-bf83-f4feda281831	03429f9e-7621-4749-8981-1d56d13c8ec5	10	2024-05-13T17:46:42.498Z	\N	\N
d5d9c052-3847-4ff4-bf83-f4feda281831	e6a02eb8-8a23-4646-b0fd-fbf064cc1cf0	10	2024-05-13T17:47:16.156Z	\N	\N
40306998-932b-4cb9-b593-1dfa7794b88c	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-13T17:47:10.549Z	2024-05-13T17:50:05.274Z	\N
40306998-932b-4cb9-b593-1dfa7794b88c	cf61184d-0ffb-4443-9a63-231432a3bed1	0	2024-05-13T17:47:17.716Z	2024-05-13T17:50:10.370Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-13T17:55:00.752Z	2024-05-13T17:55:08.453Z	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	c8ce7a65-be98-4e38-beaa-b9907dc003e9	100	2024-05-11T20:33:00.818Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	fd79a476-6a50-4389-a496-ca34724ff38e	10	2024-05-10T19:11:24.916Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	f1570b6d-f756-493e-a151-115f51f1e747	100	2024-05-11T20:33:19.314Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	c957dded-1e08-4e25-a2f8-80d111aef57b	100	2024-05-11T20:33:25.783Z	\N	\N
4503dfb5-e361-444e-92c2-f8b4409e3ca2	27c3707c-4a0b-4b43-8f8c-1b4bba103aa9	0	2024-05-13T18:00:25.875Z	2024-05-13T18:10:47.213Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	c6995a7c-5298-490e-af14-8feaaedc3e7b	0	2024-05-12T22:19:12.589Z	2024-05-14T10:27:23.497Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	ca78881a-d77f-4292-87eb-24fafb1706e7	0	2024-05-12T22:18:49.571Z	2024-05-14T10:34:23.637Z	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	1b45a959-c141-4d5b-a112-49cc10985fa1	100	2024-05-11T20:34:36.670Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	8e596eea-5ab7-480b-a22f-2af852198a92	10	2024-05-11T20:35:34.086Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	ea2c6721-693d-496e-8442-a2381d48430b	10	2024-05-11T20:35:51.799Z	\N	\N
792ef61b-0f2d-4b0f-9f10-41bbe3327bdf	13a4afa8-2b27-43c2-8ac1-0a2b29ce7832	0	2024-05-11T20:31:15.697Z	2024-05-14T18:21:22.431Z	\N
8476856d-1438-442e-8344-3f31db1d4e1b	6ee709d9-f990-41e3-9f92-a75f8d5e4855	10	2024-05-10T13:37:34.937Z	2024-05-11T23:15:33.833Z	\N
1ed38a8a-2217-4b3f-b838-f63b8af2e2fc	7ce8ca85-b7a2-47d3-a070-37bfba009ac0	10	2024-05-09T16:40:27.220Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	c905ca5a-0564-4d2a-b9b9-585cbce1cc62	10	2024-05-10T18:50:16.418Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	f3c395aa-63af-4264-99e0-2bd29760c62e	10	2024-05-10T18:50:24.608Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-10T18:50:58.526Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	0bac5a5c-e260-41eb-806e-46397862d868	10	2024-05-10T18:51:34.850Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	24a56430-28ea-465e-8287-af19639b18ce	10	2024-05-10T18:52:00.764Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	172c7042-1a1a-4ed0-9cd7-9f818efde80a	10	2024-05-10T18:53:43.019Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	2b72c607-f5b6-4907-88e9-1a2d50045b18	10	2024-05-10T18:53:59.551Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	30afd32d-4464-488e-a212-e4b9ad9ea5bc	10	2024-05-10T18:54:56.277Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	172c7042-1a1a-4ed0-9cd7-9f818efde80a	100	2024-05-13T18:54:30.763Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	367ed746-6c87-41d9-a29e-bf3540360ccf	10	2024-05-12T22:26:38.137Z	2024-05-13T14:45:19.137Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	f33825fd-e6b0-47bb-80c0-80aef8a42e19	0	2024-05-13T18:08:06.138Z	2024-05-13T18:08:31.005Z	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	be7369e0-e867-4443-948e-49b2a2b075b4	10	2024-05-11T20:36:26.252Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	4bccd468-7b89-49f0-93d5-c761ff91c6fb	0	2024-05-13T18:10:07.275Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	03c98160-18b1-46fa-8477-d85d784987b4	10	2024-05-11T20:42:06.725Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	5880fcb0-dd0e-4681-b97d-a1f501152fc6	10	2024-05-11T20:42:16.248Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	5e4b4b53-a13b-483c-a783-5576e0225d82	10	2024-05-11T20:42:25.137Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	feabdbad-dc62-4ffc-8683-3f5853fbaea9	100	2024-05-13T18:17:21.139Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	c7493f68-4e46-453d-9bf0-36fff3189bf7	10	2024-05-11T20:42:34.307Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	01794c4c-0038-4330-a478-0d10c85fb2d0	100	2024-05-13T18:18:09.643Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	38939273-b35e-49bf-b84f-0a04f747d44e	0	2024-05-12T20:37:06.177Z	2024-05-13T18:19:42.342Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	1d3bbf0a-b9d6-4766-884c-5dbcf5f941e2	100	2024-05-13T18:21:45.514Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	b15fee1e-5c89-4b46-a5b2-fb1991f57c13	100	2024-05-13T18:23:15.083Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	6c8684ed-85ad-49c0-a76e-cb34e7538f4d	100	2024-05-13T18:26:50.950Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	1d3bbf0a-b9d6-4766-884c-5dbcf5f941e2	100	2024-05-13T18:27:01.793Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	46862e71-22b7-4023-ba93-2936050c6f9f	100	2024-05-13T18:27:26.446Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	4c4b59cc-d639-4952-87e3-107c61c2a673	100	2024-05-13T18:27:40.467Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	6d503bcc-8fd1-4547-bd52-08f521913a16	10	2024-05-13T18:30:16.403Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	0d0b7439-82c1-4030-8d40-3dd94753eb40	10	2024-05-13T18:30:20.416Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	b910c015-09ec-4052-968e-a29db81d5912	100	2024-05-13T18:40:45.921Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	229f0eb8-0663-4ab0-b471-5028f1bf1e72	10	2024-05-13T18:41:12.149Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	3f4a6357-7a1b-4c64-a48b-7c6136e3f472	10	2024-05-13T18:48:16.332Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	35da1e4a-c8d2-4d9f-bd0b-ceec81216994	10	2024-05-13T18:50:55.249Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	66616847-1e8e-4ea3-bb70-a02aa8b7a33c	10	2024-05-13T18:51:37.308Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	01d3d6df-cd76-4f62-9c39-ddd968a9a634	10	2024-05-13T18:52:12.166Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	945b1d7a-17ac-4646-92ef-018669cee133	10	2024-05-13T18:32:56.153Z	2024-05-13T18:52:22.426Z	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-13T18:31:06.434Z	2024-05-13T18:52:44.155Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	37b6d4e1-224f-4fa5-a39a-efc511bab38a	0	2024-05-13T18:51:34.171Z	2024-05-13T18:52:47.593Z	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	b8598db7-a21f-4bba-8ed4-d0317b0a5df8	0	2024-05-13T18:52:47.943Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	1f136e6b-3881-4341-b169-5a4ec852c888	0	2024-05-13T18:31:19.845Z	2024-05-13T18:52:50.557Z	\N
37c914da-7334-46ea-9c73-1f7513500268	15121282-bdc8-4096-845b-974401b2e6aa	10	2024-05-13T18:52:52.450Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	f33825fd-e6b0-47bb-80c0-80aef8a42e19	0	2024-05-13T18:31:32.841Z	2024-05-13T18:52:53.957Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	d15cbac6-90ef-4c69-ac74-d4bab7389448	100	2024-05-13T18:55:05.530Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	5cac0471-262c-4408-8fd7-00e99f5a9869	10	2024-05-13T18:55:54.065Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	ce040718-1eeb-4246-bd4f-6231070f2d76	100	2024-05-13T18:56:16.931Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	0	2024-05-13T18:09:41.394Z	2024-05-14T12:28:43.405Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	7b1ffe8e-6cb1-46b9-b85c-dcb380da4aa4	10	2024-05-13T18:44:32.531Z	2024-05-14T13:27:52.285Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	625c609a-b15e-4ba2-b400-52c8cb885ff0	0	2024-05-13T18:50:40.675Z	2024-05-14T20:56:37.129Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	d1160a75-b9fe-4ef6-a10b-52a3e3cd0588	0	2024-05-13T18:51:01.829Z	2024-05-14T20:58:30.792Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	e85a86ec-1e72-4318-ab4b-3c4faadbec45	10	2024-05-13T18:19:54.271Z	\N	\N
1ed38a8a-2217-4b3f-b838-f63b8af2e2fc	2c98279b-bbd2-4645-96a3-51edb69cf509	10	2024-05-09T16:41:26.962Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	bd2a5ee3-0fc6-4777-b4d1-4bb38ebbd0d4	10	2024-05-13T18:20:20.715Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	3a9fc3a5-6dcb-423f-812e-3175b59ea51c	100	2024-05-13T18:21:00.079Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	32c65e0d-592c-4003-b071-bb11449e6de8	100	2024-05-13T18:21:42.520Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	c4e94a84-f6d2-48a3-a391-8c2491cc8b21	10	2024-05-13T18:26:17.631Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	af26cae5-8bae-420c-8052-782b9598fded	100	2024-05-09T16:53:22.505Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	538fec8f-971c-4307-aa82-074501c46e25	100	2024-05-13T18:28:22.458Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	46862e71-22b7-4023-ba93-2936050c6f9f	10	2024-05-13T18:31:53.033Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	c84192e1-0605-4b6f-8302-99aa29116f1f	10	2024-05-13T18:31:57.798Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	7ce8ca85-b7a2-47d3-a070-37bfba009ac0	10	2024-05-13T18:32:00.159Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	09fa01c2-c48c-4d7d-b910-adc3109dc041	10	2024-05-13T18:32:03.842Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	053d6422-e791-474c-9820-90252e04da58	10	2024-05-13T18:32:15.268Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	10	2024-05-13T18:32:23.795Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	f013501e-e9ea-478f-af0d-648f96244b14	10	2024-05-13T18:33:22.234Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-13T18:33:34.411Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	139d16e8-b314-499a-925a-f725cef15e5b	10	2024-05-13T18:33:47.362Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	4e619f2b-0e02-4842-8b1d-410ff44038cd	10	2024-05-13T18:33:59.160Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	112f1380-ebef-4697-87e8-7cb8a1e05cf7	10	2024-05-13T18:35:23.893Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	9ee6fd99-6604-438c-a3cc-15d2c7f997ed	10	2024-05-13T18:35:42.038Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	c1e4ef3f-0d86-418f-9d9f-05f028246bed	10	2024-05-13T18:36:20.732Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	8a6bee81-d3a5-4f61-abc0-a2f56977eb4d	100	2024-05-10T19:26:31.684Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	219e46d3-688f-4021-b7b4-3a1ab5722aa1	10	2024-05-13T18:36:43.955Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	46862e71-22b7-4023-ba93-2936050c6f9f	10	2024-05-13T18:36:56.562Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	242ff884-0ac2-47a1-850e-cf1829423692	10	2024-05-13T18:36:57.647Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	2cb3a6b6-9a04-40b4-a48c-20a2644fee72	10	2024-05-13T18:37:16.477Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	5a4901b0-14eb-4c88-92ff-bb82aff88094	10	2024-05-13T18:37:34.980Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	59ce1afa-2583-4810-b726-e8fa4c7e5464	10	2024-05-13T18:38:16.547Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	03c98160-18b1-46fa-8477-d85d784987b4	10	2024-05-13T18:39:33.394Z	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-11T20:37:09.085Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	e3f24520-666e-47d0-ad10-73a9110b3ad4	10	2024-05-13T18:41:50.218Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	55020e2d-1413-46ab-9b94-b31d48f87bd4	0	2024-05-10T19:33:35.427Z	2024-05-14T10:40:25.351Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	5a4901b0-14eb-4c88-92ff-bb82aff88094	0	2024-05-12T22:51:58.650Z	2024-05-14T18:39:15.690Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	38939273-b35e-49bf-b84f-0a04f747d44e	0	2024-05-12T22:55:08.193Z	2024-05-14T18:40:04.848Z	\N
9b4ff79d-87e5-4eff-99fb-e981f3bc3998	6aa9af23-caa5-40d6-b91d-ef297e5ec4f4	100	2024-05-12T22:45:12.926Z	\N	\N
9b4ff79d-87e5-4eff-99fb-e981f3bc3998	f75e7cd2-be77-4358-b281-90a943e1d983	100	2024-05-12T22:45:16.686Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	f8ba58b3-6549-49b7-b400-81ce225d365d	10	2024-05-11T20:40:26.937Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	1ddc00de-781a-49ed-bddd-bdc7b24d5231	10	2024-05-11T20:40:38.923Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	f94729df-e289-49d8-b55c-19ebdbfd783c	10	2024-05-11T20:42:51.860Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	167a03f7-d6bb-405e-8d75-87bf915543e8	10	2024-05-11T20:43:18.592Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	21da2418-e978-41cb-90a8-d7e677b4d577	10	2024-05-11T20:43:32.948Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	10	2024-05-11T20:43:40.273Z	\N	\N
4f9d5e9b-43eb-4ba7-919b-4be27e988a79	01794c4c-0038-4330-a478-0d10c85fb2d0	10	2024-05-11T20:39:33.807Z	2024-05-12T00:27:07.918Z	\N
4f9d5e9b-43eb-4ba7-919b-4be27e988a79	0b36b132-05b8-421d-b1b1-955c4b96f520	10	2024-05-11T20:38:22.199Z	2024-05-12T00:27:32.031Z	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	945b1d7a-17ac-4646-92ef-018669cee133	10	2024-05-12T22:33:59.275Z	\N	\N
a310934f-0b7c-44a2-9b2e-0b240eb6edee	c7493f68-4e46-453d-9bf0-36fff3189bf7	10	2024-05-12T22:36:07.884Z	\N	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	74a97d09-1b3c-4d33-9d1f-5272532daf53	10	2024-05-12T22:38:49.247Z	\N	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	d7e04a50-cb47-40c5-a5d0-6155b9704cde	10	2024-05-12T22:41:30.018Z	\N	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	feabdbad-dc62-4ffc-8683-3f5853fbaea9	10	2024-05-12T22:43:06.350Z	\N	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	3c7d2c99-9efc-40f2-a97d-9bab659b7fd8	10	2024-05-12T22:44:22.175Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	8f000e6a-c3cf-43ea-a947-f5df7150caa4	10	2024-05-12T22:54:53.655Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	024cd66e-f35f-405b-bd88-705d071be713	10	2024-05-12T22:55:41.572Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	121a7dac-5f7a-45cc-8c1f-1c86f8b8dcdd	10	2024-05-12T22:55:56.632Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	f78852fc-2874-4921-9dc4-7f9106c21233	10	2024-05-12T22:56:12.709Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	5aac6b69-af17-4c0e-b0d0-1621211bc14c	10	2024-05-12T22:57:05.950Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	7f0bba22-b51c-4d05-b9fe-d561872971a3	0	2024-05-11T20:39:16.774Z	2024-05-13T13:39:41.928Z	\N
7645eda9-f6d3-4640-afb4-31a712698a80	f8ba58b3-6549-49b7-b400-81ce225d365d	100	2024-05-13T18:20:17.831Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	340e35f2-a28c-4c48-a114-2e7339c7c735	100	2024-05-13T18:20:39.824Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	caa77bd6-4cf9-44a5-aa24-2e68c899081a	100	2024-05-13T18:20:49.222Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	24857c6e-7fe5-45e8-9cc5-c5858390c06d	100	2024-05-13T18:21:21.977Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	120fdccb-4ea6-4c03-a144-a80a55e9a070	100	2024-05-13T18:28:37.666Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	fa852d9b-c583-49ac-b5a7-95927e861285	10	2024-05-13T18:30:03.620Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	caa77bd6-4cf9-44a5-aa24-2e68c899081a	10	2024-05-13T18:30:32.113Z	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	21c26bde-bccb-45c2-b21f-41fb00a1fb2d	100	2024-05-09T17:20:40.552Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	f8c5ed02-4833-4676-9247-907d4ac9cafe	10	2024-05-13T18:30:41.108Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	01794c4c-0038-4330-a478-0d10c85fb2d0	10	2024-05-13T18:30:47.974Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	c4e94a84-f6d2-48a3-a391-8c2491cc8b21	10	2024-05-13T18:31:02.450Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	8cf0a287-9e40-4b91-a979-82533a8918c1	10	2024-05-13T18:31:18.887Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	ea2c6721-693d-496e-8442-a2381d48430b	10	2024-05-13T18:31:18.613Z	2024-05-13T18:31:26.742Z	\N
fd2d679b-4e9c-45e3-a8e2-4f4db15b7555	8dcf60fe-758b-4137-93b6-cac321724df2	10	2024-05-10T19:03:13.710Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	43a27a70-3ed5-4a3d-8428-623810c3f717	10	2024-05-10T19:06:43.534Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	6a220720-6fa3-42cc-8101-621da51b521f	10	2024-05-10T19:11:37.205Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	81c95bb4-5c9e-4d4a-b1cb-0dbcf89781a0	10	2024-05-13T18:31:34.900Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	cd9c4c7a-b1d1-4b85-9a90-a1968b1dc420	10	2024-05-10T19:17:52.926Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	70c5fbed-2863-4a0e-bdb0-f07a6f424802	100	2024-05-10T19:26:49.374Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	dfbf27f0-d560-4aea-aba6-532a6346b994	10	2024-05-13T18:31:46.378Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	a1f3cbac-ed68-4875-85a3-dae686767837	10	2024-05-13T18:31:49.449Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	edcb4032-d028-48ee-9811-b6004b277877	10	2024-05-13T18:33:56.147Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	10	2024-05-13T18:34:14.724Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	0eb81d00-fdee-4740-9070-bf23874d35a9	100	2024-05-10T19:41:26.287Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	bd2a5ee3-0fc6-4777-b4d1-4bb38ebbd0d4	100	2024-05-10T19:41:30.498Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	c957dded-1e08-4e25-a2f8-80d111aef57b	100	2024-05-10T19:41:39.190Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	c8ce7a65-be98-4e38-beaa-b9907dc003e9	100	2024-05-10T19:41:46.478Z	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	f267cbb5-a5e2-4bbb-9a84-60eddcdf922d	100	2024-05-13T18:35:10.597Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	32a2463b-506d-4ab4-8789-2ebecb70ce4e	10	2024-05-13T18:35:55.838Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	15121282-bdc8-4096-845b-974401b2e6aa	10	2024-05-13T18:36:28.170Z	\N	\N
c978c13d-2f77-48e6-bfb7-cbb560b89ae0	f94729df-e289-49d8-b55c-19ebdbfd783c	10	2024-05-11T20:45:47.022Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	4bf4cd5b-4156-409b-a3ce-8b3f96366f7c	10	2024-05-13T18:38:47.042Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	0	2024-05-13T18:31:43.896Z	2024-05-13T18:52:57.308Z	\N
fd2d679b-4e9c-45e3-a8e2-4f4db15b7555	0b0cc909-bb05-4234-a005-0a8bbde9ecd8	10	2024-05-10T19:03:37.879Z	2024-05-11T14:13:09.307Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	52634f35-73b2-4c60-99c9-1ec886f6e4b3	0	2024-05-11T00:55:19.518Z	2024-05-14T10:26:17.957Z	\N
c978c13d-2f77-48e6-bfb7-cbb560b89ae0	ace11dbc-d8fc-4d92-8692-72534bdee8be	10	2024-05-11T20:46:00.420Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	04a2d64b-69c0-4f6b-8975-4d41b4f43327	10	2024-05-11T20:39:37.399Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	e22bf0ca-5fef-46f2-bc54-a3b627d41080	10	2024-05-11T20:40:20.065Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	a1e9e0d1-cf48-4f52-8f41-cc24e44a9cce	10	2024-05-11T20:40:31.842Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	bc029ecf-f1db-4d05-b032-a87b79985300	10	2024-05-11T20:43:09.337Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-11T20:43:52.978Z	\N	\N
c978c13d-2f77-48e6-bfb7-cbb560b89ae0	4daad41e-b84e-4d36-876b-48a1f82a0c5b	100	2024-05-11T20:43:54.273Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	30afd32d-4464-488e-a212-e4b9ad9ea5bc	10	2024-05-11T20:44:31.530Z	\N	\N
c978c13d-2f77-48e6-bfb7-cbb560b89ae0	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-11T20:44:44.458Z	\N	\N
c978c13d-2f77-48e6-bfb7-cbb560b89ae0	7b1ffe8e-6cb1-46b9-b85c-dcb380da4aa4	10	2024-05-11T20:45:22.879Z	\N	\N
c978c13d-2f77-48e6-bfb7-cbb560b89ae0	bbca6f5f-96e5-4329-8a54-c0a618d5f99e	10	2024-05-11T20:46:04.657Z	\N	\N
a9800bb5-6b8b-48f7-9779-db304fa1b9b3	0676bbe1-5bb4-4bd1-94b6-7a5038ecd41e	10	2024-05-11T20:47:33.289Z	\N	\N
c978c13d-2f77-48e6-bfb7-cbb560b89ae0	30761767-ad87-46f1-8d11-68dffe654ee1	10	2024-05-11T20:47:51.059Z	\N	\N
a9800bb5-6b8b-48f7-9779-db304fa1b9b3	748f49f1-b979-4ecd-93af-5c62df9302ae	10	2024-05-11T20:47:53.029Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	3edbdcb6-ff0a-4de4-b5c9-24c30de29132	10	2024-05-10T19:11:31.082Z	2024-05-12T21:54:26.356Z	\N
50b470d7-3c67-4c20-b5cb-d3bc0f6c2e1a	6d503bcc-8fd1-4547-bd52-08f521913a16	10	2024-05-11T20:53:16.453Z	\N	\N
50b470d7-3c67-4c20-b5cb-d3bc0f6c2e1a	e0ce41a6-fe23-42eb-9ee5-d9c0e21e5833	10	2024-05-11T20:53:32.101Z	\N	\N
4f9d5e9b-43eb-4ba7-919b-4be27e988a79	bcd499a9-ddd9-479e-a057-c9f058178eaf	10	2024-05-11T20:37:44.283Z	2024-05-12T00:27:24.406Z	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	924ef7e4-1f7d-45ef-94a7-bd53435bf207	10	2024-05-12T22:40:22.618Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	d5bee376-7afa-40f0-8b05-77f984e6c12a	10	2024-05-13T18:40:17.403Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	b4560b93-cb36-4deb-a37b-e8207fedf8dd	10	2024-05-13T18:40:38.482Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	3810ff6f-2c32-4a64-a1c6-37be86fdaec6	10	2024-05-13T18:40:54.447Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	ec86de23-73b3-45f1-a5c7-a2715dc64796	100	2024-05-10T19:26:54.240Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	c8644a2b-90a2-4f10-8008-26c9ae5ff5b0	10	2024-05-13T18:41:36.102Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	b35ee0d2-6f36-4238-b786-77e38da86fa2	10	2024-05-13T19:07:32.366Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	6614f568-a5dc-4d13-90b8-8e5563088e9d	0	2024-05-13T18:41:25.919Z	2024-05-13T18:42:26.994Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	61987ae1-ed89-4be5-8918-0beb83e5d46b	100	2024-05-13T18:42:27.499Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	dfbf27f0-d560-4aea-aba6-532a6346b994	10	2024-05-11T20:44:07.905Z	\N	\N
c978c13d-2f77-48e6-bfb7-cbb560b89ae0	924e9906-692e-460a-bfe4-de2a6c33a5f1	10	2024-05-11T20:44:29.085Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	15129370-e9f5-4797-87cf-225625bc7642	10	2024-05-11T20:44:39.791Z	\N	\N
a9800bb5-6b8b-48f7-9779-db304fa1b9b3	81476608-e806-4a25-ad0f-c976bb29dd31	10	2024-05-11T20:47:09.628Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	7baf0c84-7658-4f5d-829a-36f6194c154f	100	2024-05-13T18:42:28.697Z	\N	\N
c978c13d-2f77-48e6-bfb7-cbb560b89ae0	49269442-ab56-4023-be4f-9201c8ade196	10	2024-05-11T20:48:01.425Z	\N	\N
a9800bb5-6b8b-48f7-9779-db304fa1b9b3	8f000e6a-c3cf-43ea-a947-f5df7150caa4	10	2024-05-11T20:48:02.929Z	\N	\N
a9800bb5-6b8b-48f7-9779-db304fa1b9b3	dbcb6fc3-02b4-4e31-8924-ed56f0e6ecc1	10	2024-05-11T20:48:14.172Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	81b2e05e-41cf-4bb0-96c2-a622640e6f85	10	2024-05-13T18:42:47.732Z	\N	\N
50b470d7-3c67-4c20-b5cb-d3bc0f6c2e1a	55020e2d-1413-46ab-9b94-b31d48f87bd4	10	2024-05-11T20:51:41.870Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	4124cef6-ffc1-40b7-8cb0-8b4a89dab6f2	10	2024-05-13T18:48:59.825Z	\N	\N
50b470d7-3c67-4c20-b5cb-d3bc0f6c2e1a	d3b07a6a-3b36-4bf3-a4dd-2bfeaace33bc	10	2024-05-11T20:52:07.582Z	\N	\N
50b470d7-3c67-4c20-b5cb-d3bc0f6c2e1a	460c72c0-b362-4fe8-a7e8-06aabe57cccd	10	2024-05-11T20:52:16.492Z	\N	\N
50b470d7-3c67-4c20-b5cb-d3bc0f6c2e1a	fa852d9b-c583-49ac-b5a7-95927e861285	10	2024-05-11T20:53:05.467Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	2c0eabfd-5c22-4174-b93d-b814a7706b9e	10	2024-05-13T18:49:35.232Z	\N	\N
3110fe64-dcab-4654-8a3b-e9853e5c1a3d	0676bbe1-5bb4-4bd1-94b6-7a5038ecd41e	10	2024-05-11T20:56:22.127Z	\N	\N
3110fe64-dcab-4654-8a3b-e9853e5c1a3d	fedbbfb1-777d-4914-b6fd-184e9de0e7e5	10	2024-05-11T20:56:42.340Z	\N	\N
3110fe64-dcab-4654-8a3b-e9853e5c1a3d	f1570b6d-f756-493e-a151-115f51f1e747	10	2024-05-11T20:57:55.940Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	c4cb72e4-042f-457b-a18e-6233e2bb2b9f	10	2024-05-13T18:51:52.558Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	24e95cd1-71cf-406f-b256-80ce535f8e65	0	2024-05-13T18:51:57.889Z	2024-05-13T18:52:02.486Z	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	21c26bde-bccb-45c2-b21f-41fb00a1fb2d	10	2024-05-13T18:52:15.900Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	cee04875-1bf0-4e86-af49-409087ae3598	0	2024-05-13T18:52:08.591Z	2024-05-14T13:30:05.860Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	a25f338f-1fed-4412-844a-7e16962eb051	0	2024-05-13T18:51:39.598Z	2024-05-13T18:52:51.978Z	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	2cd15597-9745-43a5-bbe9-84f9c467b45d	10	2024-05-13T18:53:40.317Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	83c7d111-7d55-4bf4-b61d-8fa5fbcfb012	100	2024-05-13T18:54:46.461Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	b8598db7-a21f-4bba-8ed4-d0317b0a5df8	0	2024-05-13T18:54:31.273Z	2024-05-13T18:55:00.799Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	f1570b6d-f756-493e-a151-115f51f1e747	10	2024-05-13T18:56:03.809Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	23b10d12-8b2f-4104-a225-f42da80a2c80	10	2024-05-13T18:56:39.287Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	05ff837b-7e24-4a6e-9b40-0b3ac0bd0ee2	100	2024-05-13T18:57:11.427Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	171de76a-606f-4166-92f7-dee09be2774b	100	2024-05-13T18:57:50.629Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	100	2024-05-13T18:58:08.582Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	e162ec59-91e5-4621-8a2a-05848cd0f368	100	2024-05-13T18:58:13.073Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	191b3241-5fce-4d0a-ae67-7d42049c4a09	100	2024-05-13T19:00:13.999Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	23b10d12-8b2f-4104-a225-f42da80a2c80	1	2024-05-13T19:01:17.209Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	84f83b15-aa13-4b74-8c81-b769f429a6db	100	2024-05-13T19:09:46.811Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	8003eb41-3cc3-4c75-a408-db2001513071	100	2024-05-13T19:11:17.140Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	aa5e1169-a9dc-4b38-a824-9e204b7d88b2	10	2024-05-13T19:11:48.782Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	b813d3b5-bf55-443b-b1a4-be3d426af4e9	100	2024-05-13T19:11:49.734Z	\N	\N
94eb5d46-85cf-4915-a8f9-e10bf77e401d	7b1d884c-19e6-49a0-badc-e98dbd02de07	0	2024-05-13T19:11:25.026Z	2024-05-13T19:11:54.380Z	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	ef206d20-b798-4215-bebb-e53afd8f4a69	100	2024-05-13T19:11:59.833Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	dbdadb3d-4d78-4e29-967d-6fdef07844ec	10	2024-05-13T19:13:11.213Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	172c7042-1a1a-4ed0-9cd7-9f818efde80a	0	2024-05-13T18:39:57.755Z	2024-05-14T17:17:18.615Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	e162ec59-91e5-4621-8a2a-05848cd0f368	0	2024-05-12T22:51:32.942Z	2024-05-14T19:20:20.206Z	\N
a9800bb5-6b8b-48f7-9779-db304fa1b9b3	b9368d94-0425-4b23-ada4-66f8986f7368	0	2024-05-11T20:47:24.492Z	2024-05-14T19:35:24.937Z	\N
a9800bb5-6b8b-48f7-9779-db304fa1b9b3	ef206d20-b798-4215-bebb-e53afd8f4a69	0	2024-05-11T20:48:10.916Z	2024-05-14T19:37:04.545Z	\N
94eb5d46-85cf-4915-a8f9-e10bf77e401d	0676bbe1-5bb4-4bd1-94b6-7a5038ecd41e	0	2024-05-13T19:10:05.884Z	2024-05-14T20:06:26.582Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	f51bc934-80c1-4fb6-858f-38f701e88dd9	100	2024-05-09T17:39:25.538Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	d98b2225-e6b9-4ba5-9085-ccdcc1d56af9	0	2024-05-09T17:55:27.400Z	2024-05-13T15:18:42.890Z	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	6614f568-a5dc-4d13-90b8-8e5563088e9d	10	2024-05-13T18:43:31.396Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	d580d7f8-a8be-4212-9ed8-8e1d52f4c384	10	2024-05-13T18:44:02.555Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	fc763265-b328-4fa5-9975-307e97ec35ca	10	2024-05-09T17:48:11.059Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	eb3caab6-6357-4757-86b2-efaf8d691de7	10	2024-05-09T17:48:14.023Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	3631657e-b8d0-4ab2-9db4-f78cef3d6322	100	2024-05-13T18:44:21.736Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	02d596a5-c59c-48fc-833f-02a9e567a312	10	2024-05-13T18:44:36.919Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	cd143579-907b-42fd-80e6-929c7d6f8879	100	2024-05-13T18:44:44.377Z	2024-05-13T18:45:05.169Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	cc4fe301-5eaa-4792-bfd0-33ee4f4a64ad	10	2024-05-12T22:52:24.353Z	\N	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	ec1b2c02-6e31-4bc6-a345-ed73ee9adcd7	100	2024-05-13T18:49:44.994Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	2b72c607-f5b6-4907-88e9-1a2d50045b18	10	2024-05-13T18:50:22.502Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	24e95cd1-71cf-406f-b256-80ce535f8e65	10	2024-05-12T22:54:03.477Z	\N	\N
50b470d7-3c67-4c20-b5cb-d3bc0f6c2e1a	61c906b1-396f-4221-8637-7096bc08a004	10	2024-05-11T20:51:34.681Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	df6f02b6-0a8d-4313-a21b-bdc111db66a8	100	2024-05-12T22:54:07.358Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	a09441c5-46c4-426b-8da7-e356c731475b	10	2024-05-13T18:51:19.705Z	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	f1afbf07-cd33-409c-b735-aac7f0b36fbc	0	2024-05-13T18:44:23.718Z	2024-05-14T17:18:11.357Z	\N
50b470d7-3c67-4c20-b5cb-d3bc0f6c2e1a	92542ce7-d1b9-4da5-9c93-38698fd0f042	10	2024-05-11T20:52:43.903Z	\N	\N
50b470d7-3c67-4c20-b5cb-d3bc0f6c2e1a	ef206d20-b798-4215-bebb-e53afd8f4a69	1	2024-05-11T20:54:20.548Z	\N	\N
3110fe64-dcab-4654-8a3b-e9853e5c1a3d	377fdec9-9b17-4086-8986-3e04508c4917	10	2024-05-11T20:55:48.087Z	\N	\N
3110fe64-dcab-4654-8a3b-e9853e5c1a3d	e48d36c1-f6b4-47f4-9123-17681ed99941	10	2024-05-11T20:56:08.678Z	\N	\N
3110fe64-dcab-4654-8a3b-e9853e5c1a3d	50272a9e-53dc-4e57-a56b-57f226b22933	10	2024-05-11T20:56:51.676Z	\N	\N
3110fe64-dcab-4654-8a3b-e9853e5c1a3d	6a220720-6fa3-42cc-8101-621da51b521f	10	2024-05-11T20:57:31.071Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	7d8f08bd-0994-433f-890d-29690027bf6a	0	2024-05-12T22:57:30.844Z	2024-05-14T18:54:18.140Z	\N
3110fe64-dcab-4654-8a3b-e9853e5c1a3d	45d237c3-1423-40ba-ae56-665d7fb95f6c	10	2024-05-11T20:57:39.851Z	\N	\N
3110fe64-dcab-4654-8a3b-e9853e5c1a3d	b813d3b5-bf55-443b-b1a4-be3d426af4e9	10	2024-05-11T20:57:50.383Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	c096c90d-0710-4804-801c-e5a2b8d14e6f	100	2024-05-12T22:53:05.932Z	2024-05-14T19:00:14.742Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	11c6d26d-d148-49c7-bcfd-cf2ce6be4022	10	2024-05-12T22:54:20.895Z	2024-05-14T19:10:40.940Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	26b02d43-3025-4538-8484-afb26c44a010	10	2024-05-12T22:54:28.155Z	2024-05-14T19:10:51.832Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	46862e71-22b7-4023-ba93-2936050c6f9f	0	2024-05-13T18:44:51.002Z	2024-05-14T20:55:35.701Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	0fc4d439-3e5d-460d-aefb-c54583690db3	10	2024-05-10T14:56:00.781Z	2024-05-12T14:17:50.080Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	9af075ac-8d39-4843-8907-02ccb6b5910b	10	2024-05-12T22:58:34.945Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	1d5eae87-630d-4d94-9f48-ec4032c000de	0	2024-05-13T18:51:30.298Z	2024-05-14T20:58:18.272Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	b9368d94-0425-4b23-ada4-66f8986f7368	0	2024-05-09T17:38:09.228Z	2024-05-14T22:00:35.987Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	65437ee2-7b21-4796-a360-9ad17c50aef5	100	2024-05-09T17:38:57.437Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	eb01d39b-e347-4a3f-a0ea-f59f916a2236	100	2024-05-09T17:39:15.221Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	de046a3e-c365-4393-b53e-3789a6711797	10	2024-05-13T19:02:49.137Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	a25f338f-1fed-4412-844a-7e16962eb051	10	2024-05-13T19:08:08.359Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	10	2024-05-09T17:45:48.227Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-09T17:46:34.143Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	8b670613-fb90-465c-b3e3-b48f4cc27c70	10	2024-05-09T17:47:30.394Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	19237243-240d-4b13-b4b5-1cc2ae01571d	100	2024-05-13T19:10:22.134Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	6d965a4b-3b38-4418-a95e-b0aec0e0eb7a	100	2024-05-13T19:10:35.833Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	5c1839cf-e5e9-4963-9018-c4d6f9ac5aeb	100	2024-05-13T19:10:46.053Z	\N	\N
50b470d7-3c67-4c20-b5cb-d3bc0f6c2e1a	7b1d884c-19e6-49a0-badc-e98dbd02de07	10	2024-05-11T20:53:52.251Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	172c7042-1a1a-4ed0-9cd7-9f818efde80a	100	2024-05-13T19:11:00.415Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	faa1f789-94e9-4d9a-89cc-fcf29e20a51d	10	2024-05-13T19:14:59.560Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	c1e974f6-1fe3-4aed-938d-4f45117fef5e	0	2024-05-13T19:15:52.378Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	486c8aae-eb62-4148-990d-61f4e88abdb5	10	2024-05-13T19:16:30.286Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	01d3d6df-cd76-4f62-9c39-ddd968a9a634	100	2024-05-10T19:46:32.462Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	100	2024-05-10T19:46:45.591Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	84f83b15-aa13-4b74-8c81-b769f429a6db	100	2024-05-10T19:46:59.949Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	b00827d0-bac9-4338-8afd-7fae5a79612f	100	2024-05-10T19:47:12.742Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	723e8686-19d8-4b51-a250-e05885d9e081	100	2024-05-13T19:16:35.393Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	b02cec28-dac2-42ec-a552-0558f598fa51	100	2024-05-10T19:51:28.069Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	ea4b0be9-5142-440e-9ae6-6c388321d3e9	10	2024-05-13T19:16:50.974Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	9e9c2ba5-8e1b-4575-a2b0-82e4534f2bad	10	2024-05-13T19:17:12.937Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	7c445fba-0410-4e80-83b6-abd88b245c15	100	2024-05-10T19:55:34.595Z	\N	\N
98afa669-bade-40c8-b052-980e5025f58e	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	10	2024-05-13T19:19:52.588Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-10T02:56:16.028Z	2024-05-11T13:39:59.893Z	\N
50b470d7-3c67-4c20-b5cb-d3bc0f6c2e1a	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	1	2024-05-11T20:54:13.826Z	\N	\N
98afa669-bade-40c8-b052-980e5025f58e	13a4afa8-2b27-43c2-8ac1-0a2b29ce7832	10	2024-05-13T19:22:23.859Z	\N	\N
19c7dc7c-74aa-4a9a-a4c7-2ad228e71cda	eadb6611-5c04-4050-9be4-fd2b4eacd182	10	2024-05-13T19:34:57.719Z	\N	\N
19c7dc7c-74aa-4a9a-a4c7-2ad228e71cda	50272a9e-53dc-4e57-a56b-57f226b22933	10	2024-05-13T19:36:33.617Z	\N	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	1f136e6b-3881-4341-b169-5a4ec852c888	0	2024-05-13T19:16:29.897Z	2024-05-13T21:30:20.398Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	f33825fd-e6b0-47bb-80c0-80aef8a42e19	0	2024-05-13T19:16:37.338Z	2024-05-13T21:30:27.437Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	0	2024-05-13T19:16:42.882Z	2024-05-13T21:30:33.276Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	0	2024-05-13T19:17:18.925Z	2024-05-13T21:30:57.330Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	52bd1913-9ae1-413d-8258-205049df62e6	0	2024-05-13T19:17:39.606Z	2024-05-13T21:31:15.939Z	\N
94eb5d46-85cf-4915-a8f9-e10bf77e401d	e3f24520-666e-47d0-ad10-73a9110b3ad4	0	2024-05-13T19:10:41.305Z	2024-05-14T13:38:24.501Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	01d3d6df-cd76-4f62-9c39-ddd968a9a634	10	2024-05-10T19:42:56.341Z	2024-05-12T21:06:07.848Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	063d43f1-9f08-4943-8f82-b51aa4e49924	0	2024-05-13T19:17:52.577Z	2024-05-13T21:31:23.446Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	4a394115-77b5-48e6-bafb-b1f5bc0c8eaf	0	2024-05-13T19:21:24.380Z	2024-05-13T21:32:52.697Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	03c98160-18b1-46fa-8477-d85d784987b4	0	2024-05-13T19:22:12.719Z	2024-05-13T21:33:18.395Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	ed48b4d0-0869-43b7-b973-9afa2916b53f	10	2024-05-12T23:20:53.311Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	f20e10e5-5a6e-4fb2-9ef3-23e691b8d2db	10	2024-05-12T23:26:17.864Z	\N	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	daeef31b-be12-4950-9d5d-039103a3e257	0	2024-05-13T19:22:47.959Z	2024-05-13T21:33:39.258Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	3a7b0aad-01bf-4f9d-b420-78b0f1e625a5	0	2024-05-13T19:29:00.510Z	2024-05-13T21:34:17.443Z	\N
627d9b43-a569-409f-be85-a5a0d606992e	799e9f43-b5e8-4484-be33-09c442390253	1	2024-05-13T19:23:34.843Z	2024-05-14T01:22:21.909Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	edcb4032-d028-48ee-9811-b6004b277877	0	2024-05-11T20:54:41.641Z	2024-05-14T10:26:32.268Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	b00827d0-bac9-4338-8afd-7fae5a79612f	0	2024-05-13T19:42:55.777Z	2024-05-14T18:27:23.545Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	115de606-b9d6-475b-953b-d838d8783dd6	0	2024-05-12T22:57:19.269Z	2024-05-14T18:43:08.636Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	4124cef6-ffc1-40b7-8cb0-8b4a89dab6f2	0	2024-05-12T22:58:03.092Z	2024-05-14T18:46:21.332Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	1174922e-fe33-4f48-b3dc-12f61af89e90	0	2024-05-12T22:58:12.412Z	2024-05-14T18:55:15.907Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	1c5dde39-a7d9-4a17-82a4-6b4e43f25b6c	0	2024-05-12T22:57:48.347Z	2024-05-14T18:55:44.443Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	ea2c6721-693d-496e-8442-a2381d48430b	100	2024-05-12T22:58:22.748Z	2024-05-14T18:59:40.256Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	bc029ecf-f1db-4d05-b032-a87b79985300	0	2024-05-11T21:57:55.346Z	2024-05-13T15:01:35.285Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	3ee51ac3-056c-4e53-9062-93df16dac1b3	0	2024-05-11T21:58:40.095Z	2024-05-13T15:01:40.429Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	ec86de23-73b3-45f1-a5c7-a2715dc64796	0	2024-05-11T21:58:28.929Z	2024-05-13T15:01:52.495Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	689c1d43-a7ee-4b95-97df-1558fbfcb863	0	2024-05-11T21:36:01.068Z	2024-05-13T17:17:43.934Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	e22bf0ca-5fef-46f2-bc54-a3b627d41080	0	2024-05-11T21:34:37.364Z	2024-05-13T17:17:57.973Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	24857c6e-7fe5-45e8-9cc5-c5858390c06d	0	2024-05-11T21:37:18.129Z	2024-05-13T17:18:04.424Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	c8642f4a-7ee0-49a7-aec8-e18eab2e2c69	0	2024-05-11T21:35:03.677Z	2024-05-13T17:18:18.297Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	81476608-e806-4a25-ad0f-c976bb29dd31	0	2024-05-11T21:37:50.547Z	2024-05-13T17:18:41.227Z	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	1d02a2b6-3aed-4dd4-acd1-27acb87856f3	100	2024-05-13T19:10:08.144Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	d48b1e31-a22b-4924-8463-2e129441a0c6	10	2024-05-13T19:12:27.119Z	\N	\N
3110fe64-dcab-4654-8a3b-e9853e5c1a3d	1beeba95-3034-4e3b-b332-fde4a0b09258	10	2024-05-11T20:58:12.192Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	880f900c-2a75-4208-bf39-6b86914f61d6	10	2024-05-13T19:16:10.415Z	\N	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	6347a939-ad2c-458e-a097-17fdb7ef34b1	100	2024-05-13T19:16:49.426Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	2df34cb2-b419-4cd9-bac0-fee998327fd6	10	2024-05-11T20:58:24.115Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	ae3c2c9b-44da-4c00-9755-74880c3f9da1	10	2024-05-13T19:17:23.747Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	9b73fb30-c29c-4081-9dca-836c62ad99a6	10	2024-05-13T19:18:05.215Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	1976695e-a2d4-46c5-afa8-438094954f48	100	2024-05-10T19:46:20.110Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	21c26bde-bccb-45c2-b21f-41fb00a1fb2d	100	2024-05-13T19:19:43.719Z	\N	\N
3110fe64-dcab-4654-8a3b-e9853e5c1a3d	3453dec4-2fa0-4a3d-a053-0af80abdc82c	10	2024-05-11T20:58:27.050Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	5a4901b0-14eb-4c88-92ff-bb82aff88094	100	2024-05-10T19:48:32.543Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	53e92ec3-dfcb-4ac2-adf4-0fd1fa963756	10	2024-05-11T21:36:51.200Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	3bb8fb06-b376-4489-80fe-59826066e849	100	2024-05-13T19:29:48.716Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	ddd88a43-eb5a-416a-9ed1-2be44c5982a8	100	2024-05-11T21:04:32.211Z	2024-05-12T05:31:18.080Z	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	6b1d5955-578e-4b7c-a66a-118060c94901	10	2024-05-11T21:00:34.573Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	a9b67a55-6742-4c3f-98ad-af8a69c05686	0	2024-05-13T19:32:57.584Z	2024-05-13T19:33:04.959Z	\N
19c7dc7c-74aa-4a9a-a4c7-2ad228e71cda	4206e979-d31c-4306-b9cf-bac8abb1b7ba	10	2024-05-13T19:34:00.234Z	\N	\N
19c7dc7c-74aa-4a9a-a4c7-2ad228e71cda	90d80e5a-8239-4983-b8aa-fa5c5b4c2967	10	2024-05-13T19:34:46.309Z	\N	\N
19c7dc7c-74aa-4a9a-a4c7-2ad228e71cda	12c0a839-cec3-4991-827c-7448fbdf63e0	10	2024-05-13T19:35:08.285Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	873f0443-1ed1-4044-ae2e-da17f59ddfc0	100	2024-05-11T21:04:12.751Z	\N	\N
19c7dc7c-74aa-4a9a-a4c7-2ad228e71cda	aa2abcfe-f957-46e6-89b7-73810b3dfcf6	10	2024-05-13T19:36:06.441Z	\N	\N
19c7dc7c-74aa-4a9a-a4c7-2ad228e71cda	c84192e1-0605-4b6f-8302-99aa29116f1f	10	2024-05-13T19:36:47.974Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	4212a820-3ffe-45ce-975f-7bdf304bf9f0	1	2024-05-13T19:42:52.472Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	20521d7d-4f86-4840-8543-0d68e84f1d7f	10	2024-05-11T21:06:35.966Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	21d0b947-aabf-445d-8622-464875e4b937	10	2024-05-11T21:06:49.914Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	ad9a4dad-3dc5-46b3-b387-889fc5b0b186	10	2024-05-11T21:07:00.849Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	b00827d0-bac9-4338-8afd-7fae5a79612f	100	2024-05-11T21:07:28.493Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	4c170954-1c43-4928-9014-d3b057e4a5ca	100	2024-05-11T21:09:01.288Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	65bc4ea4-a0db-4ac4-b343-b9d587be224b	100	2024-05-11T21:09:05.965Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	8e5bab94-d594-46dd-a855-7675f5d8231f	1	2024-05-13T19:43:08.154Z	\N	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	5facb97a-2e27-4ddf-bbde-0aeed05bb262	0	2024-05-13T19:17:10.254Z	2024-05-13T21:30:49.551Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	dfcde5dc-2359-47d8-9652-ec4606472bbe	0	2024-05-13T19:20:43.573Z	2024-05-13T21:31:02.764Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	f013501e-e9ea-478f-af0d-648f96244b14	0	2024-05-13T19:17:26.878Z	2024-05-13T21:31:09.717Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	9e66cff1-37e1-4631-8251-c7b03b287ada	0	2024-05-13T19:20:59.890Z	2024-05-13T21:31:48.622Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	32a2463b-506d-4ab4-8789-2ebecb70ce4e	0	2024-05-13T19:20:35.694Z	2024-05-13T21:32:08.272Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	8812cea7-01bc-4c7f-892d-cd0071589195	0	2024-05-13T19:19:11.537Z	2024-05-13T21:32:34.314Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	8b2c49f5-c34f-4ac9-abb0-5810c10e3dcb	10	2024-05-11T21:34:14.316Z	\N	\N
670b8732-7e77-43ad-871b-a8aa9038b940	2d3cf6fc-8424-47d6-8908-903526827010	10	2024-05-11T21:36:50.195Z	\N	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	180bed77-0c81-45d1-be29-b094c8263533	0	2024-05-13T19:19:22.417Z	2024-05-13T21:32:43.481Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	61fd5d1d-656b-404d-8168-aea8a0c9ffd9	10	2024-05-11T21:53:05.336Z	\N	\N
9eaaf07a-ca5b-4633-8b5e-0954f79be0f2	7baf0c84-7658-4f5d-829a-36f6194c154f	0	2024-05-13T19:12:20.041Z	2024-05-14T19:01:11.605Z	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	2d3cf6fc-8424-47d6-8908-903526827010	100	2024-05-11T21:03:34.227Z	2024-05-12T05:32:29.478Z	\N
94eb5d46-85cf-4915-a8f9-e10bf77e401d	9c17284c-d379-4b76-9d87-5c573b5eec6c	0	2024-05-13T19:12:21.789Z	2024-05-14T20:06:36.021Z	\N
94eb5d46-85cf-4915-a8f9-e10bf77e401d	8b01dadc-9350-4968-a95d-cf7790c62021	0	2024-05-13T19:12:52.293Z	2024-05-14T20:06:44.826Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	5c11dcf2-bc1a-4529-bd10-66c0dd7772d8	0	2024-05-09T17:55:58.387Z	2024-05-13T14:46:04.147Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	0	2024-05-10T14:47:21.267Z	2024-05-13T15:32:48.203Z	\N
3110fe64-dcab-4654-8a3b-e9853e5c1a3d	85132717-39a0-41bb-8409-6ecf6ec77019	10	2024-05-11T20:58:19.603Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	ad5309be-19f5-4a4a-9aaa-b8e70e933078	10	2024-05-13T19:13:49.513Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	d5bee376-7afa-40f0-8b05-77f984e6c12a	100	2024-05-13T19:14:12.077Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	96845fed-3b96-4423-9378-6b3b3f1d4ce6	10	2024-05-13T19:14:14.661Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	87569fc9-dfaf-477d-b4c7-e34a80b7bfd4	100	2024-05-10T19:50:04.001Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	fe2a788c-2163-41bd-a0b0-a43855b5bd38	10	2024-05-13T19:14:32.932Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	edcb4032-d028-48ee-9811-b6004b277877	10	2024-05-10T20:13:00.225Z	\N	\N
9ee3b69e-4c7f-478c-8059-3916ec8a7c2a	61735e25-7502-4864-9a02-cbec10b78700	100	2024-05-10T20:17:27.973Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	6f880b12-b5b7-4317-80a6-65940c3b8304	100	2024-05-10T20:17:47.250Z	\N	\N
9ee3b69e-4c7f-478c-8059-3916ec8a7c2a	0fe9ff90-4190-4341-b775-986d9dd18bd5	10	2024-05-10T20:18:33.252Z	\N	\N
9ee3b69e-4c7f-478c-8059-3916ec8a7c2a	db326b44-ce02-443b-bbe1-deec70fa9a7b	10	2024-05-10T20:18:45.425Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	c0c07df3-6215-4b07-8240-f462315ec075	100	2024-05-13T19:15:30.483Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	721c2a8c-a8a8-4a05-8cbf-a641bae1616f	10	2024-05-13T19:18:37.407Z	\N	\N
19c7dc7c-74aa-4a9a-a4c7-2ad228e71cda	6374669b-f8a0-433b-a6af-349529a9e31a	10	2024-05-13T19:34:15.324Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	c4976a72-788e-4360-ad86-bb4939bebcc2	10	2024-05-13T19:18:55.195Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	2a8e82ce-897c-4ce2-a611-1c5cbbb562d5	0	2024-05-10T12:09:22.436Z	2024-05-13T19:21:22.076Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	b910c015-09ec-4052-968e-a29db81d5912	100	2024-05-13T19:21:47.846Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	e30c8efd-29f1-4414-9f5e-080b7e1f6fa3	10	2024-05-12T23:13:17.041Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	cc0b7c15-55bd-426c-9637-12db360bc034	100	2024-05-12T23:14:37.964Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	64398b22-667d-43c5-8b68-17010f9927eb	10	2024-05-12T23:14:58.205Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	c0c07df3-6215-4b07-8240-f462315ec075	10	2024-05-12T23:15:07.350Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	67063252-a1a8-4dc9-9b2e-61f3c58715c4	10	2024-05-12T23:15:37.703Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	8812cea7-01bc-4c7f-892d-cd0071589195	100	2024-05-12T23:15:55.106Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	ba8261f2-7bfc-4714-9697-fae8668698ca	10	2024-05-12T23:15:57.198Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	dbcb6fc3-02b4-4e31-8924-ed56f0e6ecc1	100	2024-05-12T23:16:14.455Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	f140de4d-306f-4925-9dc3-bdef9bfcbaae	10	2024-05-12T23:20:56.998Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	b2f1c6ff-93dc-4d8d-8365-36bcfc0eb1fd	10	2024-05-12T23:21:15.226Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	b8086ace-c3c7-4fa5-905f-ad1d4e64e990	10	2024-05-12T23:22:34.362Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	5d5ba6d2-2853-4b3c-aecb-5f86a8e75707	1	2024-05-12T23:22:51.454Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	d7e04a50-cb47-40c5-a5d0-6155b9704cde	10	2024-05-12T23:23:53.201Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	57e3cb62-1c89-4543-bb4f-5dcfcf8f4936	10	2024-05-12T23:25:24.269Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	0bd6022d-21b2-47d1-8a71-1f679b62541c	10	2024-05-12T23:26:41.165Z	\N	\N
98afa669-bade-40c8-b052-980e5025f58e	14ce7f98-2cb3-46ce-bc13-d0f420c5921c	10	2024-05-13T19:22:02.123Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	634649db-5f8b-47b8-a034-f3a78c53dbfe	100	2024-05-13T19:23:07.668Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	a9b67a55-6742-4c3f-98ad-af8a69c05686	100	2024-05-13T19:23:14.557Z	\N	\N
d5d9c052-3847-4ff4-bf83-f4feda281831	7d8f08bd-0994-433f-890d-29690027bf6a	0	2024-05-13T19:31:34.393Z	2024-05-13T19:31:42.450Z	\N
19c7dc7c-74aa-4a9a-a4c7-2ad228e71cda	e577da2f-4900-45db-8d72-9b45cd5cd8c1	10	2024-05-13T19:36:00.809Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	69559371-3258-40ed-a727-5f868b6477da	0	2024-05-13T19:46:11.390Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	81476608-e806-4a25-ad0f-c976bb29dd31	10	2024-05-13T19:52:50.408Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	b8598db7-a21f-4bba-8ed4-d0317b0a5df8	10	2024-05-13T19:53:31.314Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	dc359231-d372-495a-a9e0-2bbd47965809	1	2024-05-13T20:01:17.781Z	\N	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	7982a520-ecc8-4cf9-a8be-2bd40550bd31	0	2024-05-13T19:18:02.214Z	2024-05-13T21:31:31.736Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	01d3d6df-cd76-4f62-9c39-ddd968a9a634	0	2024-05-13T19:18:17.625Z	2024-05-13T21:31:39.796Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	0	2024-05-13T19:18:33.652Z	2024-05-13T21:32:00.594Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	c1e4ef3f-0d86-418f-9d9f-05f028246bed	0	2024-05-13T19:18:46.621Z	2024-05-13T21:32:18.405Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	6f6a3e0c-d8c8-468f-b8d2-13370a988b72	10	2024-05-12T23:27:33.887Z	2024-05-13T21:32:47.587Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	0bac5a5c-e260-41eb-806e-46397862d868	0	2024-05-13T19:28:01.755Z	2024-05-13T21:33:55.655Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	39854bdb-bb2e-4dc4-a08e-d1fc9c280ebb	0	2024-05-13T19:29:17.661Z	2024-05-13T21:34:52.347Z	\N
627d9b43-a569-409f-be85-a5a0d606992e	fb004352-1213-42f9-a764-1f7a0cb34dd0	1	2024-05-13T19:22:03.060Z	2024-05-14T01:23:10.638Z	\N
9ee3b69e-4c7f-478c-8059-3916ec8a7c2a	7f8e851f-d072-469a-bf7c-1d04b14b18b4	10	2024-05-10T20:17:37.860Z	2024-05-14T15:15:12.850Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	fd4d50d8-f345-4996-b245-13b827fc416a	10	2024-05-12T23:24:35.532Z	2024-05-14T02:17:19.295Z	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	950a9045-f3c3-42d7-bf59-d42c5ef42d29	0	2024-05-12T23:13:27.996Z	2024-05-14T20:23:55.543Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	b00827d0-bac9-4338-8afd-7fae5a79612f	0	2024-05-10T15:32:26.734Z	2024-05-13T15:38:56.845Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	0	2024-05-10T20:28:53.854Z	2024-05-13T16:22:10.693Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	bea72070-859a-4327-8bd8-dba0a8ada786	1	2024-05-13T19:43:33.402Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	c6995a7c-5298-490e-af14-8feaaedc3e7b	10	2024-05-13T19:44:05.106Z	\N	\N
35e9c5ed-6b46-4997-b06a-2337690fbd59	418b48c8-ab44-4999-8b06-8ab1415db000	100	2024-05-09T18:05:49.218Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	3ccc7bd1-183d-4f51-9044-a523376e1a58	0	2024-05-13T20:18:55.737Z	2024-05-14T18:15:34.209Z	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	6ebdfdfa-c7b7-42c3-972c-a15b921d4e66	10	2024-05-13T19:53:35.716Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	46862e71-22b7-4023-ba93-2936050c6f9f	10	2024-05-13T19:53:44.400Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-13T19:54:03.358Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	6f0169e7-5ca9-4bbc-83f8-78cea1443551	10	2024-05-11T20:59:56.928Z	2024-05-11T21:00:22.395Z	\N
9eaaf07a-ca5b-4633-8b5e-0954f79be0f2	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	100	2024-05-13T20:14:08.974Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	319870a5-c97e-48b4-b5b8-4d05fcc09fdc	100	2024-05-13T20:15:38.030Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	7baf0c84-7658-4f5d-829a-36f6194c154f	100	2024-05-13T20:16:29.526Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	73fbacb1-0736-49ec-8873-80ddd65608a2	10	2024-05-11T21:05:26.014Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	2ac83258-0e18-4373-9edc-d78286bc955c	10	2024-05-11T21:07:50.594Z	2024-05-12T18:35:19.498Z	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	48b8392c-9bcf-4b94-abff-33b565af4edd	100	2024-05-13T20:16:40.493Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	8812cea7-01bc-4c7f-892d-cd0071589195	100	2024-05-13T20:16:46.003Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	6f0169e7-5ca9-4bbc-83f8-78cea1443551	100	2024-05-10T19:53:22.892Z	\N	\N
9ee3b69e-4c7f-478c-8059-3916ec8a7c2a	7d0f8cf5-9f10-4822-bcde-6b94d1738065	10	2024-05-10T20:17:09.024Z	\N	\N
9ee3b69e-4c7f-478c-8059-3916ec8a7c2a	e1075af4-70c1-4124-b93b-20149f24e57b	10	2024-05-10T20:18:15.540Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	32c65e0d-592c-4003-b071-bb11449e6de8	10	2024-05-13T20:18:56.774Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	6f880b12-b5b7-4317-80a6-65940c3b8304	100	2024-05-13T20:19:05.128Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	120fdccb-4ea6-4c03-a144-a80a55e9a070	100	2024-05-13T20:19:06.355Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	b66abcc8-33e7-4476-b725-a34f7dc90585	0	2024-05-13T19:44:14.704Z	2024-05-13T22:42:12.719Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	0	2024-05-13T19:43:45.520Z	2024-05-13T22:42:34.601Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	0	2024-05-13T19:43:19.505Z	2024-05-13T22:42:48.573Z	\N
db3695c7-d50e-43e0-9047-550bb980532f	18b45eb3-755c-4d38-a974-2857f6b30638	100	2024-05-10T21:16:24.485Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	e332e031-a18e-4407-81e9-660530260e64	0	2024-05-13T19:44:42.721Z	2024-05-13T22:44:07.616Z	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	1cbeb09b-1870-4cbb-ac44-c3d850745958	10	2024-05-11T21:06:27.084Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	02db1cee-b5a4-45e9-ad0b-bb22cada46f8	0	2024-05-13T19:44:28.883Z	2024-05-14T18:26:08.573Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	27c3707c-4a0b-4b43-8f8c-1b4bba103aa9	100	2024-05-10T19:51:34.608Z	2024-05-12T21:09:02.244Z	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	2b87fe91-5cb1-44e6-adc6-706ed3537648	10	2024-05-12T23:16:50.039Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	3704be1c-459a-4c7d-a18c-34dfd3a1c6cd	100	2024-05-11T21:08:41.798Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	51ccecbb-1d21-447c-9d62-d5b3d2775905	100	2024-05-11T21:08:46.684Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	d382afa7-cef6-4e16-89aa-22a5e20562e6	10	2024-05-10T23:24:57.565Z	2024-05-12T15:15:06.540Z	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	78e9e9be-0d18-4553-9a6f-691462e8db06	10	2024-05-12T23:13:47.258Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	e15b969f-d5fe-48cf-80ea-443be9dc5785	10	2024-05-12T23:14:16.437Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	a1b158ff-170f-455e-93b1-adaaa18f104e	10	2024-05-12T23:16:35.087Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	180bed77-0c81-45d1-be29-b094c8263533	100	2024-05-12T23:16:35.541Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	3ac0d7d4-9de0-4869-a18f-00cd6d0eefe7	10	2024-05-12T23:17:31.774Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	f9be3465-b660-4e00-a5c7-0c876cb8f34c	10	2024-05-12T23:18:01.898Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	7c906f4f-f23c-4367-97d3-db1bb27fca73	10	2024-05-12T23:18:46.280Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	4ae6c9da-c2d7-4381-a309-a938b0258122	10	2024-05-12T23:20:31.377Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	1de20395-c5ed-4f98-9090-166ffe118c11	0	2024-05-10T21:32:10.011Z	2024-05-13T03:08:30.662Z	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	a9b67a55-6742-4c3f-98ad-af8a69c05686	10	2024-05-10T22:18:26.727Z	2024-05-13T12:38:05.279Z	\N
9ee3b69e-4c7f-478c-8059-3916ec8a7c2a	f74837d7-d4b4-4224-be14-a6d0df76ea8f	100	2024-05-10T20:16:15.893Z	\N	\N
9ee3b69e-4c7f-478c-8059-3916ec8a7c2a	b2f1c6ff-93dc-4d8d-8365-36bcfc0eb1fd	100	2024-05-10T20:16:35.521Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	4c170954-1c43-4928-9014-d3b057e4a5ca	0	2024-05-10T17:13:40.067Z	2024-05-13T15:34:12.679Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	4418e35c-a14f-4b98-8b45-b8a822bbe23b	1	2024-05-13T19:45:15.918Z	2024-05-13T19:45:48.981Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	6ebdfdfa-c7b7-42c3-972c-a15b921d4e66	0	2024-05-13T19:46:40.473Z	2024-05-13T19:46:46.283Z	\N
429fc597-b5ed-4224-8401-54668f171d19	074e66ce-a845-4244-886e-8db3f76f5742	100	2024-05-10T21:04:49.094Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	f69b28ac-667a-446d-adf5-72564c0d4dab	1	2024-05-13T19:46:58.423Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	52634f35-73b2-4c60-99c9-1ec886f6e4b3	10	2024-05-13T19:53:54.548Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	f013501e-e9ea-478f-af0d-648f96244b14	10	2024-05-13T19:54:09.631Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	bd2a5ee3-0fc6-4777-b4d1-4bb38ebbd0d4	1	2024-05-13T20:00:44.401Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	ce7b5319-085e-4ad3-85be-432762ef52c9	100	2024-05-13T20:15:11.073Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	01794c4c-0038-4330-a478-0d10c85fb2d0	0	2024-05-13T19:45:02.617Z	2024-05-13T22:43:02.258Z	\N
429fc597-b5ed-4224-8401-54668f171d19	dbcb6fc3-02b4-4e31-8924-ed56f0e6ecc1	0	2024-05-10T21:46:43.086Z	2024-05-13T22:56:04.473Z	\N
685d0226-062b-4b77-a2df-c7c05a637856	d382afa7-cef6-4e16-89aa-22a5e20562e6	100	2024-05-10T22:21:22.551Z	2024-05-14T03:49:54.468Z	\N
9ee3b69e-4c7f-478c-8059-3916ec8a7c2a	21d0b947-aabf-445d-8622-464875e4b937	0	2024-05-10T20:17:44.315Z	2024-05-14T15:15:22.045Z	\N
806120c1-8d63-4f67-9351-eb3253cad789	5e19dcf8-680f-4755-a69f-be4080c95e6f	10	2024-05-10T22:02:20.686Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	87569fc9-dfaf-477d-b4c7-e34a80b7bfd4	10	2024-05-10T22:03:26.713Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	abe67b83-3fdc-4e39-82ec-a15c49630b4d	10	2024-05-10T22:04:30.857Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	043739b5-1191-46b2-9ee0-4838838464cf	10	2024-05-10T22:06:49.355Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	580c2fac-3c42-48d2-b79b-2fbc7b6fc7b0	10	2024-05-10T22:15:20.051Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	53743f4f-eded-4145-b56e-224eab9471ec	10	2024-05-10T22:16:41.604Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	b5e87f98-0f0b-44b3-bf9c-81b84bab76d4	10	2024-05-10T22:17:41.671Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	a8ae4a1f-bc8d-4d48-a5ec-ebf618e93781	10	2024-05-10T22:18:36.060Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	bdf7609e-a731-4480-874a-7ed5a8de5627	10	2024-05-10T22:19:17.978Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	e162ec59-91e5-4621-8a2a-05848cd0f368	100	2024-05-10T22:21:33.872Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	1976695e-a2d4-46c5-afa8-438094954f48	10	2024-05-10T22:21:45.333Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-10T22:21:58.430Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	5facb97a-2e27-4ddf-bbde-0aeed05bb262	10	2024-05-10T22:22:28.126Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-10T22:22:41.970Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	af969f99-eb8a-48be-89a8-028dc76417ad	10	2024-05-10T22:22:43.173Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	ca0ef946-0de3-47a2-a0cb-df72de35aeec	10	2024-05-10T22:23:28.835Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	063d43f1-9f08-4943-8f82-b51aa4e49924	10	2024-05-10T22:23:40.553Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	84f83b15-aa13-4b74-8c81-b769f429a6db	10	2024-05-10T22:24:12.738Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	053d6422-e791-474c-9820-90252e04da58	1	2024-05-12T23:22:26.434Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	abf86d41-3ba4-4dde-b0ac-3468fe06ba87	10	2024-05-12T23:23:12.209Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	883fd833-4187-4b99-82a4-0afc665a899a	100	2024-05-12T23:28:26.137Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	01794c4c-0038-4330-a478-0d10c85fb2d0	0	2024-05-11T21:33:59.840Z	2024-05-13T17:18:11.930Z	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	cd9c4c7a-b1d1-4b85-9a90-a1968b1dc420	10	2024-05-13T20:15:53.941Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	46862e71-22b7-4023-ba93-2936050c6f9f	10	2024-05-13T20:16:00.776Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	242ff884-0ac2-47a1-850e-cf1829423692	10	2024-05-13T20:16:18.772Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	01794c4c-0038-4330-a478-0d10c85fb2d0	100	2024-05-13T20:16:54.002Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	4ae4acec-ee0d-40f3-931c-37759e97ecff	100	2024-05-13T20:17:08.514Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	69732c83-e2ee-481f-b4c5-e55932e8d51f	100	2024-05-13T20:17:25.618Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	81476608-e806-4a25-ad0f-c976bb29dd31	0	2024-05-11T21:44:10.390Z	2024-05-13T20:42:01.232Z	\N
1a897e88-5092-4071-a4ae-94b887867191	b813d3b5-bf55-443b-b1a4-be3d426af4e9	0	2024-05-11T22:10:42.276Z	2024-05-14T13:02:50.486Z	\N
1a897e88-5092-4071-a4ae-94b887867191	552e881e-ed4a-414b-914e-36a0dd85d0a4	0	2024-05-11T22:07:34.433Z	2024-05-14T13:10:07.682Z	\N
1a897e88-5092-4071-a4ae-94b887867191	e22bf0ca-5fef-46f2-bc54-a3b627d41080	0	2024-05-11T22:08:05.742Z	2024-05-14T13:10:18.190Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	de84c8b2-5ac1-468e-821e-983d7529228b	10	2024-05-12T23:59:13.415Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	1c5dde39-a7d9-4a17-82a4-6b4e43f25b6c	0	2024-05-11T22:07:19.361Z	2024-05-14T13:11:09.421Z	\N
1a897e88-5092-4071-a4ae-94b887867191	1ddc00de-781a-49ed-bddd-bdc7b24d5231	0	2024-05-11T22:07:43.138Z	2024-05-14T13:11:20.936Z	\N
1a897e88-5092-4071-a4ae-94b887867191	15e4dafd-4196-4bb8-aedb-7c391f9514df	0	2024-05-11T22:09:09.268Z	2024-05-14T13:14:58.447Z	\N
1a897e88-5092-4071-a4ae-94b887867191	cf61184d-0ffb-4443-9a63-231432a3bed1	0	2024-05-11T22:10:51.240Z	2024-05-14T13:15:25.234Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	9f8f90ad-55b1-4549-b4b8-2755c3eb1b10	10	2024-05-11T21:33:13.573Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	bea72070-859a-4327-8bd8-dba0a8ada786	10	2024-05-11T21:33:43.600Z	\N	\N
670b8732-7e77-43ad-871b-a8aa9038b940	6ee709d9-f990-41e3-9f92-a75f8d5e4855	10	2024-05-11T21:37:00.842Z	\N	\N
670b8732-7e77-43ad-871b-a8aa9038b940	3edb0a60-0bbf-4332-9fd1-8de317091fca	10	2024-05-11T21:37:06.855Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	2d3cf6fc-8424-47d6-8908-903526827010	10	2024-05-11T21:38:42.968Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	65d76d06-ff09-40b5-8df8-ead5c4cabe2e	10	2024-05-11T21:44:34.550Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	acc5c092-aef5-4a76-981d-80a2c847086b	10	2024-05-11T21:46:22.078Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	8ea367f1-09ca-4195-92e6-94f3bb00f618	10	2024-05-11T21:47:39.297Z	\N	\N
05a4563e-f7cd-4257-ab9c-7171acaaefc4	6e71e6ec-9335-4db3-a0bd-4cfc3bed41f9	10	2024-05-11T21:37:32.179Z	2024-05-11T21:54:21.921Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	10	2024-05-11T21:54:47.029Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	cab34f52-bc3e-46d8-96f0-f5b20c7ca485	10	2024-05-11T21:55:00.552Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	aa2abcfe-f957-46e6-89b7-73810b3dfcf6	10	2024-05-11T21:56:05.469Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	caa77bd6-4cf9-44a5-aa24-2e68c899081a	10	2024-05-11T22:03:44.257Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	01794c4c-0038-4330-a478-0d10c85fb2d0	10	2024-05-11T22:04:08.710Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	6c8684ed-85ad-49c0-a76e-cb34e7538f4d	10	2024-05-11T22:04:26.417Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	0bd6022d-21b2-47d1-8a71-1f679b62541c	10	2024-05-11T22:05:06.454Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	4c4b59cc-d639-4952-87e3-107c61c2a673	10	2024-05-11T22:05:36.454Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	2c98279b-bbd2-4645-96a3-51edb69cf509	10	2024-05-11T22:06:00.217Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	5a68adc5-f0cc-44f6-99e4-12cd88662d08	10	2024-05-11T22:07:43.090Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	c1ab18aa-8133-465e-b850-354e70b8b9a5	10	2024-05-12T23:53:08.308Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	251dcbe0-fcd2-47d9-9527-3de6aaf26281	10	2024-05-12T23:57:32.324Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	9717b995-f922-4e7e-970b-c0275d597c01	10	2024-05-13T00:04:06.714Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	8a6bee81-d3a5-4f61-abc0-a2f56977eb4d	0	2024-05-09T19:07:10.747Z	2024-05-13T15:00:45.692Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	167a03f7-d6bb-405e-8d75-87bf915543e8	0	2024-05-09T19:07:24.807Z	2024-05-13T15:10:21.743Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-09T19:37:48.368Z	2024-05-13T16:22:02.752Z	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	99d42576-350e-4fd5-b319-34aa2f8532e6	10	2024-05-13T20:18:34.353Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	58c821b8-2ea7-4b55-aab6-2b63837aa86e	100	2024-05-13T20:18:40.901Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	688d2abd-d8f4-4356-b9cc-db8148905b6f	100	2024-05-13T20:18:41.937Z	\N	\N
40217bba-4f81-4dda-a5e6-a01fc4acad82	8dcf60fe-758b-4137-93b6-cac321724df2	10	2024-05-09T18:51:09.348Z	\N	\N
40217bba-4f81-4dda-a5e6-a01fc4acad82	fcffd019-56c9-4949-8a10-6b6f5104291c	100	2024-05-09T18:51:24.138Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	2a8e82ce-897c-4ce2-a611-1c5cbbb562d5	10	2024-05-09T18:54:09.826Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	c7493f68-4e46-453d-9bf0-36fff3189bf7	10	2024-05-13T20:18:49.495Z	\N	\N
40217bba-4f81-4dda-a5e6-a01fc4acad82	39854bdb-bb2e-4dc4-a08e-d1fc9c280ebb	10	2024-05-09T18:56:02.221Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	5a68adc5-f0cc-44f6-99e4-12cd88662d08	10	2024-05-09T18:57:33.484Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	5f805e7a-39fc-4759-936c-9a0097a5b8a6	10	2024-05-09T18:57:51.975Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	bd742c5e-9257-4f16-a572-b4571d98db90	10	2024-05-09T19:06:16.949Z	\N	\N
db3695c7-d50e-43e0-9047-550bb980532f	49e5686b-1fe3-42bd-b667-729ca65cd778	100	2024-05-10T21:16:18.406Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	1	2024-05-10T19:30:28.775Z	2024-05-12T21:53:52.247Z	\N
d6421a14-e3a8-43c5-84cc-445e169043c2	f74837d7-d4b4-4224-be14-a6d0df76ea8f	10	2024-05-09T20:07:11.558Z	\N	\N
d6421a14-e3a8-43c5-84cc-445e169043c2	14274ddb-ffb6-429c-9aa2-e68ece7d1ab9	10	2024-05-09T20:08:55.806Z	\N	\N
d6421a14-e3a8-43c5-84cc-445e169043c2	aa508257-4477-47e7-8c39-77b8b39fe8bb	10	2024-05-09T20:09:53.663Z	\N	\N
d6421a14-e3a8-43c5-84cc-445e169043c2	2d3cf6fc-8424-47d6-8908-903526827010	10	2024-05-09T20:12:21.359Z	\N	\N
d6421a14-e3a8-43c5-84cc-445e169043c2	1fde16af-ef8a-4686-b021-cafc1c5179cf	10	2024-05-09T20:13:12.459Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	01794c4c-0038-4330-a478-0d10c85fb2d0	100	2024-05-09T20:14:10.949Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	fcfdeaeb-0760-4f93-bac9-76b804551ce9	10	2024-05-09T21:40:44.664Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	49269442-ab56-4023-be4f-9201c8ade196	10	2024-05-09T21:41:00.414Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	b3dbcd74-cbaa-45af-852c-a0433220aa2a	10	2024-05-10T21:57:30.766Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	4bd475d3-779b-45bb-b9f9-7a6052bc41fb	10	2024-05-10T21:57:51.318Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	9ee6fd99-6604-438c-a3cc-15d2c7f997ed	10	2024-05-10T21:58:17.005Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	fcc2aee3-3a74-45a7-a590-961a2f78050d	100	2024-05-13T20:19:19.384Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	6b1d5955-578e-4b7c-a66a-118060c94901	100	2024-05-13T20:19:28.555Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	367ed746-6c87-41d9-a29e-bf3540360ccf	10	2024-05-13T20:20:12.127Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	c6995a7c-5298-490e-af14-8feaaedc3e7b	100	2024-05-13T20:20:48.647Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	c1e4ef3f-0d86-418f-9d9f-05f028246bed	100	2024-05-13T20:21:20.098Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	6d451ef8-e962-423c-8fc8-5fb0eb848766	100	2024-05-13T20:21:25.463Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-13T20:21:27.141Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	e3f884bd-3dc5-480f-8bfe-c0be33d26f43	10	2024-05-10T21:46:36.330Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	6ee709d9-f990-41e3-9f92-a75f8d5e4855	100	2024-05-13T20:21:33.153Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	c40c44b2-037b-46f4-b8e1-86d7b8a3f990	100	2024-05-13T20:22:09.797Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	a67daf19-d5c9-4021-a189-c89adc8cb051	10	2024-05-10T21:57:41.553Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	3810ff6f-2c32-4a64-a1c6-37be86fdaec6	10	2024-05-10T22:01:55.081Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	689c1d43-a7ee-4b95-97df-1558fbfcb863	100	2024-05-13T20:22:19.746Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	770fd1b3-e792-4127-88f9-7d7a47224363	10	2024-05-10T22:13:51.673Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	4c170954-1c43-4928-9014-d3b057e4a5ca	10	2024-05-10T22:14:18.813Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	100	2024-05-10T22:24:33.923Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	b9b2ba22-62c1-429f-839c-65990c47a3e7	100	2024-05-13T20:22:59.957Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	7982a520-ecc8-4cf9-a8be-2bd40550bd31	100	2024-05-10T22:24:48.014Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	100	2024-05-10T22:25:03.226Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	063d43f1-9f08-4943-8f82-b51aa4e49924	100	2024-05-13T20:25:20.918Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	c957dded-1e08-4e25-a2f8-80d111aef57b	100	2024-05-10T22:28:49.444Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	56ca5929-dc59-47f0-a24f-52ddd8c25de9	100	2024-05-10T22:29:15.388Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	c957dded-1e08-4e25-a2f8-80d111aef57b	100	2024-05-13T20:25:45.209Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	e85a86ec-1e72-4318-ab4b-3c4faadbec45	10	2024-05-10T22:35:20.130Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	172c7042-1a1a-4ed0-9cd7-9f818efde80a	10	2024-05-10T22:35:46.501Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	0eb81d00-fdee-4740-9070-bf23874d35a9	100	2024-05-13T20:26:06.887Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	bd2a5ee3-0fc6-4777-b4d1-4bb38ebbd0d4	100	2024-05-13T20:26:28.625Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	945b1d7a-17ac-4646-92ef-018669cee133	100	2024-05-13T20:26:37.404Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	2c98279b-bbd2-4645-96a3-51edb69cf509	100	2024-05-13T20:27:04.457Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	27c3707c-4a0b-4b43-8f8c-1b4bba103aa9	100	2024-05-13T20:38:24.000Z	\N	\N
97ef5b90-6f9b-4adb-bd07-086e7330b745	294b5457-2501-434a-8b58-b386256e4f04	10	2024-05-13T00:04:46.828Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	0	2024-05-11T21:43:55.775Z	2024-05-13T20:27:20.593Z	\N
05a4563e-f7cd-4257-ab9c-7171acaaefc4	8f2d2855-7c53-418f-929b-222e431be3b7	10	2024-05-11T21:42:25.170Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	646d25fc-788e-4853-a7a3-29190186b477	10	2024-05-11T21:44:11.324Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	873f0443-1ed1-4044-ae2e-da17f59ddfc0	10	2024-05-11T21:47:58.655Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	b2f1c6ff-93dc-4d8d-8365-36bcfc0eb1fd	10	2024-05-10T22:23:48.375Z	2024-05-12T11:52:48.854Z	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	58c7d1c9-8e7f-4d68-8ede-da32a40500bc	100	2024-05-13T20:27:29.513Z	\N	\N
cec93d9b-4cdc-42fc-9fc8-29b0a1ddbaba	0b36b132-05b8-421d-b1b1-955c4b96f520	10	2024-05-13T20:35:15.745Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	024cd66e-f35f-405b-bd88-705d071be713	100	2024-05-13T00:07:16.280Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	fcffd019-56c9-4949-8a10-6b6f5104291c	100	2024-05-13T00:08:27.278Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	20d95bd9-0113-4b90-914e-7e1083cb5cd6	100	2024-05-13T00:08:55.810Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	28114a40-6489-4712-b5ba-5968b0fc8fd9	10	2024-05-13T00:12:58.986Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	524bb8ae-a002-41f4-971c-807f9d3c016c	10	2024-05-13T00:14:03.549Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	2b6abce0-4abb-4341-b6e5-960d73ca6645	0	2024-05-13T20:22:08.343Z	2024-05-14T17:28:44.312Z	\N
cec93d9b-4cdc-42fc-9fc8-29b0a1ddbaba	bcd499a9-ddd9-479e-a057-c9f058178eaf	10	2024-05-13T20:35:31.050Z	\N	\N
cec93d9b-4cdc-42fc-9fc8-29b0a1ddbaba	2c0eabfd-5c22-4174-b93d-b814a7706b9e	10	2024-05-13T20:36:56.100Z	\N	\N
cec93d9b-4cdc-42fc-9fc8-29b0a1ddbaba	873f0443-1ed1-4044-ae2e-da17f59ddfc0	1	2024-05-13T20:37:07.361Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	219e46d3-688f-4021-b7b4-3a1ab5722aa1	10	2024-05-13T20:39:37.369Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	bc43d2f6-7c4f-4d38-8269-b66b085fcb8a	100	2024-05-13T20:39:50.817Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	367ed746-6c87-41d9-a29e-bf3540360ccf	100	2024-05-13T20:40:05.318Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	799e9f43-b5e8-4484-be33-09c442390253	0	2024-05-11T21:44:18.985Z	2024-05-13T20:40:11.218Z	\N
022fcaca-94ad-4917-9c59-5d95736a674b	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	0	2024-05-11T21:43:44.363Z	2024-05-13T20:40:56.125Z	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	ee8da859-0ae9-4344-b778-19478e468148	100	2024-05-13T20:42:26.787Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	6ad8b08c-2457-45aa-8589-013e0b73d0a4	10	2024-05-13T20:46:01.784Z	\N	\N
964b7015-8542-4787-81ba-4f70356d279d	76aec8f8-b5d7-45ad-aa2c-fc23b6599a7e	0	2024-05-13T20:46:20.229Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	15121282-bdc8-4096-845b-974401b2e6aa	100	2024-05-13T20:22:12.579Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	1d3bbf0a-b9d6-4766-884c-5dbcf5f941e2	10	2024-05-10T22:29:01.749Z	2024-05-11T15:50:25.102Z	\N
806120c1-8d63-4f67-9351-eb3253cad789	56ca5929-dc59-47f0-a24f-52ddd8c25de9	10	2024-05-10T22:00:31.161Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	70c5fbed-2863-4a0e-bdb0-f07a6f424802	0	2024-05-11T21:58:18.387Z	2024-05-13T15:01:21.391Z	\N
806120c1-8d63-4f67-9351-eb3253cad789	3aaefd40-754e-434d-b4af-180fdd60174c	10	2024-05-10T22:02:46.672Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	e1d9baf6-5014-468f-9549-2b1853767835	10	2024-05-10T22:03:02.710Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	352af921-b2eb-4ca8-9775-5f124c622d6b	10	2024-05-10T22:03:46.592Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	4d57d380-9335-4127-83fc-a54c7feeb0aa	10	2024-05-10T22:05:21.596Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	d0d08e71-113d-4a7b-9ae1-ae73ec4509ef	10	2024-05-10T22:05:37.250Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	4eb7c42e-8499-438d-9298-3ca063eca896	10	2024-05-10T22:06:15.523Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	d5bee376-7afa-40f0-8b05-77f984e6c12a	10	2024-05-10T22:09:22.915Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	ca0612fa-aa62-42ec-b333-ea09d667e48a	10	2024-05-10T22:09:56.550Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	c84192e1-0605-4b6f-8302-99aa29116f1f	10	2024-05-10T22:10:38.372Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	88fa7edf-2f9d-43e9-b983-86aa6fc63374	10	2024-05-10T22:11:11.797Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	2323bf86-445a-410d-89fc-01c6b2ea36ea	10	2024-05-10T22:13:12.122Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	924e9906-692e-460a-bfe4-de2a6c33a5f1	10	2024-05-10T22:16:15.707Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	053d6422-e791-474c-9820-90252e04da58	10	2024-05-11T21:59:02.686Z	2024-05-12T20:51:42.796Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	6fae2ee9-649c-44e0-b07d-be18bc295d5a	100	2024-05-13T00:06:31.205Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	ad9a4dad-3dc5-46b3-b387-889fc5b0b186	0	2024-05-10T22:25:59.451Z	2024-05-13T15:47:53.560Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	d1a27ea2-0281-4c95-9154-6509ede0f2dd	100	2024-05-13T00:06:55.069Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	ddfd8cc9-02db-4c9c-b59c-c4f03459607c	10	2024-05-13T00:14:22.442Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	24e95cd1-71cf-406f-b256-80ce535f8e65	10	2024-05-11T22:01:56.235Z	2024-05-13T16:27:35.322Z	\N
806120c1-8d63-4f67-9351-eb3253cad789	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-10T22:20:33.204Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	8efd91e0-8521-43ba-b45d-790d08c854e0	10	2024-05-10T22:21:09.412Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	463b2006-ff25-4d63-8b79-17666b4b4d02	100	2024-05-13T20:19:41.497Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	e4bedb60-5d9c-4cc6-8ba7-f93d890c6cec	100	2024-05-13T20:19:47.507Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	f013501e-e9ea-478f-af0d-648f96244b14	10	2024-05-10T22:22:55.004Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-10T22:23:17.047Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	caa77bd6-4cf9-44a5-aa24-2e68c899081a	100	2024-05-13T20:19:59.986Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	e82f2b29-1394-4325-a728-f3dd20f1c6bf	100	2024-05-13T20:22:05.812Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	100	2024-05-10T22:27:04.330Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	b813d3b5-bf55-443b-b1a4-be3d426af4e9	100	2024-05-10T22:27:28.369Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	f1570b6d-f756-493e-a151-115f51f1e747	100	2024-05-10T22:27:50.139Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	bd2a5ee3-0fc6-4777-b4d1-4bb38ebbd0d4	100	2024-05-10T22:28:14.496Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	dc359231-d372-495a-a9e0-2bbd47965809	100	2024-05-10T22:31:03.669Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	9ee6fd99-6604-438c-a3cc-15d2c7f997ed	100	2024-05-10T22:31:50.388Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	9f24ba1c-03a0-43c4-8745-9029555af354	100	2024-05-10T22:34:06.316Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	af26cae5-8bae-420c-8052-782b9598fded	10	2024-05-10T22:34:09.391Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	cc0b7c15-55bd-426c-9637-12db360bc034	100	2024-05-10T22:34:39.297Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	5880fcb0-dd0e-4681-b97d-a1f501152fc6	10	2024-05-10T22:34:42.882Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	24a56430-28ea-465e-8287-af19639b18ce	100	2024-05-10T22:34:55.908Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	974734e0-3a85-47e5-92bb-a7eb378c3c93	100	2024-05-13T20:22:31.254Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	f1570b6d-f756-493e-a151-115f51f1e747	100	2024-05-13T20:22:38.145Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	ecfa6079-84f1-41f8-a86f-cf0e133a135e	100	2024-05-13T20:22:47.025Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	100	2024-05-13T20:23:40.950Z	\N	\N
05a4563e-f7cd-4257-ab9c-7171acaaefc4	950a9045-f3c3-42d7-bf59-d42c5ef42d29	10	2024-05-11T21:54:03.726Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	f33825fd-e6b0-47bb-80c0-80aef8a42e19	100	2024-05-13T20:24:21.919Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	21d0b947-aabf-445d-8622-464875e4b937	10	2024-05-11T21:55:43.553Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	6347a939-ad2c-458e-a097-17fdb7ef34b1	100	2024-05-13T20:24:25.646Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	1de79252-6c13-466b-ba1a-2e9c009fbfaa	100	2024-05-13T20:24:32.005Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	5880fcb0-dd0e-4681-b97d-a1f501152fc6	0	2024-05-11T22:08:13.660Z	2024-05-14T13:11:00.231Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	39bc837b-b026-4a73-b987-efbba14a889f	10	2024-05-11T21:59:18.367Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	edcb4032-d028-48ee-9811-b6004b277877	10	2024-05-13T00:14:28.300Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	1d3bbf0a-b9d6-4766-884c-5dbcf5f941e2	10	2024-05-11T22:04:46.688Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-11T22:08:00.121Z	\N	\N
5daec969-8869-4121-bafc-1425731e6487	93e6682e-6c2a-40aa-a18a-df386c244d3d	100	2024-05-09T18:30:37.006Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	158fb67d-00f8-4752-be65-4108101bdd7f	10	2024-05-13T20:20:16.428Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	0fbe9d5e-6114-4f3a-8b06-19cca85093ea	10	2024-05-09T18:54:40.241Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	83c7d111-7d55-4bf4-b61d-8fa5fbcfb012	100	2024-05-13T20:20:22.509Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-13T20:20:31.179Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	eaefed6b-0638-4d5a-86c1-42801b2b1ac7	100	2024-05-13T20:20:36.518Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	38939273-b35e-49bf-b84f-0a04f747d44e	100	2024-05-13T20:20:53.189Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	fd54a76a-cdb9-4543-9df6-24baa384e38c	100	2024-05-13T20:20:59.570Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	4bd475d3-779b-45bb-b9f9-7a6052bc41fb	100	2024-05-10T22:25:26.408Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	a736cad0-9135-4ac2-bb96-d40350b52658	100	2024-05-13T20:21:04.131Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	ef206d20-b798-4215-bebb-e53afd8f4a69	100	2024-05-10T22:25:45.376Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	01794c4c-0038-4330-a478-0d10c85fb2d0	10	2024-05-10T22:25:55.425Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	dbcb6fc3-02b4-4e31-8924-ed56f0e6ecc1	100	2024-05-10T22:25:57.016Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	c1e4ef3f-0d86-418f-9d9f-05f028246bed	100	2024-05-10T22:26:12.854Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	c8ce7a65-be98-4e38-beaa-b9907dc003e9	100	2024-05-10T22:26:29.604Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	ea2c6721-693d-496e-8442-a2381d48430b	100	2024-05-13T20:21:12.736Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	e22bf0ca-5fef-46f2-bc54-a3b627d41080	100	2024-05-13T20:21:42.310Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	2cdfa6cc-5f3d-4858-a3ee-13f0a6c7eaf3	100	2024-05-13T20:21:44.660Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	6b1d5955-578e-4b7c-a66a-118060c94901	100	2024-05-10T22:29:43.621Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	62bd5d05-ba37-497a-a1a1-56795813790d	100	2024-05-10T22:29:59.280Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	d8b0c9ec-39a1-44e4-9ccf-36b439e39368	100	2024-05-10T22:30:16.935Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	689c1d43-a7ee-4b95-97df-1558fbfcb863	100	2024-05-10T22:30:27.977Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	100	2024-05-13T20:21:56.753Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	352af921-b2eb-4ca8-9775-5f124c622d6b	100	2024-05-10T22:35:30.799Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	c096c90d-0710-4804-801c-e5a2b8d14e6f	100	2024-05-13T20:23:55.628Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	b8598db7-a21f-4bba-8ed4-d0317b0a5df8	100	2024-05-13T20:24:18.175Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	4bd475d3-779b-45bb-b9f9-7a6052bc41fb	100	2024-05-13T20:24:48.495Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	3b7a9689-8c41-4090-9084-5b8e31a1d7d5	100	2024-05-13T20:25:11.048Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	ceebd729-eecc-420e-8e90-f764a487b202	100	2024-05-13T20:31:35.858Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-13T20:40:15.773Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	063d43f1-9f08-4943-8f82-b51aa4e49924	100	2024-05-13T20:41:31.042Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	cd6ef0ed-beb8-4987-bed0-6690360221ae	100	2024-05-13T20:43:17.325Z	\N	\N
964b7015-8542-4787-81ba-4f70356d279d	82fe2a73-a292-488d-b227-3302bd06496d	0	2024-05-13T20:45:14.180Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	92542ce7-d1b9-4da5-9c93-38698fd0f042	10	2024-05-10T22:26:23.515Z	2024-05-12T15:10:58.050Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-13T00:10:21.196Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	0bac5a5c-e260-41eb-806e-46397862d868	10	2024-05-13T20:45:32.092Z	\N	\N
964b7015-8542-4787-81ba-4f70356d279d	162b6d02-6c95-470a-b7c8-03fa75c335fb	100	2024-05-13T20:49:33.111Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	e54ecc47-ddb8-487a-aa3d-2d091a55b830	100	2024-05-13T21:17:26.137Z	\N	\N
40217bba-4f81-4dda-a5e6-a01fc4acad82	2fe71172-ab32-490e-91ae-0ec727bd3d52	10	2024-05-09T18:50:43.598Z	\N	\N
40217bba-4f81-4dda-a5e6-a01fc4acad82	3edbdcb6-ff0a-4de4-b5c9-24c30de29132	10	2024-05-09T18:50:58.692Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	fcfdeaeb-0760-4f93-bac9-76b804551ce9	10	2024-05-09T18:58:06.135Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	172c7042-1a1a-4ed0-9cd7-9f818efde80a	10	2024-05-09T18:58:23.140Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	c1e4ef3f-0d86-418f-9d9f-05f028246bed	100	2024-05-09T19:28:58.783Z	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	c957dded-1e08-4e25-a2f8-80d111aef57b	100	2024-05-09T19:29:07.215Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	d2123a82-91a0-4f30-896b-61ee15ade670	100	2024-05-10T22:30:47.790Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	02d596a5-c59c-48fc-833f-02a9e567a312	100	2024-05-10T22:31:27.211Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	09fa01c2-c48c-4d7d-b910-adc3109dc041	100	2024-05-10T22:32:23.728Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	860776d6-b97a-431f-b089-faee9ca777bc	10	2024-05-10T22:33:28.584Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	0676bbe1-5bb4-4bd1-94b6-7a5038ecd41e	10	2024-05-11T21:59:52.800Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	3b212543-48ca-43a5-9f42-20b506425a83	10	2024-05-11T22:00:45.940Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	2d2a7f10-0aa2-4c87-b5a8-3441cb569f10	10	2024-05-11T22:01:35.190Z	\N	\N
d5f1b990-bc50-4564-bb05-ae52af1b56b3	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-09T19:15:59.495Z	2024-05-13T19:21:45.582Z	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	cbe1445b-256b-4d93-8829-6a1fda8f526c	10	2024-05-11T22:06:23.284Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	cc5459a2-9b43-486b-8c3f-99c507c68562	10	2024-05-11T22:06:40.654Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	8efd91e0-8521-43ba-b45d-790d08c854e0	10	2024-05-11T22:02:04.863Z	2024-05-12T16:17:08.738Z	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	88fa7edf-2f9d-43e9-b983-86aa6fc63374	10	2024-05-11T22:07:17.208Z	\N	\N
cec93d9b-4cdc-42fc-9fc8-29b0a1ddbaba	799e9f43-b5e8-4484-be33-09c442390253	10	2024-05-13T20:24:52.337Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	dfcde5dc-2359-47d8-9652-ec4606472bbe	100	2024-05-13T20:24:59.374Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	59991d33-10e6-48af-be3e-274fa5960fc2	100	2024-05-13T20:25:38.561Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	fc383a72-fcea-45a2-86d5-0aa5faa37fad	100	2024-05-13T20:25:59.398Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	b355c6b7-f9c9-4b2f-92a2-bb7f8adeb790	100	2024-05-13T20:26:12.630Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	e82f2b29-1394-4325-a728-f3dd20f1c6bf	10	2024-05-11T22:13:56.501Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	dbcb6fc3-02b4-4e31-8924-ed56f0e6ecc1	100	2024-05-13T20:26:56.718Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	10	2024-05-11T22:14:56.172Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	7e221be5-cacb-4b5d-96b7-4d0b65d04295	10	2024-05-11T22:15:30.789Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	924e9906-692e-460a-bfe4-de2a6c33a5f1	10	2024-05-11T22:16:32.428Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-13T20:27:01.015Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	a8c18a44-ec60-4a19-8e96-785c49de9630	100	2024-05-13T20:27:13.959Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	5a68adc5-f0cc-44f6-99e4-12cd88662d08	100	2024-05-13T20:27:25.605Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	329ef2f3-32ec-4987-8089-c7f02ffd7aaf	10	2024-05-11T22:18:50.566Z	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	2f3a8fa1-713c-4e53-82c9-d95a0383c345	100	2024-05-13T20:31:31.585Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	6347a939-ad2c-458e-a097-17fdb7ef34b1	10	2024-05-13T20:38:06.440Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	dfcde5dc-2359-47d8-9652-ec4606472bbe	100	2024-05-13T20:39:10.642Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	689c1d43-a7ee-4b95-97df-1558fbfcb863	100	2024-05-13T20:39:50.881Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	1beaa417-91ee-4ccc-b779-a4c2a5a81807	10	2024-05-13T20:40:29.183Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	f3eb355a-4868-48af-befc-38a8a565c8e4	10	2024-05-13T20:40:38.197Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	eb705387-0d48-4762-be63-4c281a8b1d8e	100	2024-05-13T20:40:55.477Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	b355c6b7-f9c9-4b2f-92a2-bb7f8adeb790	100	2024-05-13T20:41:13.825Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-13T00:14:08.949Z	\N	\N
5daec969-8869-4121-bafc-1425731e6487	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-11T22:25:03.099Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	876548db-d180-4083-96ba-cddcb86134b0	10	2024-05-13T20:41:48.141Z	\N	\N
5daec969-8869-4121-bafc-1425731e6487	b8086ace-c3c7-4fa5-905f-ad1d4e64e990	10	2024-05-11T22:25:57.071Z	\N	\N
5daec969-8869-4121-bafc-1425731e6487	e87c2f41-f417-4ee0-b818-9adfe7c790e9	10	2024-05-11T22:26:11.297Z	\N	\N
5daec969-8869-4121-bafc-1425731e6487	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-11T22:28:03.477Z	\N	\N
5daec969-8869-4121-bafc-1425731e6487	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-11T22:28:19.299Z	\N	\N
5daec969-8869-4121-bafc-1425731e6487	32a2463b-506d-4ab4-8789-2ebecb70ce4e	10	2024-05-11T22:29:09.989Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	4e619f2b-0e02-4842-8b1d-410ff44038cd	10	2024-05-13T20:41:57.763Z	\N	\N
9b4ff79d-87e5-4eff-99fb-e981f3bc3998	59ce1afa-2583-4810-b726-e8fa4c7e5464	10	2024-05-11T22:48:22.444Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	100	2024-05-13T20:38:53.132Z	2024-05-13T20:54:57.442Z	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	69732c83-e2ee-481f-b4c5-e55932e8d51f	10	2024-05-11T22:35:00.003Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	528e2a82-0523-4110-8894-20ee1a60be69	10	2024-05-11T22:35:42.423Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	01794c4c-0038-4330-a478-0d10c85fb2d0	0	2024-05-11T22:07:03.496Z	2024-05-14T13:10:28.200Z	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	0774d214-1b04-4d83-90bb-bf30662b9a5a	0	2024-05-13T00:14:16.851Z	2024-05-14T13:34:29.342Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	001e3bdc-a463-4cea-a4f1-6bb36cd67d5f	10	2024-05-09T18:58:15.590Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	aac33dfd-3626-4bac-a5d3-50ad6a8d69b7	10	2024-05-09T19:03:08.228Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	e1d9baf6-5014-468f-9549-2b1853767835	100	2024-05-13T20:42:42.618Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	e4b0ddb9-594e-4790-856a-339c77d3aee1	10	2024-05-13T20:43:46.971Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	c096c90d-0710-4804-801c-e5a2b8d14e6f	100	2024-05-10T22:36:00.530Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	24e95cd1-71cf-406f-b256-80ce535f8e65	100	2024-05-13T20:42:08.359Z	2024-05-13T20:44:44.477Z	\N
964b7015-8542-4787-81ba-4f70356d279d	6bca959f-afc2-434e-a716-c6ce6fe71b70	100	2024-05-13T20:44:52.020Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	db326b44-ce02-443b-bbe1-deec70fa9a7b	10	2024-05-13T20:45:46.457Z	\N	\N
964b7015-8542-4787-81ba-4f70356d279d	c8f8e336-8a2a-487a-9fc8-2ee6b610c7fe	100	2024-05-13T20:45:42.453Z	2024-05-13T20:46:03.389Z	\N
964b7015-8542-4787-81ba-4f70356d279d	695ea3e2-3cf8-4525-b731-f951c51dfeff	0	2024-05-13T20:47:07.561Z	\N	\N
964b7015-8542-4787-81ba-4f70356d279d	c84192e1-0605-4b6f-8302-99aa29116f1f	100	2024-05-13T20:47:39.033Z	\N	\N
26a1497d-7ba3-49cc-8a51-79bc23bc2676	bc43d2f6-7c4f-4d38-8269-b66b085fcb8a	100	2024-05-13T20:54:42.435Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	fcfdeaeb-0760-4f93-bac9-76b804551ce9	10	2024-05-09T19:50:29.202Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	fd54a76a-cdb9-4543-9df6-24baa384e38c	10	2024-05-09T19:51:40.131Z	\N	\N
d6421a14-e3a8-43c5-84cc-445e169043c2	5ee91e2e-a7c2-449a-bb80-ac78b28b3767	10	2024-05-09T20:12:27.707Z	\N	\N
d6421a14-e3a8-43c5-84cc-445e169043c2	14ce7f98-2cb3-46ce-bc13-d0f420c5921c	10	2024-05-09T20:12:33.545Z	\N	\N
d6421a14-e3a8-43c5-84cc-445e169043c2	6ee709d9-f990-41e3-9f92-a75f8d5e4855	10	2024-05-09T20:12:44.708Z	\N	\N
d6421a14-e3a8-43c5-84cc-445e169043c2	e15b969f-d5fe-48cf-80ea-443be9dc5785	10	2024-05-09T20:13:07.538Z	\N	\N
26a1497d-7ba3-49cc-8a51-79bc23bc2676	04a2d64b-69c0-4f6b-8975-4d41b4f43327	100	2024-05-13T20:55:07.527Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	5992e29f-0982-4f26-b0fd-7b44fc6c08fd	100	2024-05-10T22:37:30.993Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	33ad04bc-0c6c-4137-98c2-4ad8ca9559ef	10	2024-05-10T22:37:51.363Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	919d8585-40a8-45e9-b619-b9e7a7ba20ea	10	2024-05-10T22:39:22.232Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	5c1839cf-e5e9-4963-9018-c4d6f9ac5aeb	10	2024-05-10T22:39:44.534Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	2d2a7f10-0aa2-4c87-b5a8-3441cb569f10	0	2024-05-09T13:51:01.202Z	2024-05-13T20:55:10.859Z	\N
685d0226-062b-4b77-a2df-c7c05a637856	c40c44b2-037b-46f4-b8e1-86d7b8a3f990	100	2024-05-10T22:41:48.758Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	d1341b2e-7a67-4b11-87d8-e62f53cbf83e	100	2024-05-10T22:42:12.678Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	599bee49-16ea-4ea6-9a4a-ae3043926417	10	2024-05-10T22:42:22.515Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	5cac0471-262c-4408-8fd7-00e99f5a9869	10	2024-05-10T22:43:22.777Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	0278e13b-28e9-4e18-a7af-c2f1b2d28053	100	2024-05-13T20:55:58.709Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	e0a4593b-5e8f-4f1e-89de-e584e8cdc843	10	2024-05-10T22:44:13.302Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	e99b7beb-668d-45f0-b368-6fad52f284a5	10	2024-05-10T22:44:37.593Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	bcd499a9-ddd9-479e-a057-c9f058178eaf	10	2024-05-10T22:45:23.619Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	873f0443-1ed1-4044-ae2e-da17f59ddfc0	10	2024-05-10T22:45:44.677Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	450614ac-762f-4109-bc13-d8c72066abc7	10	2024-05-13T20:56:11.073Z	\N	\N
26a1497d-7ba3-49cc-8a51-79bc23bc2676	9176dc97-5389-4f27-8730-9ef99d88903f	100	2024-05-13T20:56:12.631Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	09fa01c2-c48c-4d7d-b910-adc3109dc041	0	2024-05-11T22:10:02.023Z	2024-05-14T13:09:45.567Z	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	64d32a92-257f-4051-8628-9a79d8f6f9cc	10	2024-05-13T20:56:25.194Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	04456c45-5a31-4e24-9217-26480097eed6	100	2024-05-13T20:56:36.746Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	896bcf95-5d4a-4673-b628-4077bdd3c9d2	100	2024-05-13T20:58:07.309Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	ad2964e7-c67c-4872-bf4a-6cc060f703a6	100	2024-05-13T20:58:47.857Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	911f55b0-51f3-47ec-b80f-23fee83a5d72	10	2024-05-13T00:14:40.074Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	8f528aeb-d345-42a8-b01f-48156c9d589f	0	2024-05-09T19:44:47.332Z	2024-05-14T10:34:08.777Z	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	52634f35-73b2-4c60-99c9-1ec886f6e4b3	0	2024-05-13T00:15:03.789Z	2024-05-14T13:20:52.678Z	\N
806120c1-8d63-4f67-9351-eb3253cad789	73d62b87-49ae-48d7-9001-868839648b25	10	2024-05-10T23:11:41.380Z	2024-05-11T15:50:36.747Z	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	ebfbd0bc-1356-4086-9255-d5a2dcc7c660	0	2024-05-13T00:15:26.875Z	2024-05-14T13:34:46.855Z	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	5e3faa0a-8bf7-4182-b057-cec38d4bed2d	0	2024-05-13T00:16:32.390Z	2024-05-14T13:35:24.815Z	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	55020e2d-1413-46ab-9b94-b31d48f87bd4	10	2024-05-11T22:09:22.197Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	87d09650-d0e9-4203-867e-b6e167a1171b	10	2024-05-11T22:09:37.610Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	869ed149-9375-4fac-a687-d5450b53ceb8	10	2024-05-11T22:09:51.831Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	d8b0c9ec-39a1-44e4-9ccf-36b439e39368	10	2024-05-13T00:15:18.396Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	66a98038-4588-431c-814d-0c440c4683af	10	2024-05-11T22:11:51.230Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	063d43f1-9f08-4943-8f82-b51aa4e49924	10	2024-05-11T22:12:42.534Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	79930f4e-e408-4332-b8af-5510f34bccc2	10	2024-05-13T00:17:02.625Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	0039d5e9-4cc5-4b47-b034-225da8e4fc19	10	2024-05-11T22:13:29.539Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	352af921-b2eb-4ca8-9775-5f124c622d6b	10	2024-05-11T22:16:01.409Z	\N	\N
964b7015-8542-4787-81ba-4f70356d279d	cc0b7c15-55bd-426c-9637-12db360bc034	100	2024-05-13T20:46:28.832Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	c7912559-1554-4014-a088-2bbf51ca6da3	100	2024-05-10T22:38:03.962Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	52808a2f-f878-4f2d-8c8d-17c2861358e8	10	2024-05-10T22:41:04.211Z	\N	\N
964b7015-8542-4787-81ba-4f70356d279d	00a3e128-7af5-4fbd-aa99-ae33e46124fc	100	2024-05-13T20:47:17.677Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	a16b02b5-c7bb-4eab-bf78-0d9b073566d8	10	2024-05-10T22:43:35.054Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	2b15a0d1-c356-4b44-ae7b-eee12605e171	10	2024-05-10T22:44:58.686Z	\N	\N
964b7015-8542-4787-81ba-4f70356d279d	daf1d8ba-68d5-413d-9006-3309b176e923	100	2024-05-13T20:48:26.041Z	\N	\N
5daec969-8869-4121-bafc-1425731e6487	053d6422-e791-474c-9820-90252e04da58	10	2024-05-11T22:27:03.311Z	\N	\N
5daec969-8869-4121-bafc-1425731e6487	799e9f43-b5e8-4484-be33-09c442390253	10	2024-05-11T22:27:31.030Z	\N	\N
964b7015-8542-4787-81ba-4f70356d279d	84d5b5f4-3c06-4b70-946e-dd258278c7b2	0	2024-05-13T20:48:02.224Z	2024-05-13T20:49:17.597Z	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	053d6422-e791-474c-9820-90252e04da58	10	2024-05-11T22:36:53.326Z	\N	\N
3c25886c-39e0-482b-9b3e-cd1e7e59249c	970603df-a58e-4cbf-94f1-4aff2c5743a1	0	2024-05-13T20:52:15.145Z	2024-05-13T20:52:38.431Z	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	01143932-fcb6-433b-8ae4-e491802a41d3	100	2024-05-13T20:55:25.956Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	9f9a0d1e-8b74-4c27-9d07-7d986bcc9bbe	100	2024-05-13T20:56:54.621Z	\N	\N
26a1497d-7ba3-49cc-8a51-79bc23bc2676	0d89328b-9fbe-4bc0-981f-c5241f35b175	100	2024-05-13T20:57:01.916Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	867d8951-dffb-4cbd-9d50-1550a15fa1c7	100	2024-05-13T20:57:31.094Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	dff8384d-e10c-4093-b077-96969c67a159	100	2024-05-13T20:57:51.711Z	\N	\N
26a1497d-7ba3-49cc-8a51-79bc23bc2676	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-13T20:59:03.419Z	\N	\N
9b4ff79d-87e5-4eff-99fb-e981f3bc3998	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	10	2024-05-11T22:47:28.917Z	\N	\N
9b4ff79d-87e5-4eff-99fb-e981f3bc3998	e15b969f-d5fe-48cf-80ea-443be9dc5785	10	2024-05-11T22:48:05.568Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	0fc4d439-3e5d-460d-aefb-c54583690db3	100	2024-05-13T20:59:08.560Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	ef206d20-b798-4215-bebb-e53afd8f4a69	10	2024-05-13T21:04:57.724Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	24857c6e-7fe5-45e8-9cc5-c5858390c06d	10	2024-05-13T21:05:43.907Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	5d7dee46-9a08-4faf-adf8-5b341231f09a	100	2024-05-10T16:06:04.953Z	2024-05-11T23:04:28.635Z	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	42b139ee-4c4b-4714-ab0c-bd92689d6260	10	2024-05-13T21:06:16.312Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	6bca959f-afc2-434e-a716-c6ce6fe71b70	10	2024-05-13T21:06:30.228Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	0bac5a5c-e260-41eb-806e-46397862d868	10	2024-05-13T21:07:32.444Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	aa03f3e6-ff18-49aa-b06c-3bfeb64c71ae	0	2024-05-11T22:54:47.797Z	2024-05-14T15:15:27.581Z	\N
62a17be9-a744-42a6-a7dd-8ce2872c56c8	e4bedb60-5d9c-4cc6-8ba7-f93d890c6cec	10	2024-05-11T22:54:50.049Z	2024-05-12T16:24:03.135Z	\N
806120c1-8d63-4f67-9351-eb3253cad789	6c8684ed-85ad-49c0-a76e-cb34e7538f4d	100	2024-05-10T22:43:10.881Z	2024-05-12T20:01:56.123Z	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	b813d3b5-bf55-443b-b1a4-be3d426af4e9	10	2024-05-13T00:14:46.281Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	b355c6b7-f9c9-4b2f-92a2-bb7f8adeb790	10	2024-05-13T00:14:55.130Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	0b0cc909-bb05-4234-a005-0a8bbde9ecd8	10	2024-05-13T00:17:32.399Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	73fbacb1-0736-49ec-8873-80ddd65608a2	10	2024-05-13T00:17:39.863Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	10	2024-05-13T00:17:46.492Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	5473935f-6588-4ee8-ba0d-ec90f9d6b6fd	1	2024-05-13T00:18:07.596Z	2024-05-13T00:18:13.963Z	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	c8976b11-580c-4656-935f-10efe10a8206	100	2024-05-13T20:59:39.460Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-13T21:05:22.801Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	a25f338f-1fed-4412-844a-7e16962eb051	10	2024-05-13T21:05:59.194Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	799e9f43-b5e8-4484-be33-09c442390253	10	2024-05-13T21:07:15.829Z	\N	\N
d6421a14-e3a8-43c5-84cc-445e169043c2	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	10	2024-05-09T20:11:51.560Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	2f3a8fa1-713c-4e53-82c9-d95a0383c345	10	2024-05-09T21:41:50.372Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	15121282-bdc8-4096-845b-974401b2e6aa	10	2024-05-09T21:42:02.664Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-09T21:42:15.363Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	063d43f1-9f08-4943-8f82-b51aa4e49924	10	2024-05-09T21:42:24.990Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	10	2024-05-09T21:43:11.895Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	9d0e7d72-7bb7-4bcd-b49e-5af65224893a	10	2024-05-09T21:52:59.348Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	6bca959f-afc2-434e-a716-c6ce6fe71b70	10	2024-05-13T21:21:47.562Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	5aac6b69-af17-4c0e-b0d0-1621211bc14c	10	2024-05-13T21:22:19.806Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	32a2463b-506d-4ab4-8789-2ebecb70ce4e	10	2024-05-13T21:19:17.342Z	2024-05-14T21:58:41.079Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	2c0eabfd-5c22-4174-b93d-b814a7706b9e	0	2024-05-13T21:21:27.245Z	2024-05-13T21:26:03.106Z	\N
685d0226-062b-4b77-a2df-c7c05a637856	e4bedb60-5d9c-4cc6-8ba7-f93d890c6cec	100	2024-05-10T22:38:34.777Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	6942f871-6e35-4eeb-a3ff-8edc8959aa22	100	2024-05-10T22:39:17.409Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	4206e979-d31c-4306-b9cf-bac8abb1b7ba	100	2024-05-10T22:40:35.186Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	fcc2aee3-3a74-45a7-a590-961a2f78050d	10	2024-05-10T22:40:39.077Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	172c7042-1a1a-4ed0-9cd7-9f818efde80a	100	2024-05-10T22:41:18.269Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	caa77bd6-4cf9-44a5-aa24-2e68c899081a	10	2024-05-10T22:41:45.032Z	\N	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	c8ce7a65-be98-4e38-beaa-b9907dc003e9	0	2024-05-13T19:20:10.643Z	2024-05-13T21:32:25.963Z	\N
806120c1-8d63-4f67-9351-eb3253cad789	4daad41e-b84e-4d36-876b-48a1f82a0c5b	100	2024-05-10T23:09:28.747Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	e87c2f41-f417-4ee0-b818-9adfe7c790e9	100	2024-05-10T23:14:55.082Z	\N	\N
eb98c8bb-aa91-4de1-af23-49d4e3a876ac	446366df-d941-4d6f-9bcf-09bfc4c2a9c8	0	2024-05-13T21:39:49.758Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	04156fe1-e392-4283-a919-1e25908dbec1	0	2024-05-13T21:19:01.961Z	2024-05-13T21:41:44.623Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	20d95bd9-0113-4b90-914e-7e1083cb5cd6	0	2024-05-13T21:37:53.499Z	2024-05-13T21:41:58.652Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	c1e974f6-1fe3-4aed-938d-4f45117fef5e	0	2024-05-13T21:45:25.914Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	100	2024-05-13T21:45:33.030Z	\N	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	4ae4acec-ee0d-40f3-931c-37759e97ecff	100	2024-05-13T21:50:41.299Z	\N	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	55f952e7-5d63-431b-b2ef-8f70c771e857	10	2024-05-13T21:52:38.266Z	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	191b3241-5fce-4d0a-ae67-7d42049c4a09	100	2024-05-13T21:55:55.057Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	0b0cc909-bb05-4234-a005-0a8bbde9ecd8	100	2024-05-13T22:28:38.677Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	fea081c1-7939-4516-97a5-f2cd49177577	100	2024-05-13T22:28:45.292Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	e162ec59-91e5-4621-8a2a-05848cd0f368	10	2024-05-13T00:17:11.625Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	b02a8127-4baa-439d-96d0-4895e606f3d1	1	2024-05-13T00:18:22.436Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	eb3caab6-6357-4757-86b2-efaf8d691de7	1	2024-05-13T00:18:35.873Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	100	2024-05-10T22:59:36.676Z	2024-05-13T01:51:39.298Z	\N
9eaaf07a-ca5b-4633-8b5e-0954f79be0f2	5aad0adb-f132-45f7-b2bb-248f3d8dfacf	100	2024-05-13T22:33:26.461Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	3edb0a60-0bbf-4332-9fd1-8de317091fca	1	2024-05-13T22:43:39.802Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	599bee49-16ea-4ea6-9a4a-ae3043926417	0	2024-05-13T21:20:20.548Z	2024-05-14T23:34:57.468Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	74dc7f47-7298-418b-9b5b-04c47914721b	0	2024-05-13T21:23:37.299Z	2024-05-14T21:46:07.627Z	\N
f0007b63-a031-4c5a-ad2c-d2a708feabb4	81b2e05e-41cf-4bb0-96c2-a622640e6f85	0	2024-05-11T22:43:59.805Z	2024-05-13T15:36:24.157Z	\N
62a17be9-a744-42a6-a7dd-8ce2872c56c8	799e9f43-b5e8-4484-be33-09c442390253	10	2024-05-11T22:54:13.439Z	2024-05-12T16:23:50.271Z	\N
806120c1-8d63-4f67-9351-eb3253cad789	0bac5a5c-e260-41eb-806e-46397862d868	100	2024-05-10T23:08:11.192Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	21c26bde-bccb-45c2-b21f-41fb00a1fb2d	100	2024-05-10T23:08:58.426Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	7e27194f-1be3-419b-a219-6427362e732d	100	2024-05-10T23:14:24.346Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	20d95bd9-0113-4b90-914e-7e1083cb5cd6	100	2024-05-10T23:15:42.895Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	47cc3a3a-c887-4c02-8f08-410010ea15b4	100	2024-05-13T21:24:32.272Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	c22f92e8-d065-455e-867d-534f12705bbf	100	2024-05-10T23:19:33.201Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	100	2024-05-10T23:40:51.459Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	dc359231-d372-495a-a9e0-2bbd47965809	100	2024-05-10T23:41:03.211Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	100	2024-05-10T23:41:04.481Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	ebfbd0bc-1356-4086-9255-d5a2dcc7c660	10	2024-05-10T23:13:29.002Z	2024-05-11T15:55:35.694Z	\N
b818a598-5d62-46cf-867c-ece997cb5856	bea72070-859a-4327-8bd8-dba0a8ada786	10	2024-05-10T23:49:17.221Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	496185c5-16e8-4576-9778-0514ca727dbc	10	2024-05-11T03:03:23.004Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	86cad6e9-5244-4991-9340-eed4798547ae	100	2024-05-13T21:25:00.486Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	62bd5d05-ba37-497a-a1a1-56795813790d	10	2024-05-13T00:22:18.538Z	\N	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-13T21:29:51.201Z	2024-05-13T21:29:58.096Z	\N
5daec969-8869-4121-bafc-1425731e6487	81476608-e806-4a25-ad0f-c976bb29dd31	10	2024-05-11T22:25:22.453Z	\N	\N
5daec969-8869-4121-bafc-1425731e6487	84d5b5f4-3c06-4b70-946e-dd258278c7b2	10	2024-05-11T22:26:39.252Z	\N	\N
5daec969-8869-4121-bafc-1425731e6487	38f84d3e-7f75-46a7-ad35-080b277112ac	10	2024-05-11T22:29:34.460Z	\N	\N
5daec969-8869-4121-bafc-1425731e6487	c4651198-a582-43ed-98cc-0b96d53ec91e	10	2024-05-11T22:29:52.591Z	\N	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	0	2024-05-13T19:16:56.562Z	2024-05-13T21:30:40.848Z	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-11T22:34:40.832Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	dbcb6fc3-02b4-4e31-8924-ed56f0e6ecc1	10	2024-05-11T22:36:09.549Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	8f000e6a-c3cf-43ea-a947-f5df7150caa4	10	2024-05-11T22:36:35.149Z	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	2d3cf6fc-8424-47d6-8908-903526827010	10	2024-05-11T22:37:22.935Z	\N	\N
eb98c8bb-aa91-4de1-af23-49d4e3a876ac	a9b67a55-6742-4c3f-98ad-af8a69c05686	0	2024-05-13T21:31:30.496Z	2024-05-13T21:36:06.574Z	\N
830e3066-a383-4ef9-9aaf-efc87ad30ed5	c777f376-391c-4bff-b548-e19a8bf34ad6	10	2024-05-13T00:38:42.252Z	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	f33825fd-e6b0-47bb-80c0-80aef8a42e19	0	2024-05-13T21:37:46.886Z	2024-05-13T21:37:52.923Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	3ccc7bd1-183d-4f51-9044-a523376e1a58	0	2024-05-13T00:10:15.399Z	2024-05-13T21:42:30.252Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	6614f568-a5dc-4d13-90b8-8e5563088e9d	100	2024-05-13T21:46:53.765Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	4682d405-9a3e-435d-bb33-e249f72935a5	0	2024-05-11T22:57:08.586Z	2024-05-14T17:04:15.701Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	1ca48fb5-6df6-4884-ac61-9c9760041ee1	0	2024-05-13T21:18:21.202Z	2024-05-14T21:49:39.023Z	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	fd79a476-6a50-4389-a496-ca34724ff38e	10	2024-05-11T22:55:26.785Z	\N	\N
9573e831-471a-4356-acc3-114f8940ab24	004a49df-0306-4891-9cbf-2b40d050c318	10	2024-05-11T23:00:17.772Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	84f83b15-aa13-4b74-8c81-b769f429a6db	10	2024-05-09T21:42:38.196Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	01d3d6df-cd76-4f62-9c39-ddd968a9a634	10	2024-05-09T21:42:46.810Z	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	e82f2b29-1394-4325-a728-f3dd20f1c6bf	10	2024-05-09T21:42:55.387Z	\N	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	8e5bab94-d594-46dd-a855-7675f5d8231f	100	2024-05-13T21:29:11.492Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	77282a94-c627-46ab-a22d-3d19cc00d3c7	100	2024-05-10T23:09:58.172Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	ebaec0d9-c191-495b-88af-6949707ab812	100	2024-05-10T23:10:49.718Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	e1075af4-70c1-4124-b93b-20149f24e57b	100	2024-05-10T23:20:38.649Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	ecfa6079-84f1-41f8-a86f-cf0e133a135e	100	2024-05-10T23:21:42.767Z	\N	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	599bee49-16ea-4ea6-9a4a-ae3043926417	100	2024-05-13T21:29:23.366Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	6763caea-7b53-466a-a9b3-40ebfac0f9bb	10	2024-05-10T23:22:16.488Z	2024-05-11T15:57:41.264Z	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	6ebdfdfa-c7b7-42c3-972c-a15b921d4e66	0	2024-05-13T21:30:02.053Z	2024-05-13T21:30:07.284Z	\N
9b4ff79d-87e5-4eff-99fb-e981f3bc3998	950a9045-f3c3-42d7-bf59-d42c5ef42d29	10	2024-05-11T22:48:47.016Z	\N	\N
9b4ff79d-87e5-4eff-99fb-e981f3bc3998	20d95bd9-0113-4b90-914e-7e1083cb5cd6	10	2024-05-11T22:49:12.314Z	\N	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	a9c5cfe0-a05c-4e45-b38a-f5db5f837304	100	2024-05-13T21:28:49.005Z	2024-05-13T21:36:33.575Z	\N
429fc597-b5ed-4224-8401-54668f171d19	8f2d2855-7c53-418f-929b-222e431be3b7	0	2024-05-13T00:58:37.161Z	2024-05-14T00:01:41.309Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	0	2024-05-13T00:43:07.785Z	2024-05-15T00:48:52.797Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	a1e9e0d1-cf48-4f52-8f41-cc24e44a9cce	0	2024-05-11T22:57:56.219Z	2024-05-15T00:53:23.443Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	2ac83258-0e18-4373-9edc-d78286bc955c	0	2024-05-13T00:48:33.097Z	2024-05-15T00:53:34.489Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	8fe8f879-5cc8-4670-a13d-9d2d6bb24017	0	2024-05-11T22:13:19.726Z	2024-05-15T01:02:23.704Z	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	10	2024-05-11T22:55:09.498Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	91abb062-c815-448b-9efb-817a6b860808	1	2024-05-11T22:57:24.528Z	\N	\N
830e3066-a383-4ef9-9aaf-efc87ad30ed5	29a5dd12-fba3-49db-8c3a-13f706d195d7	10	2024-05-13T00:38:50.757Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	76c0cb36-9ee0-422f-8050-b422ff53b9d3	100	2024-05-11T22:33:05.763Z	2024-05-13T00:48:57.672Z	\N
353f8450-1885-4b98-a243-01a19593d1fd	e87c2f41-f417-4ee0-b818-9adfe7c790e9	10	2024-05-11T21:58:51.300Z	2024-05-13T00:54:38.285Z	\N
806120c1-8d63-4f67-9351-eb3253cad789	85255f2d-f774-48bb-aeec-66b711ebcd2c	100	2024-05-10T23:16:26.273Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	f8c5ed02-4833-4676-9247-907d4ac9cafe	100	2024-05-10T23:21:06.391Z	\N	\N
eb98c8bb-aa91-4de1-af23-49d4e3a876ac	f7916ade-1729-4e90-a42e-cba73f262692	0	2024-05-13T21:40:45.581Z	2024-05-13T21:43:07.109Z	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	873f0443-1ed1-4044-ae2e-da17f59ddfc0	100	2024-05-10T23:38:17.976Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	ef206d20-b798-4215-bebb-e53afd8f4a69	100	2024-05-10T23:39:35.564Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	689c1d43-a7ee-4b95-97df-1558fbfcb863	100	2024-05-10T23:39:44.756Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	100	2024-05-10T23:39:56.053Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	367ed746-6c87-41d9-a29e-bf3540360ccf	100	2024-05-10T23:40:05.212Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	27bc61d5-5d38-4060-a362-785a4c2c061c	0	2024-05-11T22:59:58.215Z	2024-05-14T15:09:10.390Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	683a84ad-681b-4971-a3ba-59694387304b	0	2024-05-12T16:09:16.534Z	2024-05-14T15:12:06.196Z	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	ea69d128-1dd3-49de-8b6e-df772a2ad9a7	100	2024-05-11T00:01:50.064Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	365c0732-be69-4de2-960e-d8f6d726bd48	0	2024-05-12T16:09:41.292Z	2024-05-14T15:14:37.227Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	65bc4ea4-a0db-4ac4-b343-b9d587be224b	0	2024-05-12T16:01:12.274Z	2024-05-14T15:15:08.723Z	\N
f2474450-56fd-4f80-b189-0eb91c5c54f5	970603df-a58e-4cbf-94f1-4aff2c5743a1	0	2024-05-13T00:40:42.626Z	2024-05-14T22:21:56.885Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	a46e43f3-6678-402a-93de-efa7f8d42006	0	2024-05-12T16:03:11.094Z	2024-05-15T00:53:44.688Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	b56b869f-3adf-4626-903f-13727027801f	0	2024-05-11T22:55:32.034Z	2024-05-15T00:54:39.318Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	578809ce-d533-43df-ad00-3e61af85d73c	0	2024-05-12T16:09:23.958Z	2024-05-15T00:58:55.426Z	\N
b818a598-5d62-46cf-867c-ece997cb5856	edcb4032-d028-48ee-9811-b6004b277877	10	2024-05-11T02:35:46.645Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	cc4fe301-5eaa-4792-bfd0-33ee4f4a64ad	10	2024-05-11T02:37:46.592Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	a1e9e0d1-cf48-4f52-8f41-cc24e44a9cce	10	2024-05-11T02:41:50.088Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	c096c90d-0710-4804-801c-e5a2b8d14e6f	10	2024-05-11T02:43:08.338Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	70f0cc2e-b5b6-4fe6-8824-a5390d566069	10	2024-05-09T21:59:48.473Z	2024-05-12T15:16:09.436Z	\N
f2474450-56fd-4f80-b189-0eb91c5c54f5	2c0eabfd-5c22-4174-b93d-b814a7706b9e	10	2024-05-13T00:40:36.790Z	\N	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	100	2024-05-09T22:01:47.351Z	\N	\N
eb98c8bb-aa91-4de1-af23-49d4e3a876ac	2417b138-3451-4da2-9172-f06ee77a6b1d	0	2024-05-13T21:43:17.612Z	2024-05-13T21:44:17.432Z	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	e30c8efd-29f1-4414-9f5e-080b7e1f6fa3	10	2024-05-13T21:47:46.514Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	6e71e6ec-9335-4db3-a0bd-4cfc3bed41f9	100	2024-05-13T21:48:13.172Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	100	2024-05-10T23:38:28.022Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	1b45a959-c141-4d5b-a112-49cc10985fa1	100	2024-05-10T23:38:51.728Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	be7369e0-e867-4443-948e-49b2a2b075b4	100	2024-05-10T23:40:27.119Z	\N	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	d7e04a50-cb47-40c5-a5d0-6155b9704cde	100	2024-05-13T21:51:06.689Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	b9b2ba22-62c1-429f-839c-65990c47a3e7	100	2024-05-10T23:59:39.849Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	e82f2b29-1394-4325-a728-f3dd20f1c6bf	100	2024-05-11T00:00:12.595Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	9e66cff1-37e1-4631-8251-c7b03b287ada	0	2024-05-13T22:01:49.230Z	2024-05-13T22:02:20.882Z	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	73fbacb1-0736-49ec-8873-80ddd65608a2	100	2024-05-13T22:28:31.117Z	\N	\N
9eaaf07a-ca5b-4633-8b5e-0954f79be0f2	b3b04603-b2a8-4178-a12c-606177a04178	100	2024-05-13T22:33:06.630Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	7dafb07f-4bf3-46ce-8c1a-5750397b51c0	0	2024-05-13T22:55:30.788Z	2024-05-13T22:58:37.270Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	a16b02b5-c7bb-4eab-bf78-0d9b073566d8	0	2024-05-13T15:04:27.192Z	2024-05-13T22:59:31.602Z	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	f78c85b4-fcac-4854-970b-d80f201d5aa3	100	2024-05-09T22:12:56.370Z	2024-05-11T13:22:30.632Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	b9368d94-0425-4b23-ada4-66f8986f7368	1	2024-05-13T23:00:03.750Z	\N	\N
69c1b76a-524b-4c16-9ced-32a789e0a186	9ee6fd99-6604-438c-a3cc-15d2c7f997ed	100	2024-05-13T23:04:08.946Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	6e71e6ec-9335-4db3-a0bd-4cfc3bed41f9	0	2024-05-13T23:03:59.744Z	2024-05-13T23:58:57.812Z	\N
429fc597-b5ed-4224-8401-54668f171d19	e30c8efd-29f1-4414-9f5e-080b7e1f6fa3	0	2024-05-13T23:02:20.360Z	2024-05-14T00:04:37.401Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	73fbacb1-0736-49ec-8873-80ddd65608a2	0	2024-05-13T00:44:59.892Z	2024-05-14T15:13:41.242Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	6dcb288d-7023-4375-8fb7-fcad84f946e2	0	2024-05-11T23:01:39.925Z	2024-05-14T15:15:17.958Z	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	0	2024-05-09T22:12:37.014Z	2024-05-14T17:36:17.925Z	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	b9368d94-0425-4b23-ada4-66f8986f7368	1	2024-05-09T22:13:44.008Z	2024-05-14T17:36:36.773Z	\N
eb98c8bb-aa91-4de1-af23-49d4e3a876ac	d6a8c7f3-3b0c-4430-99c5-fab632a5490c	0	2024-05-13T21:44:00.209Z	2024-05-14T18:38:17.664Z	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	e162ec59-91e5-4621-8a2a-05848cd0f368	10	2024-05-09T22:01:33.335Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	1de20395-c5ed-4f98-9090-166ffe118c11	10	2024-05-13T22:52:43.972Z	\N	\N
255a9dec-f128-4be8-b58e-abf5a5afca7f	48b8392c-9bcf-4b94-abff-33b565af4edd	100	2024-05-13T23:28:03.958Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-10T23:56:43.028Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	43a27a70-3ed5-4a3d-8428-623810c3f717	100	2024-05-10T23:56:58.106Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	14bb5f33-7c73-441d-a3b6-27fd7348dce3	100	2024-05-10T23:57:03.698Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	fcfdeaeb-0760-4f93-bac9-76b804551ce9	100	2024-05-10T23:57:16.747Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	100	2024-05-10T23:57:33.976Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	af26cae5-8bae-420c-8052-782b9598fded	100	2024-05-10T23:57:49.971Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	4ae4acec-ee0d-40f3-931c-37759e97ecff	100	2024-05-10T23:58:00.948Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	58c7d1c9-8e7f-4d68-8ede-da32a40500bc	100	2024-05-10T23:58:10.840Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	edcb4032-d028-48ee-9811-b6004b277877	100	2024-05-11T00:00:03.102Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	100	2024-05-11T00:00:29.548Z	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	115de606-b9d6-475b-953b-d838d8783dd6	100	2024-05-11T00:01:41.962Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	e162ec59-91e5-4621-8a2a-05848cd0f368	100	2024-05-11T23:07:08.307Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	100	2024-05-11T23:07:51.828Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	869ed149-9375-4fac-a687-d5450b53ceb8	100	2024-05-11T23:09:03.450Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	025d81fb-d637-469e-b992-697aece2e53d	10	2024-05-13T00:44:40.191Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	b7349827-482c-4c5c-b0eb-7627a8380c16	10	2024-05-11T20:15:39.575Z	2024-05-13T15:24:04.757Z	\N
9ee3b69e-4c7f-478c-8059-3916ec8a7c2a	6763caea-7b53-466a-a9b3-40ebfac0f9bb	100	2024-05-13T23:09:50.085Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-09T22:13:07.630Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	27c3707c-4a0b-4b43-8f8c-1b4bba103aa9	0	2024-05-09T22:13:18.382Z	2024-05-14T17:35:55.144Z	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	6a220720-6fa3-42cc-8101-621da51b521f	0	2024-05-09T22:13:57.707Z	2024-05-14T17:37:22.331Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	e0a4593b-5e8f-4f1e-89de-e584e8cdc843	0	2024-05-11T23:28:31.084Z	2024-05-14T18:46:56.326Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	6c8684ed-85ad-49c0-a76e-cb34e7538f4d	100	2024-05-11T23:29:16.140Z	2024-05-14T18:53:34.098Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	4ae6c9da-c2d7-4381-a309-a938b0258122	0	2024-05-11T23:23:58.123Z	2024-05-14T19:01:01.797Z	\N
38050655-12ed-4698-bce2-59089feb4d61	1f136e6b-3881-4341-b169-5a4ec852c888	100	2024-05-11T23:06:51.399Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	10	2024-05-11T23:07:00.051Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	876548db-d180-4083-96ba-cddcb86134b0	10	2024-05-11T23:07:16.893Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	1976695e-a2d4-46c5-afa8-438094954f48	100	2024-05-11T23:07:33.484Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	15121282-bdc8-4096-845b-974401b2e6aa	10	2024-05-11T23:07:38.805Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	9e66cff1-37e1-4631-8251-c7b03b287ada	100	2024-05-11T23:09:45.230Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	35f6046a-c2a2-4e4b-a857-f8de763e229a	0	2024-05-11T23:25:12.427Z	2024-05-14T19:34:07.649Z	\N
806120c1-8d63-4f67-9351-eb3253cad789	3453dec4-2fa0-4a3d-a053-0af80abdc82c	10	2024-05-11T23:09:48.561Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	c905ca5a-0564-4d2a-b9b9-585cbce1cc62	100	2024-05-11T23:09:54.117Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	dfbf27f0-d560-4aea-aba6-532a6346b994	0	2024-05-11T23:25:35.625Z	2024-05-14T19:40:08.481Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	768e744a-7637-4e64-b5fb-e7ff295ae993	0	2024-05-13T23:23:47.850Z	2024-05-15T00:35:59.581Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	b813d3b5-bf55-443b-b1a4-be3d426af4e9	10	2024-05-11T23:03:40.315Z	2024-05-15T00:44:51.130Z	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	24e95cd1-71cf-406f-b256-80ce535f8e65	0	2024-05-11T23:12:30.227Z	2024-05-15T01:37:04.974Z	\N
38050655-12ed-4698-bce2-59089feb4d61	d8b0c9ec-39a1-44e4-9ccf-36b439e39368	10	2024-05-11T23:10:05.652Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	4bd475d3-779b-45bb-b9f9-7a6052bc41fb	100	2024-05-11T23:10:14.868Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	2a9edf46-7b97-4f71-8144-15a60614e095	10	2024-05-11T20:16:42.983Z	2024-05-11T23:11:57.567Z	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	6c8684ed-85ad-49c0-a76e-cb34e7538f4d	10	2024-05-11T23:12:13.707Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	43a27a70-3ed5-4a3d-8428-623810c3f717	10	2024-05-11T23:12:20.488Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	7a841996-d096-4752-b071-263d1166fcbc	10	2024-05-11T23:12:21.213Z	\N	\N
98afa669-bade-40c8-b052-980e5025f58e	e15b969f-d5fe-48cf-80ea-443be9dc5785	10	2024-05-11T23:13:55.391Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	869ed149-9375-4fac-a687-d5450b53ceb8	10	2024-05-11T23:14:10.557Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	55c702ec-d2b4-494d-9082-3985dbeb3a28	10	2024-05-11T23:15:54.816Z	\N	\N
4f9d5e9b-43eb-4ba7-919b-4be27e988a79	86cad6e9-5244-4991-9340-eed4798547ae	10	2024-05-11T23:25:12.123Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	c8ce7a65-be98-4e38-beaa-b9907dc003e9	10	2024-05-11T23:39:33.667Z	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	87d09650-d0e9-4203-867e-b6e167a1171b	10	2024-05-13T01:47:36.282Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	f94729df-e289-49d8-b55c-19ebdbfd783c	10	2024-05-09T22:28:17.895Z	\N	\N
255a9dec-f128-4be8-b58e-abf5a5afca7f	a46e43f3-6678-402a-93de-efa7f8d42006	100	2024-05-13T23:28:15.529Z	\N	\N
a310934f-0b7c-44a2-9b2e-0b240eb6edee	d580d7f8-a8be-4212-9ed8-8e1d52f4c384	10	2024-05-11T23:20:14.462Z	\N	\N
255a9dec-f128-4be8-b58e-abf5a5afca7f	d7f296ff-11e1-45cf-a360-7989c69affb1	100	2024-05-13T23:28:24.334Z	\N	\N
255a9dec-f128-4be8-b58e-abf5a5afca7f	65bc4ea4-a0db-4ac4-b343-b9d587be224b	100	2024-05-13T23:28:28.609Z	\N	\N
255a9dec-f128-4be8-b58e-abf5a5afca7f	4ae4acec-ee0d-40f3-931c-37759e97ecff	100	2024-05-13T23:28:39.702Z	\N	\N
255a9dec-f128-4be8-b58e-abf5a5afca7f	319870a5-c97e-48b4-b5b8-4d05fcc09fdc	1	2024-05-13T23:28:52.189Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	950a9045-f3c3-42d7-bf59-d42c5ef42d29	0	2024-05-13T02:02:50.522Z	2024-05-14T10:36:10.667Z	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	3704be1c-459a-4c7d-a18c-34dfd3a1c6cd	100	2024-05-09T22:29:05.488Z	2024-05-12T19:58:16.737Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	f3981a34-0d70-4791-b234-9d9026b27f5b	0	2024-05-13T23:23:27.576Z	2024-05-14T20:26:13.914Z	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	4eb7c42e-8499-438d-9298-3ca063eca896	100	2024-05-11T01:21:02.688Z	\N	\N
a310934f-0b7c-44a2-9b2e-0b240eb6edee	ab7786c6-8133-42c0-871e-6bbacca60c5e	10	2024-05-11T23:20:35.007Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-11T23:08:01.837Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	2fe71172-ab32-490e-91ae-0ec727bd3d52	100	2024-05-11T23:08:10.472Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	66a98038-4588-431c-814d-0c440c4683af	10	2024-05-11T23:08:13.113Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	258deaa1-d4c1-4e51-9a29-9883f68d506d	100	2024-05-11T23:08:20.345Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	1822d9b2-10f4-4e0d-a39a-b987ed707fae	100	2024-05-11T23:09:15.401Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	4f44cc87-8684-4327-9fb6-0a55d3464020	10	2024-05-11T23:09:17.377Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	d4bfdb7f-b11d-405d-99c6-99c135eb89d4	100	2024-05-11T23:09:20.968Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	0eb81d00-fdee-4740-9070-bf23874d35a9	100	2024-05-11T23:09:32.175Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	03ce9af4-367a-4ff3-be16-8014eb017f2f	10	2024-05-11T23:11:46.274Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	e3f24520-666e-47d0-ad10-73a9110b3ad4	10	2024-05-11T23:13:15.895Z	\N	\N
98afa669-bade-40c8-b052-980e5025f58e	ad6d006f-06d6-41e6-adaa-6c265225c8e7	10	2024-05-11T23:14:27.962Z	2024-05-11T23:14:38.113Z	\N
98afa669-bade-40c8-b052-980e5025f58e	01143932-fcb6-433b-8ae4-e491802a41d3	10	2024-05-11T23:14:57.583Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	f3eb355a-4868-48af-befc-38a8a565c8e4	10	2024-05-11T23:15:07.650Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	84d5b5f4-3c06-4b70-946e-dd258278c7b2	10	2024-05-11T23:16:08.353Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	85132717-39a0-41bb-8409-6ecf6ec77019	10	2024-05-11T23:16:17.999Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	0676bbe1-5bb4-4bd1-94b6-7a5038ecd41e	10	2024-05-11T23:16:32.531Z	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	10	2024-05-11T23:16:57.776Z	2024-05-12T18:13:52.293Z	\N
353f8450-1885-4b98-a243-01a19593d1fd	14bb5f33-7c73-441d-a3b6-27fd7348dce3	10	2024-05-11T23:21:14.058Z	\N	\N
a310934f-0b7c-44a2-9b2e-0b240eb6edee	66a98038-4588-431c-814d-0c440c4683af	10	2024-05-11T23:22:35.748Z	\N	\N
a310934f-0b7c-44a2-9b2e-0b240eb6edee	e4e767ff-be22-4c15-99a3-fac2b97683df	10	2024-05-11T23:22:52.151Z	\N	\N
a310934f-0b7c-44a2-9b2e-0b240eb6edee	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-11T23:22:58.630Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	8f000e6a-c3cf-43ea-a947-f5df7150caa4	10	2024-05-10T14:37:49.801Z	2024-05-11T23:42:06.847Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	3ce35ddd-0dac-41f9-88a9-27a509c5df0b	10	2024-05-11T23:42:25.897Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	f76cd266-64e7-4968-854b-6308be0fe2a5	10	2024-05-09T22:24:55.333Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	100	2024-05-11T23:39:20.999Z	2024-05-13T12:41:33.588Z	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	74dc7f47-7298-418b-9b5b-04c47914721b	10	2024-05-09T22:28:02.998Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	1f136e6b-3881-4341-b169-5a4ec852c888	10	2024-05-13T23:55:07.052Z	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	5d5ba6d2-2853-4b3c-aecb-5f86a8e75707	100	2024-05-11T01:27:19.428Z	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	599bee49-16ea-4ea6-9a4a-ae3043926417	100	2024-05-11T01:27:26.922Z	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	3e85a0d3-2717-44bb-8b4b-8ce1a0d2374d	100	2024-05-11T01:28:38.832Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	b8598db7-a21f-4bba-8ed4-d0317b0a5df8	10	2024-05-13T23:55:17.921Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	f33825fd-e6b0-47bb-80c0-80aef8a42e19	10	2024-05-13T23:55:25.499Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	b910c015-09ec-4052-968e-a29db81d5912	100	2024-05-11T23:09:09.870Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	0774d214-1b04-4d83-90bb-bf30662b9a5a	10	2024-05-11T23:10:23.371Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	bd2a5ee3-0fc6-4777-b4d1-4bb38ebbd0d4	100	2024-05-13T23:57:56.120Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	10	2024-05-13T23:58:31.978Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-11T23:10:33.458Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	a7012e24-590a-4197-bf55-6f4f5392cf8b	10	2024-05-11T23:10:38.359Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	22d6eaff-3933-418f-9287-7e45c300bfad	100	2024-05-11T23:10:48.148Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	8812cea7-01bc-4c7f-892d-cd0071589195	100	2024-05-13T23:58:58.249Z	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	6b1d5955-578e-4b7c-a66a-118060c94901	10	2024-05-11T23:11:04.337Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	8e216fb9-2ce0-4804-9263-b29e8a1eeb71	10	2024-05-11T23:11:04.367Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	c957dded-1e08-4e25-a2f8-80d111aef57b	10	2024-05-13T23:59:44.015Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	f057afa8-7569-4d01-aae5-809e3c17a1e2	10	2024-05-11T23:11:29.821Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	d276802d-0992-4f87-b5fa-04e5ee6a10c1	100	2024-05-14T00:00:45.670Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	172c7042-1a1a-4ed0-9cd7-9f818efde80a	100	2024-05-14T00:01:00.473Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	460c72c0-b362-4fe8-a7e8-06aabe57cccd	10	2024-05-11T23:17:36.713Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	5aac6b69-af17-4c0e-b0d0-1621211bc14c	100	2024-05-11T23:18:03.397Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	3edbdcb6-ff0a-4de4-b5c9-24c30de29132	10	2024-05-11T23:21:33.048Z	\N	\N
a310934f-0b7c-44a2-9b2e-0b240eb6edee	61c906b1-396f-4221-8637-7096bc08a004	10	2024-05-11T23:22:02.811Z	\N	\N
a310934f-0b7c-44a2-9b2e-0b240eb6edee	55020e2d-1413-46ab-9b94-b31d48f87bd4	10	2024-05-11T23:22:13.703Z	\N	\N
a310934f-0b7c-44a2-9b2e-0b240eb6edee	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-11T23:22:45.441Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-11T22:01:48.036Z	2024-05-11T23:23:02.072Z	\N
a310934f-0b7c-44a2-9b2e-0b240eb6edee	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-11T23:23:07.291Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	fd54a76a-cdb9-4543-9df6-24baa384e38c	100	2024-05-14T00:01:33.390Z	\N	\N
4f9d5e9b-43eb-4ba7-919b-4be27e988a79	81b2e05e-41cf-4bb0-96c2-a622640e6f85	10	2024-05-11T23:24:43.074Z	\N	\N
69c1b76a-524b-4c16-9ced-32a789e0a186	42b139ee-4c4b-4714-ab0c-bd92689d6260	10	2024-05-11T23:29:11.795Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	d4911ed9-d013-48bb-a763-c5e41e7d61e4	10	2024-05-14T00:03:10.943Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	af26cae5-8bae-420c-8052-782b9598fded	10	2024-05-11T23:31:47.280Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	2c98279b-bbd2-4645-96a3-51edb69cf509	100	2024-05-14T00:03:33.376Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	f3c395aa-63af-4264-99e0-2bd29760c62e	10	2024-05-11T23:39:47.459Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	55bf190c-f2eb-4f80-89f0-76dec0843ad4	10	2024-05-11T23:40:06.858Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	27493e1f-4f5c-4149-aabf-9c4f6697a35f	10	2024-05-11T23:50:44.843Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	4f44cc87-8684-4327-9fb6-0a55d3464020	10	2024-05-14T00:09:45.166Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	3814a22f-b8a5-426e-ac21-138c2d62a0ba	100	2024-05-14T00:10:26.699Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	2247cd19-88cd-47de-8d62-a003564f27f5	100	2024-05-14T00:10:40.184Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	e22bf0ca-5fef-46f2-bc54-a3b627d41080	100	2024-05-14T00:11:28.766Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	eaefed6b-0638-4d5a-86c1-42801b2b1ac7	100	2024-05-14T00:13:04.971Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	88fa7edf-2f9d-43e9-b983-86aa6fc63374	10	2024-05-11T23:09:38.744Z	2024-05-12T15:02:44.891Z	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	552e881e-ed4a-414b-914e-36a0dd85d0a4	100	2024-05-14T00:01:17.047Z	2024-05-15T01:35:26.478Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	fab30458-721d-4712-90d5-3c15e0e102e9	0	2024-05-11T23:28:06.032Z	2024-05-14T18:45:52.667Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	9c28c037-b76a-443a-9e9d-33312e926174	0	2024-05-11T23:24:32.546Z	2024-05-14T19:33:04.781Z	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	53e92ec3-dfcb-4ac2-adf4-0fd1fa963756	1	2024-05-11T23:17:09.336Z	2024-05-12T18:14:32.597Z	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	eadb6611-5c04-4050-9be4-fd2b4eacd182	0	2024-05-14T00:11:45.667Z	2024-05-15T01:15:00.030Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	62bd5d05-ba37-497a-a1a1-56795813790d	0	2024-05-12T00:10:17.133Z	2024-05-13T16:29:06.678Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	6d451ef8-e962-423c-8fc8-5fb0eb848766	0	2024-05-12T00:06:23.716Z	2024-05-13T16:40:07.228Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	f8ba58b3-6549-49b7-b400-81ce225d365d	0	2024-05-12T00:04:20.218Z	2024-05-13T16:40:53.377Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	b9368d94-0425-4b23-ada4-66f8986f7368	0	2024-05-12T00:03:34.930Z	2024-05-13T16:43:09.761Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	053d6422-e791-474c-9820-90252e04da58	0	2024-05-12T00:12:36.220Z	2024-05-13T16:58:17.877Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	f78c85b4-fcac-4854-970b-d80f201d5aa3	0	2024-05-12T00:15:02.772Z	2024-05-13T17:03:36.429Z	\N
c082783c-12d1-4174-9e59-276a5c647079	0d90cc33-ff13-420c-bfa3-2e155200aa07	10	2024-05-09T23:30:46.333Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	0	2024-05-12T00:15:32.169Z	2024-05-13T17:05:31.591Z	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	46862e71-22b7-4023-ba93-2936050c6f9f	100	2024-05-13T23:55:37.993Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	10	2024-05-13T23:55:50.433Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	063d43f1-9f08-4943-8f82-b51aa4e49924	100	2024-05-09T23:39:33.765Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	689c1d43-a7ee-4b95-97df-1558fbfcb863	100	2024-05-09T23:40:20.909Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	bbca6f5f-96e5-4329-8a54-c0a618d5f99e	100	2024-05-09T23:44:19.703Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	3ee51ac3-056c-4e53-9062-93df16dac1b3	100	2024-05-09T23:44:45.975Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	ec86de23-73b3-45f1-a5c7-a2715dc64796	100	2024-05-09T23:44:57.854Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	01794c4c-0038-4330-a478-0d10c85fb2d0	100	2024-05-09T23:47:31.976Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	5a68adc5-f0cc-44f6-99e4-12cd88662d08	100	2024-05-09T23:48:59.343Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-13T23:56:07.563Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	945b1d7a-17ac-4646-92ef-018669cee133	10	2024-05-13T23:56:29.644Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	5c1839cf-e5e9-4963-9018-c4d6f9ac5aeb	0	2024-05-12T00:32:47.062Z	2024-05-14T15:56:16.316Z	\N
fbe32f25-fa62-422d-823d-f388000f47d4	c7493f68-4e46-453d-9bf0-36fff3189bf7	0	2024-05-12T00:41:13.363Z	2024-05-14T23:36:57.115Z	\N
b818a598-5d62-46cf-867c-ece997cb5856	dc359231-d372-495a-a9e0-2bbd47965809	10	2024-05-11T02:39:01.628Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	74dc7f47-7298-418b-9b5b-04c47914721b	10	2024-05-11T02:41:19.633Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	cbe1445b-256b-4d93-8829-6a1fda8f526c	10	2024-05-11T03:07:02.793Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	844fa0a8-93a3-481e-8221-d6d385274281	10	2024-05-12T00:31:33.916Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-11T23:44:00.875Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	6763caea-7b53-466a-a9b3-40ebfac0f9bb	10	2024-05-11T23:44:36.026Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	4c170954-1c43-4928-9014-d3b057e4a5ca	10	2024-05-11T23:45:15.134Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	2df34cb2-b419-4cd9-bac0-fee998327fd6	10	2024-05-11T23:45:36.222Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	2ac83258-0e18-4373-9edc-d78286bc955c	10	2024-05-11T23:46:05.708Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	1d02a2b6-3aed-4dd4-acd1-27acb87856f3	10	2024-05-11T23:52:34.422Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-11T23:53:26.981Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	abf86d41-3ba4-4dde-b0ac-3468fe06ba87	10	2024-05-11T23:56:18.199Z	\N	\N
fc8d1f85-1d79-4d81-aad7-260a6cb0489f	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-12T00:03:29.658Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	5a68adc5-f0cc-44f6-99e4-12cd88662d08	100	2024-05-09T22:32:12.871Z	2024-05-12T19:59:17.722Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	b813d3b5-bf55-443b-b1a4-be3d426af4e9	100	2024-05-11T23:51:41.238Z	2024-05-13T13:06:04.375Z	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	f013501e-e9ea-478f-af0d-648f96244b14	100	2024-05-13T23:56:43.826Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	52bd1913-9ae1-413d-8258-205049df62e6	100	2024-05-13T23:56:55.005Z	\N	\N
5d7ea8ee-34d8-441a-a1f7-837a8ae94dd4	8c80d8dc-10c1-45a8-a307-1626632db409	0	2024-05-13T23:56:57.383Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	ca0ef946-0de3-47a2-a0cb-df72de35aeec	100	2024-05-13T23:57:12.404Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	15129370-e9f5-4797-87cf-225625bc7642	100	2024-05-13T23:57:32.185Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-11T02:34:58.499Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	5facb97a-2e27-4ddf-bbde-0aeed05bb262	10	2024-05-11T02:35:11.968Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	3b7a9689-8c41-4090-9084-5b8e31a1d7d5	10	2024-05-11T02:35:36.597Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	ca0ef946-0de3-47a2-a0cb-df72de35aeec	10	2024-05-11T02:35:56.755Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	f1570b6d-f756-493e-a151-115f51f1e747	100	2024-05-13T23:58:16.173Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	7982a520-ecc8-4cf9-a8be-2bd40550bd31	10	2024-05-11T02:36:26.885Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	84f83b15-aa13-4b74-8c81-b769f429a6db	10	2024-05-11T02:36:44.374Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	9ef89eb7-35f7-43bb-86ac-4d5df6516fbe	10	2024-05-11T02:40:16.039Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	19237243-240d-4b13-b4b5-1cc2ae01571d	10	2024-05-13T23:59:23.366Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	d8b0c9ec-39a1-44e4-9ccf-36b439e39368	100	2024-05-14T00:00:18.246Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	a9c5cfe0-a05c-4e45-b38a-f5db5f837304	10	2024-05-11T23:46:47.814Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	e0a4593b-5e8f-4f1e-89de-e584e8cdc843	10	2024-05-11T23:48:17.783Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	0eb81d00-fdee-4740-9070-bf23874d35a9	10	2024-05-11T23:52:18.559Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	180bed77-0c81-45d1-be29-b094c8263533	100	2024-05-14T00:02:01.073Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	723e8686-19d8-4b51-a250-e05885d9e081	100	2024-05-14T00:04:23.959Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	bbdd5c64-f80e-4233-9928-7931fe5e3703	10	2024-05-11T23:55:35.711Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	73d62b87-49ae-48d7-9001-868839648b25	100	2024-05-14T00:05:01.960Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	01794c4c-0038-4330-a478-0d10c85fb2d0	100	2024-05-14T00:05:32.155Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	319870a5-c97e-48b4-b5b8-4d05fcc09fdc	100	2024-05-14T00:05:52.735Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	69732c83-e2ee-481f-b4c5-e55932e8d51f	100	2024-05-14T00:06:32.985Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	5f805e7a-39fc-4759-936c-9a0097a5b8a6	100	2024-05-14T00:06:51.110Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	c8642f4a-7ee0-49a7-aec8-e18eab2e2c69	100	2024-05-14T00:07:54.314Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	caa77bd6-4cf9-44a5-aa24-2e68c899081a	10	2024-05-14T00:08:18.932Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	dddc18c7-f4d7-43d6-9007-40599f10cc16	100	2024-05-14T00:08:49.589Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	8dcf60fe-758b-4137-93b6-cac321724df2	100	2024-05-14T00:13:36.430Z	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	1aa1cd13-4803-4871-8bd6-a8006a6cf52a	100	2024-05-14T00:39:35.790Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	c22f92e8-d065-455e-867d-534f12705bbf	100	2024-05-14T00:39:45.367Z	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	17319b12-0d9f-4d54-b516-3a1d2c0ff396	100	2024-05-14T00:39:55.213Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	d87b626c-0bff-48ff-b457-29cc838cf86e	100	2024-05-14T00:40:50.151Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	b8053337-313e-439a-ab78-93389a94b8e8	100	2024-05-14T00:41:24.090Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	4f162c9f-b72a-4661-a8f2-1cb269353d24	100	2024-05-14T00:41:52.117Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	61735e25-7502-4864-9a02-cbec10b78700	100	2024-05-14T00:42:46.085Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	e3a566f8-4b17-41a1-9753-7dc84fa1c53a	100	2024-05-14T00:42:59.782Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	db326b44-ce02-443b-bbe1-deec70fa9a7b	100	2024-05-14T00:43:12.744Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	5eda163a-d542-43c4-9a50-ccd004411f2e	100	2024-05-14T00:43:45.425Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	3b7a9689-8c41-4090-9084-5b8e31a1d7d5	10	2024-05-14T00:55:54.427Z	\N	\N
06e4a171-8579-4b18-9597-d637fe01fdda	1de20395-c5ed-4f98-9090-166ffe118c11	100	2024-05-14T00:56:06.326Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	cd9c4c7a-b1d1-4b85-9a90-a1968b1dc420	0	2024-05-12T00:10:53.012Z	2024-05-13T16:22:30.691Z	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	352af921-b2eb-4ca8-9775-5f124c622d6b	10	2024-05-09T22:42:28.099Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	3edbdcb6-ff0a-4de4-b5c9-24c30de29132	10	2024-05-09T22:47:44.822Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	e22bf0ca-5fef-46f2-bc54-a3b627d41080	0	2024-05-12T00:05:57.956Z	2024-05-13T16:39:11.084Z	\N
b818a598-5d62-46cf-867c-ece997cb5856	c7912559-1554-4014-a088-2bbf51ca6da3	10	2024-05-11T02:58:19.261Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	a1e9e0d1-cf48-4f52-8f41-cc24e44a9cce	0	2024-05-12T00:04:42.639Z	2024-05-13T16:44:13.594Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	9717b995-f922-4e7e-970b-c0275d597c01	0	2024-05-12T00:05:05.500Z	2024-05-13T16:47:09.839Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	faeac6fc-4c69-4e2b-9b15-b47e85af78ba	10	2024-05-11T23:57:29.499Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	6374669b-f8a0-433b-a6af-349529a9e31a	10	2024-05-14T00:10:22.708Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	86cad6e9-5244-4991-9340-eed4798547ae	100	2024-05-14T00:14:36.654Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	cbb08cdc-a4ec-48d0-812e-66c0448cb12c	100	2024-05-14T00:15:35.139Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	3e580c9b-a7d3-4b37-ad53-e9ec9f63e479	10	2024-05-12T00:25:54.508Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	c732940a-aa1a-4882-bab3-59783d515947	10	2024-05-12T00:26:30.759Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	063d43f1-9f08-4943-8f82-b51aa4e49924	10	2024-05-12T00:26:50.095Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	31ed387d-9786-44eb-88fb-3e19e00ba53a	10	2024-05-12T00:27:08.908Z	\N	\N
4f9d5e9b-43eb-4ba7-919b-4be27e988a79	0bd6022d-21b2-47d1-8a71-1f679b62541c	10	2024-05-12T00:27:15.065Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	e4cfa4d9-183d-42a4-8c39-994c734d8b49	10	2024-05-12T00:27:49.813Z	\N	\N
4f9d5e9b-43eb-4ba7-919b-4be27e988a79	bc43d2f6-7c4f-4d38-8269-b66b085fcb8a	10	2024-05-12T00:27:56.998Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	0f0fffef-ec91-4dc1-b8ac-41d189b1b026	100	2024-05-14T00:38:27.380Z	\N	\N
4f9d5e9b-43eb-4ba7-919b-4be27e988a79	03ce9af4-367a-4ff3-be16-8014eb017f2f	10	2024-05-12T00:28:06.724Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	2ac83258-0e18-4373-9edc-d78286bc955c	100	2024-05-14T00:38:36.993Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-12T00:28:30.922Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	7982a520-ecc8-4cf9-a8be-2bd40550bd31	10	2024-05-12T00:28:41.690Z	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	8f000e6a-c3cf-43ea-a947-f5df7150caa4	100	2024-05-14T00:38:54.698Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	6b883c42-f01c-4280-aebf-570c10276c60	100	2024-05-14T00:39:09.219Z	\N	\N
62a17be9-a744-42a6-a7dd-8ce2872c56c8	a944ad5c-36b6-417f-aa37-7b8c6a825d01	10	2024-05-12T00:37:06.740Z	2024-05-12T16:24:50.009Z	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	1e82efdb-7aaf-4f66-adfa-beb849657760	10	2024-05-12T00:10:52.717Z	2024-05-12T15:01:46.567Z	\N
429fc597-b5ed-4224-8401-54668f171d19	7982a520-ecc8-4cf9-a8be-2bd40550bd31	100	2024-05-14T00:39:19.447Z	\N	\N
296a51a1-523e-4a21-ba1e-1c05be12e33b	1de79252-6c13-466b-ba1a-2e9c009fbfaa	10	2024-05-14T00:46:59.874Z	\N	\N
296a51a1-523e-4a21-ba1e-1c05be12e33b	b8598db7-a21f-4bba-8ed4-d0317b0a5df8	0	2024-05-14T00:46:48.200Z	2024-05-14T00:47:09.293Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	1beaa417-91ee-4ccc-b779-a4c2a5a81807	0	2024-05-12T00:25:44.609Z	2024-05-14T15:08:50.786Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	0	2024-05-12T00:25:30.771Z	2024-05-14T15:08:55.502Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	13a4afa8-2b27-43c2-8ac1-0a2b29ce7832	0	2024-05-12T00:20:11.723Z	2024-05-14T19:55:47.108Z	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	7dafb07f-4bf3-46ce-8c1a-5750397b51c0	10	2024-05-12T00:34:05.919Z	2024-05-13T12:38:13.250Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	799e9f43-b5e8-4484-be33-09c442390253	0	2024-05-12T00:13:14.950Z	2024-05-13T16:42:28.770Z	\N
623a90a2-13fa-4e46-9301-cca050b94a54	84cad0e5-c559-471b-8fc3-de467afc4685	100	2024-05-09T23:39:11.774Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	6a220720-6fa3-42cc-8101-621da51b521f	100	2024-05-09T23:41:04.382Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	4fe297e6-4d45-445e-93a1-0f59f9fb5d68	100	2024-05-09T23:42:19.939Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	f3c395aa-63af-4264-99e0-2bd29760c62e	0	2024-05-12T00:09:54.767Z	2024-05-13T17:05:12.777Z	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	e6ba25e0-1181-49a7-88e8-79c586ddadaa	100	2024-05-14T00:19:06.400Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	c38e4aa6-bc90-4592-ae7d-95d93de12ec4	10	2024-05-11T03:05:13.154Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	a9c5cfe0-a05c-4e45-b38a-f5db5f837304	100	2024-05-11T03:11:22.665Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	8e5bab94-d594-46dd-a855-7675f5d8231f	10	2024-05-11T03:15:56.112Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	dfbf27f0-d560-4aea-aba6-532a6346b994	10	2024-05-11T03:20:54.575Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	55020e2d-1413-46ab-9b94-b31d48f87bd4	1	2024-05-11T23:28:35.253Z	2024-05-13T00:43:22.834Z	\N
62a17be9-a744-42a6-a7dd-8ce2872c56c8	78e9e9be-0d18-4553-9a6f-691462e8db06	100	2024-05-12T00:37:32.024Z	2024-05-14T01:11:31.246Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	0eb81d00-fdee-4740-9070-bf23874d35a9	0	2024-05-12T00:23:19.909Z	2024-05-14T15:09:42.401Z	\N
4f9d5e9b-43eb-4ba7-919b-4be27e988a79	bea72070-859a-4327-8bd8-dba0a8ada786	10	2024-05-12T00:27:01.485Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	4ae6c9da-c2d7-4381-a309-a938b0258122	10	2024-05-12T00:27:27.593Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	03ce9af4-367a-4ff3-be16-8014eb017f2f	0	2024-05-12T00:25:08.924Z	2024-05-14T15:10:16.185Z	\N
aca9f2ce-5d63-4a82-9831-56218267f324	258deaa1-d4c1-4e51-9a29-9883f68d506d	10	2024-05-12T00:29:40.856Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	d1a27ea2-0281-4c95-9154-6509ede0f2dd	10	2024-05-12T00:30:09.541Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	78e9e9be-0d18-4553-9a6f-691462e8db06	0	2024-05-12T00:33:43.484Z	2024-05-14T15:57:20.607Z	\N
aca9f2ce-5d63-4a82-9831-56218267f324	2fe71172-ab32-490e-91ae-0ec727bd3d52	10	2024-05-12T00:29:46.238Z	2024-05-12T00:30:44.080Z	\N
aca9f2ce-5d63-4a82-9831-56218267f324	f51bc934-80c1-4fb6-858f-38f701e88dd9	10	2024-05-12T00:31:15.123Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	580c2fac-3c42-48d2-b79b-2fbc7b6fc7b0	10	2024-05-12T00:31:52.397Z	\N	\N
792ef61b-0f2d-4b0f-9f10-41bbe3327bdf	65d76d06-ff09-40b5-8df8-ead5c4cabe2e	0	2024-05-14T00:29:42.404Z	2024-05-14T18:22:44.157Z	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	7baf0c84-7658-4f5d-829a-36f6194c154f	10	2024-05-10T22:16:27.615Z	2024-05-12T00:32:07.943Z	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	ea69d128-1dd3-49de-8b6e-df772a2ad9a7	10	2024-05-12T00:32:16.858Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	28114a40-6489-4712-b5ba-5968b0fc8fd9	100	2024-05-12T00:33:57.395Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	5880fcb0-dd0e-4681-b97d-a1f501152fc6	10	2024-05-12T00:10:17.508Z	2024-05-12T15:01:39.696Z	\N
62a17be9-a744-42a6-a7dd-8ce2872c56c8	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	10	2024-05-12T00:36:44.375Z	2024-05-12T16:24:27.938Z	\N
62a17be9-a744-42a6-a7dd-8ce2872c56c8	8e596eea-5ab7-480b-a22f-2af852198a92	10	2024-05-12T00:36:53.186Z	2024-05-12T16:24:36.021Z	\N
62a17be9-a744-42a6-a7dd-8ce2872c56c8	51ccecbb-1d21-447c-9d62-d5b3d2775905	10	2024-05-12T00:37:22.382Z	2024-05-12T16:24:58.663Z	\N
429fc597-b5ed-4224-8401-54668f171d19	715fb8d2-6acd-4b2b-8164-79de7fef3fec	100	2024-05-14T00:39:58.281Z	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	9f8f90ad-55b1-4549-b4b8-2755c3eb1b10	100	2024-05-14T00:40:01.403Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	258deaa1-d4c1-4e51-9a29-9883f68d506d	100	2024-05-09T23:40:47.702Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	2fe71172-ab32-490e-91ae-0ec727bd3d52	100	2024-05-09T23:40:55.264Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	869ed149-9375-4fac-a687-d5450b53ceb8	100	2024-05-09T23:41:31.799Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	70c5fbed-2863-4a0e-bdb0-f07a6f424802	100	2024-05-09T23:45:21.908Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	bc029ecf-f1db-4d05-b032-a87b79985300	100	2024-05-09T23:45:35.019Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	8a6bee81-d3a5-4f61-abc0-a2f56977eb4d	100	2024-05-09T23:45:53.331Z	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	6bca959f-afc2-434e-a716-c6ce6fe71b70	0	2024-05-14T00:42:09.463Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	873f0443-1ed1-4044-ae2e-da17f59ddfc0	100	2024-05-09T23:47:07.495Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	a1f3cbac-ed68-4875-85a3-dae686767837	10	2024-05-11T03:14:29.379Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	7fe4cd2a-9bec-419a-aaae-aa89761c5566	100	2024-05-14T00:42:12.470Z	\N	\N
c76f0f3a-38ae-4f5c-ba05-59f894c25304	724bf57e-7cad-4f73-a2c1-502e2bb8560f	0	2024-05-14T00:46:20.010Z	\N	\N
296a51a1-523e-4a21-ba1e-1c05be12e33b	1f136e6b-3881-4341-b169-5a4ec852c888	0	2024-05-14T00:46:39.327Z	2024-05-14T00:47:05.844Z	\N
296a51a1-523e-4a21-ba1e-1c05be12e33b	dfcde5dc-2359-47d8-9652-ec4606472bbe	10	2024-05-14T00:47:19.547Z	\N	\N
06e4a171-8579-4b18-9597-d637fe01fdda	cc4fe301-5eaa-4792-bfd0-33ee4f4a64ad	100	2024-05-14T00:54:19.968Z	\N	\N
06e4a171-8579-4b18-9597-d637fe01fdda	e5f41a78-0434-425c-b824-aff55a752052	10	2024-05-14T00:55:33.490Z	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	10	2024-05-14T00:55:40.462Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	97ccc4fb-5c0a-45ea-a5c5-c08cd531b2d1	100	2024-05-14T01:04:12.972Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	6ebdfdfa-c7b7-42c3-972c-a15b921d4e66	10	2024-05-14T01:14:11.899Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	58c7d1c9-8e7f-4d68-8ede-da32a40500bc	10	2024-05-14T01:14:49.172Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	242ff884-0ac2-47a1-850e-cf1829423692	10	2024-05-14T01:15:45.535Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	61735e25-7502-4864-9a02-cbec10b78700	10	2024-05-14T01:18:50.345Z	\N	\N
01578572-338e-4ddd-941f-ebfe6fa0e155	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	10	2024-05-14T01:24:09.845Z	\N	\N
01578572-338e-4ddd-941f-ebfe6fa0e155	6aa9af23-caa5-40d6-b91d-ef297e5ec4f4	10	2024-05-14T01:24:23.753Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	8e5bab94-d594-46dd-a855-7675f5d8231f	100	2024-05-14T01:25:21.167Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	3edbdcb6-ff0a-4de4-b5c9-24c30de29132	0	2024-05-09T23:41:18.151Z	2024-05-14T12:36:49.435Z	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	fbe933e1-c88c-4ec8-9a83-4cd88ceefcb6	10	2024-05-09T23:47:26.991Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	8b2c49f5-c34f-4ac9-abb0-5810c10e3dcb	100	2024-05-09T23:47:51.110Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	69732c83-e2ee-481f-b4c5-e55932e8d51f	100	2024-05-09T23:50:11.067Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	5d5ba6d2-2853-4b3c-aecb-5f86a8e75707	100	2024-05-10T00:31:19.025Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	5e41a301-df2c-4b07-9b4d-6fde4be7206e	100	2024-05-14T01:03:47.834Z	\N	\N
40ab1a6f-277c-4ccc-8f59-db8c87a098e3	d8c5a353-d026-4fd4-b1f3-2bcf2f75b921	10	2024-05-11T04:01:23.943Z	\N	\N
40ab1a6f-277c-4ccc-8f59-db8c87a098e3	18b45eb3-755c-4d38-a974-2857f6b30638	10	2024-05-11T04:02:58.861Z	\N	\N
d5d9c052-3847-4ff4-bf83-f4feda281831	7dafb07f-4bf3-46ce-8c1a-5750397b51c0	100	2024-05-12T00:47:02.743Z	\N	\N
d5d9c052-3847-4ff4-bf83-f4feda281831	16f81e02-611e-4f34-b438-2dfd3fe94bd6	10	2024-05-12T00:51:01.195Z	\N	\N
d5d9c052-3847-4ff4-bf83-f4feda281831	ddfd8cc9-02db-4c9c-b59c-c4f03459607c	10	2024-05-12T00:51:07.380Z	\N	\N
d5d9c052-3847-4ff4-bf83-f4feda281831	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	10	2024-05-12T00:51:15.084Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	6390b091-e28c-4b25-9f51-d96c0ad34e79	100	2024-05-14T01:04:39.937Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	92b4df0f-45fc-48e9-971d-6dac320380e7	100	2024-05-14T01:05:03.739Z	\N	\N
40ab1a6f-277c-4ccc-8f59-db8c87a098e3	31420dbb-f6a3-443b-89c1-05344b195408	10	2024-05-11T03:57:24.240Z	\N	\N
40ab1a6f-277c-4ccc-8f59-db8c87a098e3	e95f427a-d290-44f2-a54b-81a6e3847252	10	2024-05-11T04:01:56.138Z	\N	\N
d5d9c052-3847-4ff4-bf83-f4feda281831	39b95236-1136-4154-b79d-a03b7e04be02	100	2024-05-12T00:47:09.325Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	e2f71e7c-b16a-419c-82ee-ae353712e406	10	2024-05-12T00:55:09.528Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	77396dd0-9afa-4ae9-9a10-1d796a79b8c0	10	2024-05-12T00:55:30.395Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	53743f4f-eded-4145-b56e-224eab9471ec	100	2024-05-12T00:57:36.956Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	4f5dbb59-d5ca-4550-a6e6-6e62f8583198	100	2024-05-14T01:05:13.845Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	b445feb3-6ae1-4998-ac1f-ad71adef656f	10	2024-05-12T00:58:20.763Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-12T00:58:34.901Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	318b0858-0973-4a83-ab97-95c8e85c78ea	100	2024-05-14T01:06:54.363Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	a96f078d-2d33-4da4-b2b5-7d86d51ba507	10	2024-05-14T01:08:49.863Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	f922ba72-e34e-4c72-8cb4-6339d905b5c0	100	2024-05-14T01:09:22.388Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	eadb6611-5c04-4050-9be4-fd2b4eacd182	10	2024-05-12T01:06:02.118Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	8ed9323e-cc0d-4d4d-afa1-1bdbf3a66268	10	2024-05-12T01:16:38.897Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	a3b72470-8acf-43e6-a60e-e81685fb330d	100	2024-05-14T01:12:08.530Z	\N	\N
0d3571e1-9647-4419-929e-2f0707fcc4a9	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-12T01:17:58.053Z	\N	\N
0d3571e1-9647-4419-929e-2f0707fcc4a9	799e9f43-b5e8-4484-be33-09c442390253	10	2024-05-12T01:18:09.301Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	160ef3da-52f4-4dcb-9d1b-27fc1d9f651f	10	2024-05-12T01:18:53.167Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	646d25fc-788e-4853-a7a3-29190186b477	10	2024-05-12T01:19:03.653Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	6ee709d9-f990-41e3-9f92-a75f8d5e4855	10	2024-05-12T01:19:45.882Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	139d16e8-b314-499a-925a-f725cef15e5b	10	2024-05-14T01:12:17.638Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	b0c86acd-1f28-4ee1-baa8-18c7c918d49d	100	2024-05-14T01:13:17.799Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	dfbf27f0-d560-4aea-aba6-532a6346b994	100	2024-05-14T01:15:29.170Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	b355c6b7-f9c9-4b2f-92a2-bb7f8adeb790	10	2024-05-12T00:55:31.280Z	2024-05-12T13:54:49.876Z	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	538b2fe7-f31b-4edc-ade4-ced630b607db	100	2024-05-14T01:05:36.996Z	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	2c0eabfd-5c22-4174-b93d-b814a7706b9e	100	2024-05-14T01:05:52.378Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	9c28c037-b76a-443a-9e9d-33312e926174	10	2024-05-10T00:34:41.610Z	\N	\N
d5d9c052-3847-4ff4-bf83-f4feda281831	001e3bdc-a463-4cea-a4f1-6bb36cd67d5f	10	2024-05-12T00:51:22.275Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	3a2b4c6a-9e59-4f3a-be7b-c8399bb3a201	10	2024-05-10T00:35:20.725Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	7fe4cd2a-9bec-419a-aaae-aa89761c5566	100	2024-05-14T01:18:35.160Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	79224f5f-e140-41f1-a6df-dc1313e11387	10	2024-05-14T01:19:01.207Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	652b4e71-8aec-46f6-a361-fe78ac0efe10	10	2024-05-14T01:19:16.621Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	0d0b7439-82c1-4030-8d40-3dd94753eb40	10	2024-05-14T01:19:35.013Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	a0da9ec6-caf6-4939-a844-39534055b9e2	10	2024-05-10T01:28:59.150Z	\N	\N
627d9b43-a569-409f-be85-a5a0d606992e	87d09650-d0e9-4203-867e-b6e167a1171b	0	2024-05-13T19:21:50.031Z	2024-05-14T01:22:38.610Z	\N
01578572-338e-4ddd-941f-ebfe6fa0e155	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-14T01:23:48.608Z	\N	\N
01578572-338e-4ddd-941f-ebfe6fa0e155	f013501e-e9ea-478f-af0d-648f96244b14	10	2024-05-14T01:23:57.983Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	6347a939-ad2c-458e-a097-17fdb7ef34b1	100	2024-05-14T01:24:56.970Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	aac33dfd-3626-4bac-a5d3-50ad6a8d69b7	100	2024-05-14T01:25:50.453Z	\N	\N
01578572-338e-4ddd-941f-ebfe6fa0e155	053d6422-e791-474c-9820-90252e04da58	10	2024-05-14T01:31:24.253Z	2024-05-14T14:58:54.960Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	6374669b-f8a0-433b-a6af-349529a9e31a	0	2024-05-14T01:36:27.024Z	2024-05-14T18:40:52.612Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	82fe2a73-a292-488d-b227-3302bd06496d	0	2024-05-14T01:36:15.192Z	2024-05-14T18:48:39.020Z	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	26b02d43-3025-4538-8484-afb26c44a010	10	2024-05-12T00:53:55.958Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	6763caea-7b53-466a-a9b3-40ebfac0f9bb	10	2024-05-12T00:54:02.484Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	1ca48fb5-6df6-4884-ac61-9c9760041ee1	100	2024-05-12T00:54:08.905Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	14e49cb6-9951-4a0d-bf60-20f4b046b6f8	10	2024-05-12T00:54:52.073Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	6e9a8909-a27a-43f0-8945-7dfec5174372	0	2024-05-14T01:35:18.489Z	2024-05-14T19:38:16.231Z	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	e13ffed3-e5cb-48fb-a7a4-9a4358fc18ff	10	2024-05-12T00:58:27.310Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	31744df9-e04a-443f-a78f-3b9be14e7adf	10	2024-05-12T00:58:47.783Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	6fae2ee9-649c-44e0-b07d-be18bc295d5a	10	2024-05-12T00:58:51.807Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	0d0b7439-82c1-4030-8d40-3dd94753eb40	100	2024-05-12T00:59:27.219Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	4ff95cea-fbd8-4b79-8fde-04173c44b400	100	2024-05-12T00:59:48.892Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	133878fc-7cf2-49a2-b6a9-1407c6e64602	100	2024-05-12T00:59:53.151Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	7fe4cd2a-9bec-419a-aaae-aa89761c5566	10	2024-05-12T01:00:08.982Z	2024-05-12T01:00:18.508Z	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	95d28aa1-fca7-4df2-97ee-4daa1330ee10	10	2024-05-12T01:03:35.623Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	748f49f1-b979-4ecd-93af-5c62df9302ae	10	2024-05-12T01:05:53.676Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	ea2c6721-693d-496e-8442-a2381d48430b	10	2024-05-12T01:06:11.669Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	599bee49-16ea-4ea6-9a4a-ae3043926417	10	2024-05-12T01:06:23.379Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	52634f35-73b2-4c60-99c9-1ec886f6e4b3	10	2024-05-12T00:58:12.597Z	2024-05-12T13:54:58.718Z	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	12c780fb-9a09-4c15-bc5f-d93d5ea1177b	10	2024-05-12T00:53:33.239Z	2024-05-12T14:13:35.865Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	15129370-e9f5-4797-87cf-225625bc7642	0	2024-05-10T01:20:01.958Z	2024-05-13T19:22:33.737Z	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	fc763265-b328-4fa5-9975-307e97ec35ca	100	2024-05-10T01:24:40.573Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	4c4b59cc-d639-4952-87e3-107c61c2a673	10	2024-05-10T01:24:53.251Z	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	70ca14b1-0240-4bc7-902c-903fbe74da31	100	2024-05-10T01:24:59.943Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	c2d8b7f0-b0cc-4d81-b935-77c12baa9b0e	10	2024-05-10T01:25:01.565Z	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	d2123a82-91a0-4f30-896b-61ee15ade670	100	2024-05-10T01:26:59.239Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	51f89876-fee4-4887-a74d-351d12ca4c5e	10	2024-05-10T01:27:09.539Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	ea69d128-1dd3-49de-8b6e-df772a2ad9a7	10	2024-05-10T01:27:41.936Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	4206e979-d31c-4306-b9cf-bac8abb1b7ba	10	2024-05-10T01:27:57.302Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	6c8684ed-85ad-49c0-a76e-cb34e7538f4d	0	2024-05-12T01:46:07.580Z	2024-05-15T00:51:54.046Z	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	3e2c22be-5ac0-4b10-ba0c-150ee9f33100	10	2024-05-12T00:53:41.917Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	11c6d26d-d148-49c7-bcfd-cf2ce6be4022	10	2024-05-12T00:53:49.406Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	52b5339a-b922-4d1a-9e58-b4a614cf5369	100	2024-05-12T00:59:43.126Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	ea75bc9f-86a7-41ba-b9c3-66ecee82860d	10	2024-05-12T01:00:27.016Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	835ed21d-0c9f-481c-bcfa-9f3235f88ad5	10	2024-05-12T01:03:56.100Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	652b4e71-8aec-46f6-a361-fe78ac0efe10	10	2024-05-12T01:05:23.379Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	5e2c418e-729b-4f4f-bef7-db807ca37de3	10	2024-05-12T01:17:13.815Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	10	2024-05-12T01:17:32.249Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	d001c64f-33b0-4d50-a8c1-1b62084c6e00	10	2024-05-12T01:17:50.067Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	3453dec4-2fa0-4a3d-a053-0af80abdc82c	10	2024-05-12T01:18:16.591Z	\N	\N
0d3571e1-9647-4419-929e-2f0707fcc4a9	f3c395aa-63af-4264-99e0-2bd29760c62e	10	2024-05-12T01:18:17.947Z	\N	\N
0d3571e1-9647-4419-929e-2f0707fcc4a9	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-12T01:18:28.296Z	\N	\N
0d3571e1-9647-4419-929e-2f0707fcc4a9	242ff884-0ac2-47a1-850e-cf1829423692	10	2024-05-12T01:18:35.372Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	3c1b608c-abe0-4f61-a6f5-dedca499fbf3	10	2024-05-12T01:18:35.531Z	\N	\N
0d3571e1-9647-4419-929e-2f0707fcc4a9	cc5459a2-9b43-486b-8c3f-99c507c68562	10	2024-05-12T01:18:42.103Z	\N	\N
0d3571e1-9647-4419-929e-2f0707fcc4a9	a8c18a44-ec60-4a19-8e96-785c49de9630	10	2024-05-12T01:18:49.491Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	fd54a76a-cdb9-4543-9df6-24baa384e38c	10	2024-05-12T01:19:22.224Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	3edb0a60-0bbf-4332-9fd1-8de317091fca	10	2024-05-12T01:19:53.050Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	51ccecbb-1d21-447c-9d62-d5b3d2775905	10	2024-05-12T01:20:11.749Z	\N	\N
70084b0f-4b01-431e-a2bf-ee85df1da7cd	950a9045-f3c3-42d7-bf59-d42c5ef42d29	10	2024-05-12T01:20:26.296Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	e4f030c3-a985-4cc0-8336-9b55e1acc79f	10	2024-05-12T01:20:30.650Z	\N	\N
70084b0f-4b01-431e-a2bf-ee85df1da7cd	b8086ace-c3c7-4fa5-905f-ad1d4e64e990	1	2024-05-12T01:20:41.029Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	3875894c-baf3-48c4-8932-059914a6e27c	10	2024-05-12T01:21:10.258Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	1de20395-c5ed-4f98-9090-166ffe118c11	10	2024-05-12T01:22:10.150Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	65d76d06-ff09-40b5-8df8-ead5c4cabe2e	10	2024-05-12T01:25:01.631Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	8ea367f1-09ca-4195-92e6-94f3bb00f618	10	2024-05-12T01:26:00.670Z	\N	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	053d6422-e791-474c-9820-90252e04da58	10	2024-05-12T01:46:45.785Z	\N	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	0b36b132-05b8-421d-b1b1-955c4b96f520	10	2024-05-12T01:47:36.346Z	\N	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	24857c6e-7fe5-45e8-9cc5-c5858390c06d	10	2024-05-12T01:47:57.853Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	e1d9baf6-5014-468f-9549-2b1853767835	100	2024-05-14T01:49:24.630Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	92b76470-db2f-49fd-959d-e32dabb734a7	0	2024-05-12T01:58:06.969Z	2024-05-14T13:27:56.753Z	\N
1a897e88-5092-4071-a4ae-94b887867191	429d3f0b-54fe-44b4-9f45-81581cc5cc4b	0	2024-05-12T01:57:43.702Z	2024-05-14T13:28:07.936Z	\N
1a897e88-5092-4071-a4ae-94b887867191	5b5efd8a-6467-4496-bc81-966fbc441b54	0	2024-05-12T01:58:20.055Z	2024-05-14T18:03:33.257Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	2323bf86-445a-410d-89fc-01c6b2ea36ea	100	2024-05-12T02:07:56.111Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	5aad0adb-f132-45f7-b2bb-248f3d8dfacf	100	2024-05-12T02:09:49.921Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	13a4afa8-2b27-43c2-8ac1-0a2b29ce7832	10	2024-05-12T02:13:24.670Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	2f6dc320-55e1-4832-8fce-a7ddf9ee661a	0	2024-05-14T01:44:31.920Z	2024-05-14T18:47:31.714Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	0e951a76-4e9e-4df3-a4c0-71221e1886d2	0	2024-05-14T01:42:30.469Z	2024-05-14T18:54:52.007Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	5a68adc5-f0cc-44f6-99e4-12cd88662d08	0	2024-05-14T01:45:34.954Z	2024-05-14T18:57:02.507Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	38f84d3e-7f75-46a7-ad35-080b277112ac	10	2024-05-12T01:46:44.838Z	2024-05-13T00:46:25.699Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	664ee223-1340-43d1-9ae5-13685ec9b22b	0	2024-05-14T01:43:15.338Z	2024-05-14T18:58:31.912Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	7e221be5-cacb-4b5d-96b7-4d0b65d04295	100	2024-05-14T01:47:02.438Z	2024-05-14T19:05:42.553Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	51727155-6b86-4777-865e-f7b85eba83ea	0	2024-05-14T01:34:50.157Z	2024-05-14T19:31:44.836Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	8b9e4699-6c7a-46a1-86c2-da3d3867cd40	0	2024-05-14T01:33:22.007Z	2024-05-14T19:37:35.002Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	8f528aeb-d345-42a8-b01f-48156c9d589f	10	2024-05-10T01:21:36.491Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	c84192e1-0605-4b6f-8302-99aa29116f1f	10	2024-05-10T01:22:07.076Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	ff30edb6-ad8b-4b10-80ba-da7d2ef786f7	10	2024-05-10T01:23:07.049Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	c4651198-a582-43ed-98cc-0b96d53ec91e	10	2024-05-10T01:23:44.767Z	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	fcc2aee3-3a74-45a7-a590-961a2f78050d	100	2024-05-10T01:24:27.043Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	6c8684ed-85ad-49c0-a76e-cb34e7538f4d	10	2024-05-10T01:26:40.897Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	6374669b-f8a0-433b-a6af-349529a9e31a	10	2024-05-10T01:28:38.127Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	abf86d41-3ba4-4dde-b0ac-3468fe06ba87	10	2024-05-11T07:04:18.081Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	6b1d5955-578e-4b7c-a66a-118060c94901	10	2024-05-11T07:05:46.714Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	352af921-b2eb-4ca8-9775-5f124c622d6b	10	2024-05-11T07:06:41.960Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	e1d9baf6-5014-468f-9549-2b1853767835	10	2024-05-11T07:07:53.782Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	2cd15597-9745-43a5-bbe9-84f9c467b45d	10	2024-05-11T07:08:04.110Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	4f44cc87-8684-4327-9fb6-0a55d3464020	10	2024-05-12T01:16:19.139Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	ae3c2c9b-44da-4c00-9755-74880c3f9da1	100	2024-05-14T01:47:24.402Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	d7f296ff-11e1-45cf-a360-7989c69affb1	10	2024-05-12T01:21:37.373Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	73124159-e4fb-4edb-881b-36a99bace25c	10	2024-05-12T01:23:31.675Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	0fc4d439-3e5d-460d-aefb-c54583690db3	10	2024-05-12T01:24:02.344Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	acc5c092-aef5-4a76-981d-80a2c847086b	10	2024-05-12T01:25:35.579Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	d8b0c9ec-39a1-44e4-9ccf-36b439e39368	100	2024-05-14T01:49:03.580Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	0676bbe1-5bb4-4bd1-94b6-7a5038ecd41e	10	2024-05-12T01:27:52.701Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	a944ad5c-36b6-417f-aa37-7b8c6a825d01	100	2024-05-14T01:52:48.433Z	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-12T01:28:49.024Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	799e9f43-b5e8-4484-be33-09c442390253	10	2024-05-14T01:55:14.691Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	81476608-e806-4a25-ad0f-c976bb29dd31	10	2024-05-14T01:55:34.630Z	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	76c0cb36-9ee0-422f-8050-b422ff53b9d3	100	2024-05-12T01:35:09.339Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	3c1b608c-abe0-4f61-a6f5-dedca499fbf3	10	2024-05-12T01:52:08.041Z	2024-05-14T13:13:13.720Z	\N
1a897e88-5092-4071-a4ae-94b887867191	c8e0a4e5-963c-41b0-a9a0-dc814215cb7c	0	2024-05-12T01:52:16.951Z	2024-05-14T13:28:24.971Z	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	945b1d7a-17ac-4646-92ef-018669cee133	10	2024-05-12T01:45:54.753Z	\N	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	cbe1445b-256b-4d93-8829-6a1fda8f526c	10	2024-05-12T01:47:17.405Z	\N	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	ab9131f3-cfb0-4df9-9043-b022f5e8b9ab	10	2024-05-12T01:48:22.941Z	\N	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	b84e2a5f-8dc0-4e03-8581-9aace16bc227	10	2024-05-12T01:50:50.500Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	385c8377-a125-479c-8e96-f896a348320c	10	2024-05-12T01:52:26.218Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	387fbf07-bb94-4471-9db3-f6a2eec3e772	0	2024-05-14T01:44:03.334Z	2024-05-14T19:17:56.364Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	2a8e82ce-897c-4ce2-a611-1c5cbbb562d5	0	2024-05-14T01:42:40.375Z	2024-05-14T18:48:06.568Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	bc43d2f6-7c4f-4d38-8269-b66b085fcb8a	0	2024-05-14T01:42:00.153Z	2024-05-14T18:49:42.724Z	\N
5577f295-484a-41bf-8b11-5848f060ee9e	8302c3b8-4ef3-4cb4-816c-a0a9d788c22b	100	2024-05-12T02:02:00.056Z	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	66a98038-4588-431c-814d-0c440c4683af	1	2024-05-12T02:03:02.841Z	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	1d02a2b6-3aed-4dd4-acd1-27acb87856f3	1	2024-05-12T02:05:06.237Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	d7a5e2bf-48a5-4808-b427-8116d795f939	10	2024-05-12T02:05:23.788Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	feabdbad-dc62-4ffc-8683-3f5853fbaea9	10	2024-05-12T02:05:48.203Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	5c1839cf-e5e9-4963-9018-c4d6f9ac5aeb	10	2024-05-12T02:10:20.843Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	a22f8d3b-6143-428d-a0ab-9fa02cbd5933	10	2024-05-12T02:12:03.370Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	03806df4-f5df-48c6-b084-4993af23dcb9	10	2024-05-12T02:13:56.964Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	9e66cff1-37e1-4631-8251-c7b03b287ada	100	2024-05-11T07:04:35.419Z	2024-05-12T19:21:56.372Z	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	d84d154b-d509-4f04-b042-c1e4f506aed2	100	2024-05-11T07:07:13.147Z	2024-05-12T20:08:58.048Z	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	ddfd8cc9-02db-4c9c-b59c-c4f03459607c	10	2024-05-11T07:05:33.279Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	74dc7f47-7298-418b-9b5b-04c47914721b	10	2024-05-11T07:08:25.093Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	715fb8d2-6acd-4b2b-8164-79de7fef3fec	10	2024-05-11T07:15:49.109Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	99d42576-350e-4fd5-b319-34aa2f8532e6	100	2024-05-14T01:45:13.220Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	eadb6611-5c04-4050-9be4-fd2b4eacd182	100	2024-05-14T01:45:21.459Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	b3f244b6-07e4-41d2-ace6-a3e2fc93281b	0	2024-05-14T01:44:59.149Z	2024-05-14T18:42:36.765Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	c4d56ef3-9ee0-4af2-bc94-64394f166252	0	2024-05-14T01:46:08.925Z	2024-05-14T18:45:08.744Z	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	c4976a72-788e-4360-ad86-bb4939bebcc2	10	2024-05-12T01:48:41.989Z	\N	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	4c170954-1c43-4928-9014-d3b057e4a5ca	10	2024-05-12T01:49:07.414Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	a08d8756-9721-40b8-8146-07bec3bbed9b	100	2024-05-14T01:52:17.355Z	\N	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	8b9e4699-6c7a-46a1-86c2-da3d3867cd40	10	2024-05-12T01:51:58.908Z	2024-05-12T01:52:19.188Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	00d20b3f-9f40-46f7-9cf5-33dcac97094f	100	2024-05-14T01:52:38.823Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	1114f512-17b1-4c26-927e-5d9888029183	0	2024-05-11T22:10:09.255Z	2024-05-14T13:02:43.081Z	\N
1a897e88-5092-4071-a4ae-94b887867191	e1d9baf6-5014-468f-9549-2b1853767835	0	2024-05-11T22:11:12.115Z	2024-05-14T13:12:24.328Z	\N
1a897e88-5092-4071-a4ae-94b887867191	8a6bee81-d3a5-4f61-abc0-a2f56977eb4d	0	2024-05-11T22:08:43.312Z	2024-05-14T13:12:49.847Z	\N
1a897e88-5092-4071-a4ae-94b887867191	7e184744-f42f-4756-b713-a0cde81e35cb	0	2024-05-12T01:51:57.538Z	2024-05-14T13:18:19.352Z	\N
1a897e88-5092-4071-a4ae-94b887867191	caa77bd6-4cf9-44a5-aa24-2e68c899081a	0	2024-05-11T22:06:56.328Z	2024-05-14T13:24:20.283Z	\N
1a897e88-5092-4071-a4ae-94b887867191	1eaffd04-3a73-45a1-9729-3d28de16c87e	0	2024-05-12T01:59:07.297Z	2024-05-14T13:28:37.723Z	\N
1a897e88-5092-4071-a4ae-94b887867191	53743f4f-eded-4145-b56e-224eab9471ec	100	2024-05-12T01:57:12.835Z	2024-05-14T15:21:23.400Z	\N
5577f295-484a-41bf-8b11-5848f060ee9e	a3e547e1-3b29-43e5-838f-d66e36b12187	10	2024-05-12T02:02:38.147Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	2df34cb2-b419-4cd9-bac0-fee998327fd6	0	2024-05-11T22:10:57.175Z	2024-05-14T18:03:33.257Z	\N
5577f295-484a-41bf-8b11-5848f060ee9e	bebcebf5-673a-49af-a02b-168c11dd0dd9	1	2024-05-12T02:04:13.398Z	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	b02a8127-4baa-439d-96d0-4895e606f3d1	1	2024-05-12T02:04:38.412Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	911f55b0-51f3-47ec-b80f-23fee83a5d72	10	2024-05-12T02:04:53.039Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	91f2ff2e-6a60-44fe-9f1a-5d5b94c0629e	100	2024-05-12T02:06:45.550Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	c8bf430d-7110-4e29-90b8-405b1c79254d	10	2024-05-14T01:52:05.233Z	2024-05-14T19:15:02.048Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	4a96f026-b754-46ea-88b2-37624e604ad3	10	2024-05-14T01:51:44.105Z	2024-05-14T19:15:07.461Z	\N
448b139d-799f-402b-8da0-24fb7ac7668a	d382afa7-cef6-4e16-89aa-22a5e20562e6	10	2024-05-11T09:57:25.701Z	\N	\N
448b139d-799f-402b-8da0-24fb7ac7668a	15121282-bdc8-4096-845b-974401b2e6aa	10	2024-05-11T09:57:44.586Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	36294c41-22ed-4750-afdd-ce758eff8a26	0	2024-05-14T02:28:52.454Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	d382afa7-cef6-4e16-89aa-22a5e20562e6	100	2024-05-14T02:50:12.224Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	62bd5d05-ba37-497a-a1a1-56795813790d	0	2024-05-12T02:26:56.017Z	2024-05-13T03:07:34.016Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	4a963962-95d1-4da2-8260-73d167422452	0	2024-05-12T02:28:28.310Z	2024-05-13T03:08:01.007Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	95d28aa1-fca7-4df2-97ee-4daa1330ee10	0	2024-05-12T02:20:07.507Z	2024-05-13T03:08:43.089Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	04293a65-283f-4b8d-b7ab-aec478bba1b4	0	2024-05-12T02:24:15.383Z	2024-05-13T03:08:49.408Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	c4cb72e4-042f-457b-a18e-6233e2bb2b9f	10	2024-05-12T02:14:57.283Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	6347a939-ad2c-458e-a097-17fdb7ef34b1	10	2024-05-12T02:15:27.223Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	78608d77-3c39-4d10-83bf-d9ec1fa96361	10	2024-05-12T02:15:32.513Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	167a03f7-d6bb-405e-8d75-87bf915543e8	0	2024-05-12T02:16:31.426Z	2024-05-13T03:09:41.699Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	10ce0297-ae31-49b4-9a0c-bb164cd19353	0	2024-05-12T02:22:37.563Z	2024-05-13T03:10:10.734Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-12T02:26:13.438Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	8f31cc80-5d62-422d-8f53-0f521bbec7b1	10	2024-05-12T02:30:23.287Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	4e619f2b-0e02-4842-8b1d-410ff44038cd	100	2024-05-12T02:32:31.727Z	2024-05-12T17:44:27.321Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	d4a48129-b591-4504-a205-589bd90bd350	0	2024-05-12T02:23:40.024Z	2024-05-13T03:11:54.766Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	e1075af4-70c1-4124-b93b-20149f24e57b	0	2024-05-12T02:15:48.429Z	2024-05-13T03:13:12.291Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	3b247bc2-b6da-45e4-9109-cc199c29f41b	0	2024-05-12T02:25:47.123Z	2024-05-13T03:13:38.039Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	61987ae1-ed89-4be5-8918-0beb83e5d46b	0	2024-05-14T02:29:17.333Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	0cdc9330-0237-41e1-916d-d5ae801f383a	100	2024-05-12T02:46:59.742Z	2024-05-14T15:19:23.620Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	6aa9af23-caa5-40d6-b91d-ef297e5ec4f4	0	2024-05-12T02:16:55.490Z	2024-05-13T03:11:39.122Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	8ed9323e-cc0d-4d4d-afa1-1bdbf3a66268	0	2024-05-12T02:18:40.050Z	2024-05-13T03:12:08.596Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	9be951da-e5a4-4c2d-8216-16351db048f6	10	2024-05-12T02:16:00.508Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	f51bc934-80c1-4fb6-858f-38f701e88dd9	0	2024-05-12T02:20:32.381Z	2024-05-13T03:12:16.378Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	540d800e-cf37-4bdc-91f8-d00b8edb52b9	0	2024-05-12T02:19:48.218Z	2024-05-13T03:12:38.003Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	eb3caab6-6357-4757-86b2-efaf8d691de7	0	2024-05-12T02:19:21.668Z	2024-05-13T03:12:53.444Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	6cadf62b-c44a-4184-aa09-a3dd33fb9676	0	2024-05-12T02:16:38.686Z	2024-05-13T19:22:02.935Z	\N
72f78b69-9021-45da-89a1-004bb8dfa66f	69732c83-e2ee-481f-b4c5-e55932e8d51f	100	2024-05-14T03:17:14.183Z	\N	\N
72f78b69-9021-45da-89a1-004bb8dfa66f	43a27a70-3ed5-4a3d-8428-623810c3f717	100	2024-05-14T03:18:41.742Z	\N	\N
72f78b69-9021-45da-89a1-004bb8dfa66f	84d5b5f4-3c06-4b70-946e-dd258278c7b2	100	2024-05-14T03:19:02.450Z	\N	\N
72f78b69-9021-45da-89a1-004bb8dfa66f	1de20395-c5ed-4f98-9090-166ffe118c11	100	2024-05-14T03:19:23.169Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	32a2463b-506d-4ab4-8789-2ebecb70ce4e	0	2024-05-12T02:26:38.976Z	2024-05-13T03:07:28.641Z	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	7982a520-ecc8-4cf9-a8be-2bd40550bd31	10	2024-05-11T11:56:33.113Z	\N	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	f3c395aa-63af-4264-99e0-2bd29760c62e	10	2024-05-11T11:56:46.118Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	83c733cc-e2b0-4d93-990e-e2e05bf5187c	100	2024-05-11T12:43:05.151Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	a1e9e0d1-cf48-4f52-8f41-cc24e44a9cce	100	2024-05-11T12:43:17.031Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	4c4b59cc-d639-4952-87e3-107c61c2a673	100	2024-05-11T12:43:38.653Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	689c1d43-a7ee-4b95-97df-1558fbfcb863	0	2024-05-12T02:27:16.531Z	2024-05-13T03:07:51.196Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	c2e2516b-559f-4189-bf17-c962964d66a3	0	2024-05-12T02:28:13.428Z	2024-05-13T03:08:19.740Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	9c17284c-d379-4b76-9d87-5c573b5eec6c	10	2024-05-12T02:23:17.882Z	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	b910c015-09ec-4052-968e-a29db81d5912	0	2024-05-12T02:23:05.566Z	2024-05-13T03:09:48.519Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	7f8e851f-d072-469a-bf7c-1d04b14b18b4	0	2024-05-12T02:21:18.155Z	2024-05-13T03:10:00.216Z	\N
66665836-5d56-4596-ae37-0dd7c86576f5	c22f92e8-d065-455e-867d-534f12705bbf	0	2024-05-12T02:28:51.635Z	2024-05-13T03:13:03.552Z	\N
72f78b69-9021-45da-89a1-004bb8dfa66f	172c7042-1a1a-4ed0-9cd7-9f818efde80a	100	2024-05-14T03:17:32.103Z	\N	\N
72f78b69-9021-45da-89a1-004bb8dfa66f	caa77bd6-4cf9-44a5-aa24-2e68c899081a	100	2024-05-14T03:17:50.218Z	\N	\N
72f78b69-9021-45da-89a1-004bb8dfa66f	15121282-bdc8-4096-845b-974401b2e6aa	100	2024-05-14T03:18:07.741Z	\N	\N
72f78b69-9021-45da-89a1-004bb8dfa66f	d2123a82-91a0-4f30-896b-61ee15ade670	100	2024-05-14T03:18:16.806Z	\N	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-11T11:56:20.114Z	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	ddd88a43-eb5a-416a-9ed1-2be44c5982a8	0	2024-05-12T02:35:39.307Z	2024-05-14T00:45:34.022Z	\N
9e78210f-f25a-419c-abeb-341e562a2584	1a11bf91-5128-4a26-bacf-d81f559695eb	10	2024-05-12T03:03:56.250Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	27c3707c-4a0b-4b43-8f8c-1b4bba103aa9	100	2024-05-14T03:37:52.762Z	2024-05-14T03:38:36.489Z	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	3ce35ddd-0dac-41f9-88a9-27a509c5df0b	100	2024-05-14T03:37:32.696Z	2024-05-14T03:38:53.179Z	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	463b2006-ff25-4d63-8b79-17666b4b4d02	0	2024-05-14T03:41:06.094Z	\N	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	ddd88a43-eb5a-416a-9ed1-2be44c5982a8	100	2024-05-11T12:08:50.825Z	2024-05-11T19:56:19.809Z	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	d382afa7-cef6-4e16-89aa-22a5e20562e6	100	2024-05-14T03:44:34.290Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	5a1ad7fc-c94e-4d69-9151-ee106ba29e1d	0	2024-05-12T02:46:32.858Z	2024-05-14T13:12:36.922Z	\N
1a897e88-5092-4071-a4ae-94b887867191	a08d8756-9721-40b8-8146-07bec3bbed9b	100	2024-05-12T02:46:54.738Z	2024-05-14T15:19:34.345Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	caa77bd6-4cf9-44a5-aa24-2e68c899081a	10	2024-05-11T12:36:16.879Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	ea2c6721-693d-496e-8442-a2381d48430b	100	2024-05-11T12:43:50.161Z	\N	\N
9e78210f-f25a-419c-abeb-341e562a2584	9553af2c-3c73-4c34-ab7f-1001c1c34e86	10	2024-05-12T03:03:49.543Z	\N	\N
9e78210f-f25a-419c-abeb-341e562a2584	32c8b84b-f427-472b-91fb-150008246e85	10	2024-05-12T03:04:08.756Z	\N	\N
9e78210f-f25a-419c-abeb-341e562a2584	b8086ace-c3c7-4fa5-905f-ad1d4e64e990	10	2024-05-12T03:06:16.890Z	\N	\N
9e78210f-f25a-419c-abeb-341e562a2584	ef206d20-b798-4215-bebb-e53afd8f4a69	10	2024-05-12T03:06:58.666Z	\N	\N
9e78210f-f25a-419c-abeb-341e562a2584	b9368d94-0425-4b23-ada4-66f8986f7368	10	2024-05-12T03:07:21.454Z	\N	\N
9e78210f-f25a-419c-abeb-341e562a2584	fa855264-b42a-4559-b976-1a55f6ee9d9b	10	2024-05-12T03:08:20.103Z	\N	\N
9e78210f-f25a-419c-abeb-341e562a2584	528e2a82-0523-4110-8894-20ee1a60be69	10	2024-05-12T03:08:32.436Z	\N	\N
9e78210f-f25a-419c-abeb-341e562a2584	799e9f43-b5e8-4484-be33-09c442390253	10	2024-05-12T03:08:37.844Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	2c98279b-bbd2-4645-96a3-51edb69cf509	0	2024-05-11T12:38:13.546Z	2024-05-13T17:18:07.923Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	1822d9b2-10f4-4e0d-a39a-b987ed707fae	10	2024-05-12T03:22:07.324Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	7f0bba22-b51c-4d05-b9fe-d561872971a3	10	2024-05-12T03:22:34.934Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	b21ed5e8-0f57-4852-8755-7df401dbea9c	10	2024-05-12T03:22:59.286Z	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	15121282-bdc8-4096-845b-974401b2e6aa	100	2024-05-14T05:12:23.810Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	860776d6-b97a-431f-b089-faee9ca777bc	100	2024-05-12T03:43:14.467Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	7d861778-7335-4765-90b7-e57ef5a9799f	100	2024-05-11T12:42:50.707Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	4ae4acec-ee0d-40f3-931c-37759e97ecff	100	2024-05-11T12:42:57.947Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	c38e4aa6-bc90-4592-ae7d-95d93de12ec4	100	2024-05-11T12:43:31.333Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	e48d36c1-f6b4-47f4-9123-17681ed99941	0	2024-05-12T03:19:22.922Z	2024-05-13T18:50:57.851Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	9651eb11-619a-41cd-8e4b-7629ff6bef34	0	2024-05-12T03:20:34.273Z	2024-05-13T18:51:24.677Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	603dec10-b1e7-4034-aa4b-b0362347387b	0	2024-05-12T03:19:01.168Z	2024-05-13T18:52:15.682Z	\N
9e78210f-f25a-419c-abeb-341e562a2584	e4bedb60-5d9c-4cc6-8ba7-f93d890c6cec	10	2024-05-12T03:06:44.642Z	\N	\N
9e78210f-f25a-419c-abeb-341e562a2584	053d6422-e791-474c-9820-90252e04da58	10	2024-05-12T03:07:40.710Z	\N	\N
9e78210f-f25a-419c-abeb-341e562a2584	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-12T03:07:50.365Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	65bc4ea4-a0db-4ac4-b343-b9d587be224b	0	2024-05-12T03:23:27.117Z	2024-05-13T18:52:39.630Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	770fd1b3-e792-4127-88f9-7d7a47224363	100	2024-05-12T03:18:15.266Z	2024-05-13T18:59:15.012Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	6763caea-7b53-466a-a9b3-40ebfac0f9bb	10	2024-05-12T03:23:14.561Z	2024-05-13T19:18:45.568Z	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	ca0ef946-0de3-47a2-a0cb-df72de35aeec	0	2024-05-14T05:33:39.581Z	2024-05-14T05:34:44.046Z	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	be775eea-c7fc-4162-8f94-6bddc5c33e2f	100	2024-05-14T05:43:15.564Z	2024-05-14T05:44:02.568Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	1a91ad10-10e2-4d05-8727-69f724f076f2	0	2024-05-12T03:24:46.109Z	2024-05-13T18:51:12.901Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	66a98038-4588-431c-814d-0c440c4683af	1	2024-05-12T03:23:51.438Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	1	2024-05-12T03:24:06.155Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	dc359231-d372-495a-a9e0-2bbd47965809	1	2024-05-12T03:24:20.528Z	\N	\N
792ef61b-0f2d-4b0f-9f10-41bbe3327bdf	94701e72-8ebc-43e7-885a-9e2a810ad1e7	0	2024-05-14T07:32:41.361Z	2024-05-14T17:48:51.931Z	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	1b45a959-c141-4d5b-a112-49cc10985fa1	0	2024-05-11T13:46:01.837Z	2024-05-13T12:55:59.754Z	\N
46a75d17-ebd9-4c36-b242-0d9aaaede3ab	2c0eabfd-5c22-4174-b93d-b814a7706b9e	0	2024-05-11T14:14:40.782Z	2024-05-13T15:37:24.360Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	15121282-bdc8-4096-845b-974401b2e6aa	0	2024-05-09T19:46:52.613Z	2024-05-14T10:26:01.842Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	66a98038-4588-431c-814d-0c440c4683af	0	2024-05-11T18:25:33.198Z	2024-05-14T10:26:39.937Z	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	6347a939-ad2c-458e-a097-17fdb7ef34b1	100	2024-05-11T13:37:37.767Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	f8c5ed02-4833-4676-9247-907d4ac9cafe	100	2024-05-11T13:37:57.917Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	fd79a476-6a50-4389-a496-ca34724ff38e	100	2024-05-11T13:38:19.435Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	cbe1445b-256b-4d93-8829-6a1fda8f526c	100	2024-05-11T13:45:06.244Z	2024-05-12T21:32:12.764Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	ef206d20-b798-4215-bebb-e53afd8f4a69	0	2024-05-10T19:30:53.319Z	2024-05-14T10:27:10.147Z	\N
37c914da-7334-46ea-9c73-1f7513500268	14bb5f33-7c73-441d-a3b6-27fd7348dce3	100	2024-05-11T14:29:51.722Z	2024-05-14T14:06:33.144Z	\N
25099d81-7376-4062-9f96-8379695d9aa7	50272a9e-53dc-4e57-a56b-57f226b22933	0	2024-05-11T13:50:02.908Z	2024-05-14T14:43:34.089Z	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	edcb4032-d028-48ee-9811-b6004b277877	10	2024-05-11T13:47:12.493Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	158fb67d-00f8-4752-be65-4108101bdd7f	10	2024-05-11T14:15:53.331Z	2024-05-12T21:13:28.972Z	\N
fd2d679b-4e9c-45e3-a8e2-4f4db15b7555	cf61184d-0ffb-4443-9a63-231432a3bed1	10	2024-05-11T14:12:54.162Z	\N	\N
fd2d679b-4e9c-45e3-a8e2-4f4db15b7555	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-11T14:13:19.382Z	\N	\N
46a75d17-ebd9-4c36-b242-0d9aaaede3ab	970603df-a58e-4cbf-94f1-4aff2c5743a1	100	2024-05-11T14:14:44.983Z	2024-05-11T14:14:47.740Z	\N
46a75d17-ebd9-4c36-b242-0d9aaaede3ab	d034ab5c-92ef-4847-9014-b5114b17cc66	10	2024-05-11T14:15:24.350Z	\N	\N
46a75d17-ebd9-4c36-b242-0d9aaaede3ab	f8c5ed02-4833-4676-9247-907d4ac9cafe	10	2024-05-11T14:15:50.580Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	66a98038-4588-431c-814d-0c440c4683af	10	2024-05-11T14:23:38.394Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-11T14:24:04.544Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	e3a566f8-4b17-41a1-9753-7dc84fa1c53a	10	2024-05-11T14:24:43.794Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	40e27c43-ea54-4bc0-a0b6-3fefc08fec26	10	2024-05-11T14:25:27.458Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	869ed149-9375-4fac-a687-d5450b53ceb8	10	2024-05-11T14:30:09.897Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	21da2418-e978-41cb-90a8-d7e677b4d577	10	2024-05-11T14:30:59.724Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	d98b2225-e6b9-4ba5-9085-ccdcc1d56af9	10	2024-05-11T14:31:10.533Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	25bf800d-f0df-4ff2-bcd8-3e7eb4433e08	10	2024-05-11T14:34:41.915Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	e162ec59-91e5-4621-8a2a-05848cd0f368	10	2024-05-11T14:35:17.427Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	10	2024-05-11T14:35:31.432Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	6ee709d9-f990-41e3-9f92-a75f8d5e4855	10	2024-05-11T14:35:35.810Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	3edb0a60-0bbf-4332-9fd1-8de317091fca	10	2024-05-11T14:37:23.109Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	1cbeb09b-1870-4cbb-ac44-c3d850745958	0	2024-05-11T13:33:05.718Z	2024-05-13T15:18:28.747Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	18d94578-316e-4036-985f-956e5667b81f	0	2024-05-12T21:04:38.072Z	2024-05-14T10:29:56.427Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	24f8abd9-07e3-461d-baef-6a356d960f55	0	2024-05-10T19:31:42.141Z	2024-05-14T10:34:19.007Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	924e9906-692e-460a-bfe4-de2a6c33a5f1	0	2024-05-14T10:35:40.055Z	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	f013501e-e9ea-478f-af0d-648f96244b14	0	2024-05-14T10:46:28.620Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	0eb81d00-fdee-4740-9070-bf23874d35a9	0	2024-05-12T04:00:24.899Z	2024-05-14T13:09:38.591Z	\N
1a897e88-5092-4071-a4ae-94b887867191	88fa7edf-2f9d-43e9-b983-86aa6fc63374	0	2024-05-12T03:57:56.123Z	2024-05-14T13:10:49.457Z	\N
1a897e88-5092-4071-a4ae-94b887867191	1beeba95-3034-4e3b-b332-fde4a0b09258	0	2024-05-12T03:58:54.333Z	2024-05-14T13:13:05.100Z	\N
1a897e88-5092-4071-a4ae-94b887867191	ae3c2c9b-44da-4c00-9755-74880c3f9da1	0	2024-05-12T04:03:49.076Z	2024-05-14T13:17:49.419Z	\N
1a897e88-5092-4071-a4ae-94b887867191	4ae4acec-ee0d-40f3-931c-37759e97ecff	0	2024-05-12T03:57:34.162Z	2024-05-14T13:18:36.581Z	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	770fd1b3-e792-4127-88f9-7d7a47224363	100	2024-05-11T13:21:59.152Z	2024-05-14T18:38:07.348Z	\N
135f566a-8664-4a28-8667-76873f0dc18e	4dade5ab-d146-4a28-bc3a-40f11844d86b	10	2024-05-12T03:47:06.596Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	2a088703-bffe-491a-8e62-4c9f796024d1	10	2024-05-11T13:30:02.804Z	2024-05-11T14:58:39.510Z	\N
1a897e88-5092-4071-a4ae-94b887867191	6d915a63-c6ae-4d4a-a343-6752d0d68efd	10	2024-05-12T03:58:36.565Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	328d3f80-abfe-4c86-ba31-9399e4d9f2a6	10	2024-05-12T03:59:38.356Z	\N	\N
4c81bb1d-2bb9-4711-b7e1-4d17554407e9	15121282-bdc8-4096-845b-974401b2e6aa	10	2024-05-12T04:06:40.182Z	\N	\N
4c81bb1d-2bb9-4711-b7e1-4d17554407e9	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-12T04:06:49.420Z	\N	\N
4c81bb1d-2bb9-4711-b7e1-4d17554407e9	66a98038-4588-431c-814d-0c440c4683af	10	2024-05-12T04:07:06.549Z	\N	\N
4c81bb1d-2bb9-4711-b7e1-4d17554407e9	01d3d6df-cd76-4f62-9c39-ddd968a9a634	10	2024-05-12T04:07:20.501Z	\N	\N
4c81bb1d-2bb9-4711-b7e1-4d17554407e9	dc359231-d372-495a-a9e0-2bbd47965809	10	2024-05-12T04:08:13.809Z	\N	\N
5c3a2bbf-3603-4741-ae95-9d89a889351e	7ce8ca85-b7a2-47d3-a070-37bfba009ac0	10	2024-05-12T04:59:43.942Z	\N	\N
5c3a2bbf-3603-4741-ae95-9d89a889351e	d5bee376-7afa-40f0-8b05-77f984e6c12a	10	2024-05-12T04:59:57.669Z	2024-05-12T05:00:02.408Z	\N
5c3a2bbf-3603-4741-ae95-9d89a889351e	2477f44f-2324-4eec-a191-10ad25b564e9	10	2024-05-12T05:00:23.915Z	\N	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	873f0443-1ed1-4044-ae2e-da17f59ddfc0	1	2024-05-11T13:08:15.144Z	\N	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	1	2024-05-11T13:08:23.021Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	1d02a2b6-3aed-4dd4-acd1-27acb87856f3	0	2024-05-12T04:00:41.269Z	2024-05-14T13:09:31.165Z	\N
1a897e88-5092-4071-a4ae-94b887867191	cd66b753-ee1e-414f-8975-0881b9d636b2	0	2024-05-12T04:03:24.573Z	2024-05-14T13:13:31.869Z	\N
792ef61b-0f2d-4b0f-9f10-41bbe3327bdf	5a4901b0-14eb-4c88-92ff-bb82aff88094	0	2024-05-14T11:36:53.211Z	2024-05-14T17:49:15.489Z	\N
1a897e88-5092-4071-a4ae-94b887867191	2da60344-b6ae-4028-99e4-a5e4bded0551	10	2024-05-12T04:02:20.599Z	\N	\N
4c81bb1d-2bb9-4711-b7e1-4d17554407e9	c7493f68-4e46-453d-9bf0-36fff3189bf7	10	2024-05-12T04:07:49.409Z	\N	\N
4c81bb1d-2bb9-4711-b7e1-4d17554407e9	6942f871-6e35-4eeb-a3ff-8edc8959aa22	10	2024-05-12T04:09:02.033Z	\N	\N
4c81bb1d-2bb9-4711-b7e1-4d17554407e9	9717b995-f922-4e7e-970b-c0275d597c01	10	2024-05-12T04:09:56.359Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	7d077d4d-2f97-4c24-9e73-e64765a3b2f8	0	2024-05-12T04:31:51.513Z	2024-05-13T13:50:28.828Z	\N
4c81bb1d-2bb9-4711-b7e1-4d17554407e9	463b2006-ff25-4d63-8b79-17666b4b4d02	10	2024-05-12T04:11:54.343Z	\N	\N
129532a9-2d3b-4e30-a35e-950836dbda0e	873f0443-1ed1-4044-ae2e-da17f59ddfc0	10	2024-05-12T04:57:27.152Z	\N	\N
129532a9-2d3b-4e30-a35e-950836dbda0e	8e596eea-5ab7-480b-a22f-2af852198a92	10	2024-05-12T04:57:41.337Z	\N	\N
5c3a2bbf-3603-4741-ae95-9d89a889351e	873f0443-1ed1-4044-ae2e-da17f59ddfc0	10	2024-05-12T04:59:31.888Z	\N	\N
5c3a2bbf-3603-4741-ae95-9d89a889351e	af969f99-eb8a-48be-89a8-028dc76417ad	10	2024-05-12T05:01:52.781Z	\N	\N
5c3a2bbf-3603-4741-ae95-9d89a889351e	d1af0c2b-4e1f-4cbe-9f97-722264b50722	100	2024-05-12T05:03:04.876Z	2024-05-12T05:03:16.968Z	\N
5c3a2bbf-3603-4741-ae95-9d89a889351e	9e6662ae-0354-4bf7-a7cc-457bbe6ffe6e	100	2024-05-12T05:03:31.606Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	5d7dee46-9a08-4faf-adf8-5b341231f09a	10	2024-05-12T05:27:58.514Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	970603df-a58e-4cbf-94f1-4aff2c5743a1	10	2024-05-12T05:28:17.241Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	5d2691d5-f880-411e-a4c2-e61577985a55	10	2024-05-14T11:53:17.731Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	bb658f0c-11bd-47be-ab4c-d656c34edc5b	10	2024-05-14T11:54:24.738Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	01d3d6df-cd76-4f62-9c39-ddd968a9a634	10	2024-05-12T05:30:06.298Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	fcc2aee3-3a74-45a7-a590-961a2f78050d	10	2024-05-12T05:30:50.968Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	0	2024-05-11T13:22:17.815Z	2024-05-14T17:35:33.608Z	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	fcc2aee3-3a74-45a7-a590-961a2f78050d	0	2024-05-12T05:12:49.289Z	2024-05-15T01:39:00.169Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	b59e4cc1-39fb-4cd4-b426-4b6d38067fe7	0	2024-05-11T13:30:56.497Z	2024-05-13T15:37:49.973Z	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	a9b67a55-6742-4c3f-98ad-af8a69c05686	10	2024-05-12T05:26:38.996Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	28114a40-6489-4712-b5ba-5968b0fc8fd9	10	2024-05-12T05:27:50.109Z	\N	\N
77a0f4cc-a62d-44bb-bba2-058d1d006d0a	5aad0adb-f132-45f7-b2bb-248f3d8dfacf	0	2024-05-14T12:08:04.957Z	2024-05-14T14:11:59.028Z	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	0	2024-05-11T13:46:10.664Z	2024-05-13T12:56:22.279Z	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	e1075af4-70c1-4124-b93b-20149f24e57b	100	2024-05-11T13:37:53.629Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	f78852fc-2874-4921-9dc4-7f9106c21233	100	2024-05-11T13:38:42.479Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	4ae4acec-ee0d-40f3-931c-37759e97ecff	100	2024-05-11T13:39:09.533Z	\N	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	21d0b947-aabf-445d-8622-464875e4b937	10	2024-05-11T13:44:23.240Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T12:23:20.161Z	2024-05-14T12:23:23.338Z	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	7f8e851f-d072-469a-bf7c-1d04b14b18b4	10	2024-05-11T13:44:49.234Z	\N	\N
25099d81-7376-4062-9f96-8379695d9aa7	e332e031-a18e-4407-81e9-660530260e64	0	2024-05-11T13:49:45.348Z	2024-05-14T14:43:55.769Z	\N
25099d81-7376-4062-9f96-8379695d9aa7	fc763265-b328-4fa5-9975-307e97ec35ca	0	2024-05-11T13:49:58.107Z	2024-05-14T14:44:44.255Z	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	580c2fac-3c42-48d2-b79b-2fbc7b6fc7b0	10	2024-05-11T13:47:00.213Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	873f0443-1ed1-4044-ae2e-da17f59ddfc0	10	2024-05-12T05:38:44.653Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	799e9f43-b5e8-4484-be33-09c442390253	10	2024-05-12T05:38:59.982Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	b02cec28-dac2-42ec-a552-0558f598fa51	10	2024-05-12T05:39:16.727Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	96015ec9-b6d9-4ab2-9bac-b2e8375bb6b5	10	2024-05-12T05:40:38.881Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	2ac83258-0e18-4373-9edc-d78286bc955c	10	2024-05-12T05:41:07.297Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	5aad0adb-f132-45f7-b2bb-248f3d8dfacf	10	2024-05-12T05:41:51.662Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	860776d6-b97a-431f-b089-faee9ca777bc	10	2024-05-12T05:42:12.322Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	970603df-a58e-4cbf-94f1-4aff2c5743a1	10	2024-05-12T05:43:00.063Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	761e4265-2f75-46a2-8cf3-16b8a5a69963	10	2024-05-12T05:43:18.063Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	5d954f15-2faa-4c18-89be-883d47c19405	10	2024-05-12T05:43:49.406Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	88b8e542-7cbe-4175-a37e-30bf2c58c6ce	10	2024-05-12T05:43:58.408Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	27411da6-fbb8-41a1-aaf2-54588452c9b4	10	2024-05-12T05:44:09.058Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	d34f6cfc-a2d4-4456-8f61-9f3daae702a2	10	2024-05-12T05:51:40.116Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	924e9906-692e-460a-bfe4-de2a6c33a5f1	10	2024-05-12T05:52:36.252Z	\N	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	ad9a4dad-3dc5-46b3-b387-889fc5b0b186	10	2024-05-11T13:45:23.426Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	2b97d1b4-544b-4a93-bf2b-665412432bc6	100	2024-05-11T13:45:40.172Z	\N	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	fc763265-b328-4fa5-9975-307e97ec35ca	10	2024-05-11T13:46:44.983Z	\N	\N
5d7ea8ee-34d8-441a-a1f7-837a8ae94dd4	d382afa7-cef6-4e16-89aa-22a5e20562e6	1	2024-05-14T12:23:47.253Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	8df22c40-25d7-4f96-8bc6-0fe734f948d3	0	2024-05-14T12:28:06.190Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	8812cea7-01bc-4c7f-892d-cd0071589195	10	2024-05-14T12:35:06.641Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	869ed149-9375-4fac-a687-d5450b53ceb8	10	2024-05-14T12:38:06.911Z	\N	\N
bc133f46-b2e2-4560-8074-49512936042c	ddd88a43-eb5a-416a-9ed1-2be44c5982a8	100	2024-05-11T14:11:18.535Z	\N	\N
fd2d679b-4e9c-45e3-a8e2-4f4db15b7555	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-11T14:12:36.103Z	\N	\N
fd2d679b-4e9c-45e3-a8e2-4f4db15b7555	81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	10	2024-05-11T14:12:43.955Z	\N	\N
fd2d679b-4e9c-45e3-a8e2-4f4db15b7555	2df34cb2-b419-4cd9-bac0-fee998327fd6	10	2024-05-11T14:12:56.467Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	3b38eca1-e08a-451f-aa40-d2138daa2b08	100	2024-05-14T12:38:20.879Z	2024-05-14T12:38:24.872Z	\N
46a75d17-ebd9-4c36-b242-0d9aaaede3ab	c8ce7a65-be98-4e38-beaa-b9907dc003e9	10	2024-05-11T14:15:07.552Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	676c22c2-00f3-4f6a-a833-f1d5f5c3b54f	100	2024-05-14T12:40:10.324Z	\N	\N
46a75d17-ebd9-4c36-b242-0d9aaaede3ab	cab34f52-bc3e-46d8-96f0-f5b20c7ca485	10	2024-05-11T14:15:41.300Z	\N	\N
46a75d17-ebd9-4c36-b242-0d9aaaede3ab	e1075af4-70c1-4124-b93b-20149f24e57b	10	2024-05-11T14:15:52.680Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	ab74a1e0-5969-4d81-b28a-706ab2920afd	100	2024-05-14T12:43:17.436Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	ea75bc9f-86a7-41ba-b9c3-66ecee82860d	100	2024-05-14T12:43:25.537Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-11T14:21:46.474Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	10	2024-05-11T14:22:01.842Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-11T14:23:52.311Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	dcd3f6fb-7b64-4fad-8da4-d57f83e30d5c	10	2024-05-11T14:24:16.440Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	b3dbcd74-cbaa-45af-852c-a0433220aa2a	100	2024-05-11T14:23:45.176Z	2024-05-14T13:58:04.711Z	\N
37c914da-7334-46ea-9c73-1f7513500268	fc763265-b328-4fa5-9975-307e97ec35ca	10	2024-05-11T14:35:08.201Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	eb3caab6-6357-4757-86b2-efaf8d691de7	10	2024-05-11T14:35:10.816Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	6a220720-6fa3-42cc-8101-621da51b521f	100	2024-05-11T14:29:39.808Z	2024-05-14T14:06:23.050Z	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	f013501e-e9ea-478f-af0d-648f96244b14	10	2024-05-11T14:06:16.724Z	2024-05-11T14:41:23.418Z	\N
0d3571e1-9647-4419-929e-2f0707fcc4a9	3453dec4-2fa0-4a3d-a053-0af80abdc82c	10	2024-05-12T09:05:38.427Z	\N	\N
0d3571e1-9647-4419-929e-2f0707fcc4a9	e6d4396b-4097-4acf-a4e8-aac46722ad68	10	2024-05-12T09:05:58.397Z	\N	\N
0d3571e1-9647-4419-929e-2f0707fcc4a9	d34f6cfc-a2d4-4456-8f61-9f3daae702a2	10	2024-05-12T09:06:13.654Z	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	ea2c6721-693d-496e-8442-a2381d48430b	10	2024-05-11T14:16:27.835Z	2024-05-12T21:13:22.281Z	\N
14b58682-3c64-42fa-a61a-827f913fc174	a1e9e0d1-cf48-4f52-8f41-cc24e44a9cce	10	2024-05-11T14:17:35.731Z	2024-05-12T21:14:28.242Z	\N
446e4dc9-c485-47bb-8f49-3107c097e735	e162ec59-91e5-4621-8a2a-05848cd0f368	0	2024-05-11T14:17:21.653Z	2024-05-13T16:49:43.502Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	0	2024-05-11T14:42:16.548Z	2024-05-14T10:27:57.067Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	c7493f68-4e46-453d-9bf0-36fff3189bf7	100	2024-05-14T12:27:47.692Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	4ae4acec-ee0d-40f3-931c-37759e97ecff	0	2024-05-14T12:28:27.444Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	180bed77-0c81-45d1-be29-b094c8263533	10	2024-05-14T12:35:18.973Z	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	d609ed69-9c62-40c2-b80d-e0aeda8de704	100	2024-05-14T12:36:24.039Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	ef90a8b3-a3f1-42b9-bcca-81c496e641fc	10	2024-05-14T12:36:30.664Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	44c1015d-a43a-45b9-a4b9-7eee0d764c45	10	2024-05-14T12:39:48.773Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	540d800e-cf37-4bdc-91f8-d00b8edb52b9	100	2024-05-14T12:43:31.883Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	6b3962b3-33dd-422e-bdda-35dbe0afa554	10	2024-05-11T14:21:50.358Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	c8ce7a65-be98-4e38-beaa-b9907dc003e9	10	2024-05-11T14:21:53.429Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	367ed746-6c87-41d9-a29e-bf3540360ccf	10	2024-05-11T14:22:08.483Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-11T14:22:16.984Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	c905ca5a-0564-4d2a-b9b9-585cbce1cc62	10	2024-05-11T14:23:31.084Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	52634f35-73b2-4c60-99c9-1ec886f6e4b3	10	2024-05-11T14:24:00.020Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	2a088703-bffe-491a-8e62-4c9f796024d1	10	2024-05-11T14:24:45.908Z	2024-05-11T14:24:49.322Z	\N
37c914da-7334-46ea-9c73-1f7513500268	b2595c5c-ffe8-4396-a2c8-ea6e4d8d4e6a	10	2024-05-11T14:24:56.113Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	d609ed69-9c62-40c2-b80d-e0aeda8de704	10	2024-05-11T14:25:13.578Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	21d0b947-aabf-445d-8622-464875e4b937	10	2024-05-11T14:25:15.734Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	9ef89eb7-35f7-43bb-86ac-4d5df6516fbe	100	2024-05-14T12:46:34.138Z	\N	\N
f2474450-56fd-4f80-b189-0eb91c5c54f5	ea2c6721-693d-496e-8442-a2381d48430b	10	2024-05-14T13:23:44.534Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	fbe933e1-c88c-4ec8-9a83-4cd88ceefcb6	10	2024-05-11T14:36:07.599Z	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	13a4afa8-2b27-43c2-8ac1-0a2b29ce7832	10	2024-05-14T12:57:05.752Z	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	6e9a8909-a27a-43f0-8945-7dfec5174372	100	2024-05-14T12:57:20.122Z	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	15129370-e9f5-4797-87cf-225625bc7642	10	2024-05-14T12:57:22.131Z	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	eb705387-0d48-4762-be63-4c281a8b1d8e	10	2024-05-14T12:57:40.586Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	a8c18a44-ec60-4a19-8e96-785c49de9630	10	2024-05-11T14:39:09.561Z	\N	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	46862e71-22b7-4023-ba93-2936050c6f9f	10	2024-05-11T14:41:34.683Z	\N	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	5facb97a-2e27-4ddf-bbde-0aeed05bb262	10	2024-05-11T14:41:50.802Z	2024-05-11T14:42:01.299Z	\N
5577f295-484a-41bf-8b11-5848f060ee9e	61a8eb1b-7e23-43bd-8ad2-edc43843314b	10	2024-05-14T12:58:10.559Z	\N	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-11T14:42:22.296Z	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	2d16c993-d60f-49fb-ad83-b1f2cac4fe59	10	2024-05-14T12:58:56.665Z	2024-05-14T12:59:11.463Z	\N
5577f295-484a-41bf-8b11-5848f060ee9e	86cad6e9-5244-4991-9340-eed4798547ae	10	2024-05-14T13:00:22.396Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	e162ec59-91e5-4621-8a2a-05848cd0f368	100	2024-05-14T13:04:10.975Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	a8c18a44-ec60-4a19-8e96-785c49de9630	0	2024-05-11T22:08:22.812Z	2024-05-14T13:09:59.475Z	\N
1a897e88-5092-4071-a4ae-94b887867191	a4f73ff7-1c89-42b8-84d2-8983e7b7fd6d	0	2024-05-14T13:02:23.601Z	2024-05-14T13:10:38.607Z	\N
fbe32f25-fa62-422d-823d-f388000f47d4	a405abfb-5aba-42e1-bd0f-e8a346a42305	100	2024-05-14T13:15:27.822Z	\N	\N
0d3571e1-9647-4419-929e-2f0707fcc4a9	e904d182-a778-4fac-94fb-61cfc5b6a8ba	10	2024-05-12T09:08:14.798Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	160ef3da-52f4-4dcb-9d1b-27fc1d9f651f	0	2024-05-12T01:57:22.306Z	2024-05-14T13:15:41.554Z	\N
1a897e88-5092-4071-a4ae-94b887867191	ea2c6721-693d-496e-8442-a2381d48430b	10	2024-05-14T13:15:53.869Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	6716f08d-fa4f-48a3-8507-4c0bcbee5535	100	2024-05-14T13:15:56.313Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	a9c5cfe0-a05c-4e45-b38a-f5db5f837304	10	2024-05-14T13:16:09.658Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	6ab655f5-0dbe-4e4c-9edf-d6bd4d4ca8c2	10	2024-05-14T13:26:48.699Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	6763caea-7b53-466a-a9b3-40ebfac0f9bb	10	2024-05-14T13:16:18.867Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	3f4a6357-7a1b-4c64-a48b-7c6136e3f472	10	2024-05-14T13:16:19.662Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	e3136fbf-05df-4991-b838-ce36d3bc2d3d	10	2024-05-14T13:19:41.250Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	e04a6c7b-a808-4343-a5c5-7809179b80cd	10	2024-05-14T13:22:46.683Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	158fb67d-00f8-4752-be65-4108101bdd7f	10	2024-05-14T13:28:01.576Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	6c72a74f-0eae-481a-93a5-4d1b0e607ce0	10	2024-05-14T13:28:17.989Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	d7f296ff-11e1-45cf-a360-7989c69affb1	10	2024-05-14T13:28:21.183Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	99d42576-350e-4fd5-b319-34aa2f8532e6	10	2024-05-14T13:28:22.803Z	\N	\N
70084b0f-4b01-431e-a2bf-ee85df1da7cd	c00803c6-01e0-49ed-b030-3cf5c67f54e0	100	2024-05-14T13:28:26.172Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	91c1ee8c-c4bc-4858-86cb-c47b80846004	10	2024-05-14T13:28:46.952Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	01b0f1a3-354a-4f7a-a724-c022801d0734	10	2024-05-14T13:28:47.215Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	cc5459a2-9b43-486b-8c3f-99c507c68562	0	2024-05-11T14:39:22.174Z	2024-05-14T13:59:05.011Z	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	e1075af4-70c1-4124-b93b-20149f24e57b	100	2024-05-14T12:33:18.349Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	d382afa7-cef6-4e16-89aa-22a5e20562e6	10	2024-05-14T12:33:41.938Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	10	2024-05-14T12:33:54.241Z	\N	\N
cde9c9b1-81e4-403a-b4d9-6a7e9073aff2	74dc7f47-7298-418b-9b5b-04c47914721b	10	2024-05-12T09:46:25.033Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	ca0ef946-0de3-47a2-a0cb-df72de35aeec	10	2024-05-14T12:34:12.204Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	38ce9b58-53ff-4a90-a73d-2c869c07a5b3	10	2024-05-14T12:37:53.715Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	da31cce8-8f58-4e67-b299-b42991224a79	10	2024-05-14T12:39:07.988Z	\N	\N
cb747503-0761-4af5-877b-81dc93234425	3767b065-0ed4-4a52-a2e7-cc2e119740f2	10	2024-05-14T12:42:29.055Z	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	329140fb-9803-4f82-9334-b2b485cd1b65	100	2024-05-14T12:57:39.537Z	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	bdf7609e-a731-4480-874a-7ed5a8de5627	10	2024-05-14T12:57:44.754Z	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	e0a4593b-5e8f-4f1e-89de-e584e8cdc843	10	2024-05-14T12:58:25.394Z	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	6795ba1a-3908-4edf-95e6-96c61b21914e	10	2024-05-14T12:59:27.388Z	2024-05-14T12:59:36.152Z	\N
3c25886c-39e0-482b-9b3e-cd1e7e59249c	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T13:14:00.290Z	2024-05-14T13:14:07.894Z	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	c1e4ef3f-0d86-418f-9d9f-05f028246bed	10	2024-05-11T14:43:21.618Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	fe759238-aa02-4e06-94e5-cd2222df803b	10	2024-05-14T13:15:11.698Z	\N	\N
46a75d17-ebd9-4c36-b242-0d9aaaede3ab	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T13:15:08.240Z	2024-05-14T13:15:13.653Z	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	3810ff6f-2c32-4a64-a1c6-37be86fdaec6	10	2024-05-11T14:45:58.039Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	9553af2c-3c73-4c34-ab7f-1001c1c34e86	100	2024-05-14T13:15:20.341Z	\N	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	352af921-b2eb-4ca8-9775-5f124c622d6b	10	2024-05-11T14:47:16.117Z	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	655b4563-e2a3-4d27-a2fb-cf8fad8c91e4	10	2024-05-14T13:16:30.694Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	a75e630a-4b6f-4b5e-b013-12770df0a6f8	10	2024-05-14T13:16:34.763Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	e6e9ccb4-6608-49b3-bc7a-fabc4e6fdff4	10	2024-05-14T13:16:38.430Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	10	2024-05-14T13:16:48.988Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	3767b065-0ed4-4a52-a2e7-cc2e119740f2	100	2024-05-12T11:01:01.987Z	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	bcf3a747-91fc-4daa-9900-3dc1b30a6c60	100	2024-05-14T13:17:28.990Z	2024-05-14T13:17:42.880Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	d504cfeb-beed-4253-8d42-0e3a6c883170	10	2024-05-14T13:17:56.486Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	4e3b5069-295f-47ff-803a-4dfa23930107	10	2024-05-14T13:16:52.686Z	2024-05-14T13:18:27.865Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	42b6aceb-3e7a-4123-bfc7-dff305d16709	10	2024-05-14T13:21:15.360Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	2f521961-1ed9-4602-9d20-beeeee59c5ba	10	2024-05-14T13:21:50.024Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	2ae85dd6-9b1a-47e2-8eb9-c06c08316d8b	10	2024-05-14T13:23:30.718Z	\N	\N
95f16afe-05a4-4a7d-bf61-8d11c8de7376	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T13:23:53.825Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	a8c8c088-c127-474b-af7b-8431bf6513d0	10	2024-05-14T13:24:19.315Z	\N	\N
9b7e286c-3350-4067-8ed1-584168af5dca	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T13:24:36.219Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	6ecf5b89-427f-420d-b208-b1affbdb6dd1	0	2024-05-09T13:50:32.662Z	2024-05-14T13:25:47.404Z	\N
830e3066-a383-4ef9-9aaf-efc87ad30ed5	92f43fac-a809-4c60-b9fb-eff7dd29a8bb	10	2024-05-14T13:25:48.467Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	04739dc8-0a12-4c38-94e9-f20b696796a5	10	2024-05-14T13:25:49.025Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	a736cad0-9135-4ac2-bb96-d40350b52658	10	2024-05-14T13:27:30.326Z	2024-05-14T13:27:35.254Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	c8976b11-580c-4656-935f-10efe10a8206	0	2024-05-14T13:27:17.174Z	2024-05-14T13:27:35.615Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	29a5dd12-fba3-49db-8c3a-13f706d195d7	10	2024-05-14T13:27:41.535Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	6614f568-a5dc-4d13-90b8-8e5563088e9d	10	2024-05-14T13:27:45.340Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	3bb8fb06-b376-4489-80fe-59826066e849	10	2024-05-14T13:27:54.493Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	e22bf0ca-5fef-46f2-bc54-a3b627d41080	10	2024-05-14T13:28:13.707Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	18d94578-316e-4036-985f-956e5667b81f	0	2024-05-11T14:40:02.050Z	2024-05-14T13:58:50.896Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	3875894c-baf3-48c4-8932-059914a6e27c	100	2024-05-11T14:42:56.257Z	2024-05-13T12:40:52.619Z	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	ca0ef946-0de3-47a2-a0cb-df72de35aeec	10	2024-05-11T14:44:12.921Z	\N	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	3aaefd40-754e-434d-b4af-180fdd60174c	10	2024-05-11T14:46:47.587Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	689c1d43-a7ee-4b95-97df-1558fbfcb863	100	2024-05-11T14:44:33.921Z	2024-05-13T12:43:15.990Z	\N
5577f295-484a-41bf-8b11-5848f060ee9e	377fdec9-9b17-4086-8986-3e04508c4917	100	2024-05-14T13:18:06.162Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T13:18:08.390Z	2024-05-14T13:18:15.484Z	\N
5577f295-484a-41bf-8b11-5848f060ee9e	c4d56ef3-9ee0-4af2-bc94-64394f166252	100	2024-05-14T13:18:17.263Z	\N	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T13:19:03.906Z	2024-05-14T13:19:08.679Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	ae38df39-82a8-4e18-8fb7-d28ff55a9ee4	10	2024-05-14T13:20:30.675Z	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T13:20:39.591Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	52bd1913-9ae1-413d-8258-205049df62e6	100	2024-05-12T11:40:20.487Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	d4bfdb7f-b11d-405d-99c6-99c135eb89d4	0	2024-05-11T15:08:42.975Z	2024-05-13T15:14:51.871Z	\N
40d34be2-9c8a-41df-b86b-3c9909c0da47	dfbf27f0-d560-4aea-aba6-532a6346b994	0	2024-05-11T14:48:35.711Z	2024-05-13T15:25:06.727Z	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	cc5459a2-9b43-486b-8c3f-99c507c68562	10	2024-05-11T14:51:13.013Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	ee8da859-0ae9-4344-b778-19478e468148	0	2024-05-12T11:52:21.031Z	2024-05-13T18:51:39.730Z	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	fd54a76a-cdb9-4543-9df6-24baa384e38c	10	2024-05-11T14:51:29.525Z	\N	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	242ff884-0ac2-47a1-850e-cf1829423692	10	2024-05-11T14:51:56.276Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	b47dcd5b-0abe-44e1-bb92-d2b77e529edd	100	2024-05-12T11:53:02.352Z	2024-05-13T18:58:55.355Z	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	5e4b4b53-a13b-483c-a783-5576e0225d82	10	2024-05-14T13:28:51.229Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	3edb0a60-0bbf-4332-9fd1-8de317091fca	10	2024-05-14T13:29:06.116Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	ab840b70-dabb-4815-a8d9-5122baf2d7e8	10	2024-05-14T13:29:26.027Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	8b52634a-b86a-404c-b75e-947944b30430	10	2024-05-14T13:29:27.225Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	67063252-a1a8-4dc9-9b2e-61f3c58715c4	10	2024-05-14T13:29:32.260Z	\N	\N
70084b0f-4b01-431e-a2bf-ee85df1da7cd	572c112b-7886-4136-ad9e-5198c14bb222	10	2024-05-14T13:30:55.507Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	8e596eea-5ab7-480b-a22f-2af852198a92	10	2024-05-14T13:31:17.207Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	d25db3bc-0812-4d28-a03f-ff51419cf15d	10	2024-05-14T13:31:34.247Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	8812cea7-01bc-4c7f-892d-cd0071589195	10	2024-05-14T13:31:45.902Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	b8598db7-a21f-4bba-8ed4-d0317b0a5df8	100	2024-05-14T13:31:46.529Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	f33825fd-e6b0-47bb-80c0-80aef8a42e19	100	2024-05-14T13:31:53.007Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	b8598db7-a21f-4bba-8ed4-d0317b0a5df8	10	2024-05-14T13:32:51.536Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	f33825fd-e6b0-47bb-80c0-80aef8a42e19	10	2024-05-14T13:32:54.924Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	79c7f357-2e62-4ab9-8152-de7165e6dae6	10	2024-05-12T11:40:05.726Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	e904d182-a778-4fac-94fb-61cfc5b6a8ba	10	2024-05-14T13:33:11.553Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	3453dec4-2fa0-4a3d-a053-0af80abdc82c	10	2024-05-14T13:33:13.964Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	10	2024-05-14T13:33:25.858Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	13a4afa8-2b27-43c2-8ac1-0a2b29ce7832	10	2024-05-14T13:33:29.942Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	f94729df-e289-49d8-b55c-19ebdbfd783c	10	2024-05-14T13:33:33.550Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	c8e0a4e5-963c-41b0-a9a0-dc814215cb7c	10	2024-05-14T13:33:37.350Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	112f1380-ebef-4697-87e8-7cb8a1e05cf7	100	2024-05-14T13:33:44.598Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	172c7042-1a1a-4ed0-9cd7-9f818efde80a	10	2024-05-14T13:33:51.382Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	100	2024-05-14T13:33:52.990Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-11T15:20:29.268Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-11T15:20:34.795Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	8e5bab94-d594-46dd-a855-7675f5d8231f	10	2024-05-11T15:20:44.477Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	8c4ed7fa-8b92-492e-bf05-94d2fd4f5016	10	2024-05-11T15:20:50.572Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	10	2024-05-11T15:22:19.160Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	2fe71172-ab32-490e-91ae-0ec727bd3d52	10	2024-05-11T15:22:31.943Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	258deaa1-d4c1-4e51-9a29-9883f68d506d	10	2024-05-11T15:22:34.273Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	34c71dfe-0f7d-4b8f-8625-fa88449ac76d	10	2024-05-11T15:23:19.032Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	57b1bc7b-1bb1-4f92-85b5-8a5cd313c64c	10	2024-05-11T15:23:54.995Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	5ea0fec2-32ed-4302-9ef1-1daac2556be9	10	2024-05-11T15:24:08.568Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	83c733cc-e2b0-4d93-990e-e2e05bf5187c	10	2024-05-14T13:33:55.164Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	52634f35-73b2-4c60-99c9-1ec886f6e4b3	100	2024-05-14T13:34:00.472Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	f013501e-e9ea-478f-af0d-648f96244b14	100	2024-05-14T13:34:06.410Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	94701e72-8ebc-43e7-885a-9e2a810ad1e7	100	2024-05-14T13:35:12.662Z	\N	\N
ecd88536-268f-468d-9a9a-adb4074deb04	65437ee2-7b21-4796-a360-9ad17c50aef5	100	2024-05-12T12:05:46.441Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	f013501e-e9ea-478f-af0d-648f96244b14	100	2024-05-12T11:40:26.944Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	2c493101-799b-406c-9943-3cc8a75370f0	100	2024-05-14T13:35:22.596Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	66a98038-4588-431c-814d-0c440c4683af	100	2024-05-14T13:35:41.334Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	950a9045-f3c3-42d7-bf59-d42c5ef42d29	10	2024-05-13T00:13:07.663Z	2024-05-14T13:35:42.218Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	1976695e-a2d4-46c5-afa8-438094954f48	0	2024-05-14T13:38:07.290Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	10	2024-05-12T11:41:32.676Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	59ce1afa-2583-4810-b726-e8fa4c7e5464	100	2024-05-11T15:12:04.057Z	2024-05-12T02:07:14.198Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	62bd5d05-ba37-497a-a1a1-56795813790d	1	2024-05-12T11:48:23.720Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	4ff95cea-fbd8-4b79-8fde-04173c44b400	10	2024-05-12T11:50:56.916Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	52b5339a-b922-4d1a-9e58-b4a614cf5369	10	2024-05-12T11:51:04.386Z	\N	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	0bac5a5c-e260-41eb-806e-46397862d868	10	2024-05-11T14:47:53.887Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	6614f568-a5dc-4d13-90b8-8e5563088e9d	0	2024-05-12T11:52:25.607Z	2024-05-13T15:57:36.535Z	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	3b38eca1-e08a-451f-aa40-d2138daa2b08	10	2024-05-14T13:29:14.585Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	faeac6fc-4c69-4e2b-9b15-b47e85af78ba	10	2024-05-14T13:29:22.151Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	2fe71172-ab32-490e-91ae-0ec727bd3d52	10	2024-05-14T13:29:53.498Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	37a627ee-d6f6-4f94-8edc-190c89a3f255	10	2024-05-14T13:32:03.152Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	56ca5929-dc59-47f0-a24f-52ddd8c25de9	10	2024-05-14T13:32:16.231Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	1de79252-6c13-466b-ba1a-2e9c009fbfaa	100	2024-05-14T13:32:20.731Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	a1e9e0d1-cf48-4f52-8f41-cc24e44a9cce	100	2024-05-11T14:58:41.159Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	496185c5-16e8-4576-9778-0514ca727dbc	10	2024-05-14T13:32:25.014Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	367ed746-6c87-41d9-a29e-bf3540360ccf	100	2024-05-14T13:32:31.174Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	876548db-d180-4083-96ba-cddcb86134b0	10	2024-05-14T13:32:40.000Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	5facb97a-2e27-4ddf-bbde-0aeed05bb262	10	2024-05-14T13:32:43.570Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	52bd1913-9ae1-413d-8258-205049df62e6	100	2024-05-14T13:34:12.578Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	063d43f1-9f08-4943-8f82-b51aa4e49924	100	2024-05-14T13:34:29.074Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	ca0ef946-0de3-47a2-a0cb-df72de35aeec	10	2024-05-14T13:34:58.429Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	18b45eb3-755c-4d38-a974-2857f6b30638	0	2024-05-14T13:35:46.477Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	01d3d6df-cd76-4f62-9c39-ddd968a9a634	10	2024-05-14T13:35:55.889Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	9e6662ae-0354-4bf7-a7cc-457bbe6ffe6e	10	2024-05-14T13:36:47.381Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	8c4ed7fa-8b92-492e-bf05-94d2fd4f5016	100	2024-05-14T13:39:06.342Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	ab9131f3-cfb0-4df9-9043-b022f5e8b9ab	100	2024-05-14T13:39:57.275Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	70ca14b1-0240-4bc7-902c-903fbe74da31	100	2024-05-14T13:40:54.275Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	172c7042-1a1a-4ed0-9cd7-9f818efde80a	100	2024-05-14T13:41:00.314Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	48b8392c-9bcf-4b94-abff-33b565af4edd	100	2024-05-14T13:41:20.481Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	024cd66e-f35f-405b-bd88-705d071be713	100	2024-05-14T13:42:45.198Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	100	2024-05-14T13:43:07.885Z	\N	\N
26a1497d-7ba3-49cc-8a51-79bc23bc2676	9e66cff1-37e1-4631-8251-c7b03b287ada	10	2024-05-14T13:48:13.464Z	\N	\N
26a1497d-7ba3-49cc-8a51-79bc23bc2676	180bed77-0c81-45d1-be29-b094c8263533	10	2024-05-14T13:49:14.931Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	242ff884-0ac2-47a1-850e-cf1829423692	0	2024-05-11T14:39:20.001Z	2024-05-14T13:59:00.725Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	c957dded-1e08-4e25-a2f8-80d111aef57b	100	2024-05-14T14:02:15.768Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	52bd1913-9ae1-413d-8258-205049df62e6	100	2024-05-14T14:05:37.392Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	6347a939-ad2c-458e-a097-17fdb7ef34b1	100	2024-05-11T15:10:42.217Z	2024-05-12T19:58:06.082Z	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	10	2024-05-11T13:48:50.400Z	2024-05-12T21:49:16.305Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	fe9b91bf-1e73-4dac-9ad7-d06fb9f22ca0	100	2024-05-14T14:05:04.394Z	2024-05-14T14:05:39.656Z	\N
c8811d17-3f2a-41be-9646-0f214278cec1	f013501e-e9ea-478f-af0d-648f96244b14	100	2024-05-14T14:05:23.765Z	2024-05-14T14:05:47.319Z	\N
c8811d17-3f2a-41be-9646-0f214278cec1	ca0ef946-0de3-47a2-a0cb-df72de35aeec	10	2024-05-14T14:06:00.936Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	2cdfa6cc-5f3d-4858-a3ee-13f0a6c7eaf3	100	2024-05-14T14:06:55.897Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	38d96b67-2247-416a-af68-6b2b7ae65ad4	100	2024-05-14T14:07:12.704Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	9e66cff1-37e1-4631-8251-c7b03b287ada	10	2024-05-14T14:07:22.627Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	100	2024-05-14T14:07:35.471Z	\N	\N
2d2a7228-8ab1-464d-b30c-44d73ae857ca	e332e031-a18e-4407-81e9-660530260e64	0	2024-05-14T14:08:48.620Z	2024-05-14T21:26:22.767Z	\N
c8811d17-3f2a-41be-9646-0f214278cec1	c0c07df3-6215-4b07-8240-f462315ec075	10	2024-05-14T14:08:01.460Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	ebfbd0bc-1356-4086-9255-d5a2dcc7c660	10	2024-05-14T14:08:54.019Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	180bed77-0c81-45d1-be29-b094c8263533	10	2024-05-14T14:09:54.726Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	55bf190c-f2eb-4f80-89f0-76dec0843ad4	10	2024-05-14T14:10:36.895Z	\N	\N
77a0f4cc-a62d-44bb-bba2-058d1d006d0a	fe6cc6f1-779b-46d5-aa3f-7f57e08fecfa	10	2024-05-14T14:10:48.306Z	\N	\N
77a0f4cc-a62d-44bb-bba2-058d1d006d0a	0a238fb4-a6f0-4d93-9a1b-02245afa2513	10	2024-05-14T14:10:56.051Z	\N	\N
77a0f4cc-a62d-44bb-bba2-058d1d006d0a	81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	10	2024-05-14T14:11:12.201Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	24857c6e-7fe5-45e8-9cc5-c5858390c06d	10	2024-05-14T14:17:05.429Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	9af075ac-8d39-4843-8907-02ccb6b5910b	10	2024-05-14T14:17:29.579Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	51f89876-fee4-4887-a74d-351d12ca4c5e	10	2024-05-14T14:21:34.012Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	c4d3a5b9-3679-4acf-ab91-15a34761ce78	10	2024-05-14T14:21:38.186Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	81b2e05e-41cf-4bb0-96c2-a622640e6f85	10	2024-05-14T14:21:49.970Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	4c4b59cc-d639-4952-87e3-107c61c2a673	10	2024-05-14T14:29:53.875Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	c2d8b7f0-b0cc-4d81-b935-77c12baa9b0e	10	2024-05-14T14:30:23.986Z	\N	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	21c26bde-bccb-45c2-b21f-41fb00a1fb2d	10	2024-05-11T14:48:27.130Z	\N	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	c20019f9-5d76-42b2-b993-73a62a2c7f6d	10	2024-05-11T14:49:20.772Z	\N	\N
40d34be2-9c8a-41df-b86b-3c9909c0da47	9c28c037-b76a-443a-9e9d-33312e926174	0	2024-05-11T14:48:30.071Z	2024-05-13T15:24:49.136Z	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	21da2418-e978-41cb-90a8-d7e677b4d577	10	2024-05-14T13:30:27.049Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	43a27a70-3ed5-4a3d-8428-623810c3f717	10	2024-05-14T13:30:27.783Z	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	69732c83-e2ee-481f-b4c5-e55932e8d51f	100	2024-05-11T14:54:54.022Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	3814a22f-b8a5-426e-ac21-138c2d62a0ba	10	2024-05-14T13:30:33.813Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	5e19dcf8-680f-4755-a69f-be4080c95e6f	10	2024-05-14T13:30:43.976Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	4ae6c9da-c2d7-4381-a309-a938b0258122	10	2024-05-14T13:31:01.488Z	\N	\N
ecd88536-268f-468d-9a9a-adb4074deb04	c68df5a4-5564-4810-8a23-d83e7030cd15	100	2024-05-12T12:05:10.688Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	d01c1d11-e401-4151-b0ec-52c26ce54b32	1	2024-05-14T13:38:46.890Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	dcd3f6fb-7b64-4fad-8da4-d57f83e30d5c	100	2024-05-14T13:39:30.566Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	3875894c-baf3-48c4-8932-059914a6e27c	100	2024-05-14T13:39:53.234Z	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	bd2a5ee3-0fc6-4777-b4d1-4bb38ebbd0d4	1	2024-05-14T13:40:07.834Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	e6e9ccb4-6608-49b3-bc7a-fabc4e6fdff4	100	2024-05-14T13:40:08.806Z	\N	\N
79f05644-27f7-4e06-908b-1611d4b477ed	63aacfa9-9d2d-45b3-90c5-c59af6de6f12	100	2024-05-11T15:12:49.531Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	2f918372-5531-4e84-90a5-4520583e738c	10	2024-05-14T13:40:15.013Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	8b2c49f5-c34f-4ac9-abb0-5810c10e3dcb	100	2024-05-14T13:40:30.761Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	f92f19df-fcfc-4187-ba73-3457c765e71a	100	2024-05-14T13:40:44.646Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	3a9fc3a5-6dcb-423f-812e-3175b59ea51c	100	2024-05-14T13:41:30.322Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	723e8686-19d8-4b51-a250-e05885d9e081	100	2024-05-14T13:41:38.405Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	69732c83-e2ee-481f-b4c5-e55932e8d51f	10	2024-05-11T15:19:50.774Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	da31cce8-8f58-4e67-b299-b42991224a79	100	2024-05-14T13:42:01.551Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	83c7d111-7d55-4bf4-b61d-8fa5fbcfb012	10	2024-05-11T15:20:18.185Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	fd54a76a-cdb9-4543-9df6-24baa384e38c	10	2024-05-11T15:20:23.687Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	c84192e1-0605-4b6f-8302-99aa29116f1f	10	2024-05-11T15:21:28.046Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	46c21b60-cd85-426c-ab78-b2dfbbab9e4e	10	2024-05-11T15:23:36.250Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	f0acd27c-a496-46a3-a2ba-bea24049ea20	100	2024-05-14T13:42:08.110Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	6390b091-e28c-4b25-9f51-d96c0ad34e79	100	2024-05-14T13:42:21.213Z	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	319870a5-c97e-48b4-b5b8-4d05fcc09fdc	100	2024-05-14T13:43:03.401Z	\N	\N
ecd88536-268f-468d-9a9a-adb4074deb04	65bc4ea4-a0db-4ac4-b343-b9d587be224b	100	2024-05-12T12:07:45.315Z	\N	\N
ecd88536-268f-468d-9a9a-adb4074deb04	0690d265-7ef9-4254-8384-ad5cc97a35c9	100	2024-05-12T12:08:21.651Z	\N	\N
ecd88536-268f-468d-9a9a-adb4074deb04	be3edd3b-5dff-496b-9f1f-07bd0907d6a7	100	2024-05-12T12:10:14.688Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	21c26bde-bccb-45c2-b21f-41fb00a1fb2d	10	2024-05-12T12:44:07.209Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	52224d1e-f797-48b2-8dfa-3e550e4cf4ce	10	2024-05-12T12:45:35.813Z	2024-05-12T12:47:26.310Z	\N
4767eeec-77b4-4236-a418-6f5cd1ddb05c	3edb0a60-0bbf-4332-9fd1-8de317091fca	1	2024-05-14T13:44:03.232Z	\N	\N
4767eeec-77b4-4236-a418-6f5cd1ddb05c	177af46d-db63-49b3-bc1a-8d74136fb359	1	2024-05-14T13:45:30.811Z	\N	\N
26a1497d-7ba3-49cc-8a51-79bc23bc2676	d382afa7-cef6-4e16-89aa-22a5e20562e6	10	2024-05-14T13:47:05.565Z	\N	\N
26a1497d-7ba3-49cc-8a51-79bc23bc2676	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	10	2024-05-14T13:47:20.486Z	\N	\N
c8961acc-55b0-47c8-9add-ec746924eb48	81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	100	2024-05-14T13:47:29.236Z	\N	\N
c8961acc-55b0-47c8-9add-ec746924eb48	1beaa417-91ee-4ccc-b779-a4c2a5a81807	100	2024-05-14T13:47:36.387Z	\N	\N
26a1497d-7ba3-49cc-8a51-79bc23bc2676	112f1380-ebef-4697-87e8-7cb8a1e05cf7	10	2024-05-14T13:47:36.411Z	\N	\N
26a1497d-7ba3-49cc-8a51-79bc23bc2676	8812cea7-01bc-4c7f-892d-cd0071589195	10	2024-05-14T13:48:57.169Z	\N	\N
79f05644-27f7-4e06-908b-1611d4b477ed	14274ddb-ffb6-429c-9aa2-e68ece7d1ab9	100	2024-05-11T15:13:06.531Z	\N	\N
79f05644-27f7-4e06-908b-1611d4b477ed	1d3bbf0a-b9d6-4766-884c-5dbcf5f941e2	100	2024-05-11T15:14:06.994Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	1d3bbf0a-b9d6-4766-884c-5dbcf5f941e2	10	2024-05-11T15:19:58.490Z	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	df887393-215b-4be9-acc7-e2eb66565ae5	10	2024-05-11T15:21:59.082Z	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	b355c6b7-f9c9-4b2f-92a2-bb7f8adeb790	10	2024-05-12T12:33:21.242Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	f76cd266-64e7-4968-854b-6308be0fe2a5	10	2024-05-12T12:41:50.331Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	5a7c7193-ac38-4376-8ee4-d18034315a7c	10	2024-05-12T12:42:40.607Z	\N	\N
26a1497d-7ba3-49cc-8a51-79bc23bc2676	242ff884-0ac2-47a1-850e-cf1829423692	10	2024-05-14T13:49:35.947Z	\N	\N
26a1497d-7ba3-49cc-8a51-79bc23bc2676	59ce1afa-2583-4810-b726-e8fa4c7e5464	10	2024-05-14T13:49:49.799Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	496185c5-16e8-4576-9778-0514ca727dbc	100	2024-05-14T13:50:41.885Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	63a59ee2-0622-4383-b74b-c3a8d4d484b3	10	2024-05-12T12:42:17.978Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	0d3f2a26-0bec-4cee-9c9b-62b7dd53345c	10	2024-05-12T12:45:59.063Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	63b4f328-50d6-45a8-9780-2e795efffaa6	10	2024-05-12T12:47:38.899Z	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	9cf774c5-4ca4-45ba-9cc2-6989d84f9569	10	2024-05-12T12:47:42.748Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	676c22c2-00f3-4f6a-a833-f1d5f5c3b54f	10	2024-05-12T13:03:31.891Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	fe759238-aa02-4e06-94e5-cd2222df803b	10	2024-05-12T13:04:31.422Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-12T13:05:29.382Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	f94729df-e289-49d8-b55c-19ebdbfd783c	10	2024-05-12T13:05:52.484Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	924e9906-692e-460a-bfe4-de2a6c33a5f1	10	2024-05-12T13:06:15.170Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	f013501e-e9ea-478f-af0d-648f96244b14	10	2024-05-12T13:05:39.839Z	2024-05-12T13:07:47.567Z	\N
40d34be2-9c8a-41df-b86b-3c9909c0da47	9c17284c-d379-4b76-9d87-5c573b5eec6c	0	2024-05-14T13:49:46.802Z	2024-05-14T13:51:32.320Z	\N
37c914da-7334-46ea-9c73-1f7513500268	1976695e-a2d4-46c5-afa8-438094954f48	10	2024-05-14T13:52:27.772Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	3814a22f-b8a5-426e-ac21-138c2d62a0ba	100	2024-05-14T13:53:29.326Z	\N	\N
40d34be2-9c8a-41df-b86b-3c9909c0da47	319870a5-c97e-48b4-b5b8-4d05fcc09fdc	0	2024-05-14T13:53:22.759Z	2024-05-14T13:54:23.659Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	ca0ef946-0de3-47a2-a0cb-df72de35aeec	100	2024-05-14T14:00:31.083Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	8812cea7-01bc-4c7f-892d-cd0071589195	100	2024-05-14T14:01:03.805Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	100	2024-05-14T14:01:37.837Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	f1570b6d-f756-493e-a151-115f51f1e747	100	2024-05-14T14:02:02.907Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	69732c83-e2ee-481f-b4c5-e55932e8d51f	100	2024-05-14T14:03:05.446Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	6a220720-6fa3-42cc-8101-621da51b521f	100	2024-05-14T14:04:23.396Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	f94729df-e289-49d8-b55c-19ebdbfd783c	100	2024-05-14T14:04:25.106Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	10	2024-05-14T14:04:40.455Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	5facb97a-2e27-4ddf-bbde-0aeed05bb262	10	2024-05-14T14:04:55.425Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	112f1380-ebef-4697-87e8-7cb8a1e05cf7	10	2024-05-14T14:05:09.397Z	\N	\N
26a1497d-7ba3-49cc-8a51-79bc23bc2676	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	10	2024-05-14T13:50:58.372Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	da31cce8-8f58-4e67-b299-b42991224a79	10	2024-05-12T13:05:11.655Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	053d6422-e791-474c-9820-90252e04da58	10	2024-05-12T13:06:30.549Z	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	10	2024-05-12T13:06:54.452Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	e4e767ff-be22-4c15-99a3-fac2b97683df	10	2024-05-14T13:51:19.393Z	\N	\N
40d34be2-9c8a-41df-b86b-3c9909c0da47	f2b36d7a-84ca-49f5-a2ad-c281c80ca7aa	10	2024-05-14T13:51:22.724Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	e966d8d8-9212-49c6-a1c2-385a61edab45	10	2024-05-14T13:51:34.461Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	2c493101-799b-406c-9943-3cc8a75370f0	10	2024-05-14T13:52:09.861Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	100	2024-05-14T13:53:44.426Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	2b97d1b4-544b-4a93-bf2b-665412432bc6	0	2024-05-14T13:53:08.479Z	2024-05-14T13:54:28.705Z	\N
40d34be2-9c8a-41df-b86b-3c9909c0da47	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	0	2024-05-14T13:53:26.178Z	2024-05-14T13:54:29.080Z	\N
37c914da-7334-46ea-9c73-1f7513500268	652b4e71-8aec-46f6-a361-fe78ac0efe10	100	2024-05-14T13:54:55.506Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	c4976a72-788e-4360-ad86-bb4939bebcc2	100	2024-05-14T13:57:21.422Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	180bed77-0c81-45d1-be29-b094c8263533	100	2024-05-14T14:01:13.855Z	\N	\N
94eb5d46-85cf-4915-a8f9-e10bf77e401d	87d09650-d0e9-4203-867e-b6e167a1171b	0	2024-05-13T19:09:28.216Z	2024-05-14T14:06:04.738Z	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	ea75bc9f-86a7-41ba-b9c3-66ecee82860d	100	2024-05-14T14:06:13.305Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	540d800e-cf37-4bdc-91f8-d00b8edb52b9	100	2024-05-14T14:06:22.882Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	10	2024-05-14T14:06:43.839Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	aac720f4-bda4-4035-bf3a-4d00c76809a7	100	2024-05-14T14:06:48.593Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	15129370-e9f5-4797-87cf-225625bc7642	10	2024-05-14T14:08:15.217Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	cc4fe301-5eaa-4792-bfd0-33ee4f4a64ad	10	2024-05-14T14:09:12.514Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	8812cea7-01bc-4c7f-892d-cd0071589195	10	2024-05-14T14:09:28.571Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	6b1d5955-578e-4b7c-a66a-118060c94901	10	2024-05-14T14:10:14.989Z	\N	\N
77a0f4cc-a62d-44bb-bba2-058d1d006d0a	15129370-e9f5-4797-87cf-225625bc7642	10	2024-05-14T14:11:53.935Z	\N	\N
77a0f4cc-a62d-44bb-bba2-058d1d006d0a	0eb6f7b8-4a6c-4e0d-a518-bfdf5c46fa22	10	2024-05-14T14:12:23.871Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	52808a2f-f878-4f2d-8c8d-17c2861358e8	0	2024-05-14T14:14:39.425Z	2024-05-14T14:15:33.830Z	\N
c8811d17-3f2a-41be-9646-0f214278cec1	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T14:15:25.020Z	2024-05-14T14:16:06.338Z	\N
c8811d17-3f2a-41be-9646-0f214278cec1	f92f19df-fcfc-4187-ba73-3457c765e71a	10	2024-05-14T14:16:45.315Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	db7e7a3f-51c5-4186-9656-7869389c7716	10	2024-05-14T14:20:21.437Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	feabdbad-dc62-4ffc-8683-3f5853fbaea9	10	2024-05-14T14:23:02.254Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	27493e1f-4f5c-4149-aabf-9c4f6697a35f	10	2024-05-14T14:23:38.583Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	2c98279b-bbd2-4645-96a3-51edb69cf509	10	2024-05-14T14:24:31.877Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	ab8709c7-2655-4f0f-b1bc-68363acf5f87	10	2024-05-14T14:25:01.842Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	cbe1445b-256b-4d93-8829-6a1fda8f526c	10	2024-05-14T14:25:42.100Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	fab30458-721d-4712-90d5-3c15e0e102e9	10	2024-05-14T14:26:08.827Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	43f09bc7-2da9-4fe2-884d-987f1f11856c	10	2024-05-14T14:26:14.062Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	01794c4c-0038-4330-a478-0d10c85fb2d0	10	2024-05-14T14:28:29.805Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	e904d182-a778-4fac-94fb-61cfc5b6a8ba	10	2024-05-14T14:30:47.289Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	8ffbd7b9-7097-44b3-9a88-5dad7e78f3bc	10	2024-05-14T14:31:54.582Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	04a2d64b-69c0-4f6b-8975-4d41b4f43327	10	2024-05-14T14:32:43.432Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	e0a4593b-5e8f-4f1e-89de-e584e8cdc843	10	2024-05-14T14:33:23.709Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	bb658f0c-11bd-47be-ab4c-d656c34edc5b	10	2024-05-14T14:33:55.805Z	\N	\N
77a0f4cc-a62d-44bb-bba2-058d1d006d0a	55bf190c-f2eb-4f80-89f0-76dec0843ad4	100	2024-05-14T14:35:19.809Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	0bd6022d-21b2-47d1-8a71-1f679b62541c	10	2024-05-14T14:35:49.909Z	\N	\N
94eb5d46-85cf-4915-a8f9-e10bf77e401d	128514c2-90c9-4ab1-9ba8-47a02e780ecc	0	2024-05-14T14:05:24.190Z	2024-05-14T20:05:52.730Z	\N
2d2a7228-8ab1-464d-b30c-44d73ae857ca	f3c395aa-63af-4264-99e0-2bd29760c62e	0	2024-05-14T14:08:15.165Z	2024-05-14T21:25:18.004Z	\N
e2ee43f4-f513-428b-b082-89daf19057ac	5d9c4653-df10-4748-b65d-47196c34f644	100	2024-05-12T13:29:03.235Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	19237243-240d-4b13-b4b5-1cc2ae01571d	10	2024-05-14T14:15:51.681Z	\N	\N
77a0f4cc-a62d-44bb-bba2-058d1d006d0a	c51c47b6-4fad-45d6-9d30-f2b9c98f76f5	10	2024-05-14T14:13:49.193Z	2024-05-14T14:15:53.339Z	\N
c8811d17-3f2a-41be-9646-0f214278cec1	242ff884-0ac2-47a1-850e-cf1829423692	10	2024-05-14T14:16:06.482Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	6ee709d9-f990-41e3-9f92-a75f8d5e4855	10	2024-05-14T14:18:15.918Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	59ce1afa-2583-4810-b726-e8fa4c7e5464	10	2024-05-14T14:18:48.886Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	5c1839cf-e5e9-4963-9018-c4d6f9ac5aeb	10	2024-05-14T14:20:31.963Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	c2e9e058-dc82-4466-b3c1-fba6796e36a6	10	2024-05-14T14:22:13.589Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	eb1d5056-8b9b-455d-a179-172a747e3f20	10	2024-05-14T14:22:44.394Z	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	3704be1c-459a-4c7d-a18c-34dfd3a1c6cd	0	2024-05-14T14:20:43.321Z	2024-05-14T14:26:26.050Z	\N
c8811d17-3f2a-41be-9646-0f214278cec1	a736cad0-9135-4ac2-bb96-d40350b52658	10	2024-05-14T14:27:16.039Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	02db1cee-b5a4-45e9-ad0b-bb22cada46f8	10	2024-05-14T14:28:04.707Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	2c0eabfd-5c22-4174-b93d-b814a7706b9e	10	2024-05-14T14:28:59.156Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	e99b7beb-668d-45f0-b368-6fad52f284a5	10	2024-05-14T14:31:20.554Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	919d8585-40a8-45e9-b619-b9e7a7ba20ea	10	2024-05-14T14:34:42.841Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	7d8f08bd-0994-433f-890d-29690027bf6a	10	2024-05-14T14:35:10.560Z	\N	\N
982ec984-0e94-4855-ad46-46403578216c	69732c83-e2ee-481f-b4c5-e55932e8d51f	0	2024-05-12T13:59:33.128Z	2024-05-13T16:16:36.218Z	\N
be96408c-d616-47b2-8208-f89eabeeffec	6e71e6ec-9335-4db3-a0bd-4cfc3bed41f9	100	2024-05-12T13:40:25.572Z	\N	\N
be96408c-d616-47b2-8208-f89eabeeffec	3ccc7bd1-183d-4f51-9044-a523376e1a58	100	2024-05-12T13:41:02.936Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	f73c4835-f33f-4dbe-89bd-e93ac4c2c279	100	2024-05-12T13:45:53.943Z	\N	\N
982ec984-0e94-4855-ad46-46403578216c	01794c4c-0038-4330-a478-0d10c85fb2d0	0	2024-05-12T13:59:26.168Z	2024-05-13T16:17:11.083Z	\N
982ec984-0e94-4855-ad46-46403578216c	f8ba58b3-6549-49b7-b400-81ce225d365d	0	2024-05-12T13:59:43.150Z	2024-05-13T16:17:25.482Z	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-12T13:56:03.732Z	\N	\N
be96408c-d616-47b2-8208-f89eabeeffec	3453dec4-2fa0-4a3d-a053-0af80abdc82c	10	2024-05-12T13:58:32.341Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	b8352000-3e89-4d63-949b-3e51bd73f7f7	10	2024-05-12T13:42:12.013Z	2024-05-13T19:03:25.388Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	4ae6c9da-c2d7-4381-a309-a938b0258122	10	2024-05-12T13:41:15.634Z	2024-05-13T19:03:37.470Z	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	af26cae5-8bae-420c-8052-782b9598fded	10	2024-05-12T14:09:11.498Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	5a68adc5-f0cc-44f6-99e4-12cd88662d08	10	2024-05-12T14:09:18.375Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	83c7d111-7d55-4bf4-b61d-8fa5fbcfb012	10	2024-05-12T14:09:26.498Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	4124cef6-ffc1-40b7-8cb0-8b4a89dab6f2	10	2024-05-12T14:09:32.655Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	6d965a4b-3b38-4418-a95e-b0aec0e0eb7a	10	2024-05-12T14:09:39.826Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	d254df9f-d108-42f2-933e-3a67e2ee89ca	10	2024-05-12T14:11:50.655Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	25062b5d-9484-4b02-8eb2-338898b34844	10	2024-05-12T14:12:39.942Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	f217bb6b-8218-4858-b030-633bb3b96eb8	10	2024-05-12T13:42:28.323Z	2024-05-13T19:03:52.617Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	43d955ab-e615-4fa7-ad45-6492000fb9e9	10	2024-05-12T13:43:30.215Z	2024-05-13T19:04:32.885Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	99552dea-ee0d-4992-8dd7-b1fb700e70aa	10	2024-05-12T13:44:05.962Z	2024-05-13T19:04:49.256Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	323abc48-2457-4792-8845-d4d932a12c9a	10	2024-05-12T13:44:44.719Z	2024-05-13T19:05:03.385Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	8fb6def6-cdcf-4f6d-ad1c-e6d4049fab4a	10	2024-05-12T13:45:36.731Z	2024-05-13T19:05:45.370Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	dc7bdb2e-37ca-4624-9bbc-21bbcb7af3bd	10	2024-05-12T13:46:44.336Z	2024-05-13T19:06:23.765Z	\N
2c90f265-1621-43ea-a523-d1417d410c53	a405abfb-5aba-42e1-bd0f-e8a346a42305	10	2024-05-12T14:28:39.649Z	\N	\N
2c90f265-1621-43ea-a523-d1417d410c53	45d237c3-1423-40ba-ae56-665d7fb95f6c	10	2024-05-12T14:29:13.225Z	\N	\N
9ee3b69e-4c7f-478c-8059-3916ec8a7c2a	352af921-b2eb-4ca8-9775-5f124c622d6b	100	2024-05-12T14:29:45.454Z	\N	\N
2c90f265-1621-43ea-a523-d1417d410c53	59904744-08b6-4c32-b82d-b21f8c96bdaf	10	2024-05-12T14:29:58.506Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	3edbdcb6-ff0a-4de4-b5c9-24c30de29132	100	2024-05-12T14:35:32.185Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	8dcf60fe-758b-4137-93b6-cac321724df2	100	2024-05-12T14:35:44.104Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	e0e4e01c-881f-4117-8c0d-5d911a4269b9	100	2024-05-12T14:36:22.751Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	8d47cfb0-0925-4e88-bf2b-2bb9fb2a4a90	10	2024-05-12T13:48:44.481Z	2024-05-13T19:09:12.520Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	35a209cb-e678-4c4e-a274-217f7eab4221	100	2024-05-12T14:38:21.239Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	81b2e05e-41cf-4bb0-96c2-a622640e6f85	100	2024-05-12T14:38:57.355Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	9a8a5c61-fc58-4505-a808-8d5024545ef7	0	2024-05-12T13:46:54.431Z	2024-05-13T19:06:57.356Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	ac176047-bdf1-472b-b369-240e15eab15d	10	2024-05-12T13:47:21.801Z	2024-05-13T19:08:03.391Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	68ef2021-4411-4328-8c65-a2a9d9b37fce	10	2024-05-12T13:46:15.626Z	2024-05-13T19:08:17.938Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	01b0f1a3-354a-4f7a-a724-c022801d0734	10	2024-05-12T13:48:51.840Z	2024-05-13T19:09:24.190Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	3e45d816-1e64-4b91-a91e-22d47fd9da75	10	2024-05-12T13:49:28.535Z	2024-05-13T19:09:56.954Z	\N
c8811d17-3f2a-41be-9646-0f214278cec1	c7493f68-4e46-453d-9bf0-36fff3189bf7	10	2024-05-14T14:36:30.037Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	5770494e-2cbb-435f-ba4d-048a90c9e0bc	10	2024-05-14T14:37:23.460Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	edcb4032-d028-48ee-9811-b6004b277877	0	2024-05-12T14:36:16.584Z	2024-05-14T21:39:17.202Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	4bccd468-7b89-49f0-93d5-c761ff91c6fb	0	2024-05-12T14:36:28.231Z	2024-05-14T21:45:27.119Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	53743f4f-eded-4145-b56e-224eab9471ec	0	2024-05-12T14:36:37.257Z	2024-05-14T21:46:41.048Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	63a59ee2-0622-4383-b74b-c3a8d4d484b3	0	2024-05-12T14:34:55.310Z	2024-05-14T21:48:32.858Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	4baf7449-d259-45a3-b3cd-8fcfb9f6aa2e	0	2024-05-12T14:37:37.916Z	2024-05-14T21:48:51.159Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	d3a77238-af0d-4cb7-a684-758f8089d39e	0	2024-05-12T14:38:43.734Z	2024-05-14T21:59:47.325Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	251dcbe0-fcd2-47d9-9527-3de6aaf26281	0	2024-05-12T14:37:45.263Z	2024-05-14T22:00:55.192Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	e72b98da-d578-40c6-b666-4ee0165207e1	0	2024-05-12T14:37:22.176Z	2024-05-14T22:01:48.777Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	748b65d0-3957-4eaf-ae95-65c5acd74601	100	2024-05-12T13:46:34.462Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	47b957dd-c43b-4b27-8dad-07f8f9e88f4e	10	2024-05-12T13:41:32.622Z	2024-05-13T19:02:59.280Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	597488e8-bf87-48c5-abf6-e75a4dda7491	10	2024-05-12T13:41:51.595Z	2024-05-13T19:03:12.799Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	43580a44-4423-4194-b34f-6bd85607c327	10	2024-05-12T13:43:05.687Z	2024-05-13T19:04:10.753Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	781e5146-e4f5-4d72-93dc-e23624de4435	10	2024-05-12T13:47:39.855Z	2024-05-13T19:07:43.737Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	b2d422a6-fae3-4c55-b86e-936db8d28729	10	2024-05-12T13:48:01.408Z	2024-05-13T19:08:36.883Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	70a2d253-1b9c-4ed0-9048-c793c86ee0a0	10	2024-05-12T13:48:27.512Z	2024-05-13T19:08:56.855Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	0e2f55b5-8a6b-4ef9-b83b-6115bd47ff9c	10	2024-05-12T13:49:05.010Z	2024-05-13T19:09:35.051Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	5268f29f-d02c-40e3-ac07-f35147c1a9cc	10	2024-05-12T13:49:16.692Z	2024-05-13T19:09:44.352Z	\N
c8811d17-3f2a-41be-9646-0f214278cec1	7d861778-7335-4765-90b7-e57ef5a9799f	10	2024-05-14T14:38:00.819Z	\N	\N
4599527e-e608-4c95-8e3c-5d589e7e63e0	053d6422-e791-474c-9820-90252e04da58	100	2024-05-14T14:44:21.867Z	\N	\N
4599527e-e608-4c95-8e3c-5d589e7e63e0	6c72a74f-0eae-481a-93a5-4d1b0e607ce0	100	2024-05-14T14:44:30.956Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	edcb4032-d028-48ee-9811-b6004b277877	10	2024-05-14T14:46:49.119Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	97e97f0c-9508-4e34-96c4-575978f13f8a	1	2024-05-14T14:47:09.382Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	4fadfa90-c80e-43d9-8717-8bcd4c93ebe7	1	2024-05-14T14:47:48.967Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	b813d3b5-bf55-443b-b1a4-be3d426af4e9	10	2024-05-14T14:47:59.617Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	0eb81d00-fdee-4740-9070-bf23874d35a9	10	2024-05-14T14:48:09.305Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	f1570b6d-f756-493e-a151-115f51f1e747	10	2024-05-14T14:48:17.924Z	\N	\N
15b8422a-479f-403e-8c5e-bdd7ada28154	0fe3738e-658c-4cb5-a8b5-431583445b3c	100	2024-05-14T14:48:30.208Z	\N	\N
09e1c5fe-c4a4-442d-a638-94f55fcc5be0	799e9f43-b5e8-4484-be33-09c442390253	100	2024-05-12T13:55:02.795Z	2024-05-13T14:50:23.767Z	\N
982ec984-0e94-4855-ad46-46403578216c	bea72070-859a-4327-8bd8-dba0a8ada786	0	2024-05-12T13:59:17.817Z	2024-05-13T16:20:49.807Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	26b80625-c48e-4e18-8248-be193f1c93e6	10	2024-05-12T13:45:00.470Z	2024-05-13T19:05:15.970Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	dc6041a7-f911-4ae8-9c43-3480bd31667a	10	2024-05-12T13:45:24.614Z	2024-05-13T19:05:29.199Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	e484c6d1-41ed-4b58-aa7c-561e0ddfc01e	10	2024-05-12T13:49:44.826Z	2024-05-13T19:10:51.805Z	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	55884181-02a9-4036-94ac-c6c2645deaef	10	2024-05-12T13:49:53.621Z	2024-05-13T19:11:06.087Z	\N
c8811d17-3f2a-41be-9646-0f214278cec1	32c65e0d-592c-4003-b071-bb11449e6de8	10	2024-05-14T14:38:43.241Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	319870a5-c97e-48b4-b5b8-4d05fcc09fdc	10	2024-05-14T14:39:06.608Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	c7493f68-4e46-453d-9bf0-36fff3189bf7	10	2024-05-12T13:54:42.956Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	fc383a72-fcea-45a2-86d5-0aa5faa37fad	10	2024-05-12T13:55:46.277Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	950a9045-f3c3-42d7-bf59-d42c5ef42d29	10	2024-05-12T14:04:02.187Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	81b2e05e-41cf-4bb0-96c2-a622640e6f85	10	2024-05-12T14:09:00.593Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	0b337793-9dbf-4ae8-b21f-a8aedbc1a915	10	2024-05-12T14:10:44.252Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	eecafd84-d96c-4c05-bc1e-04c8bc2da2bd	10	2024-05-12T14:11:35.575Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	799e9f43-b5e8-4484-be33-09c442390253	100	2024-05-12T14:19:04.418Z	\N	\N
2c90f265-1621-43ea-a523-d1417d410c53	d98b2225-e6b9-4ba5-9085-ccdcc1d56af9	10	2024-05-12T14:28:46.836Z	\N	\N
2c90f265-1621-43ea-a523-d1417d410c53	7fe4cd2a-9bec-419a-aaae-aa89761c5566	10	2024-05-12T14:28:59.124Z	\N	\N
2c90f265-1621-43ea-a523-d1417d410c53	0d0b7439-82c1-4030-8d40-3dd94753eb40	10	2024-05-12T14:29:23.044Z	\N	\N
2c90f265-1621-43ea-a523-d1417d410c53	167a03f7-d6bb-405e-8d75-87bf915543e8	10	2024-05-12T14:29:45.292Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	9717b995-f922-4e7e-970b-c0275d597c01	10	2024-05-14T14:39:35.076Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	a9b67a55-6742-4c3f-98ad-af8a69c05686	0	2024-05-14T14:41:10.881Z	\N	\N
25099d81-7376-4062-9f96-8379695d9aa7	950a9045-f3c3-42d7-bf59-d42c5ef42d29	100	2024-05-14T14:42:05.896Z	\N	\N
25099d81-7376-4062-9f96-8379695d9aa7	799e9f43-b5e8-4484-be33-09c442390253	100	2024-05-14T14:43:06.340Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	9f1c1e9f-d658-4d88-8f67-f3758ff0de44	1	2024-05-14T14:41:26.855Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	063d43f1-9f08-4943-8f82-b51aa4e49924	10	2024-05-14T14:45:26.224Z	\N	\N
15b8422a-479f-403e-8c5e-bdd7ada28154	a5fdc109-911e-468e-9742-b2f7ca5d8f62	10	2024-05-14T14:45:55.953Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	30afd32d-4464-488e-a212-e4b9ad9ea5bc	10	2024-05-12T13:55:08.960Z	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	ae3c2c9b-44da-4c00-9755-74880c3f9da1	10	2024-05-12T13:55:53.676Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	b355c6b7-f9c9-4b2f-92a2-bb7f8adeb790	10	2024-05-14T14:46:01.514Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	aaac0c48-ca57-43cc-964f-8f7216f954e4	1	2024-05-14T14:46:17.657Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	76c0cb36-9ee0-422f-8050-b422ff53b9d3	10	2024-05-12T14:04:13.333Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	8fe8f879-5cc8-4670-a13d-9d2d6bb24017	10	2024-05-12T14:04:22.423Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-14T14:39:39.889Z	2024-05-14T14:46:22.053Z	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	10	2024-05-14T14:47:19.248Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	10	2024-05-14T14:47:37.778Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-14T14:49:00.048Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	cc4fe301-5eaa-4792-bfd0-33ee4f4a64ad	0	2024-05-14T14:48:39.458Z	2024-05-14T14:49:10.248Z	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	657d8978-fd31-4356-86ba-69a3cf9887b2	10	2024-05-12T14:10:05.333Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	1ff95ef9-1d26-473f-9b56-0e2152b9a681	10	2024-05-12T14:10:26.887Z	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	cc5459a2-9b43-486b-8c3f-99c507c68562	10	2024-05-12T14:10:51.047Z	\N	\N
15b8422a-479f-403e-8c5e-bdd7ada28154	d5997185-4ea3-4ab6-96ec-6f608084527a	100	2024-05-14T14:49:14.457Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	a736cad0-9135-4ac2-bb96-d40350b52658	10	2024-05-14T14:50:25.477Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	e22bf0ca-5fef-46f2-bc54-a3b627d41080	10	2024-05-14T14:51:23.094Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	fb5074d1-71b7-4737-afd5-30e6323e9fc9	10	2024-05-12T14:20:09.353Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	3622021b-0727-4d94-97ae-3c264a032621	0	2024-05-12T14:19:56.345Z	2024-05-13T15:33:14.831Z	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	55bf190c-f2eb-4f80-89f0-76dec0843ad4	10	2024-05-14T14:49:29.287Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	32c65e0d-592c-4003-b071-bb11449e6de8	0	2024-05-13T16:40:30.352Z	2024-05-14T15:01:01.107Z	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	42b139ee-4c4b-4714-ab0c-bd92689d6260	10	2024-05-14T15:01:05.854Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	e162ec59-91e5-4621-8a2a-05848cd0f368	0	2024-05-14T15:01:19.483Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	e85a86ec-1e72-4318-ab4b-3c4faadbec45	10	2024-05-14T15:03:00.270Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-14T15:03:39.048Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	ca0ef946-0de3-47a2-a0cb-df72de35aeec	10	2024-05-14T15:03:52.662Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	61735e25-7502-4864-9a02-cbec10b78700	10	2024-05-14T15:04:33.759Z	2024-05-14T15:04:46.049Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	79224f5f-e140-41f1-a6df-dc1313e11387	0	2024-05-14T15:04:39.487Z	2024-05-14T15:04:58.984Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	2a088703-bffe-491a-8e62-4c9f796024d1	10	2024-05-14T15:05:25.778Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	9db48ec1-52a5-4ecd-a7f0-7ba3e30d0d63	10	2024-05-14T15:05:26.219Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	6390b091-e28c-4b25-9f51-d96c0ad34e79	10	2024-05-14T15:05:32.841Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	c1e4ef3f-0d86-418f-9d9f-05f028246bed	10	2024-05-14T15:05:35.627Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	c8ce7a65-be98-4e38-beaa-b9907dc003e9	10	2024-05-14T15:05:46.442Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	e3a566f8-4b17-41a1-9753-7dc84fa1c53a	10	2024-05-14T15:05:47.894Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	04156fe1-e392-4283-a919-1e25908dbec1	100	2024-05-14T15:06:20.376Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	09fa01c2-c48c-4d7d-b910-adc3109dc041	10	2024-05-14T15:06:30.754Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	04a2d64b-69c0-4f6b-8975-4d41b4f43327	10	2024-05-14T15:06:36.508Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	2ac83258-0e18-4373-9edc-d78286bc955c	10	2024-05-14T15:08:48.966Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	f545aabc-a4a4-4166-b8ea-6e993dd80e7d	100	2024-05-14T15:08:51.608Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	9af075ac-8d39-4843-8907-02ccb6b5910b	0	2024-05-14T15:10:00.706Z	2024-05-14T15:10:03.996Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	bdf3ea04-9dc4-4219-bdc3-b84cde19f707	10	2024-05-14T15:10:29.362Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	1cbeb09b-1870-4cbb-ac44-c3d850745958	100	2024-05-14T15:10:52.031Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	3c7d2c99-9efc-40f2-a97d-9bab659b7fd8	10	2024-05-14T15:11:20.344Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	83c733cc-e2b0-4d93-990e-e2e05bf5187c	100	2024-05-14T15:11:25.451Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	12c0a839-cec3-4991-827c-7448fbdf63e0	10	2024-05-14T15:11:32.897Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	01794c4c-0038-4330-a478-0d10c85fb2d0	10	2024-05-14T15:11:43.026Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	f013501e-e9ea-478f-af0d-648f96244b14	100	2024-05-14T15:11:44.613Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	52bd1913-9ae1-413d-8258-205049df62e6	100	2024-05-14T15:11:51.760Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	4c4b59cc-d639-4952-87e3-107c61c2a673	100	2024-05-14T15:12:04.335Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	5880fcb0-dd0e-4681-b97d-a1f501152fc6	100	2024-05-14T15:13:32.968Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-14T15:14:51.214Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	0e951a76-4e9e-4df3-a4c0-71221e1886d2	10	2024-05-14T15:25:24.506Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	9cd61380-022a-40f2-a262-a9ec97230017	10	2024-05-14T15:25:59.599Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	d2023ffb-a9d3-4ec8-b9a5-1247e039e3da	10	2024-05-14T15:26:17.109Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	1aceea21-c442-4aaf-875f-20e344a542b9	10	2024-05-14T15:27:28.002Z	\N	\N
4599527e-e608-4c95-8e3c-5d589e7e63e0	e3f24520-666e-47d0-ad10-73a9110b3ad4	100	2024-05-14T15:30:23.885Z	\N	\N
4599527e-e608-4c95-8e3c-5d589e7e63e0	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T15:39:19.275Z	\N	\N
982ec984-0e94-4855-ad46-46403578216c	319870a5-c97e-48b4-b5b8-4d05fcc09fdc	10	2024-05-14T15:40:54.751Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	e162ec59-91e5-4621-8a2a-05848cd0f368	0	2024-05-14T15:00:25.641Z	2024-05-15T00:48:40.711Z	\N
8e112d66-6e72-4f17-9fab-7c778b191302	ed51c185-ec13-4530-a33e-330c8ddd9bc2	10	2024-05-14T15:43:12.192Z	\N	\N
b81b4e5c-798f-413d-a7cd-7ce1cfd397ee	8a491c1d-0a91-4135-b7f7-85a460eb44ba	100	2024-05-14T15:47:53.652Z	\N	\N
8e112d66-6e72-4f17-9fab-7c778b191302	1d3ead20-463d-404c-923a-e236bee7917d	10	2024-05-14T15:48:13.601Z	\N	\N
8e112d66-6e72-4f17-9fab-7c778b191302	4cffa928-96fd-4f5a-89bc-50ccde8d5d6f	10	2024-05-14T15:48:41.950Z	\N	\N
b81b4e5c-798f-413d-a7cd-7ce1cfd397ee	763d4db1-d593-4192-8481-3535284ad87d	10	2024-05-14T15:48:33.892Z	2024-05-14T15:48:47.976Z	\N
8e112d66-6e72-4f17-9fab-7c778b191302	ed0e5e53-3cc8-498b-a62a-f7d3a115d0c6	10	2024-05-14T15:48:58.739Z	\N	\N
8e112d66-6e72-4f17-9fab-7c778b191302	d75c791b-592a-4e7d-87f2-012f0e0e9295	10	2024-05-14T15:49:11.849Z	\N	\N
8e112d66-6e72-4f17-9fab-7c778b191302	2de1e0fe-6bc4-4454-be92-02a01a59e820	10	2024-05-14T15:49:24.633Z	\N	\N
b81b4e5c-798f-413d-a7cd-7ce1cfd397ee	69b90d1e-4f3b-4597-bb34-5d269a07fdd6	10	2024-05-14T15:49:22.416Z	2024-05-14T15:49:28.347Z	\N
8e112d66-6e72-4f17-9fab-7c778b191302	468fd58a-21d2-447e-828c-3af01effbbe2	10	2024-05-14T15:49:43.557Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	cc5459a2-9b43-486b-8c3f-99c507c68562	0	2024-05-14T15:10:28.884Z	2024-05-15T00:50:31.190Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	42b139ee-4c4b-4714-ab0c-bd92689d6260	0	2024-05-14T15:03:34.366Z	2024-05-15T00:52:55.491Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	352af921-b2eb-4ca8-9775-5f124c622d6b	0	2024-05-14T15:06:28.793Z	2024-05-15T01:00:44.582Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	063d43f1-9f08-4943-8f82-b51aa4e49924	0	2024-05-12T14:40:09.546Z	2024-05-13T14:59:28.661Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	6347a939-ad2c-458e-a097-17fdb7ef34b1	10	2024-05-12T14:24:58.387Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	3810ff6f-2c32-4a64-a1c6-37be86fdaec6	0	2024-05-12T14:24:08.670Z	2024-05-13T15:33:31.272Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	8d107eda-f83e-4f4c-9a21-3dd19ffc09de	10	2024-05-14T15:09:43.077Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	a257142f-813f-4450-bf2c-8ce9a51d86ed	0	2024-05-12T14:37:01.518Z	2024-05-14T22:01:26.925Z	\N
2c90f265-1621-43ea-a523-d1417d410c53	a6bf37fb-1ae0-4682-881f-a213db5b4323	10	2024-05-12T14:26:53.319Z	2024-05-12T14:28:26.681Z	\N
2c90f265-1621-43ea-a523-d1417d410c53	7b1d884c-19e6-49a0-badc-e98dbd02de07	10	2024-05-12T14:30:10.650Z	\N	\N
d6421a14-e3a8-43c5-84cc-445e169043c2	5aac6b69-af17-4c0e-b0d0-1621211bc14c	10	2024-05-12T14:33:09.422Z	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	258deaa1-d4c1-4e51-9a29-9883f68d506d	100	2024-05-12T14:35:15.944Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	d2123a82-91a0-4f30-896b-61ee15ade670	100	2024-05-14T15:01:21.451Z	2024-05-15T00:49:09.895Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	bf7f0124-f552-4ab4-8db2-0db1fb4728d8	10	2024-05-12T14:36:43.666Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	fd54a76a-cdb9-4543-9df6-24baa384e38c	0	2024-05-14T15:01:55.242Z	2024-05-15T00:50:39.401Z	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	2c98279b-bbd2-4645-96a3-51edb69cf509	10	2024-05-14T15:09:44.861Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	a3e547e1-3b29-43e5-838f-d66e36b12187	10	2024-05-12T14:40:58.088Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	d580d7f8-a8be-4212-9ed8-8e1d52f4c384	0	2024-05-14T15:10:07.172Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	1f136e6b-3881-4341-b169-5a4ec852c888	10	2024-05-12T14:42:36.534Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	46862e71-22b7-4023-ba93-2936050c6f9f	10	2024-05-12T14:42:46.142Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	3a040ebd-225f-4f0c-934c-5b14399fbd4f	0	2024-05-12T14:38:04.230Z	2024-05-13T21:42:45.958Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	a3c54809-48b7-494d-9e81-2895a1f5c217	10	2024-05-12T14:20:30.733Z	2024-05-14T13:14:52.716Z	\N
25099d81-7376-4062-9f96-8379695d9aa7	caa77bd6-4cf9-44a5-aa24-2e68c899081a	100	2024-05-14T14:56:27.574Z	\N	\N
77a0f4cc-a62d-44bb-bba2-058d1d006d0a	c419557c-c8f6-4e05-8595-614e5445bd88	0	2024-05-14T15:01:16.528Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	0	2024-05-14T15:01:22.086Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	bd742c5e-9257-4f16-a572-b4571d98db90	0	2024-05-14T15:01:25.024Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	d276802d-0992-4f87-b5fa-04e5ee6a10c1	10	2024-05-14T15:01:40.527Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	cbe1445b-256b-4d93-8829-6a1fda8f526c	0	2024-05-09T13:49:14.997Z	2024-05-14T15:03:23.129Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	0bac5a5c-e260-41eb-806e-46397862d868	100	2024-05-14T15:03:56.789Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	1b45a959-c141-4d5b-a112-49cc10985fa1	10	2024-05-14T15:04:01.116Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	191b3241-5fce-4d0a-ae67-7d42049c4a09	10	2024-05-14T15:04:16.759Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	7fe4cd2a-9bec-419a-aaae-aa89761c5566	100	2024-05-14T15:04:19.910Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	45d237c3-1423-40ba-ae56-665d7fb95f6c	10	2024-05-14T15:04:26.077Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	84f83b15-aa13-4b74-8c81-b769f429a6db	10	2024-05-14T15:04:28.146Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	e82f2b29-1394-4325-a728-f3dd20f1c6bf	10	2024-05-14T15:04:45.222Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	f8e618b1-c99d-4183-85f7-0b2c4407321f	100	2024-05-14T15:04:54.526Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	7d0f8cf5-9f10-4822-bcde-6b94d1738065	10	2024-05-14T15:05:11.355Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	0d0b7439-82c1-4030-8d40-3dd94753eb40	10	2024-05-14T15:05:39.703Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	46bd3422-75e0-4d67-b492-97f0e14dd403	0	2024-05-14T15:06:02.355Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	133878fc-7cf2-49a2-b6a9-1407c6e64602	10	2024-05-14T15:06:06.443Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	73d62b87-49ae-48d7-9001-868839648b25	100	2024-05-14T15:07:15.813Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	352af921-b2eb-4ca8-9775-5f124c622d6b	10	2024-05-14T15:08:22.542Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	172c7042-1a1a-4ed0-9cd7-9f818efde80a	100	2024-05-14T15:08:32.307Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	5a68adc5-f0cc-44f6-99e4-12cd88662d08	100	2024-05-14T15:09:07.215Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	eadb6611-5c04-4050-9be4-fd2b4eacd182	0	2024-05-14T15:09:35.775Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	ab8709c7-2655-4f0f-b1bc-68363acf5f87	100	2024-05-14T15:10:08.074Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	4ff95cea-fbd8-4b79-8fde-04173c44b400	100	2024-05-14T15:10:15.978Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	053d6422-e791-474c-9820-90252e04da58	100	2024-05-14T15:10:18.847Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	98b80385-0a11-41f8-b15d-8d460652fce4	0	2024-05-12T14:23:19.791Z	2024-05-14T15:13:01.555Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	f0d92aa4-8b09-44a8-a513-575b956ace5f	0	2024-05-12T14:21:54.756Z	2024-05-14T15:13:42.777Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	aa5db4cb-8efc-4482-8dfc-aee10949e3f4	0	2024-05-12T14:23:58.684Z	2024-05-14T15:15:12.551Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	8cf0a287-9e40-4b91-a979-82533a8918c1	100	2024-05-14T15:15:24.529Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	5e4b4b53-a13b-483c-a783-5576e0225d82	100	2024-05-14T15:15:29.685Z	\N	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	5e4b4b53-a13b-483c-a783-5576e0225d82	100	2024-05-14T15:21:29.306Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	96afd89c-f294-47d5-be96-919c7cdacce1	100	2024-05-14T15:21:35.793Z	\N	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-14T15:21:48.758Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	fa855264-b42a-4559-b976-1a55f6ee9d9b	0	2024-05-12T14:43:00.185Z	2024-05-14T21:45:09.055Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	647445b0-6c3c-4669-b1b4-fb92fd5920db	100	2024-05-12T14:39:15.246Z	2024-05-12T14:39:37.143Z	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	e121df46-f1e7-4703-a9c7-3c98f23363f0	10	2024-05-12T14:40:45.260Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	329ef2f3-32ec-4987-8089-c7f02ffd7aaf	100	2024-05-12T14:41:05.965Z	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	10452b3d-de90-4562-b57d-a94f9212d22f	0	2024-05-12T14:47:25.922Z	2024-05-13T15:03:28.732Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	b99656ae-fc0f-4016-8261-91cd43a69c62	0	2024-05-12T14:48:27.385Z	2024-05-13T22:59:01.805Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	0a238fb4-a6f0-4d93-9a1b-02245afa2513	0	2024-05-12T14:46:43.282Z	2024-05-14T12:57:00.769Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	caa77bd6-4cf9-44a5-aa24-2e68c899081a	100	2024-05-14T15:02:11.317Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	172c7042-1a1a-4ed0-9cd7-9f818efde80a	0	2024-05-14T15:02:41.731Z	2024-05-15T00:51:12.368Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	01794c4c-0038-4330-a478-0d10c85fb2d0	0	2024-05-14T15:02:30.677Z	2024-05-15T00:51:33.770Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	78e9e9be-0d18-4553-9a6f-691462e8db06	100	2024-05-12T14:46:55.953Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	e85a86ec-1e72-4318-ab4b-3c4faadbec45	0	2024-05-14T15:02:29.007Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	6ebdfdfa-c7b7-42c3-972c-a15b921d4e66	100	2024-05-12T14:53:38.115Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	1f136e6b-3881-4341-b169-5a4ec852c888	100	2024-05-12T14:53:43.938Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	46862e71-22b7-4023-ba93-2936050c6f9f	100	2024-05-12T14:53:50.663Z	\N	\N
d0b27e7f-9ef1-4fbe-a15a-36af6ad2eaa9	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-12T14:54:12.741Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	0bd6022d-21b2-47d1-8a71-1f679b62541c	0	2024-05-14T15:02:32.520Z	2024-05-14T15:02:34.957Z	\N
830e3066-a383-4ef9-9aaf-efc87ad30ed5	7a841996-d096-4752-b071-263d1166fcbc	10	2024-05-12T14:53:31.801Z	2024-05-13T00:38:22.654Z	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	df6f02b6-0a8d-4313-a21b-bdc111db66a8	100	2024-05-14T15:02:44.083Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	88fa7edf-2f9d-43e9-b983-86aa6fc63374	10	2024-05-14T15:03:11.274Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	7d8f08bd-0994-433f-890d-29690027bf6a	10	2024-05-14T15:03:15.948Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	5880fcb0-dd0e-4681-b97d-a1f501152fc6	10	2024-05-14T15:03:19.415Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	4e619f2b-0e02-4842-8b1d-410ff44038cd	10	2024-05-14T15:06:37.481Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	d54d1746-ddc6-4492-8ed4-969696bb38af	10	2024-05-14T15:07:00.672Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	0bac5a5c-e260-41eb-806e-46397862d868	0	2024-05-14T13:30:59.830Z	2024-05-14T15:07:05.995Z	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	552e881e-ed4a-414b-914e-36a0dd85d0a4	100	2024-05-14T15:07:35.182Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	df6f02b6-0a8d-4313-a21b-bdc111db66a8	100	2024-05-14T15:07:53.745Z	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	319870a5-c97e-48b4-b5b8-4d05fcc09fdc	10	2024-05-14T15:07:59.486Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	6ee709d9-f990-41e3-9f92-a75f8d5e4855	0	2024-05-14T15:08:00.717Z	2024-05-14T15:08:15.874Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	9798cd10-1d06-42a0-921b-83e17b91a90c	10	2024-05-14T15:11:17.013Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	919d8585-40a8-45e9-b619-b9e7a7ba20ea	10	2024-05-14T15:12:23.769Z	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	340e35f2-a28c-4c48-a114-2e7339c7c735	0	2024-05-14T15:12:24.772Z	\N	\N
6e5f07c3-96ca-4dad-a6d0-ffe4583fe4e2	f8e2fa5f-850f-4833-946e-5034de5671df	0	2024-05-14T15:13:45.133Z	2024-05-14T15:14:36.463Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	6bca959f-afc2-434e-a716-c6ce6fe71b70	0	2024-05-14T15:12:27.873Z	2024-05-14T15:13:15.287Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	9717b995-f922-4e7e-970b-c0275d597c01	0	2024-05-14T15:12:31.005Z	2024-05-14T15:13:21.140Z	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	88fa7edf-2f9d-43e9-b983-86aa6fc63374	100	2024-05-14T15:13:24.393Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	340e35f2-a28c-4c48-a114-2e7339c7c735	10	2024-05-14T15:14:05.271Z	\N	\N
6e5f07c3-96ca-4dad-a6d0-ffe4583fe4e2	5aac6b69-af17-4c0e-b0d0-1621211bc14c	10	2024-05-14T15:14:12.908Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	2b72c607-f5b6-4907-88e9-1a2d50045b18	100	2024-05-14T15:14:27.075Z	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	1d2b769c-5dfe-41ae-aec9-03266ff78cb5	10	2024-05-14T15:17:06.638Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	4f162c9f-b72a-4661-a8f2-1cb269353d24	100	2024-05-14T15:22:33.280Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	5e4b4b53-a13b-483c-a783-5576e0225d82	100	2024-05-14T15:23:22.512Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	8cf0a287-9e40-4b91-a979-82533a8918c1	100	2024-05-14T15:23:32.784Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	9f1e180f-c481-4edb-9a81-164801514aec	10	2024-05-14T15:23:33.919Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	f478c31a-a034-44bc-b2db-a9a9a21b15b0	10	2024-05-14T15:24:04.817Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	1418ce67-28b1-4db5-b95d-b32619b72b4c	10	2024-05-14T15:24:24.654Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	46a96020-73ec-4d2e-aa5a-d9f35697df46	10	2024-05-14T15:26:55.732Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	2a8e82ce-897c-4ce2-a611-1c5cbbb562d5	10	2024-05-14T15:27:03.317Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	664ee223-1340-43d1-9ae5-13685ec9b22b	10	2024-05-14T15:27:11.378Z	\N	\N
982ec984-0e94-4855-ad46-46403578216c	799e9f43-b5e8-4484-be33-09c442390253	10	2024-05-14T15:40:43.447Z	\N	\N
982ec984-0e94-4855-ad46-46403578216c	dfbf27f0-d560-4aea-aba6-532a6346b994	100	2024-05-14T15:41:14.679Z	\N	\N
982ec984-0e94-4855-ad46-46403578216c	30afd32d-4464-488e-a212-e4b9ad9ea5bc	100	2024-05-14T15:41:22.110Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	69732c83-e2ee-481f-b4c5-e55932e8d51f	0	2024-05-14T15:02:22.876Z	2024-05-15T00:52:15.549Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	bdf7609e-a731-4480-874a-7ed5a8de5627	0	2024-05-14T15:06:49.793Z	2024-05-15T00:54:20.477Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	cb69b4b0-b164-43ed-ad6e-c0c3ca3ad93e	0	2024-05-14T15:07:01.727Z	2024-05-15T00:54:29.383Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	31420dbb-f6a3-443b-89c1-05344b195408	100	2024-05-12T14:47:14.507Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	bc5b8611-704c-4ea1-b321-995f1b181de3	100	2024-05-12T14:56:23.962Z	2024-05-13T11:55:24.829Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	2d3cf6fc-8424-47d6-8908-903526827010	0	2024-05-12T14:47:38.248Z	2024-05-13T15:03:36.417Z	\N
d0b27e7f-9ef1-4fbe-a15a-36af6ad2eaa9	67f5833c-24b8-4004-87ca-514f302cf734	100	2024-05-12T14:48:04.262Z	\N	\N
830e3066-a383-4ef9-9aaf-efc87ad30ed5	8efd91e0-8521-43ba-b45d-790d08c854e0	0	2024-05-11T14:10:09.041Z	2024-05-14T13:25:00.937Z	\N
4b5ac1d5-0201-459d-901e-424f0d346434	81476608-e806-4a25-ad0f-c976bb29dd31	100	2024-05-12T14:50:32.431Z	\N	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	8cf0a287-9e40-4b91-a979-82533a8918c1	100	2024-05-14T15:21:53.468Z	\N	\N
4b5ac1d5-0201-459d-901e-424f0d346434	1b45a959-c141-4d5b-a112-49cc10985fa1	100	2024-05-12T14:50:43.180Z	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	b8f75b02-c99d-4a54-91a2-01e66617b676	100	2024-05-14T15:22:17.018Z	\N	\N
4b5ac1d5-0201-459d-901e-424f0d346434	528e2a82-0523-4110-8894-20ee1a60be69	100	2024-05-12T14:50:49.326Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	af187ce2-eca4-4a8e-a5d3-6ab6fe8e7c87	10	2024-05-14T15:23:53.264Z	\N	\N
4b5ac1d5-0201-459d-901e-424f0d346434	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-12T14:51:13.595Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	c4d56ef3-9ee0-4af2-bc94-64394f166252	10	2024-05-14T15:24:32.651Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	5e3faa0a-8bf7-4182-b057-cec38d4bed2d	100	2024-05-12T14:52:51.911Z	2024-05-12T14:52:56.991Z	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	4003cd8e-8536-41f7-a7fa-3c9bc622adf1	10	2024-05-14T15:24:49.547Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	4682d405-9a3e-435d-bb33-e249f72935a5	10	2024-05-14T15:25:06.116Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	945b1d7a-17ac-4646-92ef-018669cee133	100	2024-05-12T14:55:16.505Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	edcb4032-d028-48ee-9811-b6004b277877	100	2024-05-12T14:56:05.278Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	ca0ef946-0de3-47a2-a0cb-df72de35aeec	100	2024-05-12T14:56:11.756Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	377fdec9-9b17-4086-8986-3e04508c4917	10	2024-05-14T15:25:17.200Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	158fb67d-00f8-4752-be65-4108101bdd7f	10	2024-05-14T15:25:40.028Z	\N	\N
9573e831-471a-4356-acc3-114f8940ab24	652b4e71-8aec-46f6-a361-fe78ac0efe10	100	2024-05-12T14:58:23.764Z	\N	\N
d0b27e7f-9ef1-4fbe-a15a-36af6ad2eaa9	86cad6e9-5244-4991-9340-eed4798547ae	10	2024-05-12T14:58:56.001Z	\N	\N
9573e831-471a-4356-acc3-114f8940ab24	35c000d9-4475-4826-92ff-37a09b8de131	100	2024-05-12T14:58:57.750Z	\N	\N
9573e831-471a-4356-acc3-114f8940ab24	1822d9b2-10f4-4e0d-a39a-b987ed707fae	100	2024-05-12T14:59:16.588Z	\N	\N
9573e831-471a-4356-acc3-114f8940ab24	52b5339a-b922-4d1a-9e58-b4a614cf5369	100	2024-05-12T14:59:30.478Z	\N	\N
9573e831-471a-4356-acc3-114f8940ab24	4ff95cea-fbd8-4b79-8fde-04173c44b400	100	2024-05-12T14:59:34.935Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	6a7b9aab-b9ca-4dcb-bbbe-c2186631888f	10	2024-05-14T15:26:32.566Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	4734b699-3a7e-4769-9fa1-dd07d4554f98	10	2024-05-14T15:26:43.382Z	\N	\N
4599527e-e608-4c95-8e3c-5d589e7e63e0	e3a0f59f-5fb8-48ad-b589-4d6f9a789edc	100	2024-05-14T15:29:43.030Z	\N	\N
982ec984-0e94-4855-ad46-46403578216c	86cad6e9-5244-4991-9340-eed4798547ae	100	2024-05-14T15:41:30.652Z	\N	\N
8e112d66-6e72-4f17-9fab-7c778b191302	0a12c892-0352-4a3c-9a31-0e9103d85204	10	2024-05-14T15:43:29.073Z	\N	\N
8e112d66-6e72-4f17-9fab-7c778b191302	53c264d7-8472-4f8f-a863-f56752e9be71	10	2024-05-14T15:43:42.460Z	\N	\N
8e112d66-6e72-4f17-9fab-7c778b191302	304ce901-889c-4339-b4d5-32b6e33e8d00	10	2024-05-14T15:44:08.511Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	64ef52e6-fcdd-414d-9049-aebdbe271fe5	100	2024-05-12T15:01:41.290Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	8a241182-20e5-4340-be5e-53cce9a4667d	10	2024-05-12T15:01:48.628Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	7982a520-ecc8-4cf9-a8be-2bd40550bd31	10	2024-05-12T15:02:00.772Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	319870a5-c97e-48b4-b5b8-4d05fcc09fdc	100	2024-05-14T15:45:49.944Z	\N	\N
9573e831-471a-4356-acc3-114f8940ab24	b5edb6c0-dfe7-4a27-a6cb-182bb82acd29	100	2024-05-12T14:58:05.890Z	2024-05-12T18:21:13.701Z	\N
b81b4e5c-798f-413d-a7cd-7ce1cfd397ee	647d1fd0-cc5f-46d2-9350-51ff61b15c7a	10	2024-05-14T15:49:43.968Z	2024-05-14T15:49:51.398Z	\N
8e112d66-6e72-4f17-9fab-7c778b191302	2bcb78ac-03c5-4707-bb2d-ef679465e2a1	10	2024-05-14T15:50:06.685Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	cc0b7c15-55bd-426c-9637-12db360bc034	10	2024-05-14T15:52:59.478Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	90878eb1-2d46-44f5-b231-b271742b4d71	10	2024-05-14T15:53:21.548Z	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	fcf37cf9-f636-46a3-8b0d-3edb13364e69	100	2024-05-14T15:56:05.451Z	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	eb6aad71-eb82-425a-97fc-3bbeda495f69	10	2024-05-14T15:58:20.262Z	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	4bde0809-6c52-4ae5-bf78-17f5f3595eb7	100	2024-05-14T15:56:41.461Z	\N	\N
982ec984-0e94-4855-ad46-46403578216c	432604fd-e8eb-467f-8eef-e34065113c25	0	2024-05-14T15:42:27.319Z	2024-05-14T15:56:49.145Z	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	2a8e82ce-897c-4ce2-a611-1c5cbbb562d5	10	2024-05-14T15:58:10.401Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	9cd61380-022a-40f2-a262-a9ec97230017	10	2024-05-14T15:58:16.965Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	c4e92203-12a1-4b5a-b4b2-79f5da4bb597	10	2024-05-14T15:58:46.974Z	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	40fa4d35-6f69-4fd9-9697-c6944fec01a2	100	2024-05-14T15:58:50.464Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	f013501e-e9ea-478f-af0d-648f96244b14	10	2024-05-12T14:55:45.265Z	2024-05-13T23:17:41.248Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	100	2024-05-12T14:55:31.241Z	2024-05-13T23:17:55.881Z	\N
4b5ac1d5-0201-459d-901e-424f0d346434	799e9f43-b5e8-4484-be33-09c442390253	100	2024-05-12T14:50:37.733Z	\N	\N
8e112d66-6e72-4f17-9fab-7c778b191302	3dd6c27c-33fa-481d-97ae-b40a3987cef3	10	2024-05-14T15:44:32.909Z	\N	\N
8e112d66-6e72-4f17-9fab-7c778b191302	2b25ddf5-d86b-4527-a267-06951926feeb	10	2024-05-14T15:48:29.903Z	\N	\N
d0b27e7f-9ef1-4fbe-a15a-36af6ad2eaa9	a405abfb-5aba-42e1-bd0f-e8a346a42305	100	2024-05-12T14:51:14.113Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	770fd1b3-e792-4127-88f9-7d7a47224363	100	2024-05-12T14:53:16.230Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	d382afa7-cef6-4e16-89aa-22a5e20562e6	100	2024-05-12T14:53:31.799Z	\N	\N
d0b27e7f-9ef1-4fbe-a15a-36af6ad2eaa9	f0acd27c-a496-46a3-a2ba-bea24049ea20	10	2024-05-12T14:53:56.014Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	100	2024-05-12T14:53:58.778Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	79c7f357-2e62-4ab9-8152-de7165e6dae6	100	2024-05-12T14:54:09.411Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	c4e94a84-f6d2-48a3-a391-8c2491cc8b21	100	2024-05-12T14:54:16.791Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	876548db-d180-4083-96ba-cddcb86134b0	100	2024-05-12T14:54:30.892Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	367ed746-6c87-41d9-a29e-bf3540360ccf	100	2024-05-12T14:54:40.433Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	5facb97a-2e27-4ddf-bbde-0aeed05bb262	100	2024-05-12T14:54:47.350Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	112f1380-ebef-4697-87e8-7cb8a1e05cf7	100	2024-05-12T14:54:53.587Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	100	2024-05-12T14:55:00.998Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	52634f35-73b2-4c60-99c9-1ec886f6e4b3	100	2024-05-12T14:55:22.974Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	ffc9891b-43d3-4134-8e9c-7ada4690d076	100	2024-05-12T14:55:38.929Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	52bd1913-9ae1-413d-8258-205049df62e6	100	2024-05-12T14:55:51.382Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	3b7a9689-8c41-4090-9084-5b8e31a1d7d5	100	2024-05-12T14:55:57.301Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	e4cfa4d9-183d-42a4-8c39-994c734d8b49	100	2024-05-12T14:56:32.006Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	063d43f1-9f08-4943-8f82-b51aa4e49924	100	2024-05-12T14:56:58.483Z	\N	\N
9573e831-471a-4356-acc3-114f8940ab24	460c72c0-b362-4fe8-a7e8-06aabe57cccd	100	2024-05-12T14:56:59.304Z	\N	\N
d0b27e7f-9ef1-4fbe-a15a-36af6ad2eaa9	4bd475d3-779b-45bb-b9f9-7a6052bc41fb	10	2024-05-12T14:58:44.554Z	\N	\N
9573e831-471a-4356-acc3-114f8940ab24	ada0b299-35c4-46cd-96fd-9d71b4cc0720	100	2024-05-12T14:59:06.450Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	a8c18a44-ec60-4a19-8e96-785c49de9630	10	2024-05-12T15:01:52.962Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	219e46d3-688f-4021-b7b4-3a1ab5722aa1	100	2024-05-12T15:01:54.372Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	94701e72-8ebc-43e7-885a-9e2a810ad1e7	10	2024-05-12T15:02:08.397Z	\N	\N
830e3066-a383-4ef9-9aaf-efc87ad30ed5	3e9aa91a-308e-4698-a131-8e4cb28c398c	10	2024-05-12T14:51:16.604Z	2024-05-13T00:39:00.378Z	\N
830e3066-a383-4ef9-9aaf-efc87ad30ed5	4505e4ab-6789-4612-acdf-8d3c492476ea	10	2024-05-12T14:49:35.120Z	2024-05-13T00:37:46.500Z	\N
830e3066-a383-4ef9-9aaf-efc87ad30ed5	c84192e1-0605-4b6f-8302-99aa29116f1f	10	2024-05-12T14:53:15.135Z	2024-05-13T00:37:55.057Z	\N
830e3066-a383-4ef9-9aaf-efc87ad30ed5	ae3c2c9b-44da-4c00-9755-74880c3f9da1	10	2024-05-12T14:53:23.442Z	2024-05-13T00:38:12.549Z	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	d15cbac6-90ef-4c69-ac74-d4bab7389448	10	2024-05-12T15:02:12.083Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	2c493101-799b-406c-9943-3cc8a75370f0	10	2024-05-12T15:02:17.125Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	eaefed6b-0638-4d5a-86c1-42801b2b1ac7	10	2024-05-12T15:02:31.115Z	\N	\N
b81b4e5c-798f-413d-a7cd-7ce1cfd397ee	21bd512a-dc3d-470d-a9f6-f4dd2e445642	10	2024-05-14T15:50:12.595Z	2024-05-14T15:50:44.133Z	\N
30266468-96d0-487e-b2df-65e0ab1095e3	99988da7-974f-44e6-b427-87a3c4528ae1	10	2024-05-14T15:54:53.883Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	e82f2b29-1394-4325-a728-f3dd20f1c6bf	10	2024-05-12T15:05:11.193Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	9e66cff1-37e1-4631-8251-c7b03b287ada	100	2024-05-12T15:05:43.478Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	9ee6fd99-6604-438c-a3cc-15d2c7f997ed	100	2024-05-12T15:05:50.414Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	ef206d20-b798-4215-bebb-e53afd8f4a69	10	2024-05-12T15:06:15.795Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	59991d33-10e6-48af-be3e-274fa5960fc2	10	2024-05-12T15:06:24.147Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	f78c85b4-fcac-4854-970b-d80f201d5aa3	10	2024-05-12T15:06:38.031Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	15129370-e9f5-4797-87cf-225625bc7642	10	2024-05-12T15:06:45.200Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	c905ca5a-0564-4d2a-b9b9-585cbce1cc62	10	2024-05-12T15:06:53.907Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	66a98038-4588-431c-814d-0c440c4683af	10	2024-05-12T15:02:25.346Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	100	2024-05-12T15:04:45.715Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	4c523d27-7d78-4338-9fef-43a2bc8bdb82	10	2024-05-12T15:04:53.987Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	a0129157-a9e1-471f-b72a-47995daa79ab	10	2024-05-12T15:05:01.467Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	4bd475d3-779b-45bb-b9f9-7a6052bc41fb	10	2024-05-12T15:05:33.721Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	f1570b6d-f756-493e-a151-115f51f1e747	100	2024-05-12T15:07:12.929Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	56ca5929-dc59-47f0-a24f-52ddd8c25de9	10	2024-05-12T15:07:28.515Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	50272a9e-53dc-4e57-a56b-57f226b22933	10	2024-05-12T15:07:31.810Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	fc383a72-fcea-45a2-86d5-0aa5faa37fad	10	2024-05-12T15:07:39.675Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	2cb3a6b6-9a04-40b4-a48c-20a2644fee72	10	2024-05-12T15:07:51.553Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	e966d8d8-9212-49c6-a1c2-385a61edab45	10	2024-05-12T15:08:02.669Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	d2123a82-91a0-4f30-896b-61ee15ade670	100	2024-05-12T15:10:30.892Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	329ef2f3-32ec-4987-8089-c7f02ffd7aaf	10	2024-05-12T15:10:38.655Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	55bf190c-f2eb-4f80-89f0-76dec0843ad4	100	2024-05-12T15:12:21.082Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	f74837d7-d4b4-4224-be14-a6d0df76ea8f	100	2024-05-12T15:12:56.606Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	faeac6fc-4c69-4e2b-9b15-b47e85af78ba	10	2024-05-12T15:12:59.094Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	318b0858-0973-4a83-ab97-95c8e85c78ea	10	2024-05-12T15:13:22.418Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	599ad06b-2791-44c6-a0ae-9b67fa182ba1	10	2024-05-12T15:13:23.149Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	248d9ed4-d09c-45b1-a458-586a0bc06c50	10	2024-05-12T15:13:57.197Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	3ff4dd29-40d6-47ae-8e61-e441b36d6166	10	2024-05-12T15:14:14.777Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	6ad8b08c-2457-45aa-8589-013e0b73d0a4	10	2024-05-12T15:14:30.557Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	66616847-1e8e-4ea3-bb70-a02aa8b7a33c	100	2024-05-12T15:14:40.802Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	24a56430-28ea-465e-8287-af19639b18ce	10	2024-05-12T15:16:18.337Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	3453dec4-2fa0-4a3d-a053-0af80abdc82c	10	2024-05-12T15:16:25.333Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	4b7e6463-949e-4a9a-8198-0ee4245a63df	10	2024-05-12T15:17:56.356Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	a1e9e0d1-cf48-4f52-8f41-cc24e44a9cce	10	2024-05-12T15:18:42.117Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	a16b02b5-c7bb-4eab-bf78-0d9b073566d8	100	2024-05-12T15:21:03.831Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	dc359231-d372-495a-a9e0-2bbd47965809	10	2024-05-12T15:21:15.445Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	c38e4aa6-bc90-4592-ae7d-95d93de12ec4	10	2024-05-12T15:21:54.725Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	b1b07662-1ca5-4dfb-b750-69908ca81721	100	2024-05-12T15:22:42.136Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	77282a94-c627-46ab-a22d-3d19cc00d3c7	100	2024-05-12T15:26:35.210Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	4ae6c9da-c2d7-4381-a309-a938b0258122	10	2024-05-12T15:26:48.724Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	b9c9bef3-a1b6-4d94-98cf-e331e23bca4b	100	2024-05-12T15:27:12.884Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	463b2006-ff25-4d63-8b79-17666b4b4d02	100	2024-05-12T15:27:38.068Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	e4bedb60-5d9c-4cc6-8ba7-f93d890c6cec	10	2024-05-12T15:29:29.599Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	683a84ad-681b-4971-a3ba-59694387304b	100	2024-05-12T15:29:44.229Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	4daad41e-b84e-4d36-876b-48a1f82a0c5b	100	2024-05-12T15:30:56.425Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	54a7e449-dcd5-423a-af8c-11ed71b85389	0	2024-05-12T15:20:52.997Z	2024-05-13T15:28:23.817Z	\N
c082783c-12d1-4174-9e59-276a5c647079	af26cae5-8bae-420c-8052-782b9598fded	0	2024-05-12T15:15:16.846Z	2024-05-13T15:57:36.535Z	\N
c082783c-12d1-4174-9e59-276a5c647079	599bee49-16ea-4ea6-9a4a-ae3043926417	0	2024-05-12T15:12:28.384Z	2024-05-13T15:59:44.241Z	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	074e66ce-a845-4244-886e-8db3f76f5742	0	2024-05-12T15:22:58.856Z	2024-05-14T15:06:41.517Z	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	4c4b59cc-d639-4952-87e3-107c61c2a673	0	2024-05-12T18:10:04.067Z	2024-05-14T15:55:42.477Z	\N
30266468-96d0-487e-b2df-65e0ab1095e3	866fa138-912d-469a-aec0-fd6fa14a300a	100	2024-05-14T15:56:24.244Z	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	9fa75236-5a40-4ee2-89ae-feb9934ef0c2	10	2024-05-14T15:57:22.942Z	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	0e951a76-4e9e-4df3-a4c0-71221e1886d2	10	2024-05-14T15:58:34.131Z	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	a8a72f8f-404e-48af-9943-fa165177a787	100	2024-05-14T15:57:50.140Z	2024-05-14T15:59:43.612Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	c7493f68-4e46-453d-9bf0-36fff3189bf7	10	2024-05-12T15:08:13.468Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	cc4fe301-5eaa-4792-bfd0-33ee4f4a64ad	100	2024-05-12T15:09:12.172Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	6b3962b3-33dd-422e-bdda-35dbe0afa554	10	2024-05-12T15:09:21.156Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	04156fe1-e392-4283-a919-1e25908dbec1	100	2024-05-12T15:09:37.437Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	38939273-b35e-49bf-b84f-0a04f747d44e	10	2024-05-12T15:10:43.790Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	e54ecc47-ddb8-487a-aa3d-2d091a55b830	10	2024-05-12T15:11:22.397Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	ddfd8cc9-02db-4c9c-b59c-c4f03459607c	10	2024-05-12T15:11:47.777Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	6b1d5955-578e-4b7c-a66a-118060c94901	10	2024-05-12T15:12:07.456Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	21da2418-e978-41cb-90a8-d7e677b4d577	10	2024-05-12T15:13:42.624Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	f75e7cd2-be77-4358-b281-90a943e1d983	10	2024-05-12T15:13:48.517Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	9be8995e-d9db-41e5-9aa8-2ef4d0411fd2	100	2024-05-12T15:14:05.831Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	69ed1694-a1a1-4163-80c4-bcedc9a7dbd7	10	2024-05-12T15:14:22.354Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	a09441c5-46c4-426b-8da7-e356c731475b	100	2024-05-12T15:14:25.086Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	30862163-26c5-40b6-893f-1d32139a5240	10	2024-05-12T15:14:34.913Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	1d02a2b6-3aed-4dd4-acd1-27acb87856f3	10	2024-05-12T15:14:44.159Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-12T15:14:53.388Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	3aaefd40-754e-434d-b4af-180fdd60174c	100	2024-05-12T15:14:56.412Z	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	ecf975c3-add4-4e4a-8190-6789936ce9ae	10	2024-05-12T15:15:01.038Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	1fde16af-ef8a-4686-b021-cafc1c5179cf	10	2024-05-12T15:15:16.649Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	84d5b5f4-3c06-4b70-946e-dd258278c7b2	10	2024-05-12T15:15:18.948Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	ed80871e-ea7b-4734-a64f-156d6290fcf1	10	2024-05-12T15:15:34.677Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	bbdd5c64-f80e-4233-9928-7931fe5e3703	10	2024-05-12T15:15:55.623Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	35205809-7647-40b4-bdd6-11b7d1b6bf51	10	2024-05-12T15:15:58.040Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	47cc3a3a-c887-4c02-8f08-410010ea15b4	10	2024-05-12T15:16:10.128Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	2af85206-62f0-48a7-b5f5-c889498c8b18	10	2024-05-12T15:16:32.746Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	2cd15597-9745-43a5-bbe9-84f9c467b45d	10	2024-05-12T15:16:43.836Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	9ef89eb7-35f7-43bb-86ac-4d5df6516fbe	10	2024-05-12T15:17:03.085Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	352af921-b2eb-4ca8-9775-5f124c622d6b	100	2024-05-12T15:19:05.045Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	21c26bde-bccb-45c2-b21f-41fb00a1fb2d	100	2024-05-12T15:19:32.524Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	aa508257-4477-47e7-8c39-77b8b39fe8bb	100	2024-05-12T15:19:58.295Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	c096c90d-0710-4804-801c-e5a2b8d14e6f	100	2024-05-12T15:24:14.633Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	a6bf37fb-1ae0-4682-881f-a213db5b4323	100	2024-05-12T15:24:53.009Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	abe67b83-3fdc-4e39-82ec-a15c49630b4d	100	2024-05-12T15:25:03.661Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	84d5b5f4-3c06-4b70-946e-dd258278c7b2	10	2024-05-12T15:25:15.331Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	0bf4b415-78ee-4301-b064-b55f4fa6a1f2	10	2024-05-12T15:25:35.403Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	c7912559-1554-4014-a088-2bbf51ca6da3	10	2024-05-12T15:25:49.583Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	ebaec0d9-c191-495b-88af-6949707ab812	10	2024-05-12T15:27:02.333Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	4a963962-95d1-4da2-8260-73d167422452	100	2024-05-12T15:30:25.189Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	4d57d380-9335-4127-83fc-a54c7feeb0aa	10	2024-05-12T15:31:18.538Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	27bc61d5-5d38-4060-a362-785a4c2c061c	100	2024-05-12T15:31:40.555Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	e904d182-a778-4fac-94fb-61cfc5b6a8ba	100	2024-05-12T15:32:14.656Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	3453dec4-2fa0-4a3d-a053-0af80abdc82c	100	2024-05-12T15:32:43.941Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	aa9552af-cddc-4b51-8a55-175767b04c59	10	2024-05-12T15:33:09.803Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	d034ab5c-92ef-4847-9014-b5114b17cc66	100	2024-05-12T15:33:50.500Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	6942f871-6e35-4eeb-a3ff-8edc8959aa22	100	2024-05-12T15:34:07.609Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	74a97d09-1b3c-4d33-9d1f-5272532daf53	10	2024-05-12T15:34:29.750Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	7c193fb6-e93e-4542-a8b8-f32710ff3c7e	100	2024-05-12T15:34:44.778Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	3a2b4c6a-9e59-4f3a-be7b-c8399bb3a201	100	2024-05-12T15:38:10.070Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	29798ae4-8aa1-4ce0-85aa-07b86273c32e	10	2024-05-12T15:38:41.437Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	e87c2f41-f417-4ee0-b818-9adfe7c790e9	100	2024-05-12T15:39:39.248Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	ab8709c7-2655-4f0f-b1bc-68363acf5f87	100	2024-05-12T15:40:27.009Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	4a394115-77b5-48e6-bafb-b1f5bc0c8eaf	0	2024-05-12T15:11:04.682Z	2024-05-13T13:26:53.720Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	fcc4957f-124a-41ff-b0eb-920627f9112d	100	2024-05-12T15:41:01.442Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	7f0bba22-b51c-4d05-b9fe-d561872971a3	100	2024-05-12T15:43:18.531Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	88d78894-1dd5-45cd-b525-634008cb5ecb	100	2024-05-14T16:08:52.928Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	e3f24520-666e-47d0-ad10-73a9110b3ad4	0	2024-05-12T15:16:42.770Z	2024-05-13T15:47:21.096Z	\N
c082783c-12d1-4174-9e59-276a5c647079	d276802d-0992-4f87-b5fa-04e5ee6a10c1	0	2024-05-12T15:15:24.789Z	2024-05-13T15:58:34.108Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	d8b0c9ec-39a1-44e4-9ccf-36b439e39368	10	2024-05-12T15:08:30.624Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	ebfbd0bc-1356-4086-9255-d5a2dcc7c660	10	2024-05-12T15:08:41.933Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	036aff85-2f8c-434b-87fd-35b46627c5ac	100	2024-05-12T15:08:54.843Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	689c1d43-a7ee-4b95-97df-1558fbfcb863	100	2024-05-12T15:09:02.622Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	0774d214-1b04-4d83-90bb-bf30662b9a5a	100	2024-05-12T15:09:54.950Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	09fa01c2-c48c-4d7d-b910-adc3109dc041	10	2024-05-12T15:10:12.150Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	22d6eaff-3933-418f-9287-7e45c300bfad	100	2024-05-12T15:10:22.696Z	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	b318e22b-b401-4432-81c5-a2ef54cdacb7	10	2024-05-12T15:10:24.624Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	f1afbf07-cd33-409c-b735-aac7f0b36fbc	10	2024-05-12T15:13:27.876Z	2024-05-12T15:13:30.044Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	35da1e4a-c8d2-4d9f-bd0b-ceec81216994	10	2024-05-12T15:13:31.934Z	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	53e92ec3-dfcb-4ac2-adf4-0fd1fa963756	10	2024-05-12T15:13:36.742Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	0bac5a5c-e260-41eb-806e-46397862d868	100	2024-05-12T15:19:21.445Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	ef90a8b3-a3f1-42b9-bcca-81c496e641fc	100	2024-05-12T15:19:45.803Z	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	d382afa7-cef6-4e16-89aa-22a5e20562e6	10	2024-05-12T15:42:25.483Z	2024-05-13T18:16:14.773Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	74dc7f47-7298-418b-9b5b-04c47914721b	10	2024-05-12T15:20:31.472Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	3a7b0aad-01bf-4f9d-b420-78b0f1e625a5	0	2024-05-12T15:50:07.830Z	2024-05-14T15:09:58.867Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	d84d154b-d509-4f04-b042-c1e4f506aed2	10	2024-05-12T15:20:48.369Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	df887393-215b-4be9-acc7-e2eb66565ae5	100	2024-05-12T15:21:42.233Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	71f5fc2f-29f2-430c-86f5-79b33f4f825e	10	2024-05-12T15:23:46.300Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	fb2766d8-4f6f-4615-a4ec-56ab17622a06	10	2024-05-12T15:23:56.274Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	8f2d2855-7c53-418f-929b-222e431be3b7	10	2024-05-12T15:23:56.799Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	5cac0471-262c-4408-8fd7-00e99f5a9869	100	2024-05-12T15:28:08.354Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	4fcbd1d7-d0dc-46a1-96a9-88199dc075f1	100	2024-05-12T15:28:24.353Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	9092081f-0160-44ed-bc7d-2aa1819390f5	10	2024-05-12T15:28:56.818Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	e99b7beb-668d-45f0-b368-6fad52f284a5	100	2024-05-12T15:29:15.456Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	bbe40b2f-8869-4d19-8f3d-ecb8383ce4ca	100	2024-05-12T15:35:08.890Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	6bb91459-f5bb-4199-a447-3413c1b96573	100	2024-05-12T15:35:48.466Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	0039d5e9-4cc5-4b47-b034-225da8e4fc19	100	2024-05-12T15:36:01.207Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	9d0e7d72-7bb7-4bcd-b49e-5af65224893a	10	2024-05-12T15:36:16.616Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	5a68adc5-f0cc-44f6-99e4-12cd88662d08	100	2024-05-12T15:40:45.838Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	4206e979-d31c-4306-b9cf-bac8abb1b7ba	100	2024-05-12T15:41:15.354Z	\N	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	38028f59-3dc9-4556-a56a-7d2fbb7ed895	100	2024-05-14T16:12:30.573Z	\N	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	bdf3ea04-9dc4-4219-bdc3-b84cde19f707	0	2024-05-14T16:12:27.518Z	2024-05-14T16:12:46.280Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	04a2d64b-69c0-4f6b-8975-4d41b4f43327	100	2024-05-12T15:42:08.092Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	fbdf04e4-b743-4fba-9a05-0bdfe8d40a05	0	2024-05-14T16:13:43.039Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	0c31a10b-64ed-447b-8e41-d84664302671	10	2024-05-12T15:42:32.353Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	9e9ad9af-339b-4a7b-9ee1-4a2ee21045b8	10	2024-05-14T16:14:50.056Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	23e13876-7ac0-401f-b99d-5b7161533e5b	10	2024-05-14T16:15:10.461Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	4ae4acec-ee0d-40f3-931c-37759e97ecff	100	2024-05-12T15:43:32.629Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	7fe4cd2a-9bec-419a-aaae-aa89761c5566	100	2024-05-12T15:43:57.481Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	64d32a92-257f-4051-8628-9a79d8f6f9cc	100	2024-05-12T15:44:44.242Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	b903d733-7b7e-413b-96b5-b9772d84c3df	10	2024-05-12T15:46:00.218Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	40721135-21c7-4017-9be9-b5d030c22d54	100	2024-05-12T15:47:41.811Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	931206af-51cc-4484-9948-109051aca4d5	10	2024-05-14T16:15:24.324Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	c2e2516b-559f-4189-bf17-c962964d66a3	10	2024-05-12T15:48:10.583Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	e30c8efd-29f1-4414-9f5e-080b7e1f6fa3	0	2024-05-12T15:24:06.618Z	2024-05-14T19:29:20.425Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	40c59877-4ebe-4c3f-bd87-ea8236ea6cff	100	2024-05-12T15:48:41.709Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	6e71e6ec-9335-4db3-a0bd-4cfc3bed41f9	0	2024-05-12T15:23:40.741Z	2024-05-14T19:29:24.501Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	3ccc7bd1-183d-4f51-9044-a523376e1a58	100	2024-05-12T15:50:24.211Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	db7e7a3f-51c5-4186-9656-7869389c7716	10	2024-05-12T15:50:51.965Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	9c17284c-d379-4b76-9d87-5c573b5eec6c	100	2024-05-12T15:51:41.835Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	ab840b70-dabb-4815-a8d9-5122baf2d7e8	100	2024-05-12T15:52:08.655Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	9815d990-5db6-4875-9dfa-1197812a9bfa	100	2024-05-12T15:52:34.469Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	fa852d9b-c583-49ac-b5a7-95927e861285	100	2024-05-12T15:44:17.486Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	7be88738-a1ec-46ff-af28-01cdba37440a	10	2024-05-12T15:45:01.643Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	7d861778-7335-4765-90b7-e57ef5a9799f	100	2024-05-12T15:45:17.629Z	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	0cbd1092-87c3-4877-a265-adb83eef128d	100	2024-05-12T15:45:48.536Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	e48e48a7-5052-48ab-b175-fb29a7c864db	10	2024-05-12T15:46:52.244Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	f040d5f7-db89-4068-a735-9c0082f30710	100	2024-05-12T15:53:22.446Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	258deaa1-d4c1-4e51-9a29-9883f68d506d	100	2024-05-12T15:53:47.030Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	2fe71172-ab32-490e-91ae-0ec727bd3d52	100	2024-05-12T15:54:09.906Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	6a220720-6fa3-42cc-8101-621da51b521f	100	2024-05-12T15:54:25.632Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	314310e7-152c-448d-9252-35537ffa272d	100	2024-05-12T15:54:38.679Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	118cbd0b-c262-45d4-a8d6-0090cdb0842a	0	2024-05-12T15:47:26.581Z	2024-05-13T17:45:39.415Z	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	950a9045-f3c3-42d7-bf59-d42c5ef42d29	10	2024-05-12T15:54:10.505Z	2024-05-12T18:12:42.969Z	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	23b8bef8-4a21-4eb6-b4fa-a10f50b563e7	10	2024-05-14T16:13:20.239Z	\N	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	171de76a-606f-4166-92f7-dee09be2774b	100	2024-05-14T16:13:36.753Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	182dd6ab-89fc-4d72-9193-713804f0a05a	10	2024-05-14T16:14:28.038Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	8106f142-2548-464f-ba9c-2d0044974bd3	10	2024-05-14T16:38:02.476Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	83e648cc-f565-4407-8377-d2b2522f3b7f	10	2024-05-14T16:39:10.137Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	77bb6f0a-4ba6-4ec2-b831-f120d7a25da1	10	2024-05-14T16:40:20.601Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	9b5e0298-63d9-49b6-ad1d-c912aac2d437	10	2024-05-14T16:41:57.156Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	367ed746-6c87-41d9-a29e-bf3540360ccf	10	2024-05-14T16:42:31.873Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-14T16:42:47.469Z	\N	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	100	2024-05-14T16:54:44.260Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	0d89328b-9fbe-4bc0-981f-c5241f35b175	100	2024-05-14T16:58:30.859Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	9815d990-5db6-4875-9dfa-1197812a9bfa	10	2024-05-14T16:58:21.443Z	2024-05-14T16:58:38.547Z	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	7a841996-d096-4752-b071-263d1166fcbc	10	2024-05-14T16:59:15.055Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	0fe9ff90-4190-4341-b775-986d9dd18bd5	100	2024-05-14T17:02:31.867Z	\N	\N
0312a963-d2b7-428c-afc3-0be8d400cd4d	528e2a82-0523-4110-8894-20ee1a60be69	10	2024-05-14T17:04:57.480Z	\N	\N
99459d98-6e1d-470d-b060-edcc76744227	7f8e851f-d072-469a-bf7c-1d04b14b18b4	10	2024-05-14T17:16:33.213Z	\N	\N
99459d98-6e1d-470d-b060-edcc76744227	87d09650-d0e9-4203-867e-b6e167a1171b	10	2024-05-14T17:16:46.730Z	\N	\N
0312a963-d2b7-428c-afc3-0be8d400cd4d	f33825fd-e6b0-47bb-80c0-80aef8a42e19	0	2024-05-14T17:31:04.980Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	02d596a5-c59c-48fc-833f-02a9e567a312	100	2024-05-14T17:33:53.870Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	43b19c6a-6e15-4c33-8ca9-a67bf4a10be2	100	2024-05-14T17:33:59.435Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	0eb81d00-fdee-4740-9070-bf23874d35a9	10	2024-05-14T17:34:05.378Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	bd2a5ee3-0fc6-4777-b4d1-4bb38ebbd0d4	10	2024-05-14T17:34:08.407Z	2024-05-14T17:34:11.889Z	\N
429fc597-b5ed-4224-8401-54668f171d19	7da89e60-0ae8-4bf0-a19d-15e41ad7c467	100	2024-05-14T17:34:32.222Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	e0e4e01c-881f-4117-8c0d-5d911a4269b9	100	2024-05-14T17:34:58.081Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	fcafaccc-e1b1-4ced-9f5d-ade800f5789c	100	2024-05-14T17:35:09.021Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	cc97a641-e6f4-4a9a-aa1e-6138d4de999c	0	2024-05-14T17:35:05.199Z	2024-05-14T17:35:49.180Z	\N
429fc597-b5ed-4224-8401-54668f171d19	9bb109e1-e0b8-4796-be8a-80dc64f83f1a	100	2024-05-14T17:36:14.716Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	ecf975c3-add4-4e4a-8190-6789936ce9ae	100	2024-05-14T17:36:27.017Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	4a963962-95d1-4da2-8260-73d167422452	100	2024-05-14T17:36:55.413Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	b8352000-3e89-4d63-949b-3e51bd73f7f7	100	2024-05-14T17:36:57.929Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	c96b4e99-1a18-4795-8570-9db2701e07a0	100	2024-05-14T17:37:52.087Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	14bb5f33-7c73-441d-a3b6-27fd7348dce3	10	2024-05-14T17:38:13.756Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	4f44cc87-8684-4327-9fb6-0a55d3464020	100	2024-05-14T17:38:22.872Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	e3f24520-666e-47d0-ad10-73a9110b3ad4	10	2024-05-14T17:38:25.449Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	f8ba58b3-6549-49b7-b400-81ce225d365d	100	2024-05-14T17:38:32.478Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	8550fcc0-103c-46ee-a632-7cbb45f1b74a	100	2024-05-14T17:38:40.327Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	7d861778-7335-4765-90b7-e57ef5a9799f	100	2024-05-14T17:39:08.360Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	cbe1445b-256b-4d93-8829-6a1fda8f526c	10	2024-05-14T17:39:56.228Z	\N	\N
7dfb239b-1151-4d6c-8bbb-52e3306ff422	12c780fb-9a09-4c15-bc5f-d93d5ea1177b	0	2024-05-14T17:44:57.159Z	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	329ef2f3-32ec-4987-8089-c7f02ffd7aaf	10	2024-05-14T17:58:36.469Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	b4560b93-cb36-4deb-a37b-e8207fedf8dd	0	2024-05-14T18:02:28.693Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	bea62622-d057-4d13-b821-c4f144611495	0	2024-05-14T17:29:48.354Z	2024-05-14T21:26:29.153Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	4dc99795-1b87-49b9-b0af-4a65c8ea7422	100	2024-05-12T15:49:18.473Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	1d2b769c-5dfe-41ae-aec9-03266ff78cb5	100	2024-05-12T15:49:38.540Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	229f0eb8-0663-4ab0-b471-5028f1bf1e72	10	2024-05-12T15:52:47.585Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	d1341b2e-7a67-4b11-87d8-e62f53cbf83e	100	2024-05-12T15:55:52.721Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	c8644a2b-90a2-4f10-8008-26c9ae5ff5b0	100	2024-05-12T15:56:05.416Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	cd66b753-ee1e-414f-8975-0881b9d636b2	100	2024-05-12T15:56:16.679Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	49269442-ab56-4023-be4f-9201c8ade196	10	2024-05-12T15:56:46.270Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	b4560b93-cb36-4deb-a37b-e8207fedf8dd	10	2024-05-12T15:56:54.846Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	004a49df-0306-4891-9cbf-2b40d050c318	100	2024-05-12T15:57:14.738Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	8a491c1d-0a91-4135-b7f7-85a460eb44ba	10	2024-05-12T15:57:35.119Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	921c891e-502e-4e96-b556-e13e1ef2e728	10	2024-05-14T16:38:16.938Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	1c1c7bc5-787f-4f02-b532-4e95b722f3c2	10	2024-05-14T16:38:40.588Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	463c4b4d-dec4-4f40-9f6f-fe44474e8447	10	2024-05-14T16:40:35.121Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	afff9f35-95b8-48b8-8489-9ea908ae6ac5	10	2024-05-14T16:40:44.735Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	7e221be5-cacb-4b5d-96b7-4d0b65d04295	10	2024-05-14T16:45:49.044Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	e966d8d8-9212-49c6-a1c2-385a61edab45	10	2024-05-14T16:45:52.612Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	45ec530c-046f-4c3d-93f7-16f30389bbf7	10	2024-05-14T16:46:07.511Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	66a98038-4588-431c-814d-0c440c4683af	10	2024-05-14T16:46:13.872Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	85132717-39a0-41bb-8409-6ecf6ec77019	10	2024-05-14T16:46:25.277Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	0fd65d26-3ded-4e6d-aeb1-36071d9678d8	10	2024-05-14T16:46:48.457Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	2ac83258-0e18-4373-9edc-d78286bc955c	10	2024-05-14T16:47:01.922Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	a1e9e0d1-cf48-4f52-8f41-cc24e44a9cce	100	2024-05-14T16:47:38.555Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	0a238fb4-a6f0-4d93-9a1b-02245afa2513	10	2024-05-14T16:47:46.526Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	3bb8fb06-b376-4489-80fe-59826066e849	100	2024-05-14T16:48:21.443Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	88c61442-7576-41f7-b80d-6783d0ff95e4	10	2024-05-14T16:48:22.754Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	723e8686-19d8-4b51-a250-e05885d9e081	100	2024-05-14T16:48:35.922Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	732e5025-ec82-434e-bcc2-77897cf33685	10	2024-05-14T16:49:16.750Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	19b620fd-2c12-45dd-92c2-a44eff97ca23	100	2024-05-12T15:53:02.167Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	3c1b608c-abe0-4f61-a6f5-dedca499fbf3	100	2024-05-12T15:54:58.447Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	96afd89c-f294-47d5-be96-919c7cdacce1	100	2024-05-12T15:55:13.376Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	3b212543-48ca-43a5-9f42-20b506425a83	100	2024-05-12T15:56:25.895Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	9651eb11-619a-41cd-8e4b-7629ff6bef34	10	2024-05-12T15:57:53.288Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	46c21b60-cd85-426c-ab78-b2dfbbab9e4e	10	2024-05-12T15:58:09.292Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	bb89b62d-0d6b-471d-8617-872dabdca89c	10	2024-05-14T16:39:40.028Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	80590162-dc28-4b03-838e-dc1def107e65	10	2024-05-14T16:40:00.466Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	e05de4f9-3be7-451a-ab2b-f83ccf69fe90	10	2024-05-14T16:41:38.741Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	d7bcc63a-2ac5-475b-b2a6-f0134b451b98	10	2024-05-14T16:43:11.924Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	d8b0c9ec-39a1-44e4-9ccf-36b439e39368	10	2024-05-14T16:43:27.105Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	2534868d-bb4c-421f-8149-0641a599fb8a	10	2024-05-14T16:43:52.031Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	1ab617ae-01e8-412d-a0c2-9fbea777d832	10	2024-05-14T16:44:21.953Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	2f521961-1ed9-4602-9d20-beeeee59c5ba	10	2024-05-14T16:44:33.793Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	1043a736-81a6-43d1-8e45-746105b0c122	10	2024-05-14T16:45:07.888Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	10	2024-05-14T16:45:17.711Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	f9e4ebb7-1f4d-4a20-b18c-9d5e4d3984a0	10	2024-05-14T16:45:31.345Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	b445feb3-6ae1-4998-ac1f-ad71adef656f	10	2024-05-14T16:47:14.243Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	53e92ec3-dfcb-4ac2-adf4-0fd1fa963756	100	2024-05-14T16:47:25.658Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	10	2024-05-14T16:47:35.155Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	bea72070-859a-4327-8bd8-dba0a8ada786	100	2024-05-14T16:47:59.428Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	1d8bc41e-217b-498d-97ab-9f01ca364490	10	2024-05-14T16:48:04.736Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	01794c4c-0038-4330-a478-0d10c85fb2d0	100	2024-05-14T16:48:09.367Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	b2d2741f-bfc6-4a0b-b6bf-79b7f3b19b02	10	2024-05-14T16:48:40.987Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	6d965a4b-3b38-4418-a95e-b0aec0e0eb7a	100	2024-05-14T16:48:54.560Z	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	51df415f-3624-4066-ab38-25d6101e7c5a	10	2024-05-14T16:48:56.853Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	2b72c607-f5b6-4907-88e9-1a2d50045b18	100	2024-05-14T16:49:22.259Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	7492b38b-e683-4568-b758-83fd1b7ffbce	10	2024-05-14T17:00:10.443Z	\N	\N
0312a963-d2b7-428c-afc3-0be8d400cd4d	5aac6b69-af17-4c0e-b0d0-1621211bc14c	10	2024-05-14T17:04:29.516Z	\N	\N
0312a963-d2b7-428c-afc3-0be8d400cd4d	ef206d20-b798-4215-bebb-e53afd8f4a69	10	2024-05-14T17:05:25.817Z	\N	\N
0312a963-d2b7-428c-afc3-0be8d400cd4d	7b1ffe8e-6cb1-46b9-b85c-dcb380da4aa4	10	2024-05-14T17:05:45.868Z	\N	\N
0312a963-d2b7-428c-afc3-0be8d400cd4d	053d6422-e791-474c-9820-90252e04da58	10	2024-05-14T17:05:53.408Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	18b45eb3-755c-4d38-a974-2857f6b30638	10	2024-05-14T17:06:12.779Z	\N	\N
99459d98-6e1d-470d-b060-edcc76744227	cc97a641-e6f4-4a9a-aa1e-6138d4de999c	10	2024-05-14T17:17:12.534Z	\N	\N
99459d98-6e1d-470d-b060-edcc76744227	a8a72f8f-404e-48af-9943-fa165177a787	10	2024-05-14T17:17:30.046Z	\N	\N
ecb3d785-eac3-402f-ab57-028fea566bb4	be3432b6-88a6-4f2b-a2f1-2ec47d80f6ac	10	2024-05-14T17:22:06.358Z	\N	\N
2b0f8271-60c3-4cce-8443-4103015313fb	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T17:22:18.985Z	2024-05-14T17:22:51.678Z	\N
ecb3d785-eac3-402f-ab57-028fea566bb4	6614f568-a5dc-4d13-90b8-8e5563088e9d	10	2024-05-14T17:23:05.855Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	468fd58a-21d2-447e-828c-3af01effbbe2	0	2024-05-14T17:25:03.690Z	2024-05-14T17:25:38.724Z	\N
022fcaca-94ad-4917-9c59-5d95736a674b	92f43fac-a809-4c60-b9fb-eff7dd29a8bb	100	2024-05-14T17:26:44.326Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	09024c0a-be30-49c8-a5f9-9d779af6e0c7	100	2024-05-14T17:27:11.058Z	\N	\N
0312a963-d2b7-428c-afc3-0be8d400cd4d	d382afa7-cef6-4e16-89aa-22a5e20562e6	100	2024-05-14T17:31:12.169Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	c1e4ef3f-0d86-418f-9d9f-05f028246bed	10	2024-05-14T17:33:37.042Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	1ab617ae-01e8-412d-a0c2-9fbea777d832	100	2024-05-14T17:33:44.922Z	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	eef4aedb-49e6-4ccd-880a-e1143ce6e43a	0	2024-05-14T17:05:52.513Z	2024-05-14T18:15:26.573Z	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	6347a939-ad2c-458e-a097-17fdb7ef34b1	10	2024-05-14T16:54:26.159Z	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	69732c83-e2ee-481f-b4c5-e55932e8d51f	100	2024-05-14T16:59:17.218Z	\N	\N
0312a963-d2b7-428c-afc3-0be8d400cd4d	799e9f43-b5e8-4484-be33-09c442390253	10	2024-05-14T17:04:43.122Z	\N	\N
99459d98-6e1d-470d-b060-edcc76744227	d609ed69-9c62-40c2-b80d-e0aeda8de704	10	2024-05-14T17:16:20.107Z	\N	\N
ecb3d785-eac3-402f-ab57-028fea566bb4	24d16477-578f-45cd-8d85-2ed13db715cf	10	2024-05-14T17:21:29.252Z	\N	\N
ecb3d785-eac3-402f-ab57-028fea566bb4	a9c5cfe0-a05c-4e45-b38a-f5db5f837304	10	2024-05-14T17:21:42.268Z	\N	\N
ecb3d785-eac3-402f-ab57-028fea566bb4	8e5bab94-d594-46dd-a855-7675f5d8231f	10	2024-05-14T17:22:21.989Z	\N	\N
ecb3d785-eac3-402f-ab57-028fea566bb4	bea62622-d057-4d13-b821-c4f144611495	10	2024-05-14T17:23:38.087Z	\N	\N
ecb3d785-eac3-402f-ab57-028fea566bb4	e2def3cf-3787-4066-a106-2c663c008510	10	2024-05-14T17:24:07.604Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	c7493f68-4e46-453d-9bf0-36fff3189bf7	0	2024-05-13T20:41:35.803Z	2024-05-14T17:24:47.124Z	\N
022fcaca-94ad-4917-9c59-5d95736a674b	0039d5e9-4cc5-4b47-b034-225da8e4fc19	100	2024-05-14T17:27:44.795Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	90d80e5a-8239-4983-b8aa-fa5c5b4c2967	100	2024-05-14T17:28:13.517Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	6374669b-f8a0-433b-a6af-349529a9e31a	100	2024-05-14T17:28:26.503Z	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	2de1e0fe-6bc4-4454-be92-02a01a59e820	10	2024-05-14T17:29:20.724Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	911f55b0-51f3-47ec-b80f-23fee83a5d72	100	2024-05-14T17:35:38.712Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	faeac6fc-4c69-4e2b-9b15-b47e85af78ba	100	2024-05-14T17:35:50.481Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	ab840b70-dabb-4815-a8d9-5122baf2d7e8	10	2024-05-14T17:37:54.916Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	2440606c-888a-4b54-9823-85025ab9a02c	100	2024-05-14T17:38:10.426Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	723e8686-19d8-4b51-a250-e05885d9e081	100	2024-05-14T17:38:51.305Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	79224f5f-e140-41f1-a6df-dc1313e11387	100	2024-05-14T17:39:01.632Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	a1e9e0d1-cf48-4f52-8f41-cc24e44a9cce	100	2024-05-14T17:39:18.859Z	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	0d90cc33-ff13-420c-bfa3-2e155200aa07	100	2024-05-14T17:39:25.737Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	4c4b59cc-d639-4952-87e3-107c61c2a673	100	2024-05-14T17:39:32.735Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	ab8709c7-2655-4f0f-b1bc-68363acf5f87	10	2024-05-14T17:40:02.640Z	\N	\N
2b0f8271-60c3-4cce-8443-4103015313fb	cb12e508-7dc4-4a23-8141-246c8396edab	100	2024-05-14T17:41:33.819Z	\N	\N
792ef61b-0f2d-4b0f-9f10-41bbe3327bdf	2cdfa6cc-5f3d-4858-a3ee-13f0a6c7eaf3	0	2024-05-14T17:27:03.106Z	2024-05-14T17:49:09.521Z	\N
792ef61b-0f2d-4b0f-9f10-41bbe3327bdf	d01c1d11-e401-4151-b0ec-52c26ce54b32	0	2024-05-14T17:26:48.320Z	2024-05-14T17:50:24.747Z	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	d276802d-0992-4f87-b5fa-04e5ee6a10c1	10	2024-05-14T17:58:27.992Z	\N	\N
2b0f8271-60c3-4cce-8443-4103015313fb	9be8995e-d9db-41e5-9aa8-2ef4d0411fd2	0	2024-05-14T18:04:17.131Z	2024-05-14T18:04:49.277Z	\N
b8d3b2f8-1b65-414a-b086-70fd1179bd1b	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T18:21:41.911Z	2024-05-14T18:21:47.410Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	0262de4e-b408-44d3-9f6c-d9a205da311d	100	2024-05-14T18:24:33.199Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	f1afbf07-cd33-409c-b735-aac7f0b36fbc	100	2024-05-14T18:29:25.281Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	52808a2f-f878-4f2d-8c8d-17c2861358e8	100	2024-05-14T18:36:28.939Z	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	1de20395-c5ed-4f98-9090-166ffe118c11	100	2024-05-14T18:39:10.745Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	99d42576-350e-4fd5-b319-34aa2f8532e6	100	2024-05-14T18:41:05.028Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	ea2c6721-693d-496e-8442-a2381d48430b	100	2024-05-14T18:41:33.696Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	552e881e-ed4a-414b-914e-36a0dd85d0a4	0	2024-05-12T22:57:40.460Z	2024-05-14T18:42:14.349Z	\N
4503dfb5-e361-444e-92c2-f8b4409e3ca2	6374669b-f8a0-433b-a6af-349529a9e31a	100	2024-05-14T18:49:31.465Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	f30bfe21-95b2-43b3-bab3-6c1ff82de4cc	100	2024-05-14T18:31:03.978Z	2024-05-14T18:51:26.279Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	0b36b132-05b8-421d-b1b1-955c4b96f520	100	2024-05-14T18:29:45.300Z	2024-05-14T18:51:49.110Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	bcd499a9-ddd9-479e-a057-c9f058178eaf	0	2024-05-14T18:30:02.198Z	2024-05-14T18:52:46.196Z	\N
b1d640d8-07bd-433a-b841-045e87d98e30	f013501e-e9ea-478f-af0d-648f96244b14	100	2024-05-14T18:53:33.370Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	52bd1913-9ae1-413d-8258-205049df62e6	100	2024-05-14T18:51:55.455Z	2024-05-14T18:56:42.055Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	e3f884bd-3dc5-480f-8bfe-c0be33d26f43	100	2024-05-14T18:36:03.341Z	2024-05-14T18:58:56.082Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	b8cbcd9a-70e8-4e98-817c-bcf168bdcdf8	100	2024-05-14T18:29:05.734Z	2024-05-14T18:59:15.452Z	\N
022fcaca-94ad-4917-9c59-5d95736a674b	cf61184d-0ffb-4443-9a63-231432a3bed1	0	2024-05-14T17:25:22.909Z	2024-05-15T01:52:22.920Z	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	b813d3b5-bf55-443b-b1a4-be3d426af4e9	10	2024-05-14T17:34:02.218Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	f1570b6d-f756-493e-a151-115f51f1e747	10	2024-05-14T17:34:19.798Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	03c98160-18b1-46fa-8477-d85d784987b4	10	2024-05-14T17:40:15.276Z	\N	\N
792ef61b-0f2d-4b0f-9f10-41bbe3327bdf	52634f35-73b2-4c60-99c9-1ec886f6e4b3	0	2024-05-14T18:23:04.097Z	2024-05-14T18:23:18.684Z	\N
fbe32f25-fa62-422d-823d-f388000f47d4	7baf0c84-7658-4f5d-829a-36f6194c154f	100	2024-05-14T18:36:47.677Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	e48d36c1-f6b4-47f4-9123-17681ed99941	0	2024-05-14T18:42:06.568Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	3a040ebd-225f-4f0c-934c-5b14399fbd4f	100	2024-05-14T18:43:47.848Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	e904d182-a778-4fac-94fb-61cfc5b6a8ba	100	2024-05-14T18:44:06.138Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	82fe2a73-a292-488d-b227-3302bd06496d	100	2024-05-14T18:44:20.608Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	39a516e1-1d99-4300-9b1f-afc9ca68bc69	0	2024-05-14T01:45:50.280Z	2024-05-14T18:44:39.700Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T18:45:38.743Z	2024-05-14T18:46:08.714Z	\N
4503dfb5-e361-444e-92c2-f8b4409e3ca2	2d93e34c-6997-499e-b4f6-6cd7bbcf8602	100	2024-05-14T18:49:10.290Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	f68942f9-99e4-4452-979e-83a68815ab4c	100	2024-05-14T18:32:18.169Z	2024-05-14T18:50:11.357Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	01794c4c-0038-4330-a478-0d10c85fb2d0	100	2024-05-14T18:36:49.173Z	2024-05-14T18:50:52.515Z	\N
b1d640d8-07bd-433a-b841-045e87d98e30	f94729df-e289-49d8-b55c-19ebdbfd783c	10	2024-05-14T18:52:17.080Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	2d93e34c-6997-499e-b4f6-6cd7bbcf8602	100	2024-05-14T18:31:19.165Z	2024-05-14T18:52:18.603Z	\N
b1d640d8-07bd-433a-b841-045e87d98e30	15121282-bdc8-4096-845b-974401b2e6aa	10	2024-05-14T18:53:02.578Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	a4f73ff7-1c89-42b8-84d2-8983e7b7fd6d	100	2024-05-14T18:49:19.308Z	2024-05-14T18:53:13.134Z	\N
b1d640d8-07bd-433a-b841-045e87d98e30	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-14T18:53:54.876Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	876548db-d180-4083-96ba-cddcb86134b0	10	2024-05-14T18:53:20.045Z	2024-05-14T19:09:54.363Z	\N
b1d640d8-07bd-433a-b841-045e87d98e30	79c7f357-2e62-4ab9-8152-de7165e6dae6	10	2024-05-14T18:52:40.179Z	2024-05-14T19:11:29.292Z	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	9b5e0298-63d9-49b6-ad1d-c912aac2d437	10	2024-05-14T18:27:46.609Z	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	319870a5-c97e-48b4-b5b8-4d05fcc09fdc	10	2024-05-14T18:27:58.873Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	2a8e82ce-897c-4ce2-a611-1c5cbbb562d5	100	2024-05-14T18:36:58.838Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	c4cb72e4-042f-457b-a18e-6233e2bb2b9f	0	2024-05-14T18:38:05.310Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	e87c2f41-f417-4ee0-b818-9adfe7c790e9	0	2024-05-14T18:38:19.124Z	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	3ce35ddd-0dac-41f9-88a9-27a509c5df0b	100	2024-05-14T18:38:33.609Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	6374669b-f8a0-433b-a6af-349529a9e31a	100	2024-05-14T18:38:51.594Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	f68942f9-99e4-4452-979e-83a68815ab4c	100	2024-05-14T18:39:09.266Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	6795ba1a-3908-4edf-95e6-96c61b21914e	100	2024-05-14T18:39:26.936Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	2d16c993-d60f-49fb-ad83-b1f2cac4fe59	100	2024-05-14T18:39:45.156Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	f92f19df-fcfc-4187-ba73-3457c765e71a	100	2024-05-14T18:39:59.797Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	e2def3cf-3787-4066-a106-2c663c008510	100	2024-05-14T18:40:40.039Z	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	7d861778-7335-4765-90b7-e57ef5a9799f	100	2024-05-14T18:43:04.224Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	9e9ad9af-339b-4a7b-9ee1-4a2ee21045b8	100	2024-05-14T18:28:23.065Z	2024-05-14T19:02:16.699Z	\N
b1d640d8-07bd-433a-b841-045e87d98e30	ef206d20-b798-4215-bebb-e53afd8f4a69	10	2024-05-14T18:55:55.067Z	\N	\N
9eaaf07a-ca5b-4633-8b5e-0954f79be0f2	8dcf60fe-758b-4137-93b6-cac321724df2	100	2024-05-14T19:02:17.124Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	b7349827-482c-4c5c-b0eb-7627a8380c16	10	2024-05-14T19:04:00.620Z	\N	\N
1b16c142-7f78-450c-bca7-637756c89348	9e66cff1-37e1-4631-8251-c7b03b287ada	10	2024-05-14T19:07:04.476Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	b355c6b7-f9c9-4b2f-92a2-bb7f8adeb790	10	2024-05-14T19:07:10.412Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	377fdec9-9b17-4086-8986-3e04508c4917	100	2024-05-14T19:05:53.567Z	2024-05-14T19:07:39.058Z	\N
b1d640d8-07bd-433a-b841-045e87d98e30	c4e94a84-f6d2-48a3-a391-8c2491cc8b21	10	2024-05-14T19:07:45.989Z	\N	\N
1b16c142-7f78-450c-bca7-637756c89348	fd54a76a-cdb9-4543-9df6-24baa384e38c	10	2024-05-14T19:07:49.564Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	4003cd8e-8536-41f7-a7fa-3c9bc622adf1	100	2024-05-14T19:07:49.822Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	d001c64f-33b0-4d50-a8c1-1b62084c6e00	10	2024-05-14T19:08:07.304Z	\N	\N
1b16c142-7f78-450c-bca7-637756c89348	552e881e-ed4a-414b-914e-36a0dd85d0a4	10	2024-05-14T19:08:07.376Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	dfcde5dc-2359-47d8-9652-ec4606472bbe	10	2024-05-14T19:08:08.295Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	66a98038-4588-431c-814d-0c440c4683af	10	2024-05-14T19:09:31.726Z	\N	\N
1b16c142-7f78-450c-bca7-637756c89348	30afd32d-4464-488e-a212-e4b9ad9ea5bc	100	2024-05-14T19:10:17.397Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	71f33e8e-791f-4224-a8f0-67bb8557b0c0	10	2024-05-14T19:10:29.296Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	ca0ef946-0de3-47a2-a0cb-df72de35aeec	10	2024-05-14T19:10:43.691Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	5facb97a-2e27-4ddf-bbde-0aeed05bb262	10	2024-05-14T19:11:15.155Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	3814a22f-b8a5-426e-ac21-138c2d62a0ba	10	2024-05-14T19:11:44.752Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	627d5fe7-e05b-4929-9a4f-3c06eaf61fca	10	2024-05-14T19:12:24.639Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	01d3d6df-cd76-4f62-9c39-ddd968a9a634	10	2024-05-14T18:57:45.143Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	b9368d94-0425-4b23-ada4-66f8986f7368	0	2024-05-08T19:35:11.279Z	2024-05-14T18:58:01.672Z	\N
b1d640d8-07bd-433a-b841-045e87d98e30	3b7a9689-8c41-4090-9084-5b8e31a1d7d5	0	2024-05-14T18:56:56.715Z	2024-05-14T19:16:51.342Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	c4e9958c-a153-4824-96c9-2622e87e9745	100	2024-05-14T19:04:55.942Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	ba4466e9-61e1-4f84-8e98-7dda7b416e1b	100	2024-05-14T19:05:13.855Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	10	2024-05-14T19:06:29.909Z	\N	\N
1b16c142-7f78-450c-bca7-637756c89348	004a49df-0306-4891-9cbf-2b40d050c318	100	2024-05-14T19:08:57.421Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	358f41de-a752-424e-8ec1-ae88b68a7334	10	2024-05-14T19:08:59.661Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-14T19:09:14.961Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	0eb6f7b8-4a6c-4e0d-a518-bfdf5c46fa22	10	2024-05-14T19:12:39.093Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	1beaa417-91ee-4ccc-b779-a4c2a5a81807	100	2024-05-14T19:12:53.717Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	b813d3b5-bf55-443b-b1a4-be3d426af4e9	10	2024-05-14T19:12:56.771Z	\N	\N
1b16c142-7f78-450c-bca7-637756c89348	b84e2a5f-8dc0-4e03-8581-9aace16bc227	100	2024-05-14T19:12:58.886Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	100	2024-05-14T19:12:59.066Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	c1e4ef3f-0d86-418f-9d9f-05f028246bed	10	2024-05-14T19:13:32.162Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	c8ce7a65-be98-4e38-beaa-b9907dc003e9	10	2024-05-14T19:13:40.460Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	6b3962b3-33dd-422e-bdda-35dbe0afa554	10	2024-05-14T19:13:47.358Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-14T19:13:53.535Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	bd2a5ee3-0fc6-4777-b4d1-4bb38ebbd0d4	10	2024-05-14T19:14:20.809Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	c957dded-1e08-4e25-a2f8-80d111aef57b	10	2024-05-14T19:14:39.342Z	\N	\N
1b16c142-7f78-450c-bca7-637756c89348	1bae9ae8-c59e-430c-b7e0-176e307d4a99	10	2024-05-14T19:15:00.127Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	02d596a5-c59c-48fc-833f-02a9e567a312	10	2024-05-14T19:15:13.617Z	\N	\N
1b16c142-7f78-450c-bca7-637756c89348	4eb7c42e-8499-438d-9298-3ca063eca896	100	2024-05-14T19:15:24.292Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	61dddb1e-13b3-4f2f-96e9-faa1efd7a0e6	10	2024-05-14T19:16:39.501Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	6716f08d-fa4f-48a3-8507-4c0bcbee5535	100	2024-05-14T19:17:56.902Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	10	2024-05-14T19:18:28.644Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	053d6422-e791-474c-9820-90252e04da58	10	2024-05-14T19:18:53.716Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	12b9119d-04f0-4ec6-990c-76a28f0dcb82	10	2024-05-14T19:19:17.503Z	\N	\N
1b16c142-7f78-450c-bca7-637756c89348	463b2006-ff25-4d63-8b79-17666b4b4d02	100	2024-05-14T19:19:21.563Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	88c61442-7576-41f7-b80d-6783d0ff95e4	10	2024-05-14T19:19:30.506Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	8812cea7-01bc-4c7f-892d-cd0071589195	10	2024-05-14T19:20:24.635Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	71f33e8e-791f-4224-a8f0-67bb8557b0c0	10	2024-05-14T19:20:44.744Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	df954afb-bd57-422c-ab70-de3787cb7880	10	2024-05-14T19:21:20.570Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	0eb6f7b8-4a6c-4e0d-a518-bfdf5c46fa22	10	2024-05-14T19:23:25.832Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-14T19:23:34.186Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	446366df-d941-4d6f-9bcf-09bfc4c2a9c8	0	2024-05-14T19:28:03.215Z	2024-05-14T19:29:08.777Z	\N
82087ba4-959b-4321-9b90-a259be8b7b34	c957dded-1e08-4e25-a2f8-80d111aef57b	100	2024-05-14T19:37:28.432Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	01d3d6df-cd76-4f62-9c39-ddd968a9a634	100	2024-05-14T19:38:03.703Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	23e13876-7ac0-401f-b99d-5b7161533e5b	0	2024-05-14T19:40:04.745Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	f85299f5-8a6b-460b-bb56-44c893dc79c2	100	2024-05-14T19:42:16.238Z	\N	\N
96ab15d6-ecf2-47fe-bbe6-7b6764ead09a	edcb4032-d028-48ee-9811-b6004b277877	10	2024-05-14T19:51:20.851Z	\N	\N
96ab15d6-ecf2-47fe-bbe6-7b6764ead09a	ef206d20-b798-4215-bebb-e53afd8f4a69	100	2024-05-14T19:51:38.031Z	\N	\N
96ab15d6-ecf2-47fe-bbe6-7b6764ead09a	c6995a7c-5298-490e-af14-8feaaedc3e7b	100	2024-05-14T19:51:50.390Z	\N	\N
96ab15d6-ecf2-47fe-bbe6-7b6764ead09a	55bf190c-f2eb-4f80-89f0-76dec0843ad4	100	2024-05-14T19:52:13.600Z	\N	\N
96ab15d6-ecf2-47fe-bbe6-7b6764ead09a	01d3d6df-cd76-4f62-9c39-ddd968a9a634	100	2024-05-14T19:52:23.109Z	\N	\N
96ab15d6-ecf2-47fe-bbe6-7b6764ead09a	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-14T19:52:58.227Z	\N	\N
96ab15d6-ecf2-47fe-bbe6-7b6764ead09a	324fc117-cf6b-4367-a7f1-8eb595c01377	100	2024-05-14T19:53:15.276Z	\N	\N
96ab15d6-ecf2-47fe-bbe6-7b6764ead09a	0eb81d00-fdee-4740-9070-bf23874d35a9	100	2024-05-14T19:59:36.985Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	6d965a4b-3b38-4418-a95e-b0aec0e0eb7a	0	2024-05-14T19:08:59.175Z	2024-05-15T01:38:29.662Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	c84192e1-0605-4b6f-8302-99aa29116f1f	0	2024-05-14T19:50:29.662Z	2024-05-15T00:54:50.994Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	234f79d6-5cda-485a-a604-3da165c4989a	0	2024-05-14T19:52:26.609Z	2024-05-15T00:56:19.422Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	698cc13d-06c1-49ad-b7b1-d233009009c4	0	2024-05-14T19:52:40.313Z	2024-05-15T00:56:11.796Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	0cbd1092-87c3-4877-a265-adb83eef128d	0	2024-05-14T19:50:46.653Z	2024-05-15T00:56:36.259Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	2f521961-1ed9-4602-9d20-beeeee59c5ba	0	2024-05-14T19:51:23.176Z	2024-05-15T00:58:32.790Z	\N
b1d640d8-07bd-433a-b841-045e87d98e30	899fe5dd-d0bd-40df-93ed-b57eb46fcfab	10	2024-05-14T19:08:35.615Z	\N	\N
1b16c142-7f78-450c-bca7-637756c89348	c8644a2b-90a2-4f10-8008-26c9ae5ff5b0	10	2024-05-14T19:08:42.472Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	0eb81d00-fdee-4740-9070-bf23874d35a9	10	2024-05-14T19:14:06.469Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	1ef4c263-4e2b-4271-af56-2a4d8717c85c	0	2024-05-14T01:34:22.710Z	2024-05-14T19:19:39.381Z	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	0a238fb4-a6f0-4d93-9a1b-02245afa2513	10	2024-05-14T19:19:58.591Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	e87c2f41-f417-4ee0-b818-9adfe7c790e9	10	2024-05-14T19:21:44.474Z	\N	\N
1b16c142-7f78-450c-bca7-637756c89348	bc43d2f6-7c4f-4d38-8269-b66b085fcb8a	100	2024-05-14T19:21:49.936Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	c4976a72-788e-4360-ad86-bb4939bebcc2	10	2024-05-14T19:22:06.286Z	\N	\N
b166f0d0-0dd0-4c95-9eca-23adf5fd068e	e3f24520-666e-47d0-ad10-73a9110b3ad4	10	2024-05-14T19:24:44.079Z	\N	\N
82087ba4-959b-4321-9b90-a259be8b7b34	1f136e6b-3881-4341-b169-5a4ec852c888	100	2024-05-14T19:33:45.628Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	418b48c8-ab44-4999-8b06-8ab1415db000	0	2024-05-14T19:33:55.338Z	\N	\N
82087ba4-959b-4321-9b90-a259be8b7b34	9b5e0298-63d9-49b6-ad1d-c912aac2d437	100	2024-05-14T19:33:56.698Z	\N	\N
b81699a1-be81-479b-a064-046a738dda6a	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T19:41:13.944Z	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	77396dd0-9afa-4ae9-9a10-1d796a79b8c0	100	2024-05-14T19:41:41.165Z	\N	\N
96ab15d6-ecf2-47fe-bbe6-7b6764ead09a	c0c07df3-6215-4b07-8240-f462315ec075	100	2024-05-14T19:51:44.679Z	\N	\N
96ab15d6-ecf2-47fe-bbe6-7b6764ead09a	319870a5-c97e-48b4-b5b8-4d05fcc09fdc	100	2024-05-14T19:52:36.759Z	\N	\N
82087ba4-959b-4321-9b90-a259be8b7b34	f33825fd-e6b0-47bb-80c0-80aef8a42e19	0	2024-05-14T19:33:36.916Z	2024-05-15T00:51:40.172Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	79039fe7-7ae3-410a-913e-49cd816aeca1	0	2024-05-14T19:50:15.800Z	2024-05-15T00:55:26.223Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	b1d8f194-15ac-4490-b062-d45434d41966	0	2024-05-14T19:50:04.463Z	2024-05-15T00:55:47.515Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	0	2024-05-14T19:48:24.559Z	2024-05-15T01:02:12.440Z	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	fe6cc6f1-779b-46d5-aa3f-7f57e08fecfa	10	2024-05-14T19:23:57.050Z	2024-05-15T01:39:43.997Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	0dad780b-d2e5-43e3-be3c-1528a7a834a8	10	2024-05-14T19:11:34.623Z	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	8fe7a2a4-557e-4521-b644-38bce26e5d1d	10	2024-05-14T19:16:05.132Z	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	945b1d7a-17ac-4646-92ef-018669cee133	10	2024-05-14T19:23:39.353Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	d30b4170-8f35-475d-a143-6e01a60b2f29	100	2024-05-14T19:48:03.054Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	cc97a641-e6f4-4a9a-aa1e-6138d4de999c	10	2024-05-14T19:49:12.464Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	a8c18a44-ec60-4a19-8e96-785c49de9630	10	2024-05-14T19:49:19.522Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	8f528aeb-d345-42a8-b01f-48156c9d589f	10	2024-05-14T19:51:38.973Z	\N	\N
96ab15d6-ecf2-47fe-bbe6-7b6764ead09a	1a11bf91-5128-4a26-bacf-d81f559695eb	10	2024-05-14T19:53:36.439Z	\N	\N
96ab15d6-ecf2-47fe-bbe6-7b6764ead09a	87d09650-d0e9-4203-867e-b6e167a1171b	100	2024-05-14T19:53:49.332Z	\N	\N
94eb5d46-85cf-4915-a8f9-e10bf77e401d	b7349827-482c-4c5c-b0eb-7627a8380c16	0	2024-05-13T19:10:20.875Z	2024-05-14T20:06:12.982Z	\N
94eb5d46-85cf-4915-a8f9-e10bf77e401d	6a220720-6fa3-42cc-8101-621da51b521f	0	2024-05-14T13:38:39.939Z	2024-05-14T20:06:19.519Z	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	6795ba1a-3908-4edf-95e6-96c61b21914e	100	2024-05-14T20:14:21.867Z	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	8df22c40-25d7-4f96-8bc6-0fe734f948d3	100	2024-05-14T20:14:47.715Z	\N	\N
7dfb239b-1151-4d6c-8bbb-52e3306ff422	4a394115-77b5-48e6-bafb-b1f5bc0c8eaf	0	2024-05-14T20:17:08.964Z	2024-05-14T20:17:55.953Z	\N
7dfb239b-1151-4d6c-8bbb-52e3306ff422	ab7786c6-8133-42c0-871e-6bbacca60c5e	0	2024-05-14T20:20:54.970Z	\N	\N
7dfb239b-1151-4d6c-8bbb-52e3306ff422	88d78894-1dd5-45cd-b525-634008cb5ecb	0	2024-05-14T20:21:33.693Z	\N	\N
7dfb239b-1151-4d6c-8bbb-52e3306ff422	93e6682e-6c2a-40aa-a18a-df386c244d3d	0	2024-05-14T20:22:23.534Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	7ff537b9-37a7-4f7f-a4d1-cbb083881e8a	10	2024-05-14T20:24:54.631Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	4ea770b3-a691-4abe-8d7f-354f3f592fa1	100	2024-05-14T20:25:31.676Z	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	7cdd14da-e6e7-43b9-a66d-560346221e38	100	2024-05-14T20:25:37.189Z	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	44db9d4b-9b17-42ad-96f5-c078cf1b008c	100	2024-05-14T20:26:35.566Z	\N	\N
8e93096a-3a67-49a6-a771-452399296124	e4e767ff-be22-4c15-99a3-fac2b97683df	100	2024-05-14T20:36:13.686Z	\N	\N
8e93096a-3a67-49a6-a771-452399296124	edcb4032-d028-48ee-9811-b6004b277877	100	2024-05-14T20:36:16.819Z	\N	\N
964b7015-8542-4787-81ba-4f70356d279d	b445feb3-6ae1-4998-ac1f-ad71adef656f	100	2024-05-14T20:58:32.557Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	d580d7f8-a8be-4212-9ed8-8e1d52f4c384	0	2024-05-14T20:35:31.133Z	2024-05-14T21:46:40.780Z	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	e30c8efd-29f1-4414-9f5e-080b7e1f6fa3	0	2024-05-14T20:41:31.197Z	2024-05-14T21:50:23.480Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	19237243-240d-4b13-b4b5-1cc2ae01571d	0	2024-05-14T19:49:23.439Z	2024-05-15T00:49:45.842Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	32c65e0d-592c-4003-b071-bb11449e6de8	0	2024-05-14T19:49:46.559Z	2024-05-15T00:52:37.052Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	7a841996-d096-4752-b071-263d1166fcbc	0	2024-05-14T19:48:33.729Z	2024-05-15T00:55:37.684Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	b00827d0-bac9-4338-8afd-7fae5a79612f	0	2024-05-14T19:51:29.483Z	2024-05-15T00:56:28.680Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	03c98160-18b1-46fa-8477-d85d784987b4	0	2024-05-14T19:48:59.573Z	2024-05-15T00:59:57.548Z	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	46b4ece1-549d-489c-bddd-74e8c61cca3f	100	2024-05-14T20:02:37.467Z	\N	\N
94eb5d46-85cf-4915-a8f9-e10bf77e401d	35a209cb-e678-4c4e-a274-217f7eab4221	0	2024-05-12T14:46:37.525Z	2024-05-14T20:05:33.058Z	\N
94eb5d46-85cf-4915-a8f9-e10bf77e401d	688d2abd-d8f4-4356-b9cc-db8148905b6f	0	2024-05-12T14:46:54.585Z	2024-05-14T20:05:42.168Z	\N
96ab15d6-ecf2-47fe-bbe6-7b6764ead09a	d01c1d11-e401-4151-b0ec-52c26ce54b32	100	2024-05-14T20:06:34.438Z	\N	\N
7dfb239b-1151-4d6c-8bbb-52e3306ff422	2cb3a6b6-9a04-40b4-a48c-20a2644fee72	0	2024-05-14T20:17:30.615Z	\N	\N
7dfb239b-1151-4d6c-8bbb-52e3306ff422	d5bee376-7afa-40f0-8b05-77f984e6c12a	0	2024-05-14T20:18:35.035Z	\N	\N
7dfb239b-1151-4d6c-8bbb-52e3306ff422	f7916ade-1729-4e90-a42e-cba73f262692	0	2024-05-14T20:19:44.518Z	\N	\N
7dfb239b-1151-4d6c-8bbb-52e3306ff422	8980a8e1-5aa6-4168-8cd6-e06f6ab9275a	0	2024-05-14T20:20:30.796Z	2024-05-14T20:21:16.141Z	\N
7dfb239b-1151-4d6c-8bbb-52e3306ff422	6f880b12-b5b7-4317-80a6-65940c3b8304	0	2024-05-14T20:22:39.206Z	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	e6bc7980-98a4-468f-99d9-17b00e991e5b	100	2024-05-14T20:24:12.908Z	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	d84d154b-d509-4f04-b042-c1e4f506aed2	100	2024-05-14T20:31:19.729Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	7fe4cd2a-9bec-419a-aaae-aa89761c5566	10	2024-05-14T20:37:40.959Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	43a27a70-3ed5-4a3d-8428-623810c3f717	1	2024-05-14T20:38:18.451Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	fe9b91bf-1e73-4dac-9ad7-d06fb9f22ca0	10	2024-05-14T20:39:05.314Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	873f0443-1ed1-4044-ae2e-da17f59ddfc0	10	2024-05-14T20:32:03.640Z	2024-05-14T21:49:49.374Z	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	2d16c993-d60f-49fb-ad83-b1f2cac4fe59	100	2024-05-14T20:14:30.196Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	e3f24520-666e-47d0-ad10-73a9110b3ad4	10	2024-05-14T20:32:33.001Z	\N	\N
8e93096a-3a67-49a6-a771-452399296124	d382afa7-cef6-4e16-89aa-22a5e20562e6	100	2024-05-14T20:35:21.248Z	\N	\N
96ab15d6-ecf2-47fe-bbe6-7b6764ead09a	d382afa7-cef6-4e16-89aa-22a5e20562e6	10	2024-05-14T20:48:50.644Z	\N	\N
8e93096a-3a67-49a6-a771-452399296124	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	0	2024-05-14T20:52:42.831Z	2024-05-14T20:54:14.776Z	\N
964b7015-8542-4787-81ba-4f70356d279d	9ec3507a-8600-43e2-9471-39f3fc1c01f9	100	2024-05-14T20:57:17.178Z	\N	\N
964b7015-8542-4787-81ba-4f70356d279d	caa77bd6-4cf9-44a5-aa24-2e68c899081a	100	2024-05-14T20:58:23.506Z	\N	\N
964b7015-8542-4787-81ba-4f70356d279d	0ac4446e-f606-452c-9a58-5f76ce84c008	100	2024-05-14T20:57:55.458Z	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	a25f338f-1fed-4412-844a-7e16962eb051	0	2024-05-12T20:37:55.246Z	2024-05-14T20:58:45.034Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	38f84d3e-7f75-46a7-ad35-080b277112ac	100	2024-05-14T21:18:05.632Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	f013501e-e9ea-478f-af0d-648f96244b14	10	2024-05-14T21:42:04.561Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	7baf0c84-7658-4f5d-829a-36f6194c154f	100	2024-05-14T21:42:06.163Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	52bd1913-9ae1-413d-8258-205049df62e6	10	2024-05-14T21:42:20.436Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	d54d1746-ddc6-4492-8ed4-969696bb38af	0	2024-05-14T21:42:18.759Z	2024-05-14T21:42:25.931Z	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	22d6eaff-3933-418f-9287-7e45c300bfad	10	2024-05-14T21:44:20.660Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	377fdec9-9b17-4086-8986-3e04508c4917	10	2024-05-14T21:47:45.773Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	69ed1694-a1a1-4163-80c4-bcedc9a7dbd7	0	2024-05-14T21:48:28.703Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	4682d405-9a3e-435d-bb33-e249f72935a5	10	2024-05-14T21:49:08.115Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	fe4921f1-0f3a-471a-a4ba-eb92dc6fcbbe	0	2024-05-12T14:35:26.045Z	2024-05-14T21:49:11.641Z	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	fe6cc6f1-779b-46d5-aa3f-7f57e08fecfa	10	2024-05-14T21:51:10.861Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	b84e2a5f-8dc0-4e03-8581-9aace16bc227	10	2024-05-14T21:52:26.256Z	\N	\N
2d2a7228-8ab1-464d-b30c-44d73ae857ca	37a627ee-d6f6-4f94-8edc-190c89a3f255	0	2024-05-14T14:07:45.545Z	2024-05-14T21:25:33.699Z	\N
2d2a7228-8ab1-464d-b30c-44d73ae857ca	053d6422-e791-474c-9820-90252e04da58	0	2024-05-14T21:25:41.394Z	2024-05-14T21:26:07.520Z	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	cd70dd89-2f3d-4a2f-afac-ad65d7129029	100	2024-05-14T21:37:18.141Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	2ac83258-0e18-4373-9edc-d78286bc955c	100	2024-05-14T21:40:48.952Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	be7369e0-e867-4443-948e-49b2a2b075b4	100	2024-05-14T21:40:54.586Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	5c6aa175-602e-44c1-90b1-5bf8b7915df7	100	2024-05-14T21:41:46.112Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	100	2024-05-12T14:36:51.196Z	2024-05-14T21:49:55.950Z	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	9b5e0298-63d9-49b6-ad1d-c912aac2d437	10	2024-05-14T21:42:48.517Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	004a49df-0306-4891-9cbf-2b40d050c318	10	2024-05-14T21:43:15.533Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	3814a22f-b8a5-426e-ac21-138c2d62a0ba	10	2024-05-14T21:43:41.546Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	fd54a76a-cdb9-4543-9df6-24baa384e38c	10	2024-05-14T21:44:37.661Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	f33825fd-e6b0-47bb-80c0-80aef8a42e19	10	2024-05-14T21:44:45.034Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	10	2024-05-14T21:45:01.930Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	c4e94a84-f6d2-48a3-a391-8c2491cc8b21	10	2024-05-14T21:45:14.114Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	9e66cff1-37e1-4631-8251-c7b03b287ada	10	2024-05-14T21:45:35.619Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-14T21:45:50.060Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	5c1839cf-e5e9-4963-9018-c4d6f9ac5aeb	10	2024-05-14T21:46:55.798Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	ae3c2c9b-44da-4c00-9755-74880c3f9da1	10	2024-05-14T21:48:14.340Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	51df415f-3624-4066-ab38-25d6101e7c5a	10	2024-05-14T21:48:39.736Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	2323bf86-445a-410d-89fc-01c6b2ea36ea	10	2024-05-14T21:50:48.157Z	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	d8c5a353-d026-4fd4-b1f3-2bcf2f75b921	10	2024-05-14T21:52:05.979Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	f8e2fa5f-850f-4833-946e-5034de5671df	0	2024-05-14T21:47:49.716Z	2024-05-14T21:59:04.839Z	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	51727155-6b86-4777-865e-f7b85eba83ea	100	2024-05-14T21:54:41.734Z	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T22:02:36.526Z	2024-05-14T22:03:05.407Z	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	95776a6b-3df2-413b-91ab-bb5595deed09	100	2024-05-14T22:07:07.549Z	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-14T22:07:22.099Z	\N	\N
f3985a52-5c14-4cbb-b0d3-1702e26c15c5	8c8e0634-dbfb-4055-9dfe-5a3b9615daa0	100	2024-05-14T22:12:27.054Z	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	d382afa7-cef6-4e16-89aa-22a5e20562e6	0	2024-05-14T22:13:07.823Z	\N	\N
c8f7d181-9703-411b-b1fd-25dfce977382	1d5eae87-630d-4d94-9f48-ec4032c000de	10	2024-05-14T22:18:29.938Z	\N	\N
c8f7d181-9703-411b-b1fd-25dfce977382	2cdfa6cc-5f3d-4858-a3ee-13f0a6c7eaf3	100	2024-05-14T22:18:46.278Z	\N	\N
c8f7d181-9703-411b-b1fd-25dfce977382	9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	10	2024-05-14T22:18:55.120Z	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	d01c1d11-e401-4151-b0ec-52c26ce54b32	0	2024-05-09T17:38:05.574Z	2024-05-14T22:00:29.394Z	\N
830e3066-a383-4ef9-9aaf-efc87ad30ed5	01b0f1a3-354a-4f7a-a724-c022801d0734	10	2024-05-14T22:21:13.645Z	\N	\N
4f9d5e9b-43eb-4ba7-919b-4be27e988a79	16c00c8f-5d4f-49bf-8142-4c0b53e7309d	1	2024-05-14T22:30:04.667Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	c7493f68-4e46-453d-9bf0-36fff3189bf7	100	2024-05-14T22:34:01.782Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	063d43f1-9f08-4943-8f82-b51aa4e49924	100	2024-05-14T22:35:42.351Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	0eb81d00-fdee-4740-9070-bf23874d35a9	100	2024-05-14T22:35:55.923Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	b813d3b5-bf55-443b-b1a4-be3d426af4e9	100	2024-05-14T22:36:02.943Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	f8ba58b3-6549-49b7-b400-81ce225d365d	100	2024-05-14T22:36:26.785Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	cbe1445b-256b-4d93-8829-6a1fda8f526c	100	2024-05-14T22:36:36.951Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	4ae4acec-ee0d-40f3-931c-37759e97ecff	100	2024-05-14T22:36:47.389Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	7d861778-7335-4765-90b7-e57ef5a9799f	100	2024-05-14T22:36:57.009Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	5880fcb0-dd0e-4681-b97d-a1f501152fc6	100	2024-05-14T22:37:42.246Z	\N	\N
c8f7d181-9703-411b-b1fd-25dfce977382	88d78894-1dd5-45cd-b525-634008cb5ecb	10	2024-05-14T22:17:58.647Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	01750893-db86-4171-8c01-a41b61309a5d	100	2024-05-14T22:23:02.555Z	\N	\N
05161518-39ea-4af1-8d77-2f1c61485b6f	bc43d2f6-7c4f-4d38-8269-b66b085fcb8a	100	2024-05-14T22:23:18.798Z	\N	\N
05161518-39ea-4af1-8d77-2f1c61485b6f	bcd499a9-ddd9-479e-a057-c9f058178eaf	100	2024-05-14T22:23:24.692Z	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	7961a39a-2493-4821-9dd1-c8c1f6592e5b	10	2024-05-14T22:23:38.572Z	\N	\N
05161518-39ea-4af1-8d77-2f1c61485b6f	970603df-a58e-4cbf-94f1-4aff2c5743a1	100	2024-05-14T22:23:39.950Z	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	5ee91e2e-a7c2-449a-bb80-ac78b28b3767	0	2024-05-14T22:23:27.370Z	2024-05-14T22:23:44.705Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	a01832c8-765b-4e22-b421-b15a6d533a01	100	2024-05-14T22:24:17.986Z	\N	\N
4f9d5e9b-43eb-4ba7-919b-4be27e988a79	e82f2b29-1394-4325-a728-f3dd20f1c6bf	1	2024-05-14T22:30:20.326Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	f33825fd-e6b0-47bb-80c0-80aef8a42e19	100	2024-05-14T22:34:22.553Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	d2123a82-91a0-4f30-896b-61ee15ade670	100	2024-05-14T22:34:33.936Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	4cffa928-96fd-4f5a-89bc-50ccde8d5d6f	100	2024-05-14T22:35:15.218Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	32a2463b-506d-4ab4-8789-2ebecb70ce4e	100	2024-05-14T22:35:28.256Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	e82f2b29-1394-4325-a728-f3dd20f1c6bf	100	2024-05-14T22:36:12.557Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	ea2c6721-693d-496e-8442-a2381d48430b	100	2024-05-14T22:37:08.465Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	fd54a76a-cdb9-4543-9df6-24baa384e38c	100	2024-05-14T22:37:20.487Z	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	88fa7edf-2f9d-43e9-b983-86aa6fc63374	100	2024-05-14T22:37:32.574Z	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	10	2024-05-08 16:11:15.988191+00	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	12441ef6-2583-4e7e-9aae-8f3bf89147e6	10	2024-05-08 16:11:15.988191+00	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	ff30edb6-ad8b-4b10-80ba-da7d2ef786f7	10	2024-05-08 16:11:15.988191+00	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	ddd006a5-eac6-44de-ad77-b9386f25ef9c	10	2024-05-08 16:11:15.988191+00	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	55bf190c-f2eb-4f80-89f0-76dec0843ad4	10	2024-05-08 16:11:15.988191+00	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	770fd1b3-e792-4127-88f9-7d7a47224363	10	2024-05-08 16:11:15.988191+00	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	39854bdb-bb2e-4dc4-a08e-d1fc9c280ebb	10	2024-05-08 16:11:15.988191+00	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	cd9c4c7a-b1d1-4b85-9a90-a1968b1dc420	10	2024-05-08 16:11:15.988191+00	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	10	2024-05-08 16:11:15.988191+00	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	62bd5d05-ba37-497a-a1a1-56795813790d	10	2024-05-08 16:11:15.988191+00	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-08 16:11:15.988191+00	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-08 16:11:15.988191+00	\N	\N
c275c8c9-514d-484d-aad2-e2e8b2f7c882	68c9670c-99fb-438a-8169-66cc1ce66313	0	2024-05-08 16:11:15.988191+00	2024-05-14T23:27:48.084Z	\N
c275c8c9-514d-484d-aad2-e2e8b2f7c882	3e85a0d3-2717-44bb-8b4b-8ce1a0d2374d	1	2024-05-08 16:11:15.988191+00	\N	\N
c275c8c9-514d-484d-aad2-e2e8b2f7c882	18b45eb3-755c-4d38-a974-2857f6b30638	1	2024-05-08 16:11:15.988191+00	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	1fde16af-ef8a-4686-b021-cafc1c5179cf	0	2024-05-09T15:57:18.450Z	2024-05-13T17:16:48.842Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	6d451ef8-e962-423c-8fc8-5fb0eb848766	0	2024-05-08 16:11:15.988191+00	2024-05-13T17:17:02.415Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-08 16:11:15.988191+00	\N	\N
d4b86f11-de90-46cd-b0d6-a8cf4c1e8bd7	770fd1b3-e792-4127-88f9-7d7a47224363	10	2024-05-08 16:11:15.988191+00	\N	\N
d4b86f11-de90-46cd-b0d6-a8cf4c1e8bd7	68c9670c-99fb-438a-8169-66cc1ce66313	10	2024-05-08 16:11:15.988191+00	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	35f6046a-c2a2-4e4b-a857-f8de763e229a	10	2024-05-08 16:11:15.988191+00	2024-05-11T20:44:22.331Z	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-08 16:11:15.988191+00	2024-05-11T22:11:01.469Z	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	55bf190c-f2eb-4f80-89f0-76dec0843ad4	10	2024-05-08 16:11:15.988191+00	2024-05-11T22:11:21.644Z	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	1	2024-05-08 16:11:15.988191+00	2024-05-13T00:43:00.922Z	\N
62a17be9-a744-42a6-a7dd-8ce2872c56c8	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-08 16:11:15.988191+00	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	1fde16af-ef8a-4686-b021-cafc1c5179cf	0	2024-05-08 16:11:15.988191+00	2024-05-13T03:00:08.857Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	5cac0471-262c-4408-8fd7-00e99f5a9869	0	2024-05-08 16:11:15.988191+00	2024-05-13T03:02:31.282Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	ff30edb6-ad8b-4b10-80ba-da7d2ef786f7	0	2024-05-08 16:11:15.988191+00	2024-05-14T13:32:57.237Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	3e2c22be-5ac0-4b10-ba0c-150ee9f33100	0	2024-05-08 16:11:15.988191+00	2024-05-14T13:33:31.505Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	ddd006a5-eac6-44de-ad77-b9386f25ef9c	100	2024-05-08 16:11:15.988191+00	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	b7349827-482c-4c5c-b0eb-7627a8380c16	100	2024-05-08 16:11:15.988191+00	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-08 16:11:15.988191+00	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	0	2024-05-08 16:11:15.988191+00	2024-05-13T02:55:46.872Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	ceebd729-eecc-420e-8e90-f764a487b202	0	2024-05-08 16:11:15.988191+00	2024-05-13T17:17:12.287Z	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	b02cec28-dac2-42ec-a552-0558f598fa51	1	2024-05-08 16:11:15.988191+00	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	1	2024-05-08 16:11:15.988191+00	2024-05-12T18:38:30.758Z	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	1	2024-05-08 16:11:15.988191+00	2024-05-12T18:39:20.557Z	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	1	2024-05-08 16:11:15.988191+00	2024-05-12T18:40:04.399Z	\N
b818a598-5d62-46cf-867c-ece997cb5856	6d451ef8-e962-423c-8fc8-5fb0eb848766	10	2024-05-10T23:44:13.535Z	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	dd6c8774-52ca-4c3f-9125-06ad4b0e2747	10	2024-05-08 16:11:15.988191+00	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	770fd1b3-e792-4127-88f9-7d7a47224363	10	2024-05-08 16:11:15.988191+00	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	39854bdb-bb2e-4dc4-a08e-d1fc9c280ebb	10	2024-05-08 16:11:15.988191+00	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-08 16:11:15.988191+00	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	62bd5d05-ba37-497a-a1a1-56795813790d	100	2024-05-10T23:40:27.888Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	cd9c4c7a-b1d1-4b85-9a90-a1968b1dc420	100	2024-05-10T23:40:49.949Z	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	cb69b4b0-b164-43ed-ad6e-c0c3ca3ad93e	10	2024-05-08 16:11:15.988191+00	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-08 16:11:15.988191+00	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-08 16:11:15.988191+00	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	578809ce-d533-43df-ad00-3e61af85d73c	10	2024-05-08 16:11:15.988191+00	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	55bf190c-f2eb-4f80-89f0-76dec0843ad4	10	2024-05-08 16:11:15.988191+00	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	b7349827-482c-4c5c-b0eb-7627a8380c16	100	2024-05-08 16:11:15.988191+00	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	cf61184d-0ffb-4443-9a63-231432a3bed1	10	2024-05-08 16:11:15.988191+00	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	cf61184d-0ffb-4443-9a63-231432a3bed1	10	2024-05-08 16:11:15.988191+00	\N	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	10	2024-05-08 16:11:15.988191+00	\N	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-08 16:11:15.988191+00	\N	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-08 16:11:15.988191+00	\N	\N
cde9c9b1-81e4-403a-b4d9-6a7e9073aff2	35f6046a-c2a2-4e4b-a857-f8de763e229a	100	2024-05-08 16:11:15.988191+00	\N	\N
cde9c9b1-81e4-403a-b4d9-6a7e9073aff2	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-08 16:11:15.988191+00	\N	\N
cde9c9b1-81e4-403a-b4d9-6a7e9073aff2	ff30edb6-ad8b-4b10-80ba-da7d2ef786f7	100	2024-05-08 16:11:15.988191+00	\N	\N
cde9c9b1-81e4-403a-b4d9-6a7e9073aff2	b7349827-482c-4c5c-b0eb-7627a8380c16	10	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	10	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	b02cec28-dac2-42ec-a552-0558f598fa51	100	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	100	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	55bf190c-f2eb-4f80-89f0-76dec0843ad4	100	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	cf61184d-0ffb-4443-9a63-231432a3bed1	10	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	b7349827-482c-4c5c-b0eb-7627a8380c16	100	2024-05-08 16:11:15.988191+00	\N	\N
98afa669-bade-40c8-b052-980e5025f58e	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	1	2024-05-08 16:11:15.988191+00	\N	\N
98afa669-bade-40c8-b052-980e5025f58e	474cc566-0a60-4f1a-8e48-40558fe39170	1	2024-05-08 16:11:15.988191+00	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-08 16:11:15.988191+00	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	b7349827-482c-4c5c-b0eb-7627a8380c16	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	6d451ef8-e962-423c-8fc8-5fb0eb848766	10	2024-05-09T11:51:33.777Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	14bb5f33-7c73-441d-a3b6-27fd7348dce3	10	2024-05-09T11:51:40.897Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	39854bdb-bb2e-4dc4-a08e-d1fc9c280ebb	10	2024-05-09T11:56:15.941Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-10T00:31:13.507Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	b02cec28-dac2-42ec-a552-0558f598fa51	100	2024-05-10T22:15:05.954Z	2024-05-11T21:04:56.584Z	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	8e596eea-5ab7-480b-a22f-2af852198a92	10	2024-05-08 16:11:15.988191+00	2024-05-12T02:19:43.731Z	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	3a2d5542-e160-4192-974e-c0b0938b6b98	10	2024-05-09T00:56:01.536Z	2024-05-12T05:42:35.059Z	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	c38cb955-8acf-462f-baec-1fa555f92df9	10	2024-05-10T02:55:28.915Z	2024-05-12T05:42:44.374Z	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	1fde16af-ef8a-4686-b021-cafc1c5179cf	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	dd6c8774-52ca-4c3f-9125-06ad4b0e2747	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	85132717-39a0-41bb-8409-6ecf6ec77019	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	76c0cb36-9ee0-422f-8050-b422ff53b9d3	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	578809ce-d533-43df-ad00-3e61af85d73c	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	68c9670c-99fb-438a-8169-66cc1ce66313	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	770fd1b3-e792-4127-88f9-7d7a47224363	100	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	ddd006a5-eac6-44de-ad77-b9386f25ef9c	100	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	ff30edb6-ad8b-4b10-80ba-da7d2ef786f7	100	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	cb69b4b0-b164-43ed-ad6e-c0c3ca3ad93e	100	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	b7349827-482c-4c5c-b0eb-7627a8380c16	100	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	3e2c22be-5ac0-4b10-ba0c-150ee9f33100	100	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	2a340b8d-52f2-4c15-9424-fc97bb70dc30	10	2024-05-08 16:11:15.988191+00	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	68c9670c-99fb-438a-8169-66cc1ce66313	10	2024-05-08T19:52:03.570Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	7edd1812-c62d-4742-919a-c9240b41a160	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	cf61184d-0ffb-4443-9a63-231432a3bed1	100	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	68c9670c-99fb-438a-8169-66cc1ce66313	10	2024-05-10T22:14:43.628Z	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	b7349827-482c-4c5c-b0eb-7627a8380c16	100	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	ddd006a5-eac6-44de-ad77-b9386f25ef9c	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	8e596eea-5ab7-480b-a22f-2af852198a92	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	e15b969f-d5fe-48cf-80ea-443be9dc5785	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	1fde16af-ef8a-4686-b021-cafc1c5179cf	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	5cac0471-262c-4408-8fd7-00e99f5a9869	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	85132717-39a0-41bb-8409-6ecf6ec77019	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	cf61184d-0ffb-4443-9a63-231432a3bed1	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	39854bdb-bb2e-4dc4-a08e-d1fc9c280ebb	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	578809ce-d533-43df-ad00-3e61af85d73c	100	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	76c0cb36-9ee0-422f-8050-b422ff53b9d3	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	2ca22b44-7d15-4524-9999-290a2925af6f	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	6a220720-6fa3-42cc-8101-621da51b521f	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	43a27a70-3ed5-4a3d-8428-623810c3f717	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	14bb5f33-7c73-441d-a3b6-27fd7348dce3	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	12441ef6-2583-4e7e-9aae-8f3bf89147e6	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	3e2c22be-5ac0-4b10-ba0c-150ee9f33100	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	8f2d2855-7c53-418f-929b-222e431be3b7	100	2024-05-08 16:11:15.988191+00	2024-05-11T17:31:46.624Z	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	10	2024-05-10T22:13:40.967Z	2024-05-11T20:57:18.297Z	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-08 16:11:15.988191+00	2024-05-12T05:25:31.155Z	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	ff30edb6-ad8b-4b10-80ba-da7d2ef786f7	10	2024-05-08 16:11:15.988191+00	2024-05-12T05:29:04.549Z	\N
4cbfb685-56b5-4e1f-89f9-52c180540e73	68c9670c-99fb-438a-8169-66cc1ce66313	10	2024-05-08 16:11:15.988191+00	\N	\N
4cbfb685-56b5-4e1f-89f9-52c180540e73	474cc566-0a60-4f1a-8e48-40558fe39170	100	2024-05-08 16:11:15.988191+00	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	6d451ef8-e962-423c-8fc8-5fb0eb848766	100	2024-05-10T14:41:15.389Z	2024-05-13T12:45:50.725Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	0	2024-05-08 16:11:15.988191+00	2024-05-13T16:41:39.045Z	\N
eb98c8bb-aa91-4de1-af23-49d4e3a876ac	68c9670c-99fb-438a-8169-66cc1ce66313	0	2024-05-08 16:11:15.988191+00	2024-05-13T21:32:09.728Z	\N
40ab1a6f-277c-4ccc-8f59-db8c87a098e3	474cc566-0a60-4f1a-8e48-40558fe39170	10	2024-05-08 16:11:15.988191+00	\N	\N
40ab1a6f-277c-4ccc-8f59-db8c87a098e3	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	10	2024-05-08 16:11:15.988191+00	\N	\N
40ab1a6f-277c-4ccc-8f59-db8c87a098e3	8e596eea-5ab7-480b-a22f-2af852198a92	10	2024-05-08 16:11:15.988191+00	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-10T01:38:59.936Z	\N	\N
4cbfb685-56b5-4e1f-89f9-52c180540e73	580c2fac-3c42-48d2-b79b-2fbc7b6fc7b0	10	2024-05-08 16:11:15.988191+00	\N	\N
eb98c8bb-aa91-4de1-af23-49d4e3a876ac	18b45eb3-755c-4d38-a974-2857f6b30638	0	2024-05-08 16:11:15.988191+00	2024-05-14T18:38:39.849Z	\N
c275c8c9-514d-484d-aad2-e2e8b2f7c882	62bd5d05-ba37-497a-a1a1-56795813790d	0	2024-05-08 16:11:15.988191+00	2024-05-14T23:27:00.786Z	\N
c275c8c9-514d-484d-aad2-e2e8b2f7c882	cf61184d-0ffb-4443-9a63-231432a3bed1	0	2024-05-08 16:11:15.988191+00	2024-05-14T23:27:15.179Z	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-08 16:11:15.988191+00	\N	\N
62a17be9-a744-42a6-a7dd-8ce2872c56c8	dd6c8774-52ca-4c3f-9125-06ad4b0e2747	10	2024-05-08 16:11:15.988191+00	2024-05-12T16:24:43.533Z	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	770fd1b3-e792-4127-88f9-7d7a47224363	10	2024-05-09T22:42:10.314Z	2024-05-12T05:25:50.092Z	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	8f2d2855-7c53-418f-929b-222e431be3b7	100	2024-05-08 16:11:15.988191+00	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	43a27a70-3ed5-4a3d-8428-623810c3f717	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	8f2d2855-7c53-418f-929b-222e431be3b7	100	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	35f6046a-c2a2-4e4b-a857-f8de763e229a	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	474cc566-0a60-4f1a-8e48-40558fe39170	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	6d451ef8-e962-423c-8fc8-5fb0eb848766	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	8fe8f879-5cc8-4670-a13d-9d2d6bb24017	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	dd6c8774-52ca-4c3f-9125-06ad4b0e2747	10	2024-05-08 16:11:15.988191+00	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	10	2024-05-08 16:11:15.988191+00	\N	\N
cde9c9b1-81e4-403a-b4d9-6a7e9073aff2	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-08 16:11:15.988191+00	\N	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	68c9670c-99fb-438a-8169-66cc1ce66313	10	2024-05-08 16:11:15.988191+00	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	770fd1b3-e792-4127-88f9-7d7a47224363	10	2024-05-08 16:11:15.988191+00	2024-05-13T20:38:36.955Z	\N
68e21fa2-d500-4d68-9d13-fc869d1753e1	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	1	2024-05-08 16:11:15.988191+00	\N	\N
7d5e29af-7d5f-41a9-afaf-8e2135dd69c4	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	100	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	10	2024-05-09T11:48:56.290Z	\N	\N
7d5e29af-7d5f-41a9-afaf-8e2135dd69c4	cb69b4b0-b164-43ed-ad6e-c0c3ca3ad93e	10	2024-05-08 16:11:15.988191+00	\N	\N
7d5e29af-7d5f-41a9-afaf-8e2135dd69c4	ff30edb6-ad8b-4b10-80ba-da7d2ef786f7	10	2024-05-08 16:11:15.988191+00	\N	\N
7d5e29af-7d5f-41a9-afaf-8e2135dd69c4	ddd006a5-eac6-44de-ad77-b9386f25ef9c	10	2024-05-08 16:11:15.988191+00	\N	\N
7d5e29af-7d5f-41a9-afaf-8e2135dd69c4	35f6046a-c2a2-4e4b-a857-f8de763e229a	10	2024-05-08 16:11:15.988191+00	\N	\N
7d5e29af-7d5f-41a9-afaf-8e2135dd69c4	cf61184d-0ffb-4443-9a63-231432a3bed1	10	2024-05-08 16:11:15.988191+00	\N	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	cf61184d-0ffb-4443-9a63-231432a3bed1	0	2024-05-08 16:11:15.988191+00	2024-05-13T15:11:50.689Z	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	0	2024-05-08 16:11:15.988191+00	2024-05-13T15:16:39.043Z	\N
7648c991-9c53-4950-ac44-824ae0d8e1c7	474cc566-0a60-4f1a-8e48-40558fe39170	10	2024-05-08 16:11:15.988191+00	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	8f2d2855-7c53-418f-929b-222e431be3b7	0	2024-05-08T18:36:23.037Z	2024-05-13T03:13:28.258Z	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-08 16:11:15.988191+00	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-08 16:11:15.988191+00	\N	\N
eb98c8bb-aa91-4de1-af23-49d4e3a876ac	3e85a0d3-2717-44bb-8b4b-8ce1a0d2374d	0	2024-05-08 16:11:15.988191+00	2024-05-13T21:32:05.089Z	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-08 16:11:15.988191+00	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	761e4265-2f75-46a2-8cf3-16b8a5a69963	10	2024-05-08 16:11:15.988191+00	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	cb69b4b0-b164-43ed-ad6e-c0c3ca3ad93e	10	2024-05-08 16:11:15.988191+00	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	c905ca5a-0564-4d2a-b9b9-585cbce1cc62	10	2024-05-08 16:11:15.988191+00	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	d8b0c9ec-39a1-44e4-9ccf-36b439e39368	10	2024-05-08 16:11:15.988191+00	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	6b1d5955-578e-4b7c-a66a-118060c94901	10	2024-05-08 16:11:15.988191+00	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	d25db3bc-0812-4d28-a03f-ff51419cf15d	10	2024-05-08 16:11:15.988191+00	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	b8f75b02-c99d-4a54-91a2-01e66617b676	10	2024-05-08 16:11:15.988191+00	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	13a4afa8-2b27-43c2-8ac1-0a2b29ce7832	10	2024-05-08 16:11:15.988191+00	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	6763caea-7b53-466a-a9b3-40ebfac0f9bb	10	2024-05-08 16:11:15.988191+00	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	924e9906-692e-460a-bfe4-de2a6c33a5f1	10	2024-05-08 16:11:15.988191+00	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	d01c1d11-e401-4151-b0ec-52c26ce54b32	100	2024-05-08 16:11:15.988191+00	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	770fd1b3-e792-4127-88f9-7d7a47224363	10	2024-05-08 16:11:15.988191+00	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	39854bdb-bb2e-4dc4-a08e-d1fc9c280ebb	10	2024-05-08 16:11:15.988191+00	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-08 16:11:15.988191+00	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	b7349827-482c-4c5c-b0eb-7627a8380c16	10	2024-05-08 16:11:15.988191+00	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	cb69b4b0-b164-43ed-ad6e-c0c3ca3ad93e	10	2024-05-08 16:11:15.988191+00	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	12441ef6-2583-4e7e-9aae-8f3bf89147e6	100	2024-05-08 16:11:15.988191+00	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	b7349827-482c-4c5c-b0eb-7627a8380c16	0	2024-05-08 16:11:15.988191+00	2024-05-13T16:49:00.048Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	770fd1b3-e792-4127-88f9-7d7a47224363	0	2024-05-08 16:11:15.988191+00	2024-05-13T16:56:05.329Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	85132717-39a0-41bb-8409-6ecf6ec77019	0	2024-05-08 16:11:15.988191+00	2024-05-13T16:58:50.782Z	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	7137cf53-9bea-4a5f-a70b-c2ae81202d90	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	bf7f0124-f552-4ab4-8db2-0db1fb4728d8	10	2024-05-08 16:11:15.988191+00	\N	\N
905820e1-6281-4e21-8ec5-9f501a9bae42	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	10	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	e30c8efd-29f1-4414-9f5e-080b7e1f6fa3	100	2024-05-10T22:14:27.960Z	2024-05-11T17:31:56.966Z	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	c8d5bcc7-cbe3-4767-8724-2d9065d1824d	10	2024-05-08 16:11:15.988191+00	\N	\N
905820e1-6281-4e21-8ec5-9f501a9bae42	b02cec28-dac2-42ec-a552-0558f598fa51	10	2024-05-08 16:11:15.988191+00	\N	\N
905820e1-6281-4e21-8ec5-9f501a9bae42	5cac0471-262c-4408-8fd7-00e99f5a9869	10	2024-05-08 16:11:15.988191+00	\N	\N
905820e1-6281-4e21-8ec5-9f501a9bae42	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-08 16:11:15.988191+00	\N	\N
905820e1-6281-4e21-8ec5-9f501a9bae42	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	10	2024-05-08 16:11:15.988191+00	\N	\N
905820e1-6281-4e21-8ec5-9f501a9bae42	39854bdb-bb2e-4dc4-a08e-d1fc9c280ebb	10	2024-05-08 16:11:15.988191+00	\N	\N
905820e1-6281-4e21-8ec5-9f501a9bae42	ddd006a5-eac6-44de-ad77-b9386f25ef9c	10	2024-05-08 16:11:15.988191+00	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	9e66cff1-37e1-4631-8251-c7b03b287ada	0	2024-05-08 16:11:15.988191+00	2024-05-13T16:22:40.293Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	cf61184d-0ffb-4443-9a63-231432a3bed1	0	2024-05-08 16:11:15.988191+00	2024-05-13T16:59:42.095Z	\N
5577f295-484a-41bf-8b11-5848f060ee9e	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	1	2024-05-08 16:11:15.988191+00	2024-05-12T02:02:54.900Z	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	43a27a70-3ed5-4a3d-8428-623810c3f717	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	90c6ddc2-a574-47eb-a2d3-3c79b801e4fb	10	2024-05-08 16:11:15.988191+00	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	5cac0471-262c-4408-8fd7-00e99f5a9869	10	2024-05-08 16:11:15.988191+00	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	770fd1b3-e792-4127-88f9-7d7a47224363	100	2024-05-08 16:11:15.988191+00	2024-05-14T03:37:10.375Z	\N
cde9c9b1-81e4-403a-b4d9-6a7e9073aff2	580c2fac-3c42-48d2-b79b-2fbc7b6fc7b0	10	2024-05-08 16:11:15.988191+00	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	1	2024-05-08 16:11:15.988191+00	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	474cc566-0a60-4f1a-8e48-40558fe39170	10	2024-05-08 16:11:15.988191+00	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	e15b969f-d5fe-48cf-80ea-443be9dc5785	10	2024-05-08 16:11:15.988191+00	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-08 16:11:15.988191+00	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	924e9906-692e-460a-bfe4-de2a6c33a5f1	10	2024-05-08 16:11:15.988191+00	\N	\N
4cbfb685-56b5-4e1f-89f9-52c180540e73	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-08 16:11:15.988191+00	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	cb69b4b0-b164-43ed-ad6e-c0c3ca3ad93e	10	2024-05-08 16:11:15.988191+00	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	3e2c22be-5ac0-4b10-ba0c-150ee9f33100	100	2024-05-08 16:11:15.988191+00	\N	\N
cde9c9b1-81e4-403a-b4d9-6a7e9073aff2	4bccd468-7b89-49f0-93d5-c761ff91c6fb	10	2024-05-08 16:11:15.988191+00	\N	\N
cde9c9b1-81e4-403a-b4d9-6a7e9073aff2	0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	10	2024-05-08 16:11:15.988191+00	\N	\N
cde9c9b1-81e4-403a-b4d9-6a7e9073aff2	d8b0c9ec-39a1-44e4-9ccf-36b439e39368	10	2024-05-08 16:11:15.988191+00	\N	\N
cde9c9b1-81e4-403a-b4d9-6a7e9073aff2	6b3962b3-33dd-422e-bdda-35dbe0afa554	10	2024-05-08 16:11:15.988191+00	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	cd9c4c7a-b1d1-4b85-9a90-a1968b1dc420	10	2024-05-08 16:11:15.988191+00	\N	\N
9ee3b69e-4c7f-478c-8059-3916ec8a7c2a	14bb5f33-7c73-441d-a3b6-27fd7348dce3	0	2024-05-08 16:11:15.988191+00	2024-05-14T15:14:59.521Z	\N
f3985a52-5c14-4cbb-b0d3-1702e26c15c5	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-08 16:11:15.988191+00	\N	\N
f3985a52-5c14-4cbb-b0d3-1702e26c15c5	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-08 16:11:15.988191+00	\N	\N
f3985a52-5c14-4cbb-b0d3-1702e26c15c5	43a27a70-3ed5-4a3d-8428-623810c3f717	10	2024-05-08 16:11:15.988191+00	\N	\N
f3985a52-5c14-4cbb-b0d3-1702e26c15c5	39854bdb-bb2e-4dc4-a08e-d1fc9c280ebb	10	2024-05-08 16:11:15.988191+00	\N	\N
b81b4e5c-798f-413d-a7cd-7ce1cfd397ee	d01c1d11-e401-4151-b0ec-52c26ce54b32	1	2024-05-08T22:24:54.935Z	2024-05-12T15:17:26.375Z	\N
f2884cd5-1f02-43b0-a7ed-77254b8a8c5f	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	10	2024-05-08 16:11:15.988191+00	\N	\N
f2884cd5-1f02-43b0-a7ed-77254b8a8c5f	cd9c4c7a-b1d1-4b85-9a90-a1968b1dc420	10	2024-05-08 16:11:15.988191+00	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	24857c6e-7fe5-45e8-9cc5-c5858390c06d	100	2024-05-10T14:40:46.192Z	2024-05-13T15:41:26.218Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	0	2024-05-10T11:06:38.538Z	2024-05-14T10:26:11.657Z	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-09T11:49:32.830Z	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	8fe8f879-5cc8-4670-a13d-9d2d6bb24017	0	2024-05-08 16:11:15.988191+00	2024-05-14T15:29:38.155Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	d01c1d11-e401-4151-b0ec-52c26ce54b32	1	2024-05-10T11:01:53.171Z	2024-05-12T21:58:19.048Z	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	a1f41da4-7c34-46c6-a6bf-446db9063b96	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	328d3f80-abfe-4c86-ba31-9399e4d9f2a6	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	d66cd87f-0651-472d-a3e3-74e7fe481760	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	f88381ee-7e98-4806-9fb4-acd4f1c328ec	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	90d760be-3781-4bf7-ae91-5f74027bb1d8	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	8a8e86cf-24e0-4a87-b660-1a8d884bbacc	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	ae3c2c9b-44da-4c00-9755-74880c3f9da1	10	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	844fa0a8-93a3-481e-8221-d6d385274281	10	2024-05-08 16:11:15.988191+00	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	1	2024-05-08 16:11:15.988191+00	2024-05-12T22:20:42.058Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	0	2024-05-08 16:11:15.988191+00	2024-05-13T17:16:58.422Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	6347a939-ad2c-458e-a097-17fdb7ef34b1	100	2024-05-08 16:11:15.988191+00	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	790861c7-f54f-4579-8859-bfe139177c0b	10	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	100	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	6d451ef8-e962-423c-8fc8-5fb0eb848766	100	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	1fde16af-ef8a-4686-b021-cafc1c5179cf	100	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	5d7dee46-9a08-4faf-adf8-5b341231f09a	100	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	a9b67a55-6742-4c3f-98ad-af8a69c05686	100	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	10	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	cd9c4c7a-b1d1-4b85-9a90-a1968b1dc420	10	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	100	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	55bf190c-f2eb-4f80-89f0-76dec0843ad4	100	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	39854bdb-bb2e-4dc4-a08e-d1fc9c280ebb	100	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	ff30edb6-ad8b-4b10-80ba-da7d2ef786f7	100	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	ddd006a5-eac6-44de-ad77-b9386f25ef9c	100	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	35f6046a-c2a2-4e4b-a857-f8de763e229a	100	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	cb69b4b0-b164-43ed-ad6e-c0c3ca3ad93e	10	2024-05-08 16:11:15.988191+00	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	10	2024-05-08 16:11:15.988191+00	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	5cac0471-262c-4408-8fd7-00e99f5a9869	100	2024-05-08 16:11:15.988191+00	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-08 16:11:15.988191+00	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	b7349827-482c-4c5c-b0eb-7627a8380c16	10	2024-05-08 16:11:15.988191+00	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	e15b969f-d5fe-48cf-80ea-443be9dc5785	100	2024-05-08 16:11:15.988191+00	\N	\N
8f657747-1733-4665-ac7f-35074675eff2	35f6046a-c2a2-4e4b-a857-f8de763e229a	10	2024-05-08 16:11:15.988191+00	\N	\N
8f657747-1733-4665-ac7f-35074675eff2	ff30edb6-ad8b-4b10-80ba-da7d2ef786f7	10	2024-05-08 16:11:15.988191+00	\N	\N
8f657747-1733-4665-ac7f-35074675eff2	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-08 16:11:15.988191+00	\N	\N
6ff8fc55-1591-497d-a8d5-3318144a5e00	b7349827-482c-4c5c-b0eb-7627a8380c16	10	2024-05-08 16:11:15.988191+00	\N	\N
6ff8fc55-1591-497d-a8d5-3318144a5e00	770fd1b3-e792-4127-88f9-7d7a47224363	10	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	b02cec28-dac2-42ec-a552-0558f598fa51	10	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	1fde16af-ef8a-4686-b021-cafc1c5179cf	10	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	100	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	cd9c4c7a-b1d1-4b85-9a90-a1968b1dc420	10	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	6d451ef8-e962-423c-8fc8-5fb0eb848766	100	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	770fd1b3-e792-4127-88f9-7d7a47224363	10	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	ddd006a5-eac6-44de-ad77-b9386f25ef9c	100	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	cb69b4b0-b164-43ed-ad6e-c0c3ca3ad93e	10	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	43a27a70-3ed5-4a3d-8428-623810c3f717	10	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	6a220720-6fa3-42cc-8101-621da51b521f	10	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	b7349827-482c-4c5c-b0eb-7627a8380c16	10	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	e15b969f-d5fe-48cf-80ea-443be9dc5785	100	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	cf61184d-0ffb-4443-9a63-231432a3bed1	100	2024-05-08 16:11:15.988191+00	\N	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	62bd5d05-ba37-497a-a1a1-56795813790d	10	2024-05-08 16:11:15.988191+00	\N	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	cd9c4c7a-b1d1-4b85-9a90-a1968b1dc420	10	2024-05-08 16:11:15.988191+00	\N	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-08 16:11:15.988191+00	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	b02cec28-dac2-42ec-a552-0558f598fa51	10	2024-05-08 16:11:15.988191+00	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-08 16:11:15.988191+00	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	14bb5f33-7c73-441d-a3b6-27fd7348dce3	10	2024-05-08 16:11:15.988191+00	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	b7349827-482c-4c5c-b0eb-7627a8380c16	10	2024-05-08 16:11:15.988191+00	\N	\N
63c17b84-e84b-4049-b6f5-1ae31bdc2f5f	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-08 16:11:15.988191+00	\N	\N
29883304-d3af-436e-93bd-7b7327817006	5cac0471-262c-4408-8fd7-00e99f5a9869	100	2024-05-08 16:11:15.988191+00	\N	\N
29883304-d3af-436e-93bd-7b7327817006	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-08 16:11:15.988191+00	\N	\N
29883304-d3af-436e-93bd-7b7327817006	ff30edb6-ad8b-4b10-80ba-da7d2ef786f7	100	2024-05-08 16:11:15.988191+00	\N	\N
29883304-d3af-436e-93bd-7b7327817006	6d451ef8-e962-423c-8fc8-5fb0eb848766	10	2024-05-08 16:11:15.988191+00	\N	\N
29883304-d3af-436e-93bd-7b7327817006	770fd1b3-e792-4127-88f9-7d7a47224363	100	2024-05-08 16:11:15.988191+00	\N	\N
29883304-d3af-436e-93bd-7b7327817006	35f6046a-c2a2-4e4b-a857-f8de763e229a	10	2024-05-08 16:11:15.988191+00	\N	\N
29883304-d3af-436e-93bd-7b7327817006	cf61184d-0ffb-4443-9a63-231432a3bed1	10	2024-05-08 16:11:15.988191+00	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	d01c1d11-e401-4151-b0ec-52c26ce54b32	0	2024-05-08 16:11:15.988191+00	2024-05-13T03:14:27.376Z	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	43a27a70-3ed5-4a3d-8428-623810c3f717	100	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	cb69b4b0-b164-43ed-ad6e-c0c3ca3ad93e	10	2024-05-09T22:42:41.375Z	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	39854bdb-bb2e-4dc4-a08e-d1fc9c280ebb	10	2024-05-08 16:11:15.988191+00	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	62bd5d05-ba37-497a-a1a1-56795813790d	10	2024-05-08 16:11:15.988191+00	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-08 16:11:15.988191+00	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	c8642f4a-7ee0-49a7-aec8-e18eab2e2c69	0	2024-05-09T05:10:45.760Z	2024-05-13T16:41:15.000Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	0fe9ff90-4190-4341-b775-986d9dd18bd5	0	2024-05-08 16:11:15.988191+00	2024-05-13T16:48:28.581Z	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-10T22:14:07.072Z	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	580c2fac-3c42-48d2-b79b-2fbc7b6fc7b0	0	2024-05-08 16:11:15.988191+00	2024-05-13T16:50:48.082Z	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	d01c1d11-e401-4151-b0ec-52c26ce54b32	100	2024-05-08 16:11:15.988191+00	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	14bb5f33-7c73-441d-a3b6-27fd7348dce3	100	2024-05-08 16:11:15.988191+00	\N	\N
68e21fa2-d500-4d68-9d13-fc869d1753e1	3810ff6f-2c32-4a64-a1c6-37be86fdaec6	100	2024-05-08 16:11:15.988191+00	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	e4cfa4d9-183d-42a4-8c39-994c734d8b49	0	2024-05-08 16:11:15.988191+00	2024-05-13T16:22:21.312Z	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	689c1d43-a7ee-4b95-97df-1558fbfcb863	100	2024-05-10T01:24:17.514Z	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	f78c85b4-fcac-4854-970b-d80f201d5aa3	10	2024-05-08 16:11:15.988191+00	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	0fe671e5-1f19-4370-ae9d-8e49afa92aba	100	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	b3d663ed-c0db-441a-83e8-0e4b0db58825	10	2024-05-08 16:11:15.988191+00	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-08T19:39:38.684Z	\N	\N
e83fde72-4f7d-417d-9a77-1f769e7e95b5	5d7dee46-9a08-4faf-adf8-5b341231f09a	100	2024-05-08 16:11:15.988191+00	\N	\N
e83fde72-4f7d-417d-9a77-1f769e7e95b5	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	100	2024-05-08 16:11:15.988191+00	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	f51bc934-80c1-4fb6-858f-38f701e88dd9	10	2024-05-08 16:11:15.988191+00	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	100	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-08 16:11:15.988191+00	2024-05-11T15:42:37.292Z	\N
9791431f-042e-43e4-8c8d-05c50bd2db01	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-11T01:05:54.929Z	2024-05-12T01:16:10.080Z	\N
be96408c-d616-47b2-8208-f89eabeeffec	35da1e4a-c8d2-4d9f-bd0b-ceec81216994	10	2024-05-08 16:11:15.988191+00	\N	\N
e83fde72-4f7d-417d-9a77-1f769e7e95b5	a9b67a55-6742-4c3f-98ad-af8a69c05686	100	2024-05-08 16:11:15.988191+00	\N	\N
e83fde72-4f7d-417d-9a77-1f769e7e95b5	52634f35-73b2-4c60-99c9-1ec886f6e4b3	100	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	100	2024-05-08 16:11:15.988191+00	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	4bd475d3-779b-45bb-b9f9-7a6052bc41fb	10	2024-05-08 16:11:15.988191+00	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	e4e767ff-be22-4c15-99a3-fac2b97683df	10	2024-05-08 16:11:15.988191+00	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	9e66cff1-37e1-4631-8251-c7b03b287ada	100	2024-05-08 16:11:15.988191+00	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	65437ee2-7b21-4796-a360-9ad17c50aef5	10	2024-05-08 16:11:15.988191+00	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	8ef123b0-d60f-49b5-b4ef-1e015247b760	10	2024-05-08 16:11:15.988191+00	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	1114f512-17b1-4c26-927e-5d9888029183	10	2024-05-08 16:11:15.988191+00	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-08 16:11:15.988191+00	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	cf61184d-0ffb-4443-9a63-231432a3bed1	100	2024-05-08 16:11:15.988191+00	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	4124cef6-ffc1-40b7-8cb0-8b4a89dab6f2	10	2024-05-08 16:11:15.988191+00	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	cab34f52-bc3e-46d8-96f0-f5b20c7ca485	10	2024-05-08 16:11:15.988191+00	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	27c3707c-4a0b-4b43-8f8c-1b4bba103aa9	10	2024-05-08 16:11:15.988191+00	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	b1d8f194-15ac-4490-b062-d45434d41966	10	2024-05-08 16:11:15.988191+00	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	d2123a82-91a0-4f30-896b-61ee15ade670	10	2024-05-08 16:11:15.988191+00	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	43a27a70-3ed5-4a3d-8428-623810c3f717	10	2024-05-08 16:11:15.988191+00	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	74dc7f47-7298-418b-9b5b-04c47914721b	10	2024-05-08 16:11:15.988191+00	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	7baf0c84-7658-4f5d-829a-36f6194c154f	10	2024-05-08 16:11:15.988191+00	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	4c4b59cc-d639-4952-87e3-107c61c2a673	10	2024-05-08 16:11:15.988191+00	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	1b45a959-c141-4d5b-a112-49cc10985fa1	10	2024-05-08 16:11:15.988191+00	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-08 16:11:15.988191+00	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	35f6046a-c2a2-4e4b-a857-f8de763e229a	100	2024-05-08 16:11:15.988191+00	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	cb69b4b0-b164-43ed-ad6e-c0c3ca3ad93e	100	2024-05-08 16:11:15.988191+00	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	b813d3b5-bf55-443b-b1a4-be3d426af4e9	100	2024-05-08 16:11:15.988191+00	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	0	2024-05-08 16:11:15.988191+00	2024-05-13T16:28:51.256Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	01794c4c-0038-4330-a478-0d10c85fb2d0	0	2024-05-08 16:11:15.988191+00	2024-05-13T16:40:30.656Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	caa77bd6-4cf9-44a5-aa24-2e68c899081a	0	2024-05-08 16:11:15.988191+00	2024-05-13T16:42:07.526Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	b02cec28-dac2-42ec-a552-0558f598fa51	0	2024-05-08 16:11:15.988191+00	2024-05-13T17:17:29.566Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	6d965a4b-3b38-4418-a95e-b0aec0e0eb7a	0	2024-05-08 16:11:15.988191+00	2024-05-14T02:28:33.812Z	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	ff30edb6-ad8b-4b10-80ba-da7d2ef786f7	10	2024-05-08 16:11:15.988191+00	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	43a27a70-3ed5-4a3d-8428-623810c3f717	10	2024-05-08 16:11:15.988191+00	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	07249168-622c-442a-a00a-5264f3a26f74	100	2024-05-08 16:11:15.988191+00	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	b02cec28-dac2-42ec-a552-0558f598fa51	10	2024-05-08 16:11:15.988191+00	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	10	2024-05-08 16:11:15.988191+00	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-08 16:11:15.988191+00	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	60852499-daab-47a4-a8b1-330951fe3eb2	10	2024-05-08 16:11:15.988191+00	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	100	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	5cac0471-262c-4408-8fd7-00e99f5a9869	10	2024-05-08 16:11:15.988191+00	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	5992e29f-0982-4f26-b0fd-7b44fc6c08fd	0	2024-05-08 16:11:15.988191+00	2024-05-13T16:46:19.704Z	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	6a220720-6fa3-42cc-8101-621da51b521f	0	2024-05-08 16:11:15.988191+00	2024-05-13T16:48:01.075Z	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	f51bc934-80c1-4fb6-858f-38f701e88dd9	0	2024-05-08 16:11:15.988191+00	2024-05-13T17:19:18.318Z	\N
7f21ccc7-d1de-4a23-b710-260761213000	770fd1b3-e792-4127-88f9-7d7a47224363	0	2024-05-08 16:11:15.988191+00	2024-05-14T10:36:33.307Z	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	d7169b4a-e0ef-469b-8427-f2191ebe432b	10	2024-05-09T22:49:20.016Z	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	e15b969f-d5fe-48cf-80ea-443be9dc5785	10	2024-05-08 16:11:15.988191+00	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	74dc7f47-7298-418b-9b5b-04c47914721b	100	2024-05-08 16:11:15.988191+00	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	a1c072fc-9a1d-4f28-a543-b6f21a7863c0	100	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	47f6a9ff-9285-4814-8697-29045eb4ac49	100	2024-05-08 16:11:15.988191+00	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	1fde16af-ef8a-4686-b021-cafc1c5179cf	100	2024-05-08 16:11:15.988191+00	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	6d451ef8-e962-423c-8fc8-5fb0eb848766	100	2024-05-08 16:11:15.988191+00	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	bbdd5c64-f80e-4233-9928-7931fe5e3703	10	2024-05-10T13:48:56.129Z	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	6d965a4b-3b38-4418-a95e-b0aec0e0eb7a	10	2024-05-08 16:11:15.988191+00	2024-05-11T20:40:43.996Z	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-08 16:11:15.988191+00	2024-05-11T20:42:44.093Z	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	cf61184d-0ffb-4443-9a63-231432a3bed1	100	2024-05-08 16:11:15.988191+00	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	cb69b4b0-b164-43ed-ad6e-c0c3ca3ad93e	10	2024-05-08 16:11:15.988191+00	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	cf61184d-0ffb-4443-9a63-231432a3bed1	100	2024-05-08 16:11:15.988191+00	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-08 16:11:15.988191+00	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	b7349827-482c-4c5c-b0eb-7627a8380c16	100	2024-05-08 16:11:15.988191+00	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	474cc566-0a60-4f1a-8e48-40558fe39170	10	2024-05-08 16:11:15.988191+00	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	e15b969f-d5fe-48cf-80ea-443be9dc5785	100	2024-05-08 16:11:15.988191+00	\N	\N
721c2afc-0eab-4225-a20a-b707b0ffbe01	caa77bd6-4cf9-44a5-aa24-2e68c899081a	10	2024-05-08 16:11:15.988191+00	\N	\N
721c2afc-0eab-4225-a20a-b707b0ffbe01	3a9fc3a5-6dcb-423f-812e-3175b59ea51c	10	2024-05-08 16:11:15.988191+00	\N	\N
721c2afc-0eab-4225-a20a-b707b0ffbe01	69732c83-e2ee-481f-b4c5-e55932e8d51f	10	2024-05-08 16:11:15.988191+00	\N	\N
721c2afc-0eab-4225-a20a-b707b0ffbe01	a736cad0-9135-4ac2-bb96-d40350b52658	10	2024-05-08 16:11:15.988191+00	\N	\N
721c2afc-0eab-4225-a20a-b707b0ffbe01	2b72c607-f5b6-4907-88e9-1a2d50045b18	10	2024-05-08 16:11:15.988191+00	\N	\N
721c2afc-0eab-4225-a20a-b707b0ffbe01	c38e4aa6-bc90-4592-ae7d-95d93de12ec4	10	2024-05-08 16:11:15.988191+00	\N	\N
63c17b84-e84b-4049-b6f5-1ae31bdc2f5f	2d2a7f10-0aa2-4c87-b5a8-3441cb569f10	10	2024-05-08 16:11:15.988191+00	\N	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	f51bc934-80c1-4fb6-858f-38f701e88dd9	10	2024-05-08 16:11:15.988191+00	\N	\N
7d5e29af-7d5f-41a9-afaf-8e2135dd69c4	38f2c85a-d46f-4cd4-92a6-70cd8b55851a	100	2024-05-08 16:11:15.988191+00	\N	\N
63c17b84-e84b-4049-b6f5-1ae31bdc2f5f	c905ca5a-0564-4d2a-b9b9-585cbce1cc62	10	2024-05-08 16:11:15.988191+00	\N	\N
63c17b84-e84b-4049-b6f5-1ae31bdc2f5f	c1e4ef3f-0d86-418f-9d9f-05f028246bed	10	2024-05-08 16:11:15.988191+00	\N	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	b7349827-482c-4c5c-b0eb-7627a8380c16	10	2024-05-08 16:11:15.988191+00	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	e99b7beb-668d-45f0-b368-6fad52f284a5	0	2024-05-08 16:11:15.988191+00	2024-05-13T17:17:21.461Z	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-08 16:11:15.988191+00	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	8fe8f879-5cc8-4670-a13d-9d2d6bb24017	10	2024-05-10T15:49:21.750Z	\N	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	603dec10-b1e7-4034-aa4b-b0362347387b	10	2024-05-08 16:11:15.988191+00	\N	\N
29883304-d3af-436e-93bd-7b7327817006	d01c1d11-e401-4151-b0ec-52c26ce54b32	100	2024-05-08 16:11:15.988191+00	\N	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	3f4a6357-7a1b-4c64-a48b-7c6136e3f472	10	2024-05-08 16:11:15.988191+00	\N	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	74dc7f47-7298-418b-9b5b-04c47914721b	10	2024-05-08 16:11:15.988191+00	\N	\N
29883304-d3af-436e-93bd-7b7327817006	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-08 16:11:15.988191+00	\N	\N
29883304-d3af-436e-93bd-7b7327817006	2ca22b44-7d15-4524-9999-290a2925af6f	100	2024-05-08 16:11:15.988191+00	\N	\N
6ff8fc55-1591-497d-a8d5-3318144a5e00	63683e0b-eb4b-4e46-99f4-377ca5bb26f0	10	2024-05-08 16:11:15.988191+00	\N	\N
6ff8fc55-1591-497d-a8d5-3318144a5e00	dbcb6fc3-02b4-4e31-8924-ed56f0e6ecc1	10	2024-05-08 16:11:15.988191+00	\N	\N
6ff8fc55-1591-497d-a8d5-3318144a5e00	e4f030c3-a985-4cc0-8336-9b55e1acc79f	10	2024-05-08 16:11:15.988191+00	\N	\N
905820e1-6281-4e21-8ec5-9f501a9bae42	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-08 16:11:15.988191+00	\N	\N
905820e1-6281-4e21-8ec5-9f501a9bae42	e332e031-a18e-4407-81e9-660530260e64	10	2024-05-08 16:11:15.988191+00	\N	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	580c2fac-3c42-48d2-b79b-2fbc7b6fc7b0	10	2024-05-08 16:11:15.988191+00	\N	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-08 16:11:15.988191+00	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	6d451ef8-e962-423c-8fc8-5fb0eb848766	10	2024-05-08 16:11:15.988191+00	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	496185c5-16e8-4576-9778-0514ca727dbc	10	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	14bb5f33-7c73-441d-a3b6-27fd7348dce3	100	2024-05-08 16:11:15.988191+00	\N	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	b7349827-482c-4c5c-b0eb-7627a8380c16	100	2024-05-08 16:11:15.988191+00	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	55bf190c-f2eb-4f80-89f0-76dec0843ad4	10	2024-05-08 16:11:15.988191+00	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	d01c1d11-e401-4151-b0ec-52c26ce54b32	10	2024-05-08 16:11:15.988191+00	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	28114a40-6489-4712-b5ba-5968b0fc8fd9	0	2024-05-08 16:11:15.988191+00	2024-05-13T14:21:09.546Z	\N
601c5c10-194b-430f-af04-53feafb69d93	55bf190c-f2eb-4f80-89f0-76dec0843ad4	10	2024-05-08 16:11:15.988191+00	\N	\N
9ee3b69e-4c7f-478c-8059-3916ec8a7c2a	43a27a70-3ed5-4a3d-8428-623810c3f717	0	2024-05-08 16:11:15.988191+00	2024-05-14T15:15:04.561Z	\N
9ee3b69e-4c7f-478c-8059-3916ec8a7c2a	112f1380-ebef-4697-87e8-7cb8a1e05cf7	10	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	580c2fac-3c42-48d2-b79b-2fbc7b6fc7b0	100	2024-05-08 16:11:15.988191+00	\N	\N
f3985a52-5c14-4cbb-b0d3-1702e26c15c5	25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	10	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	84cad0e5-c559-471b-8fc3-de467afc4685	10	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	0f0fffef-ec91-4dc1-b8ac-41d189b1b026	100	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	251dcbe0-fcd2-47d9-9527-3de6aaf26281	100	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	d1afbc6f-fcab-421a-89fc-10bec2fdd4ff	100	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	a257142f-813f-4450-bf2c-8ce9a51d86ed	100	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	66329b48-ccaf-4fa1-a2f6-3ad4ff61b82d	100	2024-05-08 16:11:15.988191+00	\N	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	62bd5d05-ba37-497a-a1a1-56795813790d	10	2024-05-08 16:11:15.988191+00	\N	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	cd9c4c7a-b1d1-4b85-9a90-a1968b1dc420	10	2024-05-08 16:11:15.988191+00	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	ddd006a5-eac6-44de-ad77-b9386f25ef9c	10	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	689c1d43-a7ee-4b95-97df-1558fbfcb863	10	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	ffc9891b-43d3-4134-8e9c-7ada4690d076	10	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	063d43f1-9f08-4943-8f82-b51aa4e49924	10	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	060bd404-4214-469e-bac3-ea801400ea5e	10	2024-05-08 16:11:15.988191+00	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	8980a8e1-5aa6-4168-8cd6-e06f6ab9275a	10	2024-05-08 16:11:15.988191+00	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	74dc7f47-7298-418b-9b5b-04c47914721b	100	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	10	2024-05-08 16:11:15.988191+00	\N	\N
d0b27e7f-9ef1-4fbe-a15a-36af6ad2eaa9	524ad35e-7967-4ebf-96d8-cdf0f56d1e81	10	2024-05-08 16:11:15.988191+00	2024-05-12T18:23:35.884Z	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	883fd833-4187-4b99-82a4-0afc665a899a	100	2024-05-08T20:38:35.350Z	\N	\N
d0b27e7f-9ef1-4fbe-a15a-36af6ad2eaa9	f3c395aa-63af-4264-99e0-2bd29760c62e	10	2024-05-08 16:11:15.988191+00	\N	\N
eb98c8bb-aa91-4de1-af23-49d4e3a876ac	ecfa6079-84f1-41f8-a86f-cf0e133a135e	0	2024-05-08 16:11:15.988191+00	2024-05-13T21:32:40.969Z	\N
4cbfb685-56b5-4e1f-89f9-52c180540e73	599bee49-16ea-4ea6-9a4a-ae3043926417	10	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	b02cec28-dac2-42ec-a552-0558f598fa51	100	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	28114a40-6489-4712-b5ba-5968b0fc8fd9	100	2024-05-08 16:11:15.988191+00	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	e332e031-a18e-4407-81e9-660530260e64	100	2024-05-08 16:11:15.988191+00	\N	\N
905820e1-6281-4e21-8ec5-9f501a9bae42	fea081c1-7939-4516-97a5-f2cd49177577	10	2024-05-08 16:11:15.988191+00	\N	\N
f3985a52-5c14-4cbb-b0d3-1702e26c15c5	6a220720-6fa3-42cc-8101-621da51b521f	10	2024-05-08 16:11:15.988191+00	\N	\N
573f4bb7-cf57-484b-a95a-d8829c1f406a	b9368d94-0425-4b23-ada4-66f8986f7368	100	2024-05-08 16:11:15.988191+00	2024-05-11T21:41:04.527Z	\N
\.


--
-- Data for Name: shelters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shelters (id, pix, address, pet_friendly, sheltered_people, capacity, contact, created_at, updated_at, name, priority_sum, latitude, longitude, verified, city, neighbourhood, street, street_number, zip_code) FROM stdin;
049e2453-5a88-471c-ae79-a798e08e3371	\N	Av. Ipiranga, 5300 - Jardim Botânico, Porto Alegre	f	0	0	Exclusivamente pelo Instagram @35ctg_oficial	2024-05-10T00:00:00.000Z	2024-05-12T21:58:48.652Z	Ctg 35	170	\N	\N	t	Porto Alegre	\N	\N	\N	\N
604969ae-6a33-45a8-b953-6040e3c1e663	\N	AV BALTAZAR DE OLIVEIRA GARCIA 3868	f	\N	\N	51984188964	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	QUINTAL DO COOLER	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
7626d25f-640d-46b9-8f75-fcb8bc419061	\N	R. Manoel Santana, 2050 - Sítio São José, Viamão - Rs	t	5	5	Charles  (51) 9.8131-3014	2024-05-11T20:17:42.390Z	2024-05-13T14:01:06.380Z	Cbec - Centro Belga De Educação Canina	0	\N	\N	f	Viamão	\N	\N	\N	\N
250721c8-c11f-4fe0-939a-d7742cbebf31	\N	Rua 8ª Bc, 694 - Fião	\N	\N	\N	\N	2024-05-07T16:14:51.207Z	2024-05-13T07:23:39.148Z	Alojamento Igreja - São Leopoldo	0	-29.7782048	-51.1547007	f	São Leopoldo	\N	\N	\N	\N
0538a17a-fa02-42f7-b4e1-2d0ed6d9b7c8	\N	Rua Intendente Alfredo Azevedo, 475	f	\N	\N	51999553697	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	MAZZOLA	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
627d9b43-a569-409f-be85-a5a0d606992e	\N	R Anita Garibaldi, 1121 - Mont'serrat, Porto Alegre	f	\N	\N	\N	2024-05-07T01:04:26.956Z	2024-05-14T01:23:10.636Z	Paróquia Nossa Senhora De Mont Serrat	2	-30.0264726	-51.1845515	f	Porto Alegre	\N	\N	\N	\N
c2115c7c-4fc0-4d73-9672-a1c0303ae996	\N	R. Pedro Américo, 89 - Rincão Dos Ilhéus, Estância Velha - Rs, 93600-000	f	139	1	Mateus (51) 9.9817-1417/ Ana Emilia (51) 9.8446-5742	2024-05-13T15:10:42.533Z	2024-05-13T21:46:53.760Z	Capela São Francisco De Assis - Estancia Velha	500	\N	\N	f	Estância Velha	\N	\N	\N	\N
94eb5d46-85cf-4915-a8f9-e10bf77e401d	\N	Beco Souza Costa, 750 - Jardim Ypu, Porto Alegre - Rs, 91450-140	f	104	104	Marcelo (51) 9.9267-0164  /  Eduardo (51) 9.9140-8460	2024-05-06T18:31:06.940Z	2024-05-14T20:06:44.824Z	Astti (associação Dos Profissionais Em Telecomunicações E Tecnologia Da Informação)	0	-30.0486838	-51.1390812	t	Porto Alegre	\N	\N	\N	\N
54585c9d-843d-43fd-81b4-f43a8001bfe2	\N	Rua Visconde De Pelotas, 473, bairro Passo d'Areia - PORTO ALEGRE	f	20	\N	\N	2024-05-07T01:11:35.078Z	2024-05-10T03:52:29.021Z	Cf Vikings	0	-29.1655266	-51.181651	f	Porto Alegre	\N	\N	\N	\N
74c71daf-a8a9-4f36-bd60-181ffa2e7cbf	\N	R. São Manoel, 850 - Rio Branco	f	\N	\N	51993076284	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	ICI	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
879b7ca4-d0ea-45fb-9a5c-40e8a66462ba	\N	Av. Do Nazário, 1104, Olaria, Canoas	f	0	0		2024-05-14T18:34:39.488Z	2024-05-14T18:34:55.553Z	Igreja Redenção Nazário	0	\N	\N	t	\N	\N	\N	\N	\N
50b470d7-3c67-4c20-b5cb-d3bc0f6c2e1a	\N	Rua Duque De Caxias, 700, Marechal Rondon, Canoas	f	135	135	51 9 95773101	2024-05-10T00:00:00.000Z	2024-05-14T18:38:09.813Z	Paroquia Nossa Senhora Do Rosário	92	\N	\N	t	Porto Alegre	\N	\N	\N	\N
38f311e3-793e-47c6-9523-d32ea13d7186	\N	R. José Do Patrocínio, 834, Cidade Baixa, Porto Alegre	f	\N	\N		2024-05-07T01:04:26.394Z	2024-05-12T18:42:08.546Z	Opinião [desativado]	100	-30.0417573	-51.220909	f	Porto Alegre	\N	\N	\N	\N
ae0debc2-06bd-414b-a7c6-16f88f276648	\N	Av. Boqueirão, 1871 - Igara, Canoas	f	123	\N	\N	2024-05-07T01:04:30.948Z	2024-05-14T23:58:27.745Z	Webmax (studio Kangoo)	1600	-29.9053871	-51.157363	f	Canoas	\N	\N	\N	\N
35db78ae-07f9-4ff4-9c51-ccd4f6b8b2da	\N	Beco Dos Mendonças, 357, Lomba Do Pinheiro, Porto Alegre	f	\N	\N	(51) 9.8470-1295	2024-05-10T00:00:00.000Z	2024-05-12T18:31:39.382Z	Escola Estadual Indigena De Ensino Médio Anhetengua	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
e2ee43f4-f513-428b-b082-89daf19057ac	\N	Av. Elías Cirne Lima, 100, Paternon, Porto Alegre	t	\N	\N	Juliana Corbellini (51) 9.9969-2797	2024-05-11T20:51:32.184Z	2024-05-12T13:29:03.231Z	Intercap Poa [ Exclusivo Para Cães E Gatos]	100	\N	\N	f	Porto Alegre	\N	\N	\N	\N
14609c39-50a9-4046-89da-b271cd6fbf8b	\N	Rua Doutor Barcelos, 1258, Centro, Canoas	f	0	0	(51) 99258-0646	2024-05-14T18:41:54.664Z	2024-05-14T18:42:07.966Z	Transformar Rs	0	\N	\N	t	\N	\N	\N	\N	\N
af5762ba-52c7-4207-9ac2-eceb5c9beab6	\N	Av. Ipiranga, 3850 - Jardim Botânico, Porto Alegre - Rs, 90160-091	f	0	0	+55 51 9685-6729	2024-05-10T15:45:29.435Z	2024-05-14T16:59:17.213Z	Afro-sul Odomode	1070	\N	\N	f	Porto Alegre	\N	\N	\N	\N
ab8e8639-4266-40c7-963b-dfa5e99b2eb5	\N	Rua Dom Pedro, 42 - Rio Branco	\N	\N	\N	\N	2024-05-07T16:15:13.373Z	2024-05-07T16:15:13.373Z	Escola Estadual Polisinos - São Leopoldo	0	-29.77308691	-51.12767952	f	São Leopoldo	\N	\N	\N	\N
42ba4f25-8c77-44ac-8c3d-131ed52faefd	\N	rua c.278 lami	f	\N	\N	51994701634	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	ONG Ester Mulher	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
9bd5f11b-9269-4b8c-9fcd-7cd7df69499d	\N	R. Da Felicidade, 127, Itaara - Rs, 97185-000	f	1	1	Joice Machado (19) 9.9866-5953	2024-05-13T18:42:58.361Z	2024-05-13T18:42:58.361Z	Ong Alma De Galgo	0	\N	\N	f	Itaara	\N	\N	\N	\N
da6e7171-fc4e-4276-ae89-ee9262cac0e9	\N	Av. Costa Gama 4198. Viamao/ RS	t	\N	\N	51999754695	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Vira lata vira amor / Kennel Clube	0	\N	\N	t	Viamão	\N	\N	\N	\N
d1bd1cc0-7ca5-47b7-9e75-af2a62ef3e9a	\N	Av. Getúlio Vargas, 1001, Centro, Canoas	f	0	0	(51) 99811-6141	2024-05-14T18:51:20.775Z	2024-05-14T18:51:36.699Z	Petrobras	0	\N	\N	t	\N	\N	\N	\N	\N
db05d1be-c9aa-4283-bf0c-bee218bb1eb6	\N	Consultar Através Do Contato	f	25	20	Fernanda Saffer (51) 9.8544-4040	2024-05-14T12:41:09.542Z	2024-05-15T00:41:05.753Z	Abrigo Anne Frank - Abrigo Exclusivo Mulheres E Crianças	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
9eaaf07a-ca5b-4633-8b5e-0954f79be0f2	\N	Av. Paulo Pontes, 97 - Cavalhada, Porto Alegre - Rs, 91740-410	f	20	1	Marcelo Clara (51) 9.8265-1517	2024-05-13T17:00:12.246Z	2024-05-14T19:02:17.121Z	Majagru - Núcleo Comunitário	400	\N	\N	f	Porto Alegre	\N	\N	\N	\N
721c2afc-0eab-4225-a20a-b707b0ffbe01	\N	Rua Cristopher Levalley, 1007 - Fazenda São Borja, São Leopoldo - Rs, 93037-730	t	\N	\N	Yasmin Jenisch   (51) 9.9862‑8152‬	2024-05-07T16:14:57.952Z	2024-05-14T22:42:30.589Z	Igreja Ancora - São Leopoldo	60	-29.7954384	-51.1073537	f	São Leopoldo	\N	\N	\N	\N
9ee3b69e-4c7f-478c-8059-3916ec8a7c2a	\N	R. Tamôio, 3393 - Nossa Sra. Das Gracas, Canoas	t	\N	\N	\N	2024-05-07T01:04:19.552Z	2024-05-14T15:15:22.042Z	Escola Espírito Santo (canoas)	560	-29.9304772	-51.1679788	f	Canoas	\N	\N	\N	\N
a78d2791-be16-4736-89ae-17a5c6e22936	\N	Rua São Leopoldo 754, Stella Maris, Viamao	f	\N	\N	51984903974	2024-05-10T00:00:00.000Z	2024-05-14T01:34:05.802Z	Esporte Clube Campo Branco	800	\N	\N	t	São Leopoldo	\N	\N	\N	\N
fe1d441c-ba58-4f14-8c2e-088abe477e0a	\N	Av boqueirão 3895	f	\N	\N	51993052579	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Clube residencial pleno canoas	0	\N	\N	t	Canoas	\N	\N	\N	\N
623a90a2-13fa-4e46-9301-cca050b94a54	\N	Av. João Correa, 286 - Morro Do Espelho	t	300	\N	\N	2024-05-07T16:15:06.513Z	2024-05-14T12:36:49.432Z	Emef Gusmão - São Leopoldo	3510	-29.76950075	-51.13753066	f	São Leopoldo	\N	\N	\N	\N
491e371e-c6b9-4c0f-874d-44a38fd1acca	\N	Av Donário Braga, 159	f	\N	\N	(51) 98191-6496	2024-05-10T00:00:00.000Z	2024-05-14T15:17:06.635Z	Biblioteca Aninha Peixoto	1460	\N	\N	t	Porto Alegre	\N	\N	\N	\N
5292526a-51d8-4862-8da5-eadd81616af6	\N	Rua Francisco De Chagas Santos Roxo,	\N	\N	\N	\N	2024-05-07T16:15:04.207Z	2024-05-07T16:15:04.207Z	Eeip Universo Da Criança - São Leopoldo	0	-29.75586683	-51.09541892	f	São Leopoldo	\N	\N	\N	\N
52db546b-4eeb-4750-b83d-1f967b63d1de	\N	Av. Dos Industriários, 433 - Passo D'areia, Porto Alegre - Rs, 90520-400	f	1	0	51 99128 7538	2024-05-14T12:42:13.849Z	2024-05-14T13:43:07.882Z	Amovi	3161	\N	\N	t	Porto Alegre	\N	\N	\N	\N
3991bacd-260c-49bf-bcbd-8ecdf1678e78	\N	RUA LUIZ VOELCKER 285 TRES FIGUEIRAS	f	\N	\N	51997971936	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	CASA DE PASSAGEM SAO LUCAS	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
935c2c46-591d-4c82-aeb1-17a3128afc14	\N	Rua Amélia Santini Fortunati, 101 - Santa Rosa de Lima / POA	f	\N	\N	51996645174 / 51981181833	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	EMEF Porto Novo	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
200878c5-a567-4b5c-b344-0b42fc19dfc7	\N	Rua Tamôio, 3285, Nossa Senhora Das Graças, Canoas	f	0	0	(51) 98183-4377	2024-05-14T18:37:05.244Z	2024-05-14T18:37:40.385Z	Paróquia Nossa Senhora Das Graças	0	\N	\N	t	\N	\N	\N	\N	\N
eb98c8bb-aa91-4de1-af23-49d4e3a876ac	\N	R. Gov Peracchi Barcellos, 4600 - Restinga, Porto Alegre	\N	\N	\N	\N	2024-05-06T05:00:49.009Z	2024-05-14T18:38:39.846Z	21 Bpm	0	-30.1525394	-51.1521074	f	Porto Alegre	\N	\N	\N	\N
539443e4-a614-4276-9d7c-6dc1a665ac0e	\N	Rua Cônego José Leão Hartman, 82, Centro, Canoas	f	0	0		2024-05-14T18:39:37.569Z	2024-05-14T18:39:52.684Z	Paróquia São Luís Gonzaga	0	\N	\N	t	\N	\N	\N	\N	\N
427d3167-1aa2-4bc3-ad4c-ddd5b6296bf7	\N	Rua Prof Augusto Osvaldo Thiesen, 280 Rubem berta	f	\N	\N	51989422739	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	CTG Rubem Berta	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
cea7f3a5-6447-4c6e-b0dd-69fa70c4e409	\N	Av Rodrigues da Fonseca 1459	f	\N	\N	993076284	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Paróquia São José	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
3f325584-e607-4ac4-9172-1520a75ca986	\N	Rua Jordãnia, S/n - Feitoria	\N	\N	\N	\N	2024-05-07T16:15:04.795Z	2024-05-07T16:15:04.795Z	Eeef Haydee - São Leopoldo	0	-29.7623378	-51.0901607	f	São Leopoldo	\N	\N	\N	\N
a310934f-0b7c-44a2-9b2e-0b240eb6edee	\N	R. Cônego Paulo Isidoro De Nadal, 1 - Santa Tereza, Porto Alegre	f	0	0		2024-05-07T01:04:17.854Z	2024-05-12T22:36:07.881Z	Emef Ver. Martim Aranha	100	-30.08455087	-51.22894193	f	Porto Alegre	\N	\N	\N	\N
0ea3ed9d-c970-4dca-a9dc-7d1a66457757	\N	Av. Guilherme Schell, 5340 - Centro, Canoas - Rs, 92310-022	f	\N	\N	(51) 9.9544‑3499	2024-05-10T00:00:00.000Z	2024-05-13T19:56:26.972Z	Sesc Canoas	0	\N	\N	t	Canoas	\N	\N	\N	\N
a47f2260-c03e-4a2f-96bd-88cb69e1c990	\N	Avenida Piratini, 127, Formosa - Alvorada	f	0	\N	51993826390	2024-05-10T00:00:00.000Z	2024-05-12T21:49:30.902Z	Movimento Feminino Alvorada	0	\N	\N	t	Alvorada	\N	\N	\N	\N
1ff9fbed-fd78-4871-a13a-4843166539ed	\N	Rua Montivideu, 57 - Santa Tereza	\N	\N	\N	\N	2024-05-07T16:15:09.399Z	2024-05-07T16:15:09.399Z	Emef Paul Harris - São Leopoldo	0	-29.7841804	-51.14071546	f	São Leopoldo	\N	\N	\N	\N
b2c7e94b-a343-4765-8201-1bf005a8bc3f	\N	R. São Pedro, 555 - Mal. Rondon, Canoas - Rs, 92020-480	f	150	\N	(51) 9.9314-5966	2024-05-06T06:25:17.677Z	2024-05-14T20:14:47.711Z	Emef Prefeito Edgar Fontoura	2810	-29.9181301	-51.1691393	f	Canoas	\N	\N	\N	\N
cad79ef8-05e7-4142-955d-94bcd6f3d869	\N	R. Gen. Sampaio, 2 - Piratini, Alvorada - Rs, 94838-170	t	0	0	51 99823 6353	2024-05-14T12:44:12.516Z	2024-05-14T12:55:05.999Z	Associação Adote Viralata - Abrigo Pet	0	\N	\N	t	Alvorada	\N	\N	\N	\N
7eb97f36-9de9-4b82-a10d-fd9d24416bcb	\N	R. Dolores Duran, 1211 - Lomba Do Pinheiro, Porto Alegre - Rs, 91540-220	f	41	41	51 997735361	2024-05-14T12:47:09.580Z	2024-05-14T12:56:48.165Z	Centro Evangélico Cepa - Abrigo Exclusivo Para A Comunidade Indígena Guarani	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
28e4125c-c6c6-45cf-a9b7-141a12151b29	\N	R. Ramiro Barcelos, 2600 - Floresta, Porto Alegre - Rs, 90035-003	f	1	0	51 99584 1964	2024-05-14T12:44:54.613Z	2024-05-14T12:54:17.226Z	Icbs	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
3c38b84a-c7c3-4cf6-80ef-1d1fa1d5d78a	\N	Rua Victor Silva, 186 - Camaquã	f	47	47		2024-05-07T01:04:08.870Z	2024-05-11T15:28:33.528Z	Paróquia São Vicente Mártir	0	-30.1078132	-51.2412989	t	Porto Alegre	\N	\N	\N	\N
8aa03a2f-97f9-46a8-9b4c-72dce395120e	\N	Rua Bororó, 21, Vila Assunção, Porto Alegre	\N	\N	\N	\N	2024-05-07T01:04:11.667Z	2024-05-07T01:04:11.667Z	Associação Biblioteca Bororó	0	-30.097072	-51.2524539	f	Porto Alegre	\N	\N	\N	\N
7cc0f381-5b8d-4d31-8ef0-0fbf1ca7ac63	\N	RS 020 PD 82 ao lado da Gazapina	f	\N	\N	984407572 / 98517139	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Ginásio da igreja são miguel	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
cc060719-8942-4e50-8f0e-7c65c7fd5740	\N	Chacara banco 71	f	\N	\N	51 991369339	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Igreja Padre Pedro Leonardi	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
3c25886c-39e0-482b-9b3e-cd1e7e59249c	\N	Rua Dos Canudos, 625, bairro Cascata - PORTO ALEGRE	\N	\N	\N	\N	2024-05-07T01:04:16.168Z	2024-05-14T13:14:07.892Z	Cozinha Solidária Mãos Que Acolhem	250	-30.0951111	-51.1715937	t	Porto Alegre	\N	\N	\N	\N
1e08dbd0-9380-4d8c-88e9-b4590adddba9	\N	Av. Farroupilha, 8004, São José, Canoas	f	0	0	(51) 99752-4149	2024-05-14T18:59:01.253Z	2024-05-14T18:59:28.072Z	Ulbra Prédio 16 - Canoas	0	\N	\N	t	\N	\N	\N	\N	\N
5207fb6b-af7d-4842-8a19-6ae75f13d3c6	\N	Rua Walir Zottis, 380 - Jd. Itu Sabará	t	73	\N	\N	2024-05-07T01:04:09.998Z	2024-05-11T16:01:56.404Z	Abrigo Na Walir Zottis 380 Jd. Itu Sabará	950	-30.0147679	-51.1374376	f	Porto Alegre	\N	\N	\N	\N
b166f0d0-0dd0-4c95-9eca-23adf5fd068e	\N	av. bernardino de oliveira paim	f	\N	\N	51981916496	2024-05-10T00:00:00.000Z	2024-05-14T19:24:44.076Z	Igreja santa Rosa	10	\N	\N	t	Porto Alegre	\N	\N	\N	\N
40ab1a6f-277c-4ccc-8f59-db8c87a098e3	\N	Rua Sete Irmãos, 190	t	0	\N	\N	2024-05-06T04:57:34.368Z	2024-05-11T23:00:40.366Z	101 Vira Latas (ong)	70	-29.2366074	-51.8657467	f	Porto Alegre	\N	\N	\N	\N
8acf6f6a-68d1-4698-9052-00ec20b3baa2	\N	Jardim Botânico - Rua Dr. Salvador França, 1427	f	\N	\N	51999854424	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Instituto Curicaca	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
f0007b63-a031-4c5a-ad2c-d2a708feabb4	\N	Av. Bento Gonçalves, 6623 - Agronomia	f	54	110	(51) 98304-2275	2024-05-06T13:46:18.335Z	2024-05-14T13:58:05.956Z	Pastor Rodrigo Tavares - Agronomia	0	-30.0669926	-51.1502728	f	Porto Alegre	\N	\N	\N	\N
70084b0f-4b01-431e-a2bf-ee85df1da7cd	\N	Rua Beco Souza Costa, 174, Morro Santana	f	44	101		2024-05-07T01:04:23.537Z	2024-05-15T01:27:24.823Z	Igreja Rosa De Sarom	221	-30.0445068	-51.136276	t	Porto Alegre	\N	\N	\N	\N
ec52b6bc-3cd8-4732-ab40-839c0451e798	\N	Estrada João Antônio Silveira 6725	f	\N	\N	5,55199E+12	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Igreja ADMA	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
ff63560c-2e69-45fa-a6fb-d81167f60e69	\N	Rua Geraldina Batista, 135	f	\N	\N	51994477957	2024-05-10T00:00:00.000Z	2024-05-11T22:28:29.198Z	Grupo Comunitário do Lotamento Santa Maria	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
6a40dba0-935b-47e3-a7e0-457c58c16d46	somoscolodemae@gmail.com	Av. Dr Nilo Peçanha, 2400, Bairro Boa Vista, PORTO ALEGRE	f	0	500	(51) 9.9019-7332	2024-05-07T11:49:29.480Z	2024-05-12T00:50:53.877Z	Nilo 2400	0	-30.02797097	-51.16833389	t	Porto Alegre	\N	\N	\N	\N
e1bd7d3e-e7c0-4632-95c6-b131382b0498	\N	Av. Getúlio Vargas, 4388 - São João Batista	\N	\N	\N	\N	2024-05-07T16:14:59.073Z	2024-05-07T16:14:59.073Z	Colégio Concórdia - São Leopoldo	0	-29.79810601	-51.16202329	f	São Leopoldo	\N	\N	\N	\N
c0d8f35c-18cd-4707-9f2c-5f709d70ef6c	\N	Av. Baltazar De Oliveira Garcia, 3580	\N	\N	70	(51) 99866-6612	2024-05-06T13:41:22.472Z	2024-05-06T13:41:22.472Z	Aliança Cristã De Porto Alegre	0	-30.0156551	-51.10960268	f	Porto Alegre	\N	\N	\N	\N
573f4bb7-cf57-484b-a95a-d8829c1f406a	\N	R. Carazinho, 335 - Petrópolis, Porto Alegre	t	0	\N		2024-05-06T03:04:55.047Z	2024-05-11T21:41:04.525Z	PetMedic Poa	100	-30.0403943	-51.1835181	f	Porto Alegre	\N	\N	\N	\N
e26728be-9c00-46ba-9dd7-3016a19769b1	\N	Rua Lupicinio Rodrigues, 243, Arroio Da Manteiga, São Leopoldo	f	\N	\N		2024-05-07T16:15:03.641Z	2024-05-12T18:24:20.504Z	Eeip Pequena Semente - São Leopoldo	0	-29.71636	-51.1871269	f	São Leopoldo	\N	\N	\N	\N
71ecdc47-bafa-46da-a708-e77bf35e57ec	\N	Av. Integração, 2119 - Feitoria	\N	\N	\N	\N	2024-05-07T16:15:11.113Z	2024-05-07T16:15:11.113Z	Emei Carlos Moraes - São Leopoldo	0	-29.7612655	-51.0992839	f	São Leopoldo	\N	\N	\N	\N
33bf1e95-ec7a-49fd-9dc4-d55c11a205a3	\N	Rua Florianópolis, 547, Arroio Da Manteiga	\N	\N	\N	\N	2024-05-07T16:15:01.937Z	2024-05-07T16:15:01.937Z	Eeip Criança Feliz - São Leopoldo	0	-29.7288387	-51.1817728	f	São Leopoldo	\N	\N	\N	\N
1db5a141-d005-41f2-9ff3-ea8aae5a4422	\N	Rua São Sepé Esquina Viamão/sn Morro Santa Teresa	f	0	\N	\N	2024-05-07T16:15:11.680Z	2024-05-15T01:58:26.778Z	Escola Estadual Amadeo Rossi - São Leopoldo	4900	-29.7893001	-51.1334688	f	Viamão	\N	\N	\N	\N
89901a3a-0de8-4c9c-a82a-9623e3b5948a	\N	Rua Otto José Bol, S/n - Feitoria	\N	\N	\N	\N	2024-05-07T16:15:12.806Z	2024-05-07T16:15:12.806Z	Escola Estadual João Hillebrand - São Leopoldo	0	-29.7536013	-51.1080293	f	São Leopoldo	\N	\N	\N	\N
8a1de0e8-e086-46bd-bbb3-f578c5840841	\N	R. João Lourenço Schaefer, 609 - Centro, Igrejinha - Rs, 95650-000	f	38	150	\N	2024-05-08T17:22:28.261Z	2024-05-08T17:22:28.261Z	Ginásio Da Paroquia Imaculada Conceição	0	-29.5742629	-50.7911202	f	Igrejinha	\N	\N	\N	\N
754c8017-dcc5-4c8a-bcca-aadd2b3a4ade	\N	Oscar Pereira, 1434	\N	\N	\N	(51) 98285-0345	2024-05-06T13:48:30.664Z	2024-05-06T13:48:30.664Z	Igreja Cristã Filadélfia	0	-30.062563	-51.206144	f	Porto Alegre	\N	\N	\N	\N
69a67ca4-5bd4-4b28-812c-e0146d667d08	\N	av bento goncalves 343	f	\N	\N	984119509	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	CEAD	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
5de0c80f-b22c-4d00-936c-7b15de1152ac	\N	protasio alves 9972	f	\N	\N	51996392599	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	LAR MARIA ROSA	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
68e90e48-c695-4745-82df-980cfeaab3a0	\N	Avenida Mauá, 2767 - Padre Réus	\N	\N	\N	\N	2024-05-07T16:15:14.533Z	2024-05-07T16:15:14.533Z	Ginásio Padre Reus - São Leopoldo	0	-29.7804647	-51.1434706	f	São Leopoldo	\N	\N	\N	\N
fa5efac5-14ca-43cd-98c4-74d90ac423f8	\N	Rua Alexandre De Gusmão 1844	f	200	200	51 996267303	2024-05-08T16:50:38.310Z	2024-05-08T16:50:38.310Z	Igreja Encontros De Vida - Canoas	0	-29.9084413	-51.1418271	f	Canoas	\N	\N	\N	\N
e46f6147-2d17-4de7-9cc6-2b9b222ca5f3	\N	Endereço rua André pittan número 38 casa 2 fundos. Bairro Aparício Borges	f	\N	\N	51 98533‑3558	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Sindicato dos Engenheiros no Estado do RS	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
4266b3b6-c884-420b-a403-70375482792a	\N	Av. Do Lami, 4448 - Belém Novo, Porto Alegre - Rs	f	0	0		2024-05-14T19:47:09.124Z	2024-05-14T19:47:25.028Z	Asilo Prato Feito	0	\N	\N	f	\N	\N	\N	\N	\N
22875004-f93a-4e1c-81a9-b4758fdcf2e9	\N	Av. Alberto Bins, 348	f	\N	\N	51986259579	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Brigada militar Corregedoria -Geral	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
71e40554-3191-4481-ab4b-9d83b897b17e	96881066 (Felipi Vidal Fraga, diretor da escola)	Rua Victor Kessler, 291 - Centro, Canoas	f	200	190	(51) 9.9735-2527	2024-05-08T16:49:35.343Z	2024-05-13T17:32:06.201Z	Escola André Puente - Canoas	1470	-29.915858284696178	-51.185779331684294	f	Canoas	\N	\N	\N	\N
4767eeec-77b4-4236-a418-6f5cd1ddb05c	\N	Av. Icaraí, 1168 - Cristal, Porto Alegre - Rs, 90810-000	t	53	53	51 99561 7505	2024-05-14T13:06:27.185Z	2024-05-14T13:46:44.806Z	Donna Banho E Tosa - Abrigo Pet	2	\N	\N	t	Porto Alegre	\N	\N	\N	\N
b9f322b3-851b-443d-bd49-c1c5e79a725d	\N	Rua Antônio Joaquim mesquita 311	f	\N	\N	51981837943	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Escola de dança Kitty	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
df57b625-8b58-4962-92d6-667be323a70b	\N	Rua Rio Paraguaçu, 178 - Arroio Da Manteiga	\N	\N	\N	\N	2024-05-07T16:14:57.384Z	2024-05-07T16:14:57.384Z	Cepa - São Leopoldo	0	-29.7232303	-51.1856036	f	São Leopoldo	\N	\N	\N	\N
0a8f3050-34d2-41a0-97c6-c3c513d0da60	\N	Av. Pres. Vargas, 612 - Centro, Estância Velha - Rs, 93610-050	f	1	1	George (51) 9.8596-0939 / Silvano (51) 9.8472-6285 / Carol (51) 9.9744-7067 	2024-05-13T16:29:52.791Z	2024-05-13T16:29:52.791Z	Igreja Luterana - Estância Velha	0	\N	\N	f	Estância Velha	\N	\N	\N	\N
bf66178e-1427-437e-a59e-888cce5b4207	\N	R. João Leivas De Carvalho, 461 - São José, Canoas - Rs, 92420-250	f	170	170	Lina Teresinha (51) 9.9491-5959	2024-05-13T12:57:36.789Z	2024-05-13T12:57:36.789Z	Colégio Estadual Miguel Lampert - Canoas	0	\N	\N	f	Canoas	\N	\N	\N	\N
7290adae-20ba-4462-8958-8b48080223fb	\N	Nilo Peçanha	f	\N	\N	48991931603	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Anchieta	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
60c5e4fe-6c42-4a87-8b97-6b51e781ede7	\N	Avenida Wenceslau Fontoura 105 Bairro Nova Americana Alvorada	f	\N	\N	51 3483.3010	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Sindicato dos servidores públicos municipais de Alvorada	0	\N	\N	t	Alvorada	\N	\N	\N	\N
4e3613ba-dfaf-4598-8bba-ffcb0efb244d	\N	Rua 24 de junho casa 4 passos da areia	f	\N	\N	51984349455	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Casa do Marcelo terça enfermagem	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
0ad569d9-08e5-4ffd-a00c-410f12ad5aae	\N	Av. Bento Martins, 457, Alvorada	f	100	100		2024-05-14T19:49:06.572Z	2024-05-14T19:49:32.846Z	Abrigo Alvorada - Exclusivo Mulheres E Crianças	0	\N	\N	t	\N	\N	\N	\N	\N
0312a963-d2b7-428c-afc3-0be8d400cd4d	\N	Rua Nove, 678, Arroio Manteiga, São Leopoldo	t	0	\N		2024-05-07T16:15:10.541Z	2024-05-14T17:31:33.827Z	Emef Tancredo Neves - São Leopoldo	160	-29.72904259	-51.19308244	f	São Leopoldo	\N	\N	\N	\N
9e596ac9-701b-44cb-87ad-c469f7cdb86c	\N	Av. Protasio Alves, 2837	f	0	0		2024-05-14T19:56:05.154Z	2024-05-14T19:56:20.013Z	Aje Poa	0	\N	\N	f	\N	\N	\N	\N	\N
beb1d609-2ddf-4e3f-8e66-ccf1909cf9b0	\N	Rua Professora Ziláh Totta, 220 - Jardim Dona Leopoldina	f	0	0		2024-05-14T19:57:35.773Z	2024-05-14T19:57:55.696Z	Andrirl Xangô	0	\N	\N	t	\N	\N	\N	\N	\N
793a281d-e2dd-483b-98af-9995e8b5f283	\N	Capela São José Operário (pertence À Paróquia Nossa Senhora Da Glória)	t	19	\N	(19) 9.9648-4951	2024-05-11T20:57:00.828Z	2024-05-14T20:12:55.927Z	Capela São José Operário (pertence À Paróquia Nossa Senhora Da Glória)	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
8e1f7e72-0634-41f0-b5d7-dd932d40dbf3	\N	Av Feitoria 2944	\N	\N	\N	\N	2024-05-07T16:14:58.511Z	2024-05-07T16:14:58.511Z	Igreja Maft - São Leopoldo	0	-29.7599922	-51.1098125	f	São Leopoldo	\N	\N	\N	\N
a473d415-e5bd-4293-94de-040ac36fd39d	\N	Av Tharcilo Nunes, 301 - Santo Andre	f	60	\N	\N	2024-05-07T16:15:00.205Z	2024-05-10T02:01:34.077Z	CTG Tio Lautério - São Leopoldo	910	-29.7724161	-51.1132612	f	São Leopoldo	\N	\N	\N	\N
ecb3d785-eac3-402f-ab57-028fea566bb4	\N	R. Araguaia, 335 - Igara, Canoas - Rs, 92410-001	f	200	200	51 996881066	2024-05-08T16:49:34.647Z	2024-05-14T17:24:07.599Z	Complexo Libertad - Canoas	70	-29.9018183	-51.1737975	f	Canoas	\N	\N	\N	\N
a94e5b7b-e0a1-4825-be41-82470cf72ba6	\N	Av. A.j. Renner, 211 - Estância Velha, Canoas - Rs, 92030-010	f	160	160	(51) 9.9811-1134	2024-05-08T16:49:36.022Z	2024-05-13T20:04:11.148Z	Colégio Rondônia - Canoas	0	-29.6537221	-51.1737738	f	Canoas	\N	\N	\N	\N
4b5ac1d5-0201-459d-901e-424f0d346434	\N	R. Dom Feliciano, 560 - Santa Cruz, Gravataí - Rs, 94170-230	t	25	\N	Ilse Marlene (51) 9.99971696	2024-05-11T20:53:26.780Z	2024-05-13T14:25:23.871Z	Abrigo Chacrinha	500	\N	\N	f	Gravataí	\N	\N	\N	\N
bef1fe53-bf7e-4f4f-89f7-d515074e028c	\N	na praça em frente ao Gasômetro, astrás do parque Harmonia	f	200	\N	\N	2024-05-06T03:04:59.519Z	2024-05-15T00:51:44.611Z	Usina do Gasômetro	2330	\N	\N	f	Porto Alegre	\N	\N	\N	\N
670b8732-7e77-43ad-871b-a8aa9038b940	\N	Av. João Corrêa S/n, Fião, São Leopoldo	t	0	\N		2024-05-07T16:15:26.829Z	2024-05-12T18:33:42.163Z	Escola Irmão Weibert - São Leopoldo	30	-29.771974	-51.1515106	f	São Leopoldo	\N	\N	\N	\N
6ff8fc55-1591-497d-a8d5-3318144a5e00	\N	Av. Feitoria, 2942, Feitoria	\N	\N	\N	\N	2024-05-07T16:14:56.236Z	2024-05-08T01:45:00.250Z	Ccei Recanto Da Criança - São Leopoldo	50	-29.7601014	-51.1100166	f	Feitoria	\N	\N	\N	\N
805faba4-b950-463f-b0b6-3bf5fb521d1a	\N	Endereço Nossa Senhora Dos Navegantes 572 Itapuã	t	42	\N	(51) 99767-0503	2024-05-06T06:36:26.897Z	2024-05-14T13:19:08.677Z	Escola Odete Barcelos Bernardes	140	-30.2799293	-51.0147725	f	Porto Alegre	\N	\N	\N	\N
02fff2ca-7a10-42ea-8ac1-b6ad2bcfa31b	\N	R. Jordânia, Sn - Feitoria, São Leopoldo	\N	\N	\N	\N	2024-05-07T16:15:27.420Z	2024-05-07T16:15:27.420Z	Eeem Prof. Haydee Mello Rostirolla - São Leopoldo	0	-29.7623378	-51.0901607	f	São Leopoldo	\N	\N	\N	\N
4599527e-e608-4c95-8e3c-5d589e7e63e0	\N	Rua Davi Canabarro, 10 - Morro Do Espelho	t	750	\N	\N	2024-05-07T16:15:21.530Z	2024-05-14T15:39:19.271Z	Sindicato Dos Metalurgicos - Bigornão - São Leopoldo	400	-29.7801154	-51.1393731	f	São Leopoldo	\N	\N	\N	\N
dd23c095-9d3e-45a6-bd15-98cba0ea0c97	\N	Mario de Artagão 13 - Morro da conceição	f	\N	\N	51993939824	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Pequena Casa da Criança	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
0e422650-b93e-45fb-a8e7-fcf705047ef5	\N	Rua Dona Alzira, 275	t	175	20	https://chat.whatsapp.com/KSBD1ZUHc5B7NcadJxmAHI	2024-05-06T03:04:53.365Z	2024-05-12T00:10:46.238Z	Igreja Batista Braza - ZN	540	-30.0076442	-51.1379387	f	Porto Alegre	\N	\N	\N	\N
0f6506cb-46f5-4cee-a8f0-925f4097e076	\N	Rua Bento Martins, 457, Piratini, Alvorada	f	0	0		2024-05-14T19:51:09.634Z	2024-05-14T19:51:44.309Z	Abrigo Coração De Mãe - Exclusivo Mulheres E Crianças	0	\N	\N	f	\N	\N	\N	\N	\N
c3557925-c02f-4d77-93f4-d0bf170dc9eb	\N	Av. Do Forte, 77	f	207	220		2024-05-06T03:04:44.400Z	2024-05-14T13:50:21.703Z	Colégio Mesquita	480	-30.011603	-51.1536087	f	Porto Alegre	\N	\N	\N	\N
d40a7d0f-9c76-4096-b189-cd7061eec6cc	\N	Av. Bernardino De Oliveira Paim, 665	t	105	105	51986483187	2024-05-10T15:45:36.716Z	2024-05-13T12:51:32.435Z	Eeem Santa Rosa	350	\N	\N	f	Porto Alegre	\N	\N	\N	\N
15b8422a-479f-403e-8c5e-bdd7ada28154	\N	R. General Osório, 233, Vila Duque, São Leopoldo	f	118	\N		2024-05-07T16:15:18.057Z	2024-05-14T14:50:13.478Z	Paróquia Da Duque - São Leopoldo	210	-29.79280532	-51.13782586	f	São Leopoldo	\N	\N	\N	\N
f2884cd5-1f02-43b0-a7ed-77254b8a8c5f	\N	João Salomoni, 1083 - Vila Nova	f	29	\N	\N	2024-05-07T01:04:25.259Z	2024-05-10T09:28:26.041Z	Mulheres Em Rede / Consepro	171	-30.1144612	-51.2156123	f	Porto Alegre	\N	\N	\N	\N
a0c44b0e-4f70-433c-b6b9-be9d8657c6ad	\N	Rua Amaro Cavalcante, 1 - Arroio Da Manteiga	\N	\N	\N	\N	2024-05-07T16:15:18.628Z	2024-05-07T16:15:18.628Z	Paróquia Da Vila Elza - São Leopoldo	0	-29.7314729	-51.1703392	f	São Leopoldo	\N	\N	\N	\N
b64dabab-63ca-4b9f-9705-3a45a658fa51	\N	Rua Da Gruta, 240 - Glória	f	44	\N		2024-05-07T17:49:22.937Z	2024-05-14T16:36:21.398Z	Abrigo Da Gruta	960	-30.0837038	-51.1893198	f	Porto Alegre	\N	\N	\N	\N
3505803c-452c-4a9e-ab2e-edbd3bbe50fd	\N	Rua Monte Videl, 57	\N	\N	\N	\N	2024-05-07T16:15:25.088Z	2024-05-10T15:59:00.545Z	Abster - São Leopoldo	0	-29.78433288	-51.14030832	f	São Leopoldo	\N	\N	\N	\N
ce32f99e-339a-435a-8c46-9d10b301bc0e	\N	Estrada Do Morro Do Paula	\N	\N	\N	\N	2024-05-07T16:15:26.259Z	2024-05-07T16:15:26.259Z	Ocupação Morada Do Sol - São Leopoldo	0	\N	\N	f	São Leopoldo	\N	\N	\N	\N
83b5ce2a-cf4e-48e4-a7c2-b1bb755bc853	\N	Rua Leopoldo Scheil, 127	\N	\N	\N	\N	2024-05-07T16:15:25.681Z	2024-05-07T16:15:25.681Z	Associação De Moradores Do Jardim América - São Leopoldo	0	-29.78226298	-51.13057903	f	São Leopoldo	\N	\N	\N	\N
711dacc3-4c88-4daa-bbec-d0335f364242	\N	Rua Otto Daudt, 831 - São Geraldo - Feitoria	\N	\N	\N	\N	2024-05-07T16:15:20.379Z	2024-05-07T16:15:20.379Z	Piquete Acampamento Atgf - São Leopoldo	0	-29.7476594	-51.0991697	f	São Leopoldo	\N	\N	\N	\N
6550efe6-a916-462d-8d3c-4d0f9168a7e0	\N	Estrada João de Oliveira Remião 5683	f	\N	\N	51993556975	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	CODENE RS / Sbrc Mocidade Independente da Lomba do Pinheiro	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
96b6a536-1613-45d7-b163-13fb39a70a2e	\N	Rua dona rosa, 9, cascata - Porto Alegre	f	\N	\N	19996484951	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Paróquia Nossa Senhora da Glória	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
befe637f-794e-4a67-8483-2326f87605ec	\N	Ctg Roda Chimarrão	t	\N	\N	(51) 9.9325-6682	2024-05-10T16:03:00.495Z	2024-05-10T16:03:00.495Z	CTG Roda Chimarrão	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
d1397d8f-8301-4525-ac52-156e574f83e6	\N	R. 24 De Outubro, 1751 - Auxiliadora, Porto Alegre - Rs, 90510-003	t	72	\N	\N	2024-05-07T18:15:59.056Z	2024-05-10T18:31:03.198Z	Paróquia Nossa Senhora Auxiliadora	0	-30.0221588	-51.1914053	f	Porto Alegre	\N	\N	\N	\N
7422324b-fbfc-4043-8106-82e44d2eac01	\N	Rua 06, 400 - Setor 5 Quadra X - Guajuviras,	f	\N	\N	51 991052300	2024-05-08T16:50:26.417Z	2024-05-08T16:50:26.417Z	Escola Drumond Guajuviras - Canoas	0	-29.8914008	-51.1219552	f	Canoas	\N	\N	\N	\N
3a145b07-fc3b-44b9-9724-458de6a9790c	\N	Rua Austrália, 61 Bairro Marechal Rondon Canoas	f	180	180	51 981541423	2024-05-08T16:50:33.061Z	2024-05-08T16:50:33.061Z	Igreja Rhema In Church - Canoas	0	-29.9083793	-51.1761685	f	Canoas	\N	\N	\N	\N
0042bb4c-d556-4098-bbc8-4e5a8671c9c4	\N	R. Esperança, 734	f	50	50	51 998937201	2024-05-08T16:50:31.062Z	2024-05-14T13:34:27.350Z	Igreja Mover - Canoas	0	-29.899348866497906	-51.14385420284847	f	Canoas	\N	\N	\N	\N
63c17b84-e84b-4049-b6f5-1ae31bdc2f5f	\N	Av. Feitoria, 3171 - Feitoria	f	200	\N	\N	2024-05-07T16:15:22.152Z	2024-05-09T14:09:09.393Z	Sociedade Mauá - São Leopoldo	40	-29.759014	-51.1080984	f	São Leopoldo	\N	\N	\N	\N
3a5e8ab5-5c48-48f3-98f1-f7c9c5b26ddb	\N	Av. Integração, 1009 - Feitoria	f	\N	\N	\N	2024-05-07T16:14:54.549Z	2024-05-12T01:57:52.541Z	Caic Madezzatti - São Leopoldo	1600	-29.7486023	-51.0973457	f	São Leopoldo	\N	\N	\N	\N
d8944c64-cd5a-43e8-b6de-01f8a9f01174	\N	Rua Henrique Scharlau, S/n (ao Lado Da Emef Paulo Couto)	\N	\N	\N	\N	2024-05-07T16:15:19.807Z	2024-05-09T15:41:49.323Z	Paróquia São Roque - São Leopoldo	770	-29.727583	-51.1521124	f	São Leopoldo	\N	\N	\N	\N
247ab173-d456-49ad-8d48-a142b340ad9e	\N	Rua Engenheiro Afonso Cavalcanti, 51 - Bela Vista, Porto Alegre - RS, 90440-110	f	\N	\N	051 999893187	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	CARACOL ESCOLINHA	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
95f16afe-05a4-4a7d-bf61-8d11c8de7376	\N	Rua Manoel Marques 433 - Mário Quintana	f	40	40	(51) 98267-4879	2024-05-06T13:37:34.424Z	2024-05-14T13:23:53.822Z	Igreja Maanaim	0	-30.0342243	-51.1183503	f	Porto Alegre	\N	\N	\N	\N
9c680b0d-69db-4e4f-b439-f817f51375ba	\N	Rua Rodolfo Muller, S/n (ao Lado Escola Dilza)	\N	\N	\N	\N	2024-05-07T16:14:51.768Z	2024-05-07T16:14:51.768Z	Amocef - São Leopoldo	0	-29.76011091	-51.08834253	f	São Leopoldo	\N	\N	\N	\N
76bac72f-c0a7-48af-bf22-301920b221c5	\N	R. 15 De Novembro, 131 - Barnabé, Gravataí - Rs, 94150-230	f	1	1	Bárbara (51) 9.9565-4990	2024-05-13T14:28:24.583Z	2024-05-13T14:28:24.583Z	Igreja El Shaddai - Gravataí	0	\N	\N	f	Gravataí	\N	\N	\N	\N
bf097610-4650-4439-bf6d-cfd601bda374	\N	Paulino Chaves, 20	f	\N	\N	51985130282	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Atelier da beleza	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
66adf5d4-903b-4991-ac4e-74c87be10317	\N	Rua sessenta e dois quadra D no 50 setor 3	f	\N	\N	51984380792	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Paróquia Nossa Senhora Aparecida	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
869b95a8-67c2-41b5-b322-2d01c485e644	\N	Av. Parobé, S/n - Scharlau	t	410	\N	\N	2024-05-07T16:15:19.221Z	2024-05-09T12:44:37.314Z	Paróquia Nossa Senhora Aparecida - São Leopoldo	730	-29.7266851	-51.1596456	f	São Leopoldo	\N	\N	\N	\N
443935ee-51dc-4ad9-8b86-5198a555770a	\N	Av. São Borja, 3000 - Fazenda São Borja	\N	\N	\N	\N	2024-05-07T16:15:23.884Z	2024-05-08T23:59:33.266Z	Stihl - São Leopoldo	40	-29.788062	-51.115079	f	São Leopoldo	\N	\N	\N	\N
52a79ef7-7e8d-4478-9ef9-a06899483809	\N	Área Verde 13, Setor 6 - Guajuviras - CANOAS	f	237	237	(51) 9.9899-2646	2024-05-10T00:00:00.000Z	2024-05-13T17:19:31.561Z	EMEF Professora Nancy Ferreira Pansera - Canoas	510	\N	\N	t	Canoas	\N	\N	\N	\N
a191db9a-7d8b-4893-8f26-60dc6951d4f6	\N	Rua Jorge Meyer, 108 - Feitoria	\N	\N	\N	\N	2024-05-07T16:15:16.313Z	2024-05-07T16:15:16.313Z	Igreja Batista - São Leopoldo	0	-29.7522169	-51.0947491	f	São Leopoldo	\N	\N	\N	\N
29883304-d3af-436e-93bd-7b7327817006	\N	Rua Do Carioca, 345 - São João Batista	\N	\N	\N	\N	2024-05-07T16:15:22.727Z	2024-05-08T01:41:44.358Z	Sociedade Recreativa Bangu - São Leopoldo	640	-29.7897144	-51.1665863	f	São Leopoldo	\N	\N	\N	\N
982ec984-0e94-4855-ad46-46403578216c	\N	Estrada João De Oliveira Remião, 4444 - Lomba Do Pinheiro	f	120	120		2024-05-07T01:04:28.092Z	2024-05-14T15:56:49.142Z	Paróquia Santa Clara	340	-30.1081531	-51.112884	f	Porto Alegre	\N	\N	\N	\N
ab956c36-acb3-48d1-8131-24f2a8bf3ebf	\N	Rua Irmão José Otão, 11	f	\N	\N	51 98130‑8550/51998480841	2024-05-10T15:45:41.133Z	2024-05-10T15:45:41.133Z	Colégio Marista Champagnat	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
f2722942-ee8b-4dbb-adbc-44747a16d614	\N	Av. Wenceslau Fontoura, 105 Nova Americana - Alvorada CEP: 94824-700	f	\N	\N	51 34424568	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	SINDICATO DOS SERVIDORES PÚBLICOS MUNICIPAIS DE ALVORADA	0	\N	\N	t	Alvorada	\N	\N	\N	\N
564f5e52-0ee3-4b85-a70d-be59eb51be25	\N	Rua Jacob Uebel, 265 - Santo André	\N	\N	\N	\N	2024-05-07T16:15:15.709Z	2024-05-07T16:15:15.709Z	Igreja - São Leopoldo	0	-29.7689592	-51.1183808	f	São Leopoldo	\N	\N	\N	\N
4b1e6e8d-4881-40df-993b-a9e4d93f9f83	\N	R. Alberto Uebel, 591, bairro Feitoria - SÃO LEOPOLDO	\N	\N	\N	\N	2024-05-07T16:15:03.075Z	2024-05-07T16:15:03.075Z	Eeip Nova Geração - São Leopoldo	0	-29.759214	-51.103283	f	São Leopoldo	\N	\N	\N	\N
85c59831-496b-45f1-b04b-78d3ac8cf6c2	\N	R. Wolfram Metzler, 600	f	\N	\N	+55 51 98514-3885	2024-05-10T15:45:33.329Z	2024-05-10T15:45:33.329Z	Escola Municipal Grande Oriente	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
15e83845-49b4-4b1a-a145-814473455ecb	\N	Avenida valado 363	f	\N	\N	33392020	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Escola adventista partnom	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
0841b3a6-13d8-419b-b062-a324eb98ef9a	\N	R. Alexandre De Gusmão, 112 - Estância Velha, Canoas - Rs, 92030-340	f	45	45	Clair (51) 9.8462-0098	2024-05-13T13:12:45.832Z	2024-05-14T17:18:11.354Z	Inove Fitness - Canoas	370	\N	\N	f	Canoas	\N	\N	\N	\N
ef24cece-8be6-4401-a739-7d93e1818c62	\N	Ac. A-um, 169 - Mário Quintana, Porto Alegre - Rs, 91260-390	f	0	0		2024-05-14T20:01:32.399Z	2024-05-14T20:01:52.254Z	Associação Força E Coragem	0	\N	\N	f	\N	\N	\N	\N	\N
5935f47f-3932-4cae-affa-df0fbb06f51f	\N	Rua Maria Zélia Carneiro De Figueiredo, 870 - Igara, Canoas	t	490	\N	(51) 9.9531-4966	2024-05-07T21:49:44.425Z	2024-05-13T14:21:09.544Z	Ifrs De Canoas	1040	-29.8992429	-51.1513927	f	Canoas	\N	\N	\N	\N
1160eeed-e587-420f-a3a1-fe11e59fb32b	\N	R. Aurora, 695 - Mal. Rondon, Canoas	f	75	75	51 991994373	2024-05-08T16:50:28.417Z	2024-05-13T17:05:52.139Z	Colégio Leonardo Da Vinci - Canoas	430	-29.9103979	-51.1738952	f	Canoas	\N	\N	\N	\N
eb9e5517-3f04-49d2-b2e7-ed771e030419	\N	R. Osvaldo Olmiro Machado, 36 - Ipanema Porto Alegre - Rs, 91751-670	f	800	800		2024-05-14T20:03:02.637Z	2024-05-14T20:03:26.693Z	Bahia De Xangô Ilê Adocô	0	\N	\N	f	\N	\N	\N	\N	\N
fe84ac9f-8ef8-4be1-ba31-c196f0d0b388	CNPJ: 23420475000132	Alameda Servidão, 25 - Tristeza, Porto Alegre	f	\N	\N	Daniel Morephson (51) 9.8648-8544\t	2024-05-11T20:56:30.282Z	2024-05-12T03:53:27.208Z	Abrigo [exclusivo Lgbtqiapn+] - Tristeza	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
d2059fef-d21d-4eea-b57f-959aad6fc556	\N	R. Tupi, 228 - Igara, Canoas - Rs, 92410-310	f	200	200	51 981325736	2024-05-08T16:50:34.944Z	2024-05-11T19:13:14.870Z	Santuário São Cristóvão - Canoas	100	-29.8973389	-51.1734922	f	Canoas	\N	\N	\N	\N
7b14fcc8-6d27-46cd-9794-08b7f7d66dc7	\N	Rua Vinte De Setembro, 1143, Barnabé, Gravataí, 94150010	f	40	50	Fabiano Lima  51 9952-0172	2024-05-08T21:15:08.365Z	2024-05-10T00:30:51.593Z	Igreja Vida Do Reino	0	-29.9349703	-51.0365971	f	Gravataí	\N	\N	\N	\N
17ca6632-2d8c-4f55-84da-812bddcd9e7b	\N	Av. Unisinos, 950	t	1300	\N	\N	2024-05-07T16:15:15.125Z	2024-05-14T18:10:04.441Z	Ginásio Unisinos - São Leopoldo	2600	-29.797471	-51.1567121	f	São Leopoldo	\N	\N	\N	\N
f2386324-9b97-4ed7-9e41-b299dab251c5	\N	Rua João Guimarães 337 Bairro Santa Cecília	f	0	0	51 997092006	2024-05-10T15:45:23.946Z	2024-05-14T18:43:52.504Z	Centro De Apoio Às Famílias Afetadas Kizomba	622	\N	\N	t	Porto Alegre	\N	\N	\N	\N
237da5e5-e652-4424-acef-b9951015568b	\N	Rua Vânius Abílio Dos Santos, 999, Gravataí - Rs	t	70	70	Renan (51) 9.8540-4194	2024-05-08T21:34:59.804Z	2024-05-12T16:56:04.413Z	Aabb - Gravataí	0	-29.9198596	-50.996578	f	Gravataí	\N	\N	\N	\N
1e3f0172-3e6c-46aa-970c-31a3906d4ebb	\N	Av. Santos Ferreira, 3500 - Mal. Rondon, Canoas - Rs, 92030-138	t	500	500	Luciana (51) 9.8949-3829	2024-05-08T17:18:40.538Z	2024-05-13T17:18:39.758Z	Modular Cargas Transportadora - Canoas	1240	-29.9245292	-51.144821	f	Canoas	\N	\N	\N	\N
cf8181f6-46e8-4377-bf69-d9f0c89f5f33	\N	Av. Rambla Del Prado, 660 - Prado Bairro Cidade, Gravataí - Rs, 94195-340	f	1	1	Atendimento do Colégio (51) 3424-0088	2024-05-13T18:06:17.336Z	2024-05-13T18:06:17.336Z	Colégio Sinodal Prado - Gravataí	0	\N	\N	f	Gravataí	\N	\N	\N	\N
c14ebbd0-1b9b-4ec5-bec3-2e46bfd319dc	\N	A J Renner 1275 - Estância Velha, Canoas	\N	\N	\N	\N	2024-05-07T01:04:16.726Z	2024-05-07T01:04:16.726Z	Cre Brasil	0	-29.915818	-51.146055	f	Canoas	\N	\N	\N	\N
19c7dc7c-74aa-4a9a-a4c7-2ad228e71cda	\N	Av. Santos Ferreira, 2818 - Mal. Rondon - Canoas	t	270	270	Rafaela (51) 9.9334-5657	2024-05-08T16:50:29.761Z	2024-05-13T19:37:53.996Z	Colégio Gomes Jardim - Canoas	90	-29.928353	-51.1517433	f	Canoas	\N	\N	\N	\N
b03f0b26-ca9d-488f-af20-0c50724625b0	\N	Rua Franscisco Pinto da Fontoura 634	t	\N	\N	51992764239	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	CTG valentes da tradição	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
f0694b10-69a0-4034-a9cc-0229788685a3	\N	RUA JAIME LINO DOS SANTOS FILHO 322	f	\N	\N	51984743278	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	IGREJA EVANGELICA ASSEMBLEIA DE DEUS DA LOMBA DO PINHEIRO	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
678f6ff6-6827-45b6-af28-5c1820613a61	\N	Rua Buritis, 254 Esquina Açucena, Igara, Canoas	t	100	100	(51) 9.8119-1349	2024-05-08T16:50:30.387Z	2024-05-12T17:06:42.140Z	Abrigo Buritis - Canoas	0	-29.895960893063613	-51.152848577929134	f	Canoas	\N	\N	\N	\N
0fbd9591-ed73-4212-956d-105977191c59	\N	Av. Feitoria, 2784, Feitoria	\N	\N	\N	\N	2024-05-07T16:15:02.506Z	2024-05-07T16:15:02.506Z	Eeip Maior Pintor Do Mundo - São Leopoldo	0	-29.7611148	-51.1112818	f	São Leopoldo	\N	\N	\N	\N
983ae1d8-7192-461f-b075-15efa57fa81e	\N	R. Cel. José Maciel, 241 - Cidade Alta - Santo Antônio Da Patrulha - Rs, 95500-000	t	12	25	\N	2024-05-08T17:01:36.528Z	2024-05-10T15:58:59.999Z	Abrigo Salão Paroquial Da Cidade Alta	0	-29.8211778	-50.5175009	f	Santo Antônio Da Patrulha	\N	\N	\N	\N
b81b4e5c-798f-413d-a7cd-7ce1cfd397ee	\N	Rua Ney Castilhos Ferreira, 301 - Pedra Redonda	t	200	200		2024-05-07T01:04:24.699Z	2024-05-14T15:50:44.131Z	Morro Do Sabiá	341	-30.129124	-51.243047	t	Porto Alegre	\N	\N	\N	\N
2b586368-2785-4d18-82d5-4a4c9e1442af	\N	Rua João Guimarães 337 - Santa Cecília	t	\N	\N	51992126224	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Instituto EcoVida	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
792ef61b-0f2d-4b0f-9f10-41bbe3327bdf	\N	R. Tupi, 212 - Passo D'areia, Porto Alegre - Rs, 90010-090	t	10	112	(51) 99997-7133	2024-05-06T06:40:14.785Z	2024-05-14T18:29:52.574Z	Instituto São Francisco - Palotti	0	-30.0101547	-51.1696091	f	Porto Alegre	\N	\N	\N	\N
31ca71a6-87c5-4302-8d3b-17d3bfdd1455	\N	Av. Ipiranga, 2752 - Azenha, Porto Alegre - Rs, 90610-000	f	30	30		2024-05-14T20:09:40.964Z	2024-05-14T20:10:08.253Z	Casa Do Estudante Indígena (cei) / N~inhpyyg,gatéh,patté	0	\N	\N	f	\N	\N	\N	\N	\N
32b295fb-5b98-4987-89a6-3d45a6921b56	\N	Rua Marinho Da Silva Silveira, 480 - Santa Teresa	f	120	\N	\N	2024-05-07T16:15:00.777Z	2024-05-10T15:21:34.052Z	CTG Tropeiro Da Coxilha - São Leopoldo	170	-29.7848371	-51.1325344	f	São Leopoldo	\N	\N	\N	\N
a5b17f33-1727-48f5-8b56-f6590fcad1a3	\N	R. Borges De Medeiros, 663 - Bom Sucesso, Gravataí - Rs, 94130-110	t	170	\N	Neri Facin (51) 9.8064-5123	2024-05-11T20:53:46.423Z	2024-05-14T17:01:37.473Z	Ctg Carreteiros Da Saudade	0	\N	\N	f	Gravataí	\N	\N	\N	\N
6c0b51d2-584d-4db3-a7a7-e1a52829c257	\N	R. Marabá, 2231 - Centro Capão Da Canoa - Rs, 95555-000	t	15	120	51 51982093933	2024-05-09T00:16:04.830Z	2024-05-14T22:24:35.561Z	Paróquia Nossa Senhora De Lourdes - Capão Da Canoa	10	\N	\N	f	Porto Alegre	\N	\N	\N	\N
6e5f07c3-96ca-4dad-a6d0-ffe4583fe4e2	\N	Rua 9 de junho, 1671 - Morro da Cruz	f	\N	\N	980383905	2024-05-10T00:00:00.000Z	2024-05-14T15:14:36.460Z	Periferia Feminista	10	\N	\N	t	Porto Alegre	\N	\N	\N	\N
2b0f8271-60c3-4cce-8443-4103015313fb	\N	Dr. Salvador França, 120, Partenon	f	\N	\N	51 985991535	2024-05-10T00:00:00.000Z	2024-05-14T18:04:49.274Z	Mitra Da Arquidiocese De Poa Paroquia Sao Jorge	100	\N	\N	t	Porto Alegre	\N	\N	\N	\N
44c0ba1c-9420-4f47-a410-87a36d1bda5a	\N	Av. Getúlio Vargas, 11.001 - São José, Canoas - Rs, 92426-000	f	300	300	51 996686394	2024-05-08T16:50:37.045Z	2024-05-08T16:50:37.045Z	Cepe - Petrobras - Canoas	0	-29.8701603	-51.166382	f	Canoas	\N	\N	\N	\N
bffde3c1-e0e9-4c0d-8079-24f26dc07234	\N	Rua Santana, 440, Porto Alegre	f	\N	\N	(519) 995-5797	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Mistério Público do Rio Grande do Sul	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
e5c637ba-c46c-4a45-b325-32e17c08d2dc	\N	Av. Edgar Pires De Castro, 803 - Hípica	t	236	236	(51) 98493-2401	2024-05-06T13:38:52.529Z	2024-05-14T19:34:07.897Z	Igreja Reviver	10	-30.1566507	-51.1838467	f	Porto Alegre	\N	\N	\N	\N
4cbfb685-56b5-4e1f-89f9-52c180540e73	administrativo@nd.org.br	Av. Guilherme Schell, 5888 - Centro, Canoas - Rs, 92310-364	f	100	100	Wagner (51) 9.9561-1086	2024-05-06T03:05:03.431Z	2024-05-13T16:34:10.488Z	Colégio Maria Auxiliadora - Canoas	440	-29.9174107	-51.1831725	f	Canoas	\N	\N	\N	\N
255a9dec-f128-4be8-b58e-abf5a5afca7f	\N	R. Castilho Inácio Barcelos, 124 - Oriçó, Gravataí - Rs, 94010-450	f	1	1	Bárbara Souza (51) 9.9565-4990	2024-05-13T13:57:38.413Z	2024-05-13T23:28:52.185Z	Associação 6 De Maio - Gravataí	501	\N	\N	f	Gravataí	\N	\N	\N	\N
a87e4465-43d3-4b9e-9d55-b55c9939d3f5	\N	Rua Dr Barbosa Gonçalves 61	f	\N	\N	51 99363-5121	2024-05-10T15:45:26.130Z	2024-05-10T15:45:26.130Z	Abrigo De Animais Chácara Das Pedras	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
e93ef19e-b32a-4795-ba35-fa88dee335f1	\N	Rs-118, 3130 - Tarumã	f	\N	\N	51 8515-9692	2024-05-10T15:45:39.501Z	2024-05-10T15:45:39.501Z	Bola De Neve	0	\N	\N	f	Viamão	\N	\N	\N	\N
8476856d-1438-442e-8344-3f31db1d4e1b	\N	Av. Ipiranga, N° 5300 - Jardim Botânico Poa	f	0	0	https://www.instagram.com/35ctg_oficial/	2024-05-06T18:30:17.570Z	2024-05-14T22:42:59.095Z	35 Ctg	2990	-30.0549881	-51.1869725	f	Porto Alegre	\N	\N	\N	\N
44bff262-eddc-4024-b8e5-20d98d92a80e	\N	Rua Seis, 270	f	\N	\N	51985547186 / 51985374390	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Igreja Santos Mártires	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
4e1cce0d-c563-400f-88e7-9a7cfe13e6da	\N	Av Paraguaçu, 1780, Magistério, Balneário Pinhal	f	\N	\N	51 9 9783 9700	2024-05-10T15:45:42.747Z	2024-05-10T15:45:42.747Z	Capela São Pedro	0	\N	\N	f	Balneário Pinhal	\N	\N	\N	\N
2c6837d0-3795-4f58-aace-3d099c600b36	\N	Rua da Pedreira, 406, Águas Claras - Viamão	f	110	110	(51)982688653 / 51 98560-3384	2024-05-10T15:45:40.056Z	2024-05-11T14:38:22.555Z	CTG Tropeiros Do Morro Grande	110	\N	\N	f	Viamão	\N	\N	\N	\N
672ff58c-df3a-4a35-b087-d0f975e9a417	\N	Rua Carlos Bier, 110, Feitoria	\N	\N	\N	\N	2024-05-07T16:14:55.673Z	2024-05-07T16:14:55.673Z	Ccei Criança Jedidias - São Leopoldo	0	-29.7542768	-51.1017323	f	Feitoria	\N	\N	\N	\N
4c81bb1d-2bb9-4711-b7e1-4d17554407e9	\N	Avenida Liberdade N° 1826, Santa Isabel, Viamão	f	0	50	\N	2024-05-08T17:19:44.333Z	2024-05-12T04:11:54.338Z	Paroquia Santa Isabel - Viamão	90	-30.0656309	-51.1068945	f	Viamão	\N	\N	\N	\N
f6f8ff5e-1ee3-4a01-b0aa-656cde59abf3	\N	Rua Referendo Daniel Betts, 319, Morro Santana	f	\N	\N	(51) 984153517	2024-05-10T15:45:35.045Z	2024-05-13T12:56:22.277Z	Associação De Moradores Da Vila Tijuca - Centro De Distribuição	160	\N	\N	f	Porto Alegre	\N	\N	\N	\N
38c76dce-c5ae-4ab2-940f-e116711272a2	\N	Av. Henrique Bier, 4075 - Campina	\N	\N	\N	\N	2024-05-07T16:14:59.644Z	2024-05-07T16:14:59.644Z	CTG Sepé Tiarajú - São Leopoldo	0	-29.7284791	-51.1827903	f	São Leopoldo	\N	\N	\N	\N
0ddb7766-e9a0-4f24-a946-71c2e06f2a4a	\N	Rua Rosana Valls Hofmeister 112	f	\N	\N	51997994845	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Ginásio Nossa senhora Aparecida	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
5d7ea8ee-34d8-441a-a1f7-837a8ae94dd4	\N	Ramiro Barcelos, 996	f	28	52	(51) 98629-1257 / (51) 99720-2088	2024-05-10T15:45:29.989Z	2024-05-14T12:23:47.249Z	Colégio Nossa Senhora Do Bom Conselho	1	\N	\N	f	Porto Alegre	\N	\N	\N	\N
0e99c186-d3fa-4a48-8276-6f2eed54ed99	\N	R. Dezenove de Fevereiro, 426 - Rubem Berta	f	\N	\N	51982918774	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	LAR GUSTAVO NORDLUND 93022960000133	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
21cb4372-5f7c-44d0-8791-8de4cd1db4ea	\N	Sítio São José, Viamão	f	\N	\N	Alice (51) 3455-1803	2024-05-11T20:55:21.057Z	2024-05-11T20:55:21.057Z	Colégio Farroupilha - Sede Campestre [somente Mulheres E Crianças]	0	\N	\N	f	Viamão	\N	\N	\N	\N
76a3df8e-d473-432c-bbb2-63f2c6f8b13e	\N	Rua Araújo Ribeiro, 189, Barra Do Ribeiro	t	79	150	\N	2024-05-08T21:23:19.372Z	2024-05-14T00:36:59.642Z	Paróquia São José - Barra Do Ribeiro	0	-30.2887659	-51.3054406	f	Barra do Ribeiro	\N	\N	\N	\N
46a75d17-ebd9-4c36-b242-0d9aaaede3ab	\N	Rua Chácara Dos Bombeiros, 01 (zona Leste)	f	0	0		2024-05-07T01:04:15.601Z	2024-05-14T13:15:13.651Z	Cozinha Comunitária Vidas De Luz	250	-30.0776645	-51.1703023	f	Porto Alegre	\N	\N	\N	\N
d5d9c052-3847-4ff4-bf83-f4feda281831	\N	Cristóvão Colombo, 1085	t	25	0	(51) 993274817	2024-05-10T15:45:27.234Z	2024-05-13T19:31:42.448Z	Centro Clínico Cristóvão	310	\N	\N	t	Porto Alegre	\N	\N	\N	\N
0ab17ee3-a169-43d1-a467-88f4222c891b	\N	Nossa Senhora De Guadalupe, 249/339 - Hípica, Porto Alegre	\N	\N	\N	\N	2024-05-07T01:04:29.815Z	2024-05-07T01:04:29.815Z	Sociedade Hipica	0	-30.1629226	-51.1855185	f	Porto Alegre	\N	\N	\N	\N
811c8995-d14b-45c7-b0a5-e4cbff92abe6	\N	Avenida João Salomoni, 1085	f	29	33	51994075204	2024-05-10T00:00:00.000Z	2024-05-11T18:12:09.580Z	Associação Cultural E Social Vila Nova	50	\N	\N	t	Porto Alegre	\N	\N	\N	\N
3c534c25-b833-4606-8c8a-f830d3ed49db	\N	Rua 6 De Novembro, 332 (zona Norte)	f	0	0	54 98115 9499	2024-05-10T15:45:45.467Z	2024-05-14T13:18:15.481Z	Cozinha Comunitária Brasileirinhos	370	\N	\N	t	Porto Alegre	\N	\N	\N	\N
bfce87e3-404f-4c1d-80be-4e35211039ad	39.507.077/0001-98 ou sosrs@brasachurch.com	R. Dona Alzira, 275	t	152	180	(51) 98258-7678	2024-05-10T15:45:25.040Z	2024-05-14T03:44:34.287Z	Brasa Church Dona Alzira	3010	\N	\N	t	Porto Alegre	\N	\N	\N	\N
806120c1-8d63-4f67-9351-eb3253cad789	\N	Praça Paulo De Aragão Bozano	f	133	\N	51 991836030	2024-05-10T15:45:46.568Z	2024-05-14T01:07:42.192Z	Eeeb Gomes Carneiro	2470	\N	\N	f	Porto Alegre	\N	\N	\N	\N
65b4f855-2d15-4039-9d64-2fa252d6b0ed	\N	R. Dezenove De Fevereiro, 330	f	\N	\N		2024-05-10T15:45:32.781Z	2024-05-10T15:45:32.781Z	Emef Deputado Victor Issler	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
5aa9c420-e1f3-4736-b6ce-ebb18264e508	\N	Rio Parnaíba 50 Jardim Luciana	\N	\N	\N	\N	2024-05-07T16:15:08.236Z	2024-05-07T16:15:08.236Z	Emef Maria Emília De Paula - São Leopoldo	0	-29.70886385	-51.19054787	f	São Leopoldo	\N	\N	\N	\N
cece28cb-c379-4eda-a3bd-16856a825b82	\N	Av. Alcídes São Severiano, 99 - Sarandi, Porto Alegre - Rs, 91130-500	t	100	\N	(51) 99595-3141	2024-05-06T06:28:41.690Z	2024-05-08T23:20:49.282Z	Colégio Kennedy	0	-29.9948945	-51.1264353	f	Porto Alegre	\N	\N	\N	\N
42fbbb1e-0749-41d0-a9d8-d60a03184954	\N	Av. Martins Felix Berta, número 1.229 - Bairro Rubem Berta	f	45	\N	985508867	2024-05-10T00:00:00.000Z	2024-05-14T19:30:51.002Z	Igreja Gideão	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
65df3c42-a186-47ef-a806-a819ae4fdcc9	\N	17 de abril 150 Guajuviras canoas	t	\N	\N	984724179	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Olhos de quem ve	0	\N	\N	t	Canoas	\N	\N	\N	\N
c236641e-e700-41c1-bca5-fa9696481ee2	\N	Av Elvio antonio felipeto 39 b	f	\N	\N	51 98622-7358	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Instituto espalha do amor e conhecimento	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
b059e628-a48a-459d-be96-a413cd8a442f	\N	R. José Da Maia Martins, 178 - Mário Quintana	f	0	0		2024-05-14T20:14:34.276Z	2024-05-14T20:14:48.502Z	Centro Afro Umbandista Ile De Oxum Panda (cozinha)	0	\N	\N	f	\N	\N	\N	\N	\N
f2474450-56fd-4f80-b189-0eb91c5c54f5	\N	Rua Dona Inocência, 321, Jardim Botânico	f	0	0	51 99999-5902	2024-05-10T15:45:46.018Z	2024-05-14T22:21:56.883Z	Círculo Militar De Porto Alegre	30	\N	\N	t	Porto Alegre	\N	\N	\N	\N
bd446650-d778-439b-b343-fa7c62959584	\N	R. São Luís, 316 - Santana, Porto Alegre	\N	\N	\N	\N	2024-05-07T01:04:14.486Z	2024-05-07T01:04:14.486Z	Clinica Vet Hug	0	-30.0458351	-51.2053828	f	Porto Alegre	\N	\N	\N	\N
5577f295-484a-41bf-8b11-5848f060ee9e	\N	Rua Padre Cornélio, 33 - Partenon Porto Alegre - Rs, 91520-624	t	85	85		2024-05-06T06:29:59.865Z	2024-05-14T13:18:17.259Z	Igreja Pentecostal Deus É Amor	636	-30.0669109	-51.169641	t	Porto Alegre	\N	\N	\N	\N
9b7e286c-3350-4067-8ed1-584168af5dca	\N	R. Parlamento, 115 - Morro Santana, Porto Alegre	f	53	53	51 98245 0640	2024-05-07T01:04:11.111Z	2024-05-14T13:24:36.216Z	Aspirantes De Cristo	0	-30.0397657	-51.120779	f	Porto Alegre	\N	\N	\N	\N
fc8d1f85-1d79-4d81-aad7-260a6cb0489f	\N	Rua Corte Real,  142, Petrópolis, PORTO ALEGRE	f	\N	\N	Sérgio Viana (51) 9.9905-0452	2024-05-11T21:01:24.250Z	2024-05-12T00:03:29.653Z	IFRS - Instituto Federal do Rio Grande do Sul	10	\N	\N	f	Porto Alegre	\N	\N	\N	\N
7fb817fe-42ba-42fd-89df-792f6dd63c30	\N	Rua Primeiro de Março, 197 - Bairro São José	f	\N	\N	55 51 98300-9593	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Centro Social Murialdo	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
68107c64-61eb-4c06-8c5f-00f6c3a54e0c	\N	Rua salvador calamussi, 56 - Cavalhada, Porto Alegre	t	145	\N	\N	2024-05-06T03:05:01.751Z	2024-05-14T21:18:05.628Z	AFISVEC	1820	-30.0970283	-51.2269952	f	Porto Alegre	\N	\N	\N	\N
9f8257b0-4777-4f31-ba93-f83f0a02de41	\N	Rua Conde D’eu, 66, Santana - Porto Alegre	f	0	0	51 98155-0657	2024-05-10T15:45:30.542Z	2024-05-13T14:10:14.056Z	Ginásio Da Associação Dos Servidores Do Demhab - Ased	100	\N	\N	t	Porto Alegre	\N	\N	\N	\N
ba9f9dcc-193d-486f-9c80-536bd6fda875	\N	Av. Protásio Alves, 3839 - Petrópolis, Porto Alegre - Rs, 91310-002	f	0	0	Raphael Peter (51) 9.9943-8016	2024-05-11T20:18:23.350Z	2024-05-14T23:08:34.614Z	Ponto De Coleta Espartano Skatepark	100	\N	\N	f	Porto Alegre	\N	\N	\N	\N
9c8c6775-4c65-419e-a72c-1cd5104abf38	\N	Av. Cel. Lucas De Oliveira, 995 - Bela Vista, Porto Alegre - Rs, 90440-011	f	\N	\N		2024-05-10T15:45:49.856Z	2024-05-10T15:45:49.856Z	Art Hotel - Lucas De Oliveira (no Antigo Radisson)	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
27dc15cf-13a6-44bb-8707-0baef7dd99f1	\N	Estrada Aracaju, 651 - Vila Nova, Porto Alegre	t	129	\N	\N	2024-05-07T01:04:24.122Z	2024-05-09T14:06:30.282Z	Casa Marista Da Juventude Caju	0	-30.103381	-51.2167155	f	Porto Alegre	\N	\N	\N	\N
8e93096a-3a67-49a6-a771-452399296124	\N	Av. Loureiro Da Silva, 150 - Cidade Baixa, Porto Alegre - Rs, 90010-420	t	0	0		2024-05-14T20:30:20.430Z	2024-05-14T20:54:14.773Z	Hospital De Campanha Veterinário - Orla	300	\N	\N	t	\N	\N	\N	\N	\N
be96408c-d616-47b2-8208-f89eabeeffec	\N	Rua Dezessete, 80 - Bom Jesus, Porto Alegre	f	95	\N	(51) 9.9217‑5830	2024-05-07T17:48:22.983Z	2024-05-12T18:07:36.027Z	Bom Jesus	220	-30.049025	-51.1635534	f	Porto Alegre	\N	\N	\N	\N
0959c7c1-5b77-412b-a2e7-c412ccb4fe37	\N	Rua Manoel Bitencourt, 744	f	\N	\N	51985768516	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Amigos pelo Rs	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
b818a598-5d62-46cf-867c-ece997cb5856	\N	Av. Francisco Silveira Bitencourt, 1135 - Sarandi, Porto Alegre - Rs, 91150-010	f	0	0	(51) 98430-3400 / (51) 99661-9142	2024-05-06T03:04:53.920Z	2024-05-12T21:51:25.567Z	Igreja Batista Do Passo Da Areia	1250	-29.9933507	-51.1188121	t	Porto Alegre	\N	\N	\N	\N
77d5b27a-9034-4424-a3da-ee4311c3e2d2	\N	Rua Salvador Calamucci, 56 - Cavalhada, Porto Alegre, 91740-280	t	140	\N	\N	2024-05-07T20:48:04.661Z	2024-05-09T19:52:51.061Z	Associação Dos Auditores Fiscais Da Receita Estadual Do Rs (afisvec)	0	-30.0970283	-51.2269952	f	Porto Alegre	\N	\N	\N	\N
e8de6533-d059-4a9a-b2d4-e293a68a5325	\N	R. Portugal, 544 - São João, Porto Alegre - RS, 90520-310	t	0	\N	\N	2024-05-06T03:04:42.155Z	2024-05-14T20:26:35.562Z	Clínica Ametista	412	-30.0134283	-51.1831512	f	Porto Alegre	\N	\N	\N	\N
de4d524d-fd58-45b9-96e6-7b6748b06119	\N	R. Ivo Janson, 31 - Partenon, Porto Alegre - RS, 91530-070	f	140	\N	\N	2024-05-06T03:04:46.078Z	2024-05-09T22:22:20.188Z	CTG Sentinela dos Pampas	0	-30.0577332	-51.1595201	f	Porto Alegre	\N	\N	\N	\N
347d33a1-618b-4fd7-81b0-3412fd3bc6f7	\N	Rua Tenente Ari Tarragô, 61, Aparício Borges - Porto Alegre	f	\N	\N	(51) 9.8191-3869	2024-05-10T00:00:00.000Z	2024-05-12T17:49:45.934Z	Aesppom	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
09e1c5fe-c4a4-442d-a638-94f55fcc5be0	\N	Rua Antonio da Silveira 7325 Lomba do Pinheiro	f	75	\N	51984968775	2024-05-10T00:00:00.000Z	2024-05-13T14:54:46.252Z	Ginásio Aliança	1310	\N	\N	t	Porto Alegre	\N	\N	\N	\N
de500277-1e1d-47dc-96a4-349b3d4051d2	\N	R. Bôrtolo Barbieri, 80 - Jardim São Pedro, Porto Alegre - Rs, 91040-160	t	108	111	(51) 9.8553-4090	2024-05-06T18:36:27.232Z	2024-05-15T02:29:09.218Z	Paróquia Divino Espírito Santo	1072	-30.0049773	-51.1652791	f	Porto Alegre	\N	\N	\N	\N
c8811d17-3f2a-41be-9646-0f214278cec1	\N	Avenida Cristovão Colombo, 951 - Porto Alegre - RS	f	0	\N	(51) 98304-0111	2024-05-10T00:00:00.000Z	2024-05-14T14:41:10.878Z	IGREJA ADVENTISTA DO SETIMO DIA - COMUNIDADE MOINHOS	1480	\N	\N	t	Porto Alegre	\N	\N	\N	\N
446e4dc9-c485-47bb-8f49-3107c097e735	\N	Rua mali, 405 - Cristo Redentor, Porto Alegre	t	190	\N	\N	2024-05-06T03:05:01.192Z	2024-05-15T01:14:38.913Z	Colégio Santa Doroteia	250	-30.0145034	-51.1494325	f	Porto Alegre	\N	\N	\N	\N
14280a63-eaea-4d1e-bdd3-49a48634d43f	\N	Av. Ipiranga, 8223 - Jardim Botânico, Porto Alegre	f	\N	\N	\N	2024-05-07T01:04:12.798Z	2024-05-14T18:38:33.607Z	Bnb Church	1111	-30.0579891	-51.1547882	f	Porto Alegre	\N	\N	\N	\N
b9585f55-85ee-47d0-a6f2-2787b49962b8	\N	R. Dona Alzira, 417 - Sarandi, Porto Alegre - Rs, 91110-010	t	\N	\N	Carine Frank (51) 9.9202-9708	2024-05-11T20:53:02.549Z	2024-05-15T00:36:39.205Z	Pet Alzira - Oficina Dhl [somente Pet]	1601	\N	\N	f	Porto Alegre	\N	\N	\N	\N
1d116975-3072-47b5-85da-44eac0fb4b3b	\N	80 E 81, Av. Ipiranga, 6690 - Partenon, Rs, 90619-900	t	255	255	https://chat.whatsapp.com/FThTzwV6WJd3HdJCFRwWOT	2024-05-06T03:04:56.173Z	2024-05-14T22:23:38.569Z	Pucrs - Parque Esportivo	410	-30.0553383	-51.1736419	t	Porto Alegre	\N	\N	\N	\N
fbe32f25-fa62-422d-823d-f388000f47d4	\N	Av. Manoel Elias, 2001 - Passo Das Pedras, Porto Alegre - Rs, 91240-261	t	160	160	51 981405764	2024-05-07T00:47:52.793Z	2024-05-14T23:36:57.113Z	Uniritter - Campus Fapa	1880	-30.0330961	-51.121655	t	Porto Alegre	\N	\N	\N	\N
30266468-96d0-487e-b2df-65e0ab1095e3	\N	Rua Arroio Do Sal, 55, Bairro Estância Velha - Canoas	f	180	200	Antoni (51) 9.92651184 / Yasmin (51) 9.80527719	2024-05-08T00:10:22.760Z	2024-05-14T17:14:30.166Z	Eeem Profª Margot Terezinha Noal Giacomazzi	1470	-29.90791	-51.147272	f	Canoas	\N	\N	\N	\N
1738716a-eec9-40b6-852b-54c4abbf1b11	\N	Avenida Principal Da Ponta Grossa, 191 - Ponta Grossa	t	28	34	Doações e Abrigados (51) 98486 8136 / Voluntariado (51) 99945 9334	2024-05-10T15:45:31.665Z	2024-05-14T04:20:26.477Z	Associação Beneficiente Casa De Abraão	440	\N	\N	t	Ponta Grossa	\N	\N	\N	\N
1371b350-16b4-45b5-b85a-35088cfdfee5	\N	Rua General Caldwell, 1022 - Menino Deus Porto Alegre - Rs, 90160-091	f	12	50	51 3223 1243	2024-05-14T14:21:04.052Z	2024-05-14T17:33:12.912Z	Paróquia Nossa Senhora De Lourdes De Porto Alegre - Abrigo Feminino E Infantil	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
7f7fa718-3d08-4225-ae3d-310689c59d48	\N	Estrada Bruno Wulff, 565 - Distrito De Santa Tecla, Gravataí - Rs, 94110-300	t	71	500	Caroline M. Martins - (51) 9.9983-7510	2024-05-08T21:16:52.968Z	2024-05-13T18:17:57.429Z	Academia Seicho-no-ie - Santa Tecla - Gravataí	0	-29.8247604	-51.0314094	f	Gravataí	\N	\N	\N	\N
22bed38e-c1bd-4a4e-b13b-1b5091853655	\N	Rua Beco Dos Soares, 1045 - São Lucas Viamão - Rs, 94450-440	f	14	46	\N	2024-05-14T14:28:05.111Z	2024-05-13T14:28:05.111Z	Igreja Deus É Amor De Viamão	0	\N	\N	f	Viamão	\N	\N	\N	\N
c9ea8c23-dd6a-45f8-88fd-889afd1d7fca	\N	Rua Deodoro, 250, Mário Quintana	f	68	69	998692107	2024-05-10T00:00:00.000Z	2024-05-11T20:25:06.845Z	Lar Esperança	330	\N	\N	t	Porto Alegre	\N	\N	\N	\N
b13dc73f-b5cb-453b-9f61-28d096b4c685	\N	R. Tilápia, 100 - Lomba Do Pinheiro, Porto Alegre - Rs, 91550-350	f	70	70		2024-05-14T20:53:31.837Z	2024-05-14T20:53:52.656Z	Quilombo Família Ouro	0	\N	\N	t	\N	\N	\N	\N	\N
8ca0918c-d4ab-4afe-aaca-acc1d963ca80	\N	DR SALVADOR FRANÇA 1800	f	\N	\N	51999465808	2024-05-10T00:00:00.000Z	2024-05-12T20:05:43.896Z	Sociedade dos Surdos do Rio Grande do Sul - SSRS	20	\N	\N	t	Porto Alegre	\N	\N	\N	\N
c07ad79d-51ec-4b06-aeeb-2bc5492e5b7d	12985967000159	Bairro Medianeira; Entrada Pela Azenha	f	\N	\N		2024-05-06T03:04:51.107Z	2024-05-14T18:32:08.874Z	Estádio Olímpico Monumental	750	-30.0690898	-51.211145	f	Porto Alegre	\N	\N	\N	\N
e9658190-7322-47b3-90dd-87b0ea36ac7c	\N	Praça Paulo de Aragão Bozano - Vila Ipiranga	f	\N	\N	51996036835	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Abrigo gomes carneiro	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
cec93d9b-4cdc-42fc-9fc8-29b0a1ddbaba	\N	Butui 420	f	\N	\N	5,55199E+12	2024-05-10T00:00:00.000Z	2024-05-13T20:37:07.357Z	Instituto Social do Cristal	41	\N	\N	t	Porto Alegre	\N	\N	\N	\N
b4d66a6f-7cd0-4864-801c-2170744bc72b	\N	R. Gonçalves Dias, 700 - Menino Deus, Porto Alegre RS, 90130-060	f	252	\N	https://chat.whatsapp.com/IfqeUKTePcQLKr5sNeJUf4	2024-05-06T03:04:41.591Z	2024-05-14T21:42:17.488Z	CETE Menino Deus	930	-30.0566012	-51.2196691	f	Porto Alegre	\N	\N	\N	\N
7645eda9-f6d3-4640-afb4-31a712698a80	\N	Rua 3, Nº 178 - Vila Das Laranjeiras - Morro Santana - Porto Alegre	f	150	\N	Isaías (51) 9.8192-6813	2024-05-10T16:01:53.787Z	2024-05-13T18:23:15.079Z	Associação Missionária Sos - Resgatando Vidas	3700	\N	\N	t	Porto Alegre	\N	\N	\N	\N
bc133f46-b2e2-4560-8074-49512936042c	\N	R. Ângelo Barcelos, 35	f	\N	\N	51994040207	2024-05-10T15:45:37.271Z	2024-05-11T14:11:18.533Z	Igreja Quadrangular Shammah	100	\N	\N	f	Porto Alegre	\N	\N	\N	\N
0d3571e1-9647-4419-929e-2f0707fcc4a9	\N	Av. Cel. Marcos, 1085 - Ipanema, Porto Alegre - Rs, 91760-000	t	\N	\N	55 51 9430-1313	2024-05-06T18:31:43.990Z	2024-05-12T09:09:50.639Z	Enjoy Sushi	110	-30.12439	-51.24562	f	Porto Alegre	\N	\N	\N	\N
66665836-5d56-4596-ae37-0dd7c86576f5	\N	Endereço: Av. Padre Cacique, 2893 - Cristal, Porto Alegre - Rs, 90810-240	f	0	\N	\N	2024-05-06T06:40:57.551Z	2024-05-13T03:15:31.059Z	Shopping Pontal	20	-30.0792726	-51.2473516	f	Porto Alegre	\N	\N	\N	\N
97ef5b90-6f9b-4adb-bd07-086e7330b745	\N	R. Ouro Preto, 785 - Jardim Floresta, Porto Alegre - Rs, 91040-610	t	95	95	(51) 9.8134-7851 / (51) 9.8195-93386	2024-05-10T15:45:28.315Z	2024-05-13T05:57:06.051Z	Nexos Ibn Church	30	\N	\N	f	Porto Alegre	\N	\N	\N	\N
6a01e68e-80ac-4f18-bf95-5e8b64edf1ee	\N	Av. Érico Veríssimo, s/n - Menino Deus, Porto Alegre - RS, 90160-180	\N	\N	\N	\N	2024-05-06T03:04:58.959Z	2024-05-08T03:14:00.535Z	Tesourinha [DESATIVADO]	100	-30.0514981	-51.2182643	f	Porto Alegre	\N	\N	\N	\N
4503dfb5-e361-444e-92c2-f8b4409e3ca2	\N	R. Das Azaléias, 189 - Igara Ii, Canoas - Rs, 92410-520	f	200	200		2024-05-08T16:50:36.336Z	2024-05-14T18:49:31.462Z	Amorji (associação Igara) - Canoas [desativado]	210	-29.9001427	-51.1556636	f	Canoas	\N	\N	\N	\N
59b57c26-312d-4cfc-aef8-722657679213	\N	R. Dom Bosco, 103 - Glória, Porto Alegre - Rs, 91110-460	t	78	78		2024-05-06T03:04:43.838Z	2024-05-11T20:07:45.605Z	Colégio Marista Assunção	0	-30.0754208	-51.2029509	f	Porto Alegre	\N	\N	\N	\N
f6f53aae-9c33-43e0-8656-c323d475cb00	\N	R. Dr. Barbosa Gonçalves 61, Chácara Das Pedras, Porto Alegre	f	0	\N	(51) 9.9363-5121	2024-05-06T14:20:07.726Z	2024-05-14T05:44:02.565Z	Casa De Abrigo De Animais Chácara Das Pedras	3921	-30.0350946	-51.1617453	f	Porto Alegre	\N	\N	\N	\N
51077fad-c591-4849-b1d7-08d05faeec96	\N	Rua Cristopher Levalle, 74 - São Borja	\N	\N	\N	\N	2024-05-07T16:14:50.637Z	2024-05-10T15:58:56.194Z	Aabb - São Leopoldo	140	-29.7994986	-51.1058662	f	São Borja	\N	\N	\N	\N
29d92bc5-933f-45cd-acf9-3dcedaf83874	\N	Rua Jacob F Rieth, 314, Jardim América	\N	\N	\N	\N	2024-05-07T16:15:01.364Z	2024-05-07T16:15:01.364Z	Eeip Aquarela Kids - São Leopoldo	0	-29.7789096	-51.1285887	f	São Leopoldo	\N	\N	\N	\N
e57048e9-f927-4f68-b680-975504367292	\N	Av. Assis Brasil, 164 - São João, Porto Alegre	\N	\N	\N	\N	2024-05-07T01:04:21.232Z	2024-05-07T01:04:21.232Z	Estacionamento Bourbon Assis Brasil	0	-30.0063911	-51.1843574	f	Porto Alegre	\N	\N	\N	\N
cbe93aa2-47a4-4ee8-9fd8-500fc5182f31	\N	Rua Carlos Dienstbach, 347 - Rondônia, Novo Hamburgo - 93415-270	f	\N	\N	(51) 99688-4542	2024-05-10T15:45:50.959Z	2024-05-11T19:12:18.501Z	Igreja Adventista Do Sétimo Dia	0	\N	\N	f	Novo Hamburgo	\N	\N	\N	\N
3110fe64-dcab-4654-8a3b-e9853e5c1a3d	\N	Av. Delmar Rocha Barbosa, 234	t	115	120	51 99112 0296 / 51 99184 1831 / 51 991636429	2024-05-10T15:45:38.381Z	2024-05-11T20:58:27.047Z	Escola São Francisco - Santa Fé	120	\N	\N	f	Porto Alegre	\N	\N	\N	\N
68cab6a0-52a4-4239-b146-2ee6309699bf	\N	Av. Feitoria, 3171 - Feitoria, São Leopoldo	f	\N	\N		2024-05-10T15:45:55.861Z	2024-05-10T15:45:55.861Z	Sociedade Grêmio Atlético Mauá	0	\N	\N	f	São Leopoldo	\N	\N	\N	\N
0311b68c-4e53-48be-aafa-7bdffac559b1	\N	Av. João Pessoa, 75 - Centro Histórico, Porto Alegre - Rs, 90040-000	f	\N	\N	+55 54 9685-6405	2024-05-10T15:45:43.822Z	2024-05-10T15:45:43.822Z	Centro Do Estudante Universitário (ceu)	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
36cce5cd-0aa3-4815-98f5-d6c50e6c48d1	\N	Rua Rio Tietê, 510 - Arroio Da Manteiga, São Leopoldo	f	\N	\N		2024-05-10T15:45:52.031Z	2024-05-10T15:45:52.031Z	Associação De Moradores Do Parque Jardim Luciana	0	\N	\N	f	São Leopoldo	\N	\N	\N	\N
3972d909-d0fd-43bb-aca1-890c4299b5b0	\N	R. Jorge Meyer, 108 - Feitoria, São Leopoldo	f	\N	\N		2024-05-10T15:45:56.404Z	2024-05-10T15:45:56.404Z	Igreja Batista Da Feitoria	0	\N	\N	f	São Leopoldo	\N	\N	\N	\N
68e2c941-920d-4677-8a32-fbdbbdf6ae8b	\N	Av. Aureliano De Figueiredo Pinto, 620 - Praia De Belas, Porto Alegre - Rs, 90050-190	f	1	1	Dr. Lamachia (51) 9.9961-4432	2024-05-13T14:58:18.964Z	2024-05-13T14:58:18.964Z	Oab - Praia De Belas	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
c60edc35-e1b0-450b-862d-5bc10c97b1f0	\N	R. Deodoro, 80 - Mário Quintana Porto Alegre - Rs, 91260-370	f	0	0		2024-05-14T14:32:05.146Z	2024-05-14T14:32:48.242Z	Cozinha Comunitária Tia Helena	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
7ab41d9b-d98d-45ba-a5b8-cc9e9e81a2c3	\N	Rua Tarcila Moraes Dutra, 140 - Rubem Berta, Porto Alegre	f	0	0	(51)993833784	2024-05-14T23:20:50.033Z	2024-05-14T23:39:06.206Z	Centro Popular De Cultura - Centro De Distribuição De Doações (para Pessoas Na Casa De Familiares)	221	\N	\N	t	\N	\N	\N	\N	\N
2bcef6eb-c411-4757-b409-3dd3a8da08af	\N	Av. José Loureiro Da Silva, 655 - Gravataí	f	\N	\N	51 99997-5520	2024-05-10T15:45:53.678Z	2024-05-10T15:45:53.678Z	Colégio Dom Feliciano	0	\N	\N	f	Gravataí	\N	\N	\N	\N
92b6a9f7-0e55-42dc-b8f4-4e2db29d9e32	\N	Rua Caramuru N° 330, Centro - Canoas	f	\N	\N	(51)980389784	2024-05-10T15:45:44.381Z	2024-05-10T15:45:44.381Z	Sindicado Dos Metalúrgicos Canoas	0	\N	\N	f	Canoas	\N	\N	\N	\N
8c7084b7-cdc9-47c3-80f5-81d4c671411a	\N	Av. Gen. Daltro Filho, 859 - Hamburgo Velho, Novo Hamburgo - Rs, 93540-005	f	1	1	Angela (51) 9.91095255	2024-05-13T15:05:40.551Z	2024-05-13T15:05:40.551Z	Princess Candy Cafeteria	0	\N	\N	f	Novo Hamburgo	\N	\N	\N	\N
d4be8782-a7d0-4516-b016-a9a7adcda9c9	\N	R. Roque Gonzáles, Sn - Cristo Rei, São Leopoldo	f	\N	\N		2024-05-10T15:45:56.954Z	2024-05-10T15:45:56.954Z	Eeemédio Cristo Rei	0	\N	\N	f	São Leopoldo	\N	\N	\N	\N
e4933f45-3268-425d-a7e4-484a1ee8e24e	\N	AV IPIRANGA 2485, BAIRRO SANTANA, PORTO ALEGRE, CEP 90610-001 - RS.	f	0	\N	51994433672	2024-05-10T00:00:00.000Z	2024-05-14T18:28:36.276Z	SOCIEDADE RECREATIVA BENEFICENTE CULTURAL FIDALGOS E ARISTOCRATAS	363	\N	\N	t	Porto Alegre	\N	\N	\N	\N
d0e91a2e-9480-43c8-89f6-24e887643e46	\N	Rua Dário Borba Brossard, 39, Porto Alegre	f	100	100	Dari Pereira	2024-05-08T21:19:30.166Z	2024-05-08T21:19:30.166Z	Aliança	0	-30.0154042	-51.1093424	f	Porto Alegre	\N	\N	\N	\N
a9800bb5-6b8b-48f7-9779-db304fa1b9b3	\N	Rua Vidal De Negreiros, 1652 - Bairro São José.	f	10	10	(51) 98277-5161	2024-05-10T15:45:48.751Z	2024-05-14T19:37:04.542Z	Coletivo Autônomo Morro Da Cruz	50	\N	\N	f	Porto Alegre	\N	\N	\N	\N
0800730f-6575-4685-9b6b-33b7c04d816e	\N	Av. Mathilde Trein Renner, 55 - Vila Ipiranga, Porto Alegre - Rs, 91370-050	f	1	1	André Sträher  (51) 9.9332-5337	2024-05-13T18:24:34.986Z	2024-05-13T18:24:34.986Z	Colégio Sinodal Do Salvador - Porto Alegre	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
683ccc75-0e59-4274-b22f-bc345bf2a4f9	\N	Vereador Moisés Bonetti, 50, Santa Cecilia, Viamão.	t	186	\N		2024-05-10T15:45:44.931Z	2024-05-12T18:22:50.838Z	Cie Altair Cantini	0	\N	\N	f	Viamão	\N	\N	\N	\N
b097abe3-1680-4a2f-b582-83c46a79d698	\N	Av. Inconfidência, 1231 - Mal. Rondon, Canoas	f	\N	\N		2024-05-10T15:45:54.213Z	2024-05-12T20:30:29.481Z	Colégio Ulbra - Cristo Redentor - Canoas	0	\N	\N	f	Canoas	\N	\N	\N	\N
1d430ba5-9209-4eb7-9d29-064020b9e12e	\N	Rua Beco Dos Soares 765, São Lucas, Viamão	f	\N	\N	(51) 9.9292-7070	2024-05-10T15:45:51.494Z	2024-05-12T16:58:08.226Z	Abcrei	0	\N	\N	f	Viamão	\N	\N	\N	\N
5c3a2bbf-3603-4741-ae95-9d89a889351e	\N	Juarez Tavora, 550	f	\N	\N	51 984464995	2024-05-10T15:45:40.597Z	2024-05-13T13:56:25.515Z	Escola Estadual Jeronimo De Albuquerque	270	\N	\N	f	Porto Alegre	\N	\N	\N	\N
b2c2178e-06d2-4c9a-95dc-638e72e8d990	\N	Av. Santos Ferreira, 3850, Bairro Estância Velha - Canoas	t	250	130	(51) 99950-6950	2024-05-08T16:50:34.266Z	2024-05-14T18:38:55.942Z	Paróquia Santa Luzia - Canoas	1560	-29.9242876	-51.1414281	t	Canoas	\N	\N	\N	\N
d0d0461e-3c55-444a-ad30-73bbb7c1f4e5	\N	Estrada Armando Inácio Da Silveira, 331, Extrema, Porto Alegre	f	\N	\N	(51) 9.9886-8147	2024-05-10T00:00:00.000Z	2024-05-12T17:52:05.125Z	Aldeia Indígena Van Ka	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
e92f75ee-7983-4d40-aa83-6c125389988b	\N	Rua Riachuelo 600, Centro Histórico, Porto Alegre	f	0	0		2024-05-15T00:04:21.879Z	2024-05-15T00:04:40.897Z	Igreja Nossa Senhora Das Dores	0	\N	\N	t	\N	\N	\N	\N	\N
1a897e88-5092-4071-a4ae-94b887867191	\N	R. Felipe Neri, 78 - Auxiliadora, Porto Alegre - Rs, 90440-150	t	85	85	51 993695577	2024-05-06T18:35:41.360Z	2024-05-14T18:03:33.257Z	Casa Da Criança Nossa Senhora Auxiliadora	790	-30.0231652	-51.1949675	t	Porto Alegre	\N	\N	\N	\N
02120e18-7ac1-4eaa-8b90-95acb5b9dbf8	\N	Lucas de Oliveira 2746 - POA	f	\N	\N	51 998862151	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Sociedade Espírita Maria de Nazaré	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
37a4f87e-e0b8-4dea-a118-e6f1fb4097a3	\N	Av. Ipiranga, 2752 - Azenha, Porto Alegre - Rs, 90610-000	f	0	0		2024-05-14T14:52:28.385Z	2024-05-14T14:52:49.163Z	Faculdade De Farmácia Ufrgs	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
ecd88536-268f-468d-9a9a-adb4074deb04	\N	R. Veador Porto, 241 - Santana, Porto Alegre - Rs, 90610-200	f	\N	\N	Deborah (51) 9.9345‑2222 / (51) 9.8585-3708	2024-05-10T00:00:00.000Z	2024-05-13T14:10:12.477Z	Sindicatos Dos Gráficos De Porto Alegre - Ginásio	500	\N	\N	t	Porto Alegre	\N	\N	\N	\N
68e21fa2-d500-4d68-9d13-fc869d1753e1	\N	Av. Inconfidência, 1231 - Bairro Mal. Rondon, Canoas	f	\N	\N	(51) 9.9621-6499	2024-05-06T06:26:39.694Z	2024-05-12T18:10:24.969Z	Colégio Cristo Redentor - Canoas	101	-29.92151274	-51.1693024	f	Canoas	\N	\N	\N	\N
efaaacc6-4553-4070-992c-73cc8d23bb1f	\N	Rua Alberto Scherer, 743 - Jardim América	\N	\N	\N	\N	2024-05-07T16:15:20.958Z	2024-05-09T06:56:07.155Z	Sesi - São Leopoldo	10	-29.7755717	-51.1312014	f	São Leopoldo	\N	\N	\N	\N
37c914da-7334-46ea-9c73-1f7513500268	\N	Rua Cipó, 450 - Vila Ipiranga, Porto Alegre (ginásio Da Ielb)	f	180	\N	(51) 992700179	2024-05-10T15:45:33.878Z	2024-05-14T22:13:07.819Z	Bc - Abrigo Cipó (brasa Church Vila Ipiranga)	1151	\N	\N	f	Porto Alegre	\N	\N	\N	\N
c978c13d-2f77-48e6-bfb7-cbb560b89ae0	\N	Rua Argemiro Ogando Corrêa, 220 - Serraria, Porto Alegre	f	50	\N	\N	2024-05-07T01:04:18.982Z	2024-05-11T20:48:01.421Z	Escola Custódio	180	-30.1645397	-51.2281356	f	Porto Alegre	\N	\N	\N	\N
9019bf0d-0364-4b8c-b1ef-57d748cd086c	\N	R. Carlos Huber, 425 - Três Figueiras, Porto Alegre - Rs, 91330-150	t	40	\N		2024-05-10T15:45:47.661Z	2024-05-14T20:58:45.031Z	Colégio Farroupilha	500	\N	\N	f	Porto Alegre	\N	\N	\N	\N
125e8961-15bc-4e42-b4f4-6848a7b1b487	\N	R. Felizardo, 750 - Jardim Botânico, Porto Alegre - RS, 90690-200	t	580	\N	https://chat.whatsapp.com/GPWQtgnCHEiIHGs29KKnfp	2024-05-06T03:04:50.554Z	2024-05-14T19:40:30.135Z	ESEFID	3561	-30.0509364	-51.1825257	f	Porto Alegre	\N	\N	\N	\N
aca9f2ce-5d63-4a82-9831-56218267f324	\N	Tv. Cmte. Gustavo Cramer, 90 - Jardim Lindóia, Porto Alegre - RS, 91050-190	t	257	\N	\N	2024-05-06T03:04:54.479Z	2024-05-13T14:00:33.381Z	Lindóia Tênis Clube	2010	-30.0028995	-51.1517602	f	Porto Alegre	\N	\N	\N	\N
3e40b540-1afd-4a07-ad06-07f8af9974b6	\N	Av. Rodrigues Da Fonseca, 1459 - Vila Nova, Porto Alegre - Rs, 91740-800	t	78	78	Fernanda Furtado (51) 9.9307-6284 / Symon (51) 9.9552-2912	2024-05-10T16:02:29.407Z	2024-05-14T01:05:52.374Z	Centro Paroquial São José Da Vila Nova (paróquia)	1150	\N	\N	t	Porto Alegre	\N	\N	\N	\N
d4b86f11-de90-46cd-b0d6-a8cf4c1e8bd7	\N	Av. Alcídes São Severiano, 100 - Sarandi, Porto Alegre - RS, 91130-500	f	0	\N	\N	2024-05-06T03:04:43.288Z	2024-05-11T20:37:21.472Z	Colégio Luterano da Paz	20	-29.9960749	-51.1256287	f	Porto Alegre	\N	\N	\N	\N
765a9b71-222f-425d-8eed-4ff5b8559d9f	\N	Av. Ignês E Fagundes, 1248-1210 - Restinga, Porto Alegre	t	31	50	Luciana (51)9.8460-7739	2024-05-07T01:04:22.973Z	2024-05-13T15:52:25.068Z	Igreja Casa Church Restinga	90	-30.14627853	-51.14499769	t	Porto Alegre	\N	\N	\N	\N
25099d81-7376-4062-9f96-8379695d9aa7	\N	Rua Cinco, 20, Vila Das Laranjeiras (ao Lado Do Posto De Saúde), Morro Santana, Porto Alegre	f	190	\N		2024-05-07T01:04:12.238Z	2024-05-14T14:56:27.571Z	Associação De Moradores Da Vila Das Laranjeiras/morro Santana	300	-30.0468476	-51.1293184	f	Porto Alegre	\N	\N	\N	\N
79f05644-27f7-4e06-908b-1611d4b477ed	\N	R. Caiapó, 96 - Vila Monte Carlo Cachoeirinha - Rs, 94940-040	f	50	100	\N	2024-05-08T17:07:23.869Z	2024-05-13T16:58:33.709Z	Igreja Ressurreição	1100	-29.9367563	-51.0882675	f	Cachoeirinha	\N	\N	\N	\N
135f566a-8664-4a28-8667-76873f0dc18e	\N	Rua Napoleão Laureano Sem Número	f	76	76	51996181013	2024-05-10T00:00:00.000Z	2024-05-12T18:42:55.597Z	Paróquia Nossa Senhora De Fátima	90	\N	\N	t	Porto Alegre	\N	\N	\N	\N
e34189e8-c23c-469f-98d7-c002bb958eae	\N	Rua Da Conceição, Floresta 388	f	\N	\N	51 98317-5827	2024-05-10T15:45:49.304Z	2024-05-10T15:45:49.304Z	Igreja Pentecostal Videira Verdadeira	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
c03f447f-ac67-4d13-aa8f-01a1dc004d69	26823743000155	Rua Fernando Pessoa, Nº 300, Bairro Vila Nova - Porto Alegre	f	18	\N	Joel (51) 9.9396-5031 e Andressa (51) 9.9235-8004	2024-05-10T16:02:14.136Z	2024-05-14T20:02:37.463Z	Associação Recreativa E Cultural Sport Vida	15030	\N	\N	t	Porto Alegre	\N	\N	\N	\N
429fc597-b5ed-4224-8401-54668f171d19	\N	R. Dr. Mário Totta, 1252 - Tristeza, Porto Alegre - Rs, 91920-130	t	113	\N	55 51 9152-8876	2024-05-06T18:31:26.509Z	2024-05-14T17:39:25.734Z	Colegio Mae De Deus	3320	-30.1120498	-51.248415	f	Porto Alegre	\N	\N	\N	\N
8e60ec23-4f86-4652-b012-930b6dae8df0	\N	R. Cel. Aparício Borges, 2001 - Glória, Porto Alegre - Rs, 90680-570	t	350	\N		2024-05-06T03:04:52.222Z	2024-05-14T16:54:44.255Z	Aparício Ginásio Da Brigada Militar	1140	-30.0707825	-51.1870114	f	Porto Alegre	\N	\N	\N	\N
c2e7b07a-6424-4a5b-8289-35e148954deb	(51) 98912-1488	R. Dona Alzira, 420 - Sarandi, Porto Alegre - Rs, 91110-010	f	60	\N	Emerson (51) 9.8912-1488	2024-05-07T01:04:09.440Z	2024-05-15T00:18:57.635Z	Abba Igreja	310	-30.0063804	-51.1384687	f	Porto Alegre	\N	\N	\N	\N
38f670ff-43a1-4889-b56f-1deeb4f6b26f	\N	R. Caeté, 328 - Vila Assunção, Porto Alegre - Rs, 91900-180	t	113	113		2024-05-07T22:12:30.701Z	2024-05-15T01:39:43.995Z	Escola Estadual Santos Dumont	530	-30.1026238	-51.260195	t	Porto Alegre	\N	\N	\N	\N
b46a7556-56c6-4fec-83b5-2eb0fcf8810a	\N	Rua São leopoldo 754- Alvorada	f	\N	\N	98490-3974	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Associacao Comercial	0	\N	\N	t	Alvorada	\N	\N	\N	\N
e0d69bb1-21c7-4b00-9e34-fdac26534a02	\N	Rua Coronel Lafayete Cruz, 680 - Estância Velha - Canoas	f	\N	\N	51981778039	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Associação Brasileira da Igreja de Jesus Cristo dos Santos Dos últimos dias	0	\N	\N	t	Canoas	\N	\N	\N	\N
01578572-338e-4ddd-941f-ebfe6fa0e155	\N	Av. Farroupilha, 5680 - Mal. Rondon, Canoas - RS, 92020-476	f	200	200	(51) 9.9194-3734	2024-05-10T00:00:00.000Z	2024-05-14T14:58:54.956Z	Escola Adventista - Canoas	50	\N	\N	t	Canoas	\N	\N	\N	\N
c8961acc-55b0-47c8-9add-ec746924eb48	\N	R. Joaquim Silveira, 738 - São Sebastião, Porto Alegre - Rs, 91060-320	f	104	104	51 93567660	2024-05-14T12:46:22.214Z	2024-05-14T13:47:36.384Z	Eeef Ana Neri	200	\N	\N	t	Porto Alegre	\N	\N	\N	\N
2d2a7228-8ab1-464d-b30c-44d73ae857ca	\N	Rua Tomaz Gonzaga, 466 - Boa Vista, Porto Alegre - Rs, 90480-201	f	0	0	51 99115 3046	2024-05-14T12:43:14.280Z	2024-05-14T21:26:22.764Z	Colégio Província De São Pedro	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
40a991ef-e1ad-44c7-bbdb-633e13be4a53	\N	Av. Benjamin Constant, 1653 - São Geraldo, Porto Alegre - Rs, 90550-005	f	0	0	51 99892 8141	2024-05-14T12:47:52.154Z	2024-05-14T12:57:42.772Z	Igreja Evangélica Batista Betel De Porto Alegre	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
733fda1d-2f0f-41c3-b20b-6aae3d4a1d9a	\N	Rua Reinaldo Becker, 168 - Scharlau	\N	\N	\N	\N	2024-05-07T16:15:23.302Z	2024-05-11T00:01:50.061Z	Sociedade União - São Leopoldo	2200	-29.7310037	-51.1522095	f	São Leopoldo	\N	\N	\N	\N
9b5a37c7-5323-4d07-bd0e-7136b7a324de	\N	R. Ulisses Pímentel, 391 - Tamandaré, Esteio - Rs, 93260-440	f	0	0	 51 98539 6780	2024-05-14T12:45:41.538Z	2024-05-14T12:54:49.528Z	Salão De Festas Kau	0	\N	\N	t	Esteio	\N	\N	\N	\N
8397dd8c-c491-4e70-88ad-e124669b59ea	\N	Av. Eng. Francisco Rodolfo Simch, 311 - Sarandi, Porto Alegre - Rs, 91130-210	f	30	30	51 99892 8141	2024-05-14T12:48:38.731Z	2024-05-14T12:58:06.986Z	Nova Química Do Sul	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
d0b27e7f-9ef1-4fbe-a15a-36af6ad2eaa9	\N	Rua Irmão José Otão, 11 (entrada Do Abrigo., Pela Rua De Trás Da Entrada Principal Do Colégio.)	f	200	200		2024-05-06T03:04:44.961Z	2024-05-13T14:02:17.293Z	Colégio Marista Rosário	290	-30.0302541	-51.2184298	t	Porto Alegre	\N	\N	\N	\N
3be55b4c-70cd-4719-a759-5e2d4c50fc61	\N	Av. Benjamin Constant, 561 - São João, Porto Alegre - Rs, 90550-003	f	0	0	51 99400 8012	2024-05-14T12:49:22.065Z	2024-05-15T01:10:31.242Z	Viaduto José Eduardo Utzig	250	\N	\N	t	Porto Alegre	\N	\N	\N	\N
a5a27e23-6ddd-4e9c-abb6-f80cb54c5020	\N	R. Felipe De Oliveira, 35 - Santa Cecília, Porto Alegre	t	42	112	51 991776820	2024-05-14T12:39:09.642Z	2024-05-14T19:19:57.377Z	Abrigo Aliadas - Abrigo Exclusivo Para Mulheres Com Crianças	200	\N	\N	t	Porto Alegre	\N	\N	\N	\N
02aa1149-b4f3-4721-ad19-347ac0d367f2	\N	R. Eng. Ildo Meneghetti, 955 - Estalagem	t	48	\N	51984779241	2024-05-10T15:45:38.949Z	2024-05-14T21:27:56.530Z	CTG Recanto Nativo	1390	\N	\N	f	Estalagem	\N	\N	\N	\N
c5272267-663c-482f-9007-1c1688b017c2	\N	R. João Leivas de Carvalho, 551 - São José, Canoas - RS, 92420-250	f	360	360	(51) 9.9510-6999	2024-05-10T00:00:00.000Z	2024-05-13T18:35:23.888Z	CTG Seiva Nativa - Canoas	1470	\N	\N	t	Canoas	\N	\N	\N	\N
76fdc594-6a28-4d80-8ac5-c2a37ff05f27	\N	Rua 3, 176, Vila Laranjeira - Morro Santana POA	f	\N	\N	5,55198E+12	2024-05-10T00:00:00.000Z	2024-05-15T01:10:51.569Z	Associação Missionária SOS Resgatando vidas	100	\N	\N	t	Porto Alegre	\N	\N	\N	\N
c76f0f3a-38ae-4f5c-ba05-59f894c25304	\N	Av. Boqueirão, 3975 - Estância Velha, Canoas - RS, 92032-023	t	55	55	(51) 9.8658-3420	2024-05-10T00:00:00.000Z	2024-05-14T00:46:20.007Z	Igreja do Evangelho Quadrangular 09 - Canoas	80	\N	\N	t	Canoas	\N	\N	\N	\N
1d2a1f95-ce5c-4cf7-95a8-a43a958a245f	\N	Estrada do conde 4000 eldorado do sul	f	\N	\N	55 51 99982-4982	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Associação delta do jacui	0	\N	\N	t	Eldorado do Sul	\N	\N	\N	\N
2b90421a-ebe1-44fc-bc7b-aacbc6f7ff7e	\N	rua 121A, casa 4 - Guajuviras - Canoas	f	\N	\N	51984729014	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	ASSOCIAÇÃO MÁGICA DO AMOR	0	\N	\N	t	Canoas	\N	\N	\N	\N
cebba04c-f7df-4696-9504-48b8fb63152b	\N	Av. Dr. Nilo Peçanha, 1521 - Três Figueiras	f	\N	\N	51 9685-5229	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	APM - Anchieta	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
cb14d9fd-6f4b-4312-b7f9-bdc657e32fad	\N	R. Astério de Mello	f	\N	\N	51999579444	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Apromosc	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
5a0c1939-8c6a-47cf-bb66-0cac81ef3e29	\N	Av. Principal Da Ponta Grossa, 707 - Ponta Grossa, Porto Alegre - Rs, 91778-299	f	1	1	Natália (51) 9.9343-3485	2024-05-13T18:47:54.122Z	2024-05-13T18:47:54.122Z	Igreja Ad. Ágape Porto Alegre	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
9edf90ec-f77a-4d0a-89cb-bc67514a3cac	\N	Av. Boqueirão, 1947 - Igara, Canoas - RS, 92022-701	f	35	35	(51) 9.9127-3561	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Charrua Barbell & Fitness Matriz - Canoas	0	\N	\N	t	Canoas	\N	\N	\N	\N
201ffc6d-baab-4b55-ac7c-aec8b6e6338e	\N	Rua Veranópolis, 56 Arroio Da Manteiga	\N	\N	\N	\N	2024-05-07T16:15:05.940Z	2024-05-07T16:15:05.940Z	Emef Dr. Paulo Couto - São Leopoldo	0	-29.7301061	-51.1788213	f	São Leopoldo	\N	\N	\N	\N
20afd808-5cc9-4b20-9d5f-4904da685578	\N	Av. Feitoria, 2942 - Feitoria, São Leopoldo	f	\N	\N		2024-05-10T15:45:54.764Z	2024-05-10T15:45:54.764Z	Escola De Educação Infantil Recanto Da Criança	0	\N	\N	f	São Leopoldo	\N	\N	\N	\N
4bafaded-7015-4798-9e74-67e4840ef6f4	\N	TV. CUBA- VILA Ipê, 40	f	\N	\N	51 980230173	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	IGREJA SÃO BORJA	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
ab3734c2-f1dd-48ef-9fe1-488619934c6e	\N	RUA PINDORAMA 203 IGARA CANOAS	f	\N	\N	51981575281	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	IGREJA BATISTA FILADELFIA DE CANOAS	0	\N	\N	t	Canoas	\N	\N	\N	\N
3cbbbb2e-659c-4c05-943c-1bdbf7cc259f	\N	Rua Dona Teodora 1435	f	\N	\N	51995070618	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Comunidade Terapêutica Casa Marta e Maria	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
3019a4fe-616e-4da4-8fed-93493d22be89	\N	Rua Guilherme Alves 1512	t	\N	\N	51983444145	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Assembleia de Deus	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
288e9bff-e466-4021-8f0f-223557ed5a72	\N	R. José Do Patrocínio, 954 - Cidade Baixa, Porto Alegre	\N	\N	\N	\N	2024-05-07T01:04:27.515Z	2024-05-07T01:04:27.515Z	Paróquia Sagrada Família	0	-30.0424264	-51.2201188	f	Porto Alegre	\N	\N	\N	\N
392fa9c1-c702-41b5-88e5-bbb42756968f	\N	RUA ESPADODEA, 171 - PONTA GROSSA	f	200	\N	51986515614	2024-05-10T00:00:00.000Z	2024-05-14T03:58:47.039Z	ASSOCIAÇÃO SANTA MÔNICA	8390	\N	\N	t	Ponta Grossa	\N	\N	\N	\N
c55297fa-03cb-4069-be9e-a08fe6706656	\N	manuel lentz da silva, 23. Santa Tereza	f	\N	\N	98170-6061	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Centro Africano	0	\N	\N	t	Santa Tereza	\N	\N	\N	\N
a5278180-0559-4325-8d0f-6042e0cf0c4d	\N	RUA F, 66, MARIO QUINTANA PORTO ALEGRE	f	\N	\N	51992618122	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	BYL VEREADOR	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
53951d67-44d7-44bd-94f4-7de7390c1d94	\N	RUA 6 N 400 - SETOR 5 - QUADRA X, 400 GUAJUVIRAS. 92440-020 Canoas - RS.	f	\N	\N	51993511738	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	ESCOLA CARLOS DRUMMOND DE ANDRADE	0	\N	\N	t	Canoas	\N	\N	\N	\N
63dab49d-469d-4336-b43a-a52ac9087095	\N	Jacy Kroeff Milanez 6	f	\N	\N	51981080879	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Associação vinte de setembro	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
1829ca4d-2bae-4427-aa08-664646a121a5	\N	Estrada Martins Felix Berta 1241	f	\N	\N	51994012663	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Davovo esportes bar	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
2bee30ab-27d7-4a47-ba70-ea5bdf6c4393	\N	Rua Coronel Timóteo,350	f	\N	\N	(51) 98456-0064 / 51984556190	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Casa de Nazaré	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
cb747503-0761-4af5-877b-81dc93234425	\N	Rua Gervásio Da Rosa, 190 - Cavalhada, Porto Alegre	f	73	73	990185458	2024-05-10T00:00:00.000Z	2024-05-14T12:44:14.422Z	Ctg Inhanduí	700	\N	\N	t	Porto Alegre	\N	\N	\N	\N
ee37bc3a-80b5-45db-8739-775cfcf0edbe	\N	Rua João Leivas De Carvalho, 461, São José, Canoas	f	1	1	(51) 98272-6757	2024-05-14T17:16:08.703Z	2024-05-13T17:16:08.703Z	Colégio Estadual Miguel Lampert	0	\N	\N	f	\N	\N	\N	\N	\N
3bd0bd66-f13b-4b52-98f1-cc9289f7a4bb	\N	R. Ll - Guajuviras, Canoas - Rs, 92415-360	f	200	200	(51) 9.8408-4791	2024-05-10T00:00:00.000Z	2024-05-14T16:49:16.747Z	Colégio Jussara	380	\N	\N	t	Canoas	\N	\N	\N	\N
7a743c96-432e-49dc-84eb-9d96db7ef720	\N	Rua Aurora, 695, Marechal Rondon, Canoas	f	1	1		2024-05-14T17:16:40.360Z	2024-05-13T17:16:40.360Z	Colégio Leonardo Da Vinci	0	\N	\N	f	\N	\N	\N	\N	\N
9bc8061e-56db-45e4-a71f-72a9794058e9	\N	Rua barão do itaqui 184 jardim São pedro	t	\N	\N	51992545499	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Associação Cão da Guarda	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
c64ae146-c6b2-45b1-9de5-2b1b5db6db7e	\N	Av. Getúlio Vargas, 1303, Niteroi, Canoas	f	0	0		2024-05-14T17:14:22.148Z	2024-05-14T17:23:22.696Z	Aeb Estruturas Metálicas	0	\N	\N	t	\N	\N	\N	\N	\N
b0adecca-fe41-46d5-af4b-2d4c8ed0191b	\N	Av da serraria 1835	t	101	\N	51991665275	2024-05-10T00:00:00.000Z	2024-05-15T01:18:04.056Z	CTG RODA DE CHIMARRÃO	910	\N	\N	t	Porto Alegre	\N	\N	\N	\N
05161518-39ea-4af1-8d77-2f1c61485b6f	\N	Rua Ernesto da Silva Rocha 1582, Canoas, RS	f	\N	\N	(519) 608-1386	2024-05-10T00:00:00.000Z	2024-05-14T22:23:39.947Z	EMEF Arthur OscarJochims	300	\N	\N	t	Canoas	\N	\N	\N	\N
4ab43775-3b42-4a32-96de-4ec086eea904	\N	Rua Sérgio/ Sn - Boa Vista	f	650	\N	\N	2024-05-07T16:15:07.663Z	2024-05-14T22:28:07.746Z	Emef José Grimberg - São Leopoldo	0	-29.70170001	-51.19441603	f	São Leopoldo	\N	\N	\N	\N
4ddc7e9b-5d84-4938-a94f-5e8e133118b9	\N	Rua Alfazema 160 Morro Santana	f	\N	\N	982061059	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Igreja Fonte da Agua viva	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
c7cc002b-f8bb-4465-8a11-13fb2b93529e	\N	Av. Padre Santin, 760 - Jardim América	\N	\N	\N	\N	2024-05-07T16:15:13.950Z	2024-05-07T16:15:13.950Z	Ginásio Aliança Esportiva Botafogo - São Leopoldo	0	-29.7900767	-51.1281113	f	São Leopoldo	\N	\N	\N	\N
bc40fcb7-ecc0-4abe-a6bc-f38a34336e82	\N	Rua Cruzeiro do Sul, 1719	f	\N	\N	51993962015	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Igreja do evangelho quadrangular	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
7071b372-9a37-49f2-9689-9097d4a192e4	\N	Rua Lopo Gonçalves, 87/5	t	\N	\N	51999513305	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Comunidade Guarani Ijerê - Ponta do arado	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
2277e3a7-870d-4570-b9eb-7b081e3c9743	\N	Estrada Dionísio Cardoso de Lima 6350	t	\N	\N	51996307983	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Centro de recuperação nova Jerusalém	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
730b8121-d677-4f2d-800a-0e72bf3c53d5	\N	R. Felizardo De Farias, 183 - Medianeira Porto Alegre	f	\N	\N	Karla ou JP (51) 9.9911-5580	2024-05-11T20:54:51.361Z	2024-05-11T20:54:51.361Z	Karla E Jp	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
d41cd014-5870-4548-9347-f6664f410307	\N	Rua Deodoro, 265, Mário Quintana	f	\N	\N	986434871	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Instituto Bíblico Esperança	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
8840edb1-56ed-44b4-b22d-a8d867e18c95	\N	Rua Vigário José Inácio, 741	f	\N	\N	51 994032014	2024-05-10T15:45:43.281Z	2024-05-10T15:45:43.281Z	Casa De Apoio Madre Ana	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
682e89a1-168a-46ef-a212-d3183d5d7551	\N	Rua João Guimarães, 337	f	\N	\N	51982340196	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Fórum Social das Periferias de Porto Alegre	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
093406be-631c-4da3-a56f-660ca77d554e	\N	Rua Deodoro, 255, Morro Santana	f	\N	\N	51981893199	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Clínica Esperança de Amparo à Criança	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
ce66db13-6dc2-45f2-90aa-4fa313f7bb43	\N	Av. Otto Niemeyer 1571	f	\N	\N	51982979324	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	JoG engenharia de andaimes	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
f66e8bb3-1878-4f3c-bbac-b74821f614da	\N	AVENIDA Principal da Ponta grossa, 191	f	\N	\N	98486-8136	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	ASSOCIAÇÃO BENEFICIENTE CASA DE ABRAÃO	0	\N	\N	t	Ponta Grossa	\N	\N	\N	\N
a1e47020-acf2-46a8-b964-fd27cd6f929d	\N	Estrada João de Oliveira Remião, 5683	f	\N	\N	51997548544	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	SBRC Mocidade Independente da Lomba do Pinheiro	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
d8f87eb4-4e0f-4bde-a6f9-538dfe615e01	\N	Rua Santini Longoni, 147, Marechal Rondon, Canoas	f	0	0	(51) 99815-6688	2024-05-14T17:15:49.140Z	2024-05-14T17:24:49.824Z	Colégio Estadual Marechal Rondon	0	\N	\N	t	\N	\N	\N	\N	\N
b1d640d8-07bd-433a-b841-045e87d98e30	\N	Av Farroupilha, 5616, Marechal Rondon, Canoas	t	200	0	(54) 98103-2329	2024-05-14T17:15:09.842Z	2024-05-14T22:03:05.405Z	Colégio Adventista	670	\N	\N	t	\N	\N	\N	\N	\N
0e810f84-1d49-426f-a9d9-75ba6ec47d1d	\N	Av. Otto Niemeyer, 3475 - Tristeza, Porto Alegre - Rs, 91740-188	t	0	0	51 99282-1712	2024-05-14T17:36:48.422Z	2024-05-14T17:37:22.084Z	Majuna Proteção Animal - Abrigo Pet	0	\N	\N	t	\N	\N	\N	\N	\N
d706b874-9f59-41cd-8cf9-4da0b1becccf	\N	Rua Ouro Preto, 408a, Bairro Cristo Redentor - Porto Alegre	f	100	\N	Adriana (51) 9.9431-7578	2024-05-06T13:16:42.032Z	2024-05-13T17:52:43.595Z	Abrigo Cristo Redentor	380	-30.0026262	-51.155601	f	Porto Alegre	\N	\N	\N	\N
eb6cf14e-9a44-4355-9800-e4b6aa5430ee	\N	Beco da vitória, 404 - 36	f	\N	\N	51984427770	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Igreja Evangélica Vitória em Jesus	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
3b5d55b1-3bb6-4f3d-90cb-03b9735fbb77	\N	Av. Integração, 1009 - Feitoria, São Leopoldo	f	\N	\N		2024-05-10T15:45:53.131Z	2024-05-10T15:45:53.131Z	Eeem Caic Madezatti	0	\N	\N	f	São Leopoldo	\N	\N	\N	\N
6c1d8f98-7114-46ef-86da-79ced202f396	\N	Rua Teixeira de Freitas 85	f	\N	\N	993638042	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Espaço Clínico Especial - Unidade Santo Antônio	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
702fdb3c-a141-48cf-8849-074f2756040b	\N	Av. São Pedro, 1420 - São Geraldo, Porto Alegre - Rs, 90230-124	f	1	1	Setcergs Secretaria (51) 9.8440-2929	2024-05-13T16:54:28.277Z	2024-05-13T16:54:28.277Z	Setcergs - Sindicato Das Empresas De Transporte De Carga	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
6952c270-aeba-4e5f-b7de-7fd9ffe35cf1	\N	Avenida Comandante Harald Stunde 161	f	\N	\N	51999400906	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Associação dos moradores da vila Varig	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
69c1b76a-524b-4c16-9ced-32a789e0a186	\N	av. josé loureiro da silva, 900, gravataí	f	\N	\N	51986592515	2024-05-10T00:00:00.000Z	2024-05-13T23:04:08.942Z	Grupo de Escoteiros Murialdo	110	\N	\N	t	Gravataí	\N	\N	\N	\N
d94905ff-faec-4cf8-b196-52bfa0783da7	\N	Av. Princesa Isabel, 1160 (Escola Estadual São Francisco)	f	\N	\N	51 993832781	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Bloco Chiquinho dos Anjos	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
74b0e3dc-6914-448e-b55d-4ee2d74f7a47	\N	Estrada João De Oliveira Remião Parada 07	\N	15	30	\N	2024-05-06T13:42:41.811Z	2024-05-06T13:42:41.811Z	Igreja Quadrangular - Parada 07	0	-30.1255794	-51.1016973	f	Porto Alegre	\N	\N	\N	\N
b872c3d2-ade2-48f9-8962-8769678b018b	\N	Parque Itapema	\N	\N	\N	\N	2024-05-07T16:14:53.982Z	2024-05-07T16:14:53.982Z	Associação Parque Itapema - São Leopoldo	0	-29.71961251	-51.15917632	f	São Leopoldo	\N	\N	\N	\N
40306998-932b-4cb9-b593-1dfa7794b88c	\N	Rua Ceristopher Levalley 1007, Canoas	f	\N	\N	51990115213	2024-05-10T00:00:00.000Z	2024-05-13T17:50:10.367Z	Igreja Âncora	20	\N	\N	t	Canoas	\N	\N	\N	\N
94a0eaf5-0194-489b-8b03-a25ff37bee1a	\N	Rua 06, 400 - Setor 5 Quadra X - Guajuviras, Canoas	f	\N	\N		2024-05-10T15:45:55.315Z	2024-05-10T15:45:55.315Z	Emef Carlos Drummond Andrade	0	\N	\N	f	Canoas	\N	\N	\N	\N
76a909a1-e204-49d1-bfb8-96588161da1b	\N	Rua Quintino Bocaiuva 1540	f	\N	\N	51997456396	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Altos do Bela vista	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
07bc523a-0d78-4278-ae5d-80642fb47260	\N	R. Carol, 128	f	\N	\N	(51) 996682180	2024-05-10T15:45:42.214Z	2024-05-10T15:45:42.214Z	Gresbces Filhos De Maria	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
3eb3aa39-8422-4f7c-acad-78b197373280	\N	Av. Juca Batista, 6676 - Ponta Grossa, Porto Alegre - Rs, 91778-063	f	1	1	Lucas Duarte (51) 9.9647-1742	2024-05-13T17:33:49.505Z	2024-05-13T17:33:49.505Z	Carrabba Store	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
89ff7a93-77d8-4449-b01d-aabe3488e1ea	\N	Rua são domingos 89 - Bom jesus - Porto Alegre	f	\N	\N	5,19932E+11	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	CTG Raízes do Sul	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
5f1063c4-eb88-4c40-abf3-b46fd71bd3f9	\N	Rua monsenhor Rubens Neis 730	f	\N	\N	51981331818	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Ascat	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
667bd3ce-9d8b-414e-9b40-826edca354fa	\N	Loteamento do bosque acesso a 2 casa 36	f	\N	\N	51982760468	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Associação dos moradores do loteamento Bosque e arredores	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
0991c26c-b53c-4a90-a2f2-84a5b1e8647f	\N	Rua Diamante, S/n - Scharlau	\N	\N	\N	\N	2024-05-07T16:14:52.318Z	2024-05-07T16:14:52.318Z	Associação Campo Penharol - São Leopoldo	0	-29.7167589	-51.1620275	f	São Leopoldo	\N	\N	\N	\N
7e20d0e7-4f14-46cf-8acb-c6a6cd654c88	\N	Rua Eugênio Berger - Scharlau, São Leopoldo	f	\N	\N		2024-05-10T15:45:27.771Z	2024-05-10T15:45:27.771Z	Escola Municipal Professor João Carlos Von Hoendorff	0	\N	\N	f	São Leopoldo	\N	\N	\N	\N
80765aa9-0a37-4f9b-9a4c-939244fede4e	\N	alameda 2, numero 104, vila são jose comunitária	f	\N	\N	51985487480	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Associação de Mulher maria da gloria	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
fe2d90fe-ce24-4b55-b910-5181a2860abc	\N	Av. Joaquim Porto Vila Nova	\N	\N	\N	\N	2024-05-06T03:04:40.468Z	2024-05-06T03:04:40.468Z	CEEE Vila Nova	0	-30.053574	-51.1594639	f	Porto Alegre	\N	\N	\N	\N
1c1abbe5-c0f4-4487-b98a-d74087a8f554	\N	R. Luiz Corrêa Da Silva, 3200 - Extrema, Porto Alegre - Rs, 91787-520	f	1	1	Bárbara Grecco (51) 9.8458-5830	2024-05-13T17:52:14.860Z	2024-05-13T17:52:14.860Z	Lar Temporario Lami	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
b9b99149-4001-414b-be58-58ff339e7030	\N	Avenida Assis Brasil, 5680	t	\N	\N	5,19989E+11	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Associação Continente	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
b5c9a35c-ec79-46c9-afe5-c01113b64f50	\N	SAMBODROMO BARRACAO VILA ISABEL	f	\N	\N	51981646563	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	BARRACAO VILA ISABEL	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
7cd3f472-6bd5-4ea3-834b-243f61a1452c	\N	Rua Juruá, 200 -Jardim São Pedro - Porto Alegre	f	\N	\N	51982368218	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Alojamento Thaise	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
cab66a5a-155a-4c4d-8d52-c93ba0133460	\N	RUA CAROL 128 LOMBA DO PINHEIRO	f	\N	\N	51996682180	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	FILHOS DE MARIA	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
9cbf8973-a0f4-40a1-b0f8-e6e504083c6c	\N	CEL APARICIO BORGES 2199	f	\N	\N	51996615401	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	BRIGADA MILITAR	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
743578ed-910d-46a8-9388-05ddb396867d	\N	Rua Eva Moreira Dos Santos, 48 - Arroio Da Manteiga	\N	\N	\N	\N	2024-05-07T16:15:09.961Z	2024-05-07T16:15:09.961Z	Emef Santa Marta - São Leopoldo	0	-29.7257651	-51.1891166	f	São Leopoldo	\N	\N	\N	\N
8dda1503-a639-42f6-9f4c-a8cb71101a5e	\N	Rua avaré, 90, jardim floresta	f	\N	\N	51997261402	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	EMEF David Riegel Neto	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
16b4fd57-f876-4ff1-85e3-0ed012f86676	\N	Av. Antônio Ficagna, 452 - Morada Do Vale Iii, Gravataí - Rs, 94080-280	f	1	1	Giovanni Brum (51) 9.8526-9302	2024-05-13T17:02:45.022Z	2024-05-13T17:02:45.022Z	Comunidade Santa Rita - Gravataí	0	\N	\N	f	Gravataí	\N	\N	\N	\N
129532a9-2d3b-4e30-a35e-950836dbda0e	\N	Rua Joao dallegrave, 130 - Morro Santana	t	\N	\N	51989200555	2024-05-10T00:00:00.000Z	2024-05-14T23:37:13.510Z	Escola Estadual Porto Alegre	440	\N	\N	t	Porto Alegre	\N	\N	\N	\N
c8f7d181-9703-411b-b1fd-25dfce977382	\N	Estrada Presidente Lucena, 311-347, Scharlau -são Leopoldo - 93125-450	f	\N	\N		2024-05-10T15:45:50.405Z	2024-05-14T22:18:55.118Z	Emei Jardim Verde	130	\N	\N	f	São Leopoldo	\N	\N	\N	\N
52c36619-2712-4aa0-9a80-46ea14bc73c8	\N	Siqueira Campos, 292 - Canoas	f	\N	\N	51982619529	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Solarium Residencial Geriatria	0	\N	\N	t	Canoas	\N	\N	\N	\N
953759a1-d7d8-48e6-8d73-2d66d65cf6d5	\N	Av. liberdade, 1826	f	\N	\N	51996022051	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Paróquia Santa Isabel	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
bfbafa93-6ea3-4ba2-9918-6eb104f0ca53	\N	R. CIPÓ, 450, JARDIM IPIRANGA, POA - RS	f	\N	\N	51997877377	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	PARÓQUIA CRISTO BOM PASTOR	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
069095ee-1450-4076-86ba-f675431f3970	\N	Rua Luiz de Camões 337, Partenon - Porto Alegre	f	\N	\N	51996702215	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Sede de Triagem Prefeitura de POA	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
e4c7032d-5db2-40bf-bad7-a5f870da6f72	\N	RUA Jorge Kalil flores, 241	f	\N	\N	51992278992	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Sindicato dos Municipários de Viamão	0	\N	\N	t	Viamão	\N	\N	\N	\N
1c0b9c93-c4b1-4537-a9f3-9e7afb20ac61	\N	Estrada Aracaju, 651 - Vila Nova, Porto Alegre	\N	\N	\N	\N	2024-05-07T01:04:13.921Z	2024-05-07T01:04:13.921Z	Casa Da Juventude Marista	0	-30.103381	-51.2167155	f	Porto Alegre	\N	\N	\N	\N
e5590922-96f4-4c93-ac33-4ea3e303ef2c	\N	Rua Eugênio Berger, 100 - Scharlau	\N	\N	\N	\N	2024-05-07T16:15:07.088Z	2024-05-07T16:15:07.088Z	Emef Hohendorff - São Leopoldo	0	-29.725776	-51.1606897	f	São Leopoldo	\N	\N	\N	\N
74a090b4-3600-4d15-a0bc-6e6de6c47c72	\N	Avenida Dante Ângelo Pilla 285 / Costa E Silva	\N	15	30	\N	2024-05-06T13:42:04.693Z	2024-05-06T13:42:04.693Z	Igreja Quadrangular - Costa e Silva	0	-30.0125509	-51.1184693	f	Porto Alegre	\N	\N	\N	\N
e738ef42-705e-474b-88ea-8592b29f1838	\N	Rua Dona Zulmira 233	f	\N	\N	51983488435	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Igreja Batista Cristal	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
f83af05b-c50a-472c-b48d-b7044e5f36e6	\N	Av. Benno Mentz, 1560 - Vila Ipiranga, Porto Alegre - Rs, 91370-020	f	1	1	Rô Educandario (51) 9.8138-4557	2024-05-13T15:03:03.328Z	2024-05-13T15:03:03.328Z	Paróquia Nossa Senhora Do Trabalho - Porto Alegre	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
12552f84-c2ce-4cd3-b2d7-ae329f387287	\N	Av. Boqueirão, 2911 - Estância Velha, Canoas - Rs, 92031-200	f	200	200	51 999668887	2024-05-08T16:50:32.352Z	2024-05-08T16:50:32.352Z	Colaziol Scotta - Canoas	0	-29.9056903	-51.1464413	f	Canoas	\N	\N	\N	\N
623379c7-0342-4f95-b55f-13e86b1ff64c	\N	Av diário de noticias	f	\N	\N	51984071662	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Ponto de resgate pontal do estaleiro	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
3eb02293-54a1-4f45-86da-eda19a88b059	\N	Av. Guilherme Schell, 5888, Centro, Canoas	f	1	1	(51) 99550-7141	2024-05-14T17:17:02.585Z	2024-05-13T17:17:02.585Z	Colégio Maria Auxiliadora	0	\N	\N	f	\N	\N	\N	\N	\N
73e76e84-e6db-4b2e-a928-82d545826c3a	\N	AV MARCELO GAMA 1537	f	\N	\N	51992584629	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	RCA TRANSPORTES	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
bbb358a6-a2b3-4d62-a401-f727a022575b	\N	Rua Frederico Dilh 3388, Alvorada	f	\N	\N	51 980111682	2024-05-10T15:45:36.158Z	2024-05-10T15:45:36.158Z	Assembleia De Deus Zona Leste De Alvorada	0	\N	\N	f	Alvorada	\N	\N	\N	\N
37a25927-133c-41ff-a2d2-4b7521c63c5b	\N	Rua ursa maior 538	f	\N	\N	51984236965	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Associação de moradores força maior da pedreira(AMFOMAP)	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
407cee53-1d82-41bd-93d5-0998bbe281c2	\N	Rua Ouro Preto, 785, Jardim Lindóia	t	110	\N	51981347851	2024-05-10T00:00:00.000Z	2024-05-13T14:43:38.392Z	Nexos IBN Church	680	\N	\N	t	Porto Alegre	\N	\N	\N	\N
2c90f265-1621-43ea-a523-d1417d410c53	\N	Rua Paulino Gonçalves Barcelos, 307, Bairro Rubem Berta, Porto Alegre	f	230	230	(51) 9.9118-2143	2024-05-10T00:00:00.000Z	2024-05-13T15:55:01.396Z	Sesi Rubem Berta / Sesi Poa - Centro Esportivo	700	\N	\N	t	Porto Alegre	\N	\N	\N	\N
9e78210f-f25a-419c-abeb-341e562a2584	\N	Rua Dr Pitrez 61, aberta dos morros	t	\N	\N	51984673592	2024-05-10T00:00:00.000Z	2024-05-12T19:51:07.892Z	Paroquia Menino Jesus de Praga	140	\N	\N	t	Porto Alegre	\N	\N	\N	\N
7d18daed-516d-4dd6-b894-4d2a72f8273a	\N	Rua Itu, 672, Igara, Canoas	f	0	0		2024-05-14T17:14:36.996Z	2024-05-14T17:23:46.224Z	Befyron	0	\N	\N	t	\N	\N	\N	\N	\N
80e5365f-c40a-4559-a02a-f1564983cb25	\N	Av. Araguaia, 1151 , Igara, Canoas	f	0	0	(54) 98103-2329	2024-05-14T17:14:49.904Z	2024-05-14T17:25:16.486Z	Centro Olímpico Municipal	0	\N	\N	t	\N	\N	\N	\N	\N
b319e63b-0754-4cb5-b158-513ab25d07b8	\N	Rua Tobias Barreto, 990, Nossa Senhora Das Graças, Canoas	f	0	0	(51) 99361-5584	2024-05-14T17:18:46.434Z	2024-05-14T17:54:55.083Z	Cssgapa	0	\N	\N	t	\N	\N	\N	\N	\N
8740e5b9-8a86-4db1-919b-bbe19dcb9de3	\N	Rua João Leiva De Carvalho, 541, São José, Canoas	f	0	0	(51) 99430-2640	2024-05-14T17:19:06.758Z	2024-05-14T17:59:03.244Z	Csu São José	0	\N	\N	t	\N	\N	\N	\N	\N
57e8ce51-dd04-4d5c-9cc0-6f2f9eff5387	\N	Rua Mem De Sá, 561, Nossa Senhora Das Graças, Canoas	f	0	0	(51) 98403-7393	2024-05-14T17:19:28.228Z	2024-05-14T17:59:26.926Z	Ctg Brazão Do Rio Grande	0	\N	\N	t	\N	\N	\N	\N	\N
92e34f7a-24be-4c3e-bd95-2655929fbad0	\N	R. Luiz Manoel, 229 - Santana	f	\N	\N	51982499085	2024-05-10T00:00:00.000Z	2024-05-14T20:41:16.609Z	Ong Misturaí	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
8c675091-a9c1-485f-84d4-9f33b55d2d8f	\N	Rua Leopoldino José Santos 350	f	\N	\N	51980111490	2024-05-10T00:00:00.000Z	2024-05-14T23:18:14.693Z	ONG MAYDAY	40	\N	\N	t	Porto Alegre	\N	\N	\N	\N
caefef98-cf51-44e9-b4e0-ad8949fb336c	\N	Av. Farroupilha, 8001 - São José, Canoas - Rs, 92425-020	f	6000	7000		2024-05-06T03:05:02.870Z	2024-05-14T19:49:12.461Z	Ulbra Prédio 55 - Canoas	1980	-29.88614635418371	-51.166481489358276	t	Canoas	\N	\N	\N	\N
1901f957-605d-4709-b4a4-4e82f521b073	\N	Porto Seguro, 197, Canoas	t	200	200	Marcelo (Diretor) (51) 9.9288-7184	2024-05-08T21:24:57.881Z	2024-05-13T17:25:56.319Z	Escola Jacob Longoni - Canoas	540	-29.9328523	-51.1585029	f	Canoas	\N	\N	\N	\N
964b7015-8542-4787-81ba-4f70356d279d	\N	R. Bento Gonçalves, 4130 - Guarani, Novo Hamburgo - Rs, 93520-054	t	90	1	Simone (51) 9.8186-5465 / (51) 9.9976-8824 / (51) 9.8954-4771	2024-05-13T19:01:55.762Z	2024-05-14T20:58:32.554Z	Paróquia Nossa Senhora De Fátima - Novo Hamburgo	1100	\N	\N	f	Novo Hamburgo	\N	\N	\N	\N
c41b4da8-342e-443e-8830-b6adf96dc4bc	\N	R. Papa João Xxiii, 316 - São Vicente, Cachoeirinha - Rs, 94910-170	t	148	136	Leonardo Pompeu  (51) 9.9495-3113	2024-05-08T17:12:56.603Z	2024-05-13T18:32:03.838Z	Paróquia São Vicente De Paulo (entrega De Doações Na Rua Detrás, A R. Tamôios, 589)	2680	-29.9527481	-51.0942474	f	Cachoeirinha	\N	\N	\N	\N
d036b8ca-85d1-449f-b032-922497874543	\N	Ernardino Silveira Pastoriza, 880 – Santa Rosa De Lima	t	\N	30	(51) 98316-8144	2024-05-06T13:39:34.827Z	2024-05-13T20:02:49.049Z	Mevam	3220	-29.9907255	-51.0995657	f	Porto Alegre	\N	\N	\N	\N
98afa669-bade-40c8-b052-980e5025f58e	\N	Av. Venâncio Aires, 711 - Santana, Porto Alegre - RS, 90040-193	t	\N	\N	\N	2024-05-06T03:05:00.079Z	2024-05-13T19:22:23.856Z	Volpe	62	-30.0396752	-51.2133431	f	Porto Alegre	\N	\N	\N	\N
32068812-91bf-40dd-a268-b2183f8cbf61	\N	Rua Mercurio, 928 - Santa Tereza	\N	\N	\N	\N	2024-05-07T16:15:16.903Z	2024-05-07T16:15:16.903Z	Igreja Kenned - São Leopoldo	0	-29.1702208	-51.7358184	f	São Leopoldo	\N	\N	\N	\N
685d0226-062b-4b77-a2df-c7c05a637856	\N	R. Prof. Augusto Osvaldo Thiesen, 280 - Rubem Berta - Porto Alegre	t	25	25	Sérgio (51) 9.9624-5083 / (51) 9.8942-2739	2024-05-10T16:02:44.073Z	2024-05-14T23:12:38.851Z	Ctg Estância Do Rubem Berta	4010	\N	\N	t	Porto Alegre	\N	\N	\N	\N
a093dda2-ea81-4f42-b7ae-950e5c69c8df	\N	Rua João Obino, 130	f	\N	\N	(51) 981240463‬ (contato desatualizado)	2024-05-10T15:45:35.597Z	2024-05-14T13:20:39.587Z	Pan American School (evangelical Church - Igreja Ao Lado Da Escola)	730	\N	\N	f	Porto Alegre	\N	\N	\N	\N
9791431f-042e-43e4-8c8d-05c50bd2db01	\N	R. Paulino Chaves, 262 - Santo Antônio, Porto Alegre	f	70	140		2024-05-07T01:04:15.044Z	2024-05-12T01:16:15.857Z	Colégio Rainha Do Brasil	20	-30.0582512	-51.2008257	t	Porto Alegre	\N	\N	\N	\N
296a51a1-523e-4a21-ba1e-1c05be12e33b	\N	Av. Heitor Viêira, 474 - Belém Novo, Porto Alegre - Rs, 91780-000	t	120	1	Rafa  (51) 9.9142-4150	2024-05-13T17:56:46.595Z	2024-05-14T00:47:19.544Z	Paróquia Nossa Senhora De Belém - Porto Alegre	20	\N	\N	f	Porto Alegre	\N	\N	\N	\N
80386665-d935-4a8f-851d-b20d847c7ad3	\N	Rua Sarmento Leite 103 - Centro Histórico, Porto Alegre	\N	\N	\N	\N	2024-05-07T01:04:25.834Z	2024-05-10T13:04:20.181Z	Gabinete de crise OAB/RS	1040	-30.0430294	-51.224944	f	Porto Alegre	\N	\N	\N	\N
98bcdaf6-7dc8-405e-a919-f4330bfd4e4b	\N	R. Dezenove De Fevereiro, 330 - Mário Quintana, Porto Alegre	\N	\N	\N	\N	2024-05-07T01:04:20.103Z	2024-05-07T01:04:20.103Z	Escola Victor Isler	0	-30.0353353	-51.1167334	f	Porto Alegre	\N	\N	\N	\N
7d5e29af-7d5f-41a9-afaf-8e2135dd69c4	\N	R. Prof. Guerreiro Lima, 476 - Partenon Porto Alegre - Rs, 91530-190	f	80	10	\N	2024-05-06T06:33:28.651Z	2024-05-09T14:53:14.161Z	Igreja Da Lagoinha	500	-30.0585149	-51.1544922	f	Porto Alegre	\N	\N	\N	\N
57794b28-0896-40ca-9681-527a5509bd9b	mulheresmirabal@gmail.com	Porto Alegre - Consultar Endereço No Contato De Telefone	f	25	45	Andressa (51)9.8583-3778	2024-05-13T20:28:12.469Z	2024-05-13T20:57:19.074Z	Casa Mulheres Mirabal - Porto Alegre	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
662577bc-aa4c-458e-b02e-7e7d092c14fe	\N	Rua Cruzeiro Do Sul, 2702 E 2704, Bairro Cruzeiro Do Sul - Porto Alegre	t	12	30	(51) 9.99921-4077	2024-05-10T00:00:00.000Z	2024-05-13T14:05:05.177Z	Acm - Cruzeiro Do Sul (exclusivo Para Mulheres)	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
ed4e7f54-4969-4719-959e-95618de7c812	\N	Rua Dr. Pitrez, 61, Aberta Dos Morros, Porto Alegre	f	\N	\N	(51) 9.9818-6878	2024-05-10T00:00:00.000Z	2024-05-12T18:22:01.987Z	Conselho Estadual Dos Povos Indígenas Do Rs	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
448b139d-799f-402b-8da0-24fb7ac7668a	\N	Tarcila Moraes Dutra, 799, Porto Alegre	t	100	120	Carla Floriano - 51 98470-7285	2024-05-08T21:33:18.437Z	2024-05-11T09:57:44.583Z	Centro Assistencial Paz - Semear	20	-29.9980207	-51.0932043	f	Porto Alegre	\N	\N	\N	\N
62a17be9-a744-42a6-a7dd-8ce2872c56c8	\N	R. Hélio Pimpão, 52 - Morro Santana, Porto Alegre - RS, 91450-330	t	\N	\N	https://chat.whatsapp.com/DyKDqMF0D2IBnr2Dd8i3EB	2024-05-06T03:04:47.759Z	2024-05-14T01:11:31.244Z	EEEM Alcides Cunha	220	-30.0394275	-51.1230777	f	Porto Alegre	\N	\N	\N	\N
c0ee062d-9de5-49b5-bc22-f274a52b039e	\N	R. Ramiro Barcelos, 2500 - Santana, Porto Alegre - RS, 90035-003	\N	\N	\N	\N	2024-05-06T03:04:56.723Z	2024-05-12T02:03:21.781Z	RUs UFRGS	150	-30.0422139	-51.2077125	f	Porto Alegre	\N	\N	\N	\N
40d34be2-9c8a-41df-b86b-3c9909c0da47	\N	Av. Dr. Nilo Peçanha, 1521 - Três Figueiras, Porto Alegre - RS, 91330-000	f	0	\N	\N	2024-05-06T03:04:42.717Z	2024-05-14T13:56:21.208Z	Colégio Anchieta	30	-30.0295382	-51.175124	f	Porto Alegre	\N	\N	\N	\N
4ade18c9-0975-4fb6-8be2-988dc3089afa	\N	Rua 6 De Novembro, 332 - Mário Quintana, Porto Alegre	\N	\N	\N	\N	2024-05-07T01:04:20.663Z	2024-05-07T01:04:20.663Z	Espaço Comunitário Multiplicidade Poa	0	-30.0331154	-51.1176897	f	Porto Alegre	\N	\N	\N	\N
c082783c-12d1-4174-9e59-276a5c647079	\N	R. Chico Pedro, 390 - Camaquã, Porto Alegre	t	98	127		2024-05-07T01:04:18.413Z	2024-05-14T14:36:06.973Z	Escola Aramy Silva (emef)	323	-30.0978373	-51.2416315	t	Porto Alegre	\N	\N	\N	\N
cde9c9b1-81e4-403a-b4d9-6a7e9073aff2	financeiro@sogipa.com.br	R. Barão Do Cotegipe, 415 - São João, Porto Alegre - Rs, 90540-020	f	170	\N	https://chat.whatsapp.com/D28C59oCQL517LqdX1JhtJ	2024-05-06T03:04:57.851Z	2024-05-14T17:43:40.073Z	Sogipa	290	-30.0097359	-51.1880348	f	Porto Alegre	\N	\N	\N	\N
5c116641-b2a1-4b41-8bd4-6c8b45bc783f	\N	Rua João Leivas De Carvalho, 551, São José, Canoas	f	1	1	(51) 99430-2640	2024-05-14T17:19:45.062Z	2024-05-13T17:19:45.062Z	Ctg Seiva Nativa	0	\N	\N	f	\N	\N	\N	\N	\N
68965819-7e52-4ed3-b8b1-e5f2fa239acb	\N	Rua 5, 300, Guajuviras, Canoas	f	0	0	(51) 99753-6199	2024-05-14T17:18:12.692Z	2024-05-14T17:54:37.187Z	Comunidade Sagrado Coração De Jesus	0	\N	\N	t	\N	\N	\N	\N	\N
022fcaca-94ad-4917-9c59-5d95736a674b	\N	Av. Bento Gonçalves, 7196 - Agronomia	t	20	60	(51) 99191-2752	2024-05-06T13:44:13.212Z	2024-05-15T01:52:22.917Z	Igreja Lugar De Adoração	640	-30.0687806	-51.1438099	f	Porto Alegre	\N	\N	\N	\N
942565ba-f6ac-46f3-bea2-09cea520ca0a	\N	Av. Cel. Marcos, 1000 - Pedra Redonda, Porto Alegre - Rs, 91760-000	t	70	120		2024-05-06T03:04:38.206Z	2024-05-14T23:18:58.498Z	Aabb Porto Alegre	1810	-30.1240686	-51.2457055	f	Porto Alegre	\N	\N	\N	\N
64c872b6-3e46-43a8-a705-6db3289b3fae	\N	R. Borborema, 687 - E 691 - Vila Joao Pessoa, Porto Alegre	f	90	\N	\N	2024-05-07T01:04:28.667Z	2024-05-14T16:23:40.673Z	Projeto Surfar	740	-30.0730156	-51.1703683	f	Porto Alegre	\N	\N	\N	\N
5613526f-211d-4fd0-bb75-bc186e31df6e	\N	Rua Leopoldo Kamal, 291 0, bairro Scharlau - SÃO LEOPOLDO	\N	\N	\N	\N	2024-05-07T16:15:05.368Z	2024-05-07T16:15:05.368Z	Emef Clodomir Vianna Moog - São Leopoldo	0	-29.7279003	-51.155395	f	São Leopoldo	\N	\N	\N	\N
678940d7-8fba-4da6-9505-17111f383628	\N	Estrada do Rincão Ruas T, 35	t	150	\N	51992246691	2024-05-10T00:00:00.000Z	2024-05-12T19:34:55.122Z	Ministério Resgatados do Lodebar	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
8e112d66-6e72-4f17-9fab-7c778b191302	\N	Rua 06, 400 - Setor 5 Quadra X - Guajuviras, Canoas - Rs, 92415-570	f	410	120	(51) 9.9105-2300	2024-05-08T16:50:31.686Z	2024-05-14T15:50:06.676Z	Emef Carlos Drummond Andrade - Canoas	170	-29.9089819	-51.1365619	f	Canoas	\N	\N	\N	\N
44a58dd6-0f70-4c1c-bae1-87d01d49f149	\N	Rua João Paris 241	f	\N	\N	51980131519	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Turbulento express	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
8aee3834-3ff9-4aa5-a724-71b094aade50	\N	R. Islândia, 49 - Scharlau, São Leopoldo	f	\N	\N		2024-05-07T16:14:52.876Z	2024-05-12T18:03:21.040Z	Associação Moradores - São Leopoldo	0	\N	\N	f	São Leopoldo	\N	\N	\N	\N
353f8450-1885-4b98-a243-01a19593d1fd	\N	R. Rocco Aloise, 1030 - Sarandi, Porto Alegre - Rs, 91712-073	f	3000	3000	996497841	2024-05-10T15:45:23.399Z	2024-05-13T16:30:12.573Z	Quilombo Machado	590	\N	\N	f	Porto Alegre	\N	\N	\N	\N
58e59a33-b321-447a-af23-762a8e508664	\N	Rua vidal de negreiros, 340	f	\N	\N	995787846	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Instituto Leonardo Murialdo	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
a2d5a6c4-81c6-491f-820f-0a1a48a8a48c	\N	RUA EDMUNDO BASTIAN 558, CRISTO REDENTOR	f	\N	\N	51997027262	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	SOS CASA DA ACOLHIDA	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
b81699a1-be81-479b-a064-046a738dda6a	\N	Rua Jari, 221, Passo Da Areia, Porto Alegre	f	\N	\N	Débora Saueressig (51) 9.8275-0270 / Roberta (51) 9.8942-3828	2024-05-10T00:00:00.000Z	2024-05-14T19:41:13.941Z	Colo De Mãe (exclusivo Para Pessoas Autistas)	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
8f657747-1733-4665-ac7f-35074675eff2	\N	Rua Doze, 470 (esquina com Av. das Américas), bairro Duque de Caxias - SÃO LEOPOLDO	\N	\N	\N	\N	2024-05-07T16:14:55.112Z	2024-05-08T01:48:59.818Z	Capela Santa Rita - São Leopoldo	30	-29.79742336	-51.12989696	f	São Leopoldo	\N	\N	\N	\N
988aa603-63dc-4fff-85d6-9671b4640a2b	\N	Rua Wolfram Metzler, 600 - Rubem Berta, Porto Alegre	t	251	\N		2024-05-06T03:04:48.875Z	2024-05-15T00:38:07.374Z	Escola Grande Oriente	3400	-29.6786759	-51.0857556	f	Porto Alegre	\N	\N	\N	\N
14b58682-3c64-42fa-a61a-827f913fc174	\N	Walir Zottis N 380, Jardim Itu, Porto Alegre	f	50	70	(51) 9.9781-9262	2024-05-10T15:45:25.587Z	2024-05-14T00:56:10.567Z	Abrigo Do Gringo	750	\N	\N	t	Porto Alegre	\N	\N	\N	\N
db3695c7-d50e-43e0-9047-550bb980532f	\N	Av. ipiranga, 8300, Jardim Carvalho - PORTO ALEGRE	f	0	\N	\N	2024-05-06T03:04:39.900Z	2024-05-11T14:32:35.885Z	CEEE Ipiranga	200	-30.0566601	-51.1562501	f	Porto Alegre	\N	\N	\N	\N
124c9a46-72b6-4c16-b46a-4fa3be7cdc31	\N	Avenida Padre Cacique, 891 Ao lado do estádio Beira-Rio - Praia de Belas, Porto Alegre - RS, 90810-240	\N	\N	\N	\N	2024-05-06T03:04:51.666Z	2024-05-06T03:04:51.666Z	Gigantinho	0	-30.065066	-51.2365144	f	Porto Alegre	\N	\N	\N	\N
9fd89e47-46ed-4862-8046-5366e4e9e7b5	\N	Praça Walter Schultz, 32, Vila Ipiranga, Porto Alegre	f	\N	\N	(51) 9.8648-8544	2024-05-11T20:56:08.657Z	2024-05-11T20:56:08.657Z	Abrigo Para Pessoas Lgbt - Ipiranga	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
f33927e8-9633-48f5-a432-48021b6ba712	\N	AV SALVADOR FRANCA 300 CASA 13	f	\N	\N	51981408903	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	PROJETO SOCIAL ANGELINA LUZ	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
78dd3306-5706-4f9f-b23d-3ab41a2beba2	\N	Rua Appel 798, Santa Maria -rs, Cep: 97015-140	f	75	100	\N	2024-05-08T17:15:41.846Z	2024-05-09T15:42:26.857Z	Centro Desportivo Municipal Cdm - Santa Maria	40	-29.6951653	-53.8169636	f	Santa Maria	\N	\N	\N	\N
99459d98-6e1d-470d-b060-edcc76744227	\N	R. Ernesto Che Guevara, 281 - Guajuviras, Canoas - Rs, 92440-848	t	490	\N	(51) 9.8142-4661	2024-05-06T06:35:43.901Z	2024-05-14T17:18:34.859Z	Escola Paulo Freire - Canoas	80	-29.8904101	-51.1292424	f	Canoas	\N	\N	\N	\N
c8e42fb5-0e2f-4339-af4c-d8dd7bbce6e8	\N	Rua 24 de outubro 1751	t	\N	\N	11948516796	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Espaço Pet Igreja Auxiliadora	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
5834ca11-472c-4f9b-9785-f157d377873b	\N	Rua Mauá, 980, Centro - SÃO LEOPOLDO	\N	\N	\N	\N	2024-05-07T16:15:17.493Z	2024-05-07T16:15:17.493Z	Lar Santa Elisabete / Colégio São José - São Leopoldo	0	-30.0276221	-51.2315846	f	São Leopoldo	\N	\N	\N	\N
94b90d0c-d196-4273-862c-749c40b4307a	\N	Rua Jerônimo Zelmanovitz 01, São Sebastião - Porto Alegre	f	\N	\N	51984178210	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	UPA Moacyr Scliar	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
ed183f4a-3333-4a27-9795-e3f43cc7f422	\N	R. Gen. Lima e Silva, 1647 - Cidade Baixa, Porto Alegre - RS, 90050-102	\N	\N	\N	\N	2024-05-06T03:04:46.637Z	2024-05-09T03:38:38.030Z	Drop bar [DESATIVADO]	0	-30.0465376	-51.2152249	f	Porto Alegre	\N	\N	\N	\N
039718f2-5382-4b52-b75f-bbb951375e1d	\N	R. Carlos Estevão, 233 / 207 - Jardim Dona Leopoldina	f	0	0		2024-05-14T17:49:07.596Z	2024-05-14T17:49:55.046Z	Rede De Apoio Aos Territórios Indígenas Do Rs - Leopoldina	0	\N	\N	t	\N	\N	\N	\N	\N
ad321e5e-6efc-4405-a099-04bdbce500cf	\N	Rua Dona Laura, 166 - Parque Granja Esperança - Cachoerinha	f	0	0		2024-05-14T17:49:21.505Z	2024-05-14T20:22:24.761Z	Rede De Apoio Aos Territórios Indígenas Do Rs	0	\N	\N	t	\N	\N	\N	\N	\N
c7acb35c-72fe-4d3d-ac50-668a770f21a4	\N	Av. Dr. Sezefredo Azambuja Vieira, 61, Olaria, Canoas	f	0	0	(51) 99560-8259	2024-05-14T18:12:10.099Z	2024-05-14T18:12:41.504Z	E.e.e.f. Planalto Canoense	0	\N	\N	t	\N	\N	\N	\N	\N
0cbf3209-453d-40c6-85ee-060b8a8ae9cb	\N	Rua Coronel Joaquim Pedro Salgado, 80 - Rio Branco, Porto Alegre - Rs, 90420-060	t	135	150		2024-05-06T18:30:57.790Z	2024-05-14T18:39:10.741Z	Ipa - Centro Universitário Metodista (casemiro De Abreu)	2199	-30.0339667	-51.1971475	t	Porto Alegre	\N	\N	\N	\N
96ab15d6-ecf2-47fe-bbe6-7b6764ead09a	\N	R. Jânio Quadros, 156 - Glória Porto Alegre - Rs, 91710-450	f	0	0		2024-05-14T17:40:29.356Z	2024-05-14T20:48:50.639Z	Rede De Apoio Aos Territórios Indígenas Do Rs Cascata	1130	\N	\N	t	\N	\N	\N	\N	\N
2f9c350e-9707-48f3-9d07-e690f29699aa	\N	Rua cel. Lafaiete cruz 690 estância velha Canoas	f	\N	\N	51981778039	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Igreja de Jesus Cristo dos Santos dos Últimos Dias	0	\N	\N	t	Canoas	\N	\N	\N	\N
1ed38a8a-2217-4b3f-b838-f63b8af2e2fc	\N	R. Aurora, 1220 - Mal. Rondon, Canoas - Rs, 92020-510	f	301	300	Fabio Trojan (55) 9.9151-8485	2024-05-08T16:50:27.740Z	2024-05-14T02:14:34.529Z	Sesi - Canoas	30	-29.910159276749418	-51.169538560520806	f	Canoas	\N	\N	\N	\N
a7c72997-f0ba-4a13-bba0-2743dbb04f56	\N	Martins Félix Berta 38, Rubem Berta, Poa	f	\N	\N	51 981953635	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Imperatriz Dona Leopoldina	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
9dd4b483-929a-4656-b2fb-aa3ac2ae7818	\N	Rua Santa Terezinha, 860 - Bairro Nossa Senhora Das Graças, Canoas	t	350	350	Éder (51) 9.8926-6224	2024-05-08T16:50:35.618Z	2024-05-13T13:08:46.999Z	Aabb - Canoas	340	-29.9305176	-51.1628284	t	Canoas	\N	\N	\N	\N
36f0516d-b08e-451e-9cc2-86f96da044e2	\N	Av. Inconfidência, 460 - Nossa Sra. Das Gracas, Canoas	f	85	85	51 993744139	2024-05-08T16:50:29.087Z	2024-05-13T15:59:24.722Z	Escola Edu.co - Canoas	67	-29.9245355	-51.1757368	f	Canoas	\N	\N	\N	\N
e160e173-9c64-4121-834a-d0a7f73af2c4	\N	Av. Esperança, 1560 - Guajuviras, Canoas - Rs, 92440-565	f	110	50	(51) 9.9272-6416	2024-05-08T16:50:37.652Z	2024-05-13T22:38:15.726Z	Igreja Hebrom - Canoas	180	-29.890207577960222	-51.14125020208303	f	Canoas	\N	\N	\N	\N
c02b6b29-3e29-467c-b426-b18662e6be93	\N	R. Liberdade, 980 - Mal. Rondon, Canoas - Rs, 92020-240	f	45	45	(51) 9.9508-0094	2024-05-08T16:49:33.980Z	2024-05-13T19:59:32.081Z	Orbita - Canoas	0	-29.9085374	-51.1729768	f	Canoas	\N	\N	\N	\N
45a746a7-3c88-4667-aaa6-7fa4ae62435f	\N	Estrada Da Taquara, 671 - Bairro Lageado	f	0	0		2024-05-14T17:48:55.652Z	2024-05-14T17:50:11.188Z	Oka Manaka - Rede De Apoio Aos Territórios Indígenas Do Rs	0	\N	\N	t	\N	\N	\N	\N	\N
911c231d-a09d-4b3e-b199-78854be2cb58	\N	Av. Pres. Vargas, 377 - Patronato, Santa Maria - Rs, 97020-001	f	2	10	0	2024-05-09T04:07:09.402Z	2024-05-14T16:22:19.159Z	Templo Das Nações - Santa Maria	68	\N	\N	f	Santa Maria	\N	\N	\N	\N
d5f1b990-bc50-4564-bb05-ae52af1b56b3	\N	Av. Victor Barreto, 2288 - Centro, Canoas - Rs, 92010-000	f	480	300	(51) 9.8907-2153	2024-05-08T16:50:27.041Z	2024-05-14T13:38:40.305Z	Universidade Unilasalle Centro - Canoas	200	-29.9174051	-51.1802408	f	Canoas	\N	\N	\N	\N
25dbd422-5ec3-4a6e-841d-4e18173fbe83	\N	Rua Walter Spiess, S/n, Estância Velha, Canoas	f	0	0		2024-05-14T18:14:10.593Z	2024-05-14T18:14:24.071Z	E.m.e.f Arthur Oscar Jochims	0	\N	\N	t	\N	\N	\N	\N	\N
b86e6275-e274-4091-b36a-346a2f6d25a7	\N	Grêmio Geraldo Santana, Rua Luiz De Camões, 337	f	0	0		2024-05-07T16:20:45.101Z	2024-05-12T19:11:19.422Z	Centro De Triagem Geraldo Santana	1720	-30.0551779	-51.2009834	t	Porto Alegre	\N	\N	\N	\N
67651643-03d0-4a7d-a2da-b92b423ec8ac	\N	R. Rio Tietê, 510 - Arroio Da Manteiga, São Leopoldo - Rs, 93145-060	t	430	\N	(51) 9.9780-0145	2024-05-07T16:14:53.425Z	2024-05-13T14:39:17.270Z	Associação Moradores Jardim Luciana - São Leopoldo	1650	-29.70870574	-51.19128243	f	São Leopoldo	\N	\N	\N	\N
95b97ec2-a9be-43d7-9377-5f6f44d61db3	\N	Rua Cipó, 450 - Vila Ipiranga, Porto Alegre	t	150	120	(51) 99199-8738	2024-05-06T03:05:00.629Z	2024-05-09T12:25:31.048Z	Igreja Luterana Congregação São Paulo	650	-30.0199672	-51.1587408	f	Porto Alegre	\N	\N	\N	\N
e01657b5-c64c-473e-a08c-29d1c0644319	\N	R. Bento Martins, 457 - Piratini, Alvorada - Rs, 94852-490	f	1	1	Isadora (51) 9.8236-0018	2024-05-13T19:42:02.721Z	2024-05-14T18:47:00.979Z	Bgd Arena [abrigo Somente Para Mulheres E Crianças]	0	\N	\N	f	Alvorada	\N	\N	\N	\N
26a1497d-7ba3-49cc-8a51-79bc23bc2676	\N	R. Andrade Neves, 171 - São João Batista, São Leopoldo - Rs, 93022-400	f	130	1	Claudia Tatiana Brito (51) 9.9264-0492	2024-05-13T19:39:59.108Z	2024-05-14T13:50:58.370Z	Paróquia São João Batista (abrigo) - São Leopoldo	590	\N	\N	f	São Leopoldo	\N	\N	\N	\N
777e7126-a5a6-4a40-89f8-ab6f0e13ba46	\N	Rua Roque Gonzales, Sn - Cristo Rei	t	150	\N	\N	2024-05-07T16:15:12.241Z	2024-05-14T14:27:17.909Z	Escola Estadual Cristo Rei - São Leopoldo	320	-29.8546682	-51.1454938	f	São Leopoldo	\N	\N	\N	\N
c275c8c9-514d-484d-aad2-e2e8b2f7c882		Av. 21 de Abril, 792 - Sarandi, Porto Alegre - RS, 91120-630	\N	\N	\N	\N	2024-05-06T03:04:39.334Z	2024-05-14T23:27:48.081Z	AMVEP [DESATIVADO]	2	-29.9857901	-51.1298725	f	Porto Alegre	\N	\N	\N	\N
cc8e231c-73fe-41bb-92ac-0af903f2da58	\N	Av. Ipiranga, 5311 - Partenon, Porto Alegre - RS, 90610-001	\N	\N	\N	\N	2024-05-06T03:04:38.772Z	2024-05-12T22:01:07.104Z	AMRIGS	280	-30.057263	-51.186334	f	Porto Alegre	\N	\N	\N	\N
06e4a171-8579-4b18-9597-d637fe01fdda	\N	R. Rio Dos Sinos, 10 - Liberdade, Novo Hamburgo - Rs, 93332-240	t	300	1	Magda (51) 9.8108-2550 / Elton (51) 9.9978-1244 	2024-05-13T18:51:16.827Z	2024-05-14T00:56:06.324Z	Paróquia Santo Antônio - Novo Hamburgo	210	\N	\N	f	Novo Hamburgo	\N	\N	\N	\N
52975860-eae4-470a-a4e4-ad7a5ec6d917	\N	Rua Alfredo Ferreira Rodrigues, 631 - Bom Jesus	f	0	0		2024-05-14T17:48:39.237Z	2024-05-14T17:50:29.047Z	Rede De Apoio Aos Territórios Indígenas Do Rs - Bonja	0	\N	\N	t	\N	\N	\N	\N	\N
c6dd015c-fdab-4201-bcbf-29e9b507fab9	\N	Rua Butuí 221	t	81	81	51996483730	2024-05-10T00:00:00.000Z	2024-05-12T22:33:59.270Z	Emef Prof. Elyseu Paglioli	1590	\N	\N	t	Porto Alegre	\N	\N	\N	\N
bd03e148-2454-4650-8fae-2712e11c1a43	\N	Estr. Martins Félix Berta, 2123 - Rubem Berta	f	0	0		2024-05-14T17:41:55.792Z	2024-05-14T17:50:47.075Z	Rede De Apoio Aos Territórios Indígenas Do Rs - Rubem Berta	0	\N	\N	t	\N	\N	\N	\N	\N
7f67759c-0aec-4f78-b2ed-a7b386ff87ed	(51) 99606-7480	Av. Piratini, 76 - Santana, Porto Alegre - Rs, 90040-160	t	200	\N	51 98452-5490	2024-05-06T18:30:38.341Z	2024-05-14T22:00:35.984Z	Colégio Júlio De Castilhos	1180	-30.0441372	-51.2127628	f	Porto Alegre	\N	\N	\N	\N
ff4a7e34-3597-4bdc-91fc-8933abeec05f	\N	Av. Inconfidência, 460, Nossa Senhora Das Graças, Canoas	f	0	0	(51) 99374-4139	2024-05-14T18:14:53.390Z	2024-05-14T18:15:09.586Z	Edu.co - Coworking Educacional	0	\N	\N	t	\N	\N	\N	\N	\N
a19c567a-ebe1-4f5f-9389-f159c26d0b4a	\N	Av. baltazar de oliveira garcia, 2132 - Porto Alegre	t	700	\N	https://chat.whatsapp.com/Fs967Q6vvIn6F77pBUTnyF	2024-05-06T03:05:02.304Z	2024-05-14T23:30:41.549Z	Centro Humanista	3390	-30.0106249	-51.1227617	f	Porto Alegre	\N	\N	\N	\N
14924f93-f3dd-48a8-a711-49c5ffe1a6c7	\N	Rua Monte Castelo, 975 , Nossa Senhora Das Graças, Canoas	f	0	0	(51) 99101-0478	2024-05-14T18:18:02.285Z	2024-05-14T18:18:24.518Z	Emef Duque De Caxias	0	\N	\N	t	\N	\N	\N	\N	\N
cbfb456b-d879-4a47-95b0-91c5f83b3a80	\N	Rua Imbé, 25, Estância Velha, Canoas	f	0	0	(51) 99630-5208	2024-05-14T18:18:57.346Z	2024-05-14T18:19:10.542Z	Emef Engenheiro Ildo Meneghetti	0	\N	\N	t	\N	\N	\N	\N	\N
1b16c142-7f78-450c-bca7-637756c89348	\N	Rua Tapajós, 290 , Igara, Canoas	t	121	0	(51) 98529-8574	2024-05-14T18:15:47.683Z	2024-05-14T19:21:49.932Z	Emef Castelo Branco	650	\N	\N	t	\N	\N	\N	\N	\N
4f9d5e9b-43eb-4ba7-919b-4be27e988a79	\N	Rua Dona Laura, 646 - Rio Branco, Porto Alegre	f	65	66		2024-05-07T01:04:13.357Z	2024-05-15T01:11:05.002Z	Caixeiros Viajantes	102	-30.0292037	-51.1991499	f	Porto Alegre	\N	\N	\N	\N
89a2d2cd-48dd-4a69-b4e7-bf159776d938	\N	R. Mali, 255 - Vila Ipiranga, Porto Alegre - Rs, 91370-380	t	90	1	Paulo César Betim (51) 3349-6600 ou (55) 9.8100-5885	2024-05-13T18:21:49.639Z	2024-05-13T19:08:23.476Z	Colégio Adventista Marechal Rondon	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
5daec969-8869-4121-bafc-1425731e6487	\N	Rua Bernardo Pires, 415 - Santana, Porto Alegre	f	0	\N	\N	2024-05-07T01:04:17.299Z	2024-05-13T17:55:48.415Z	Cremers	330	-30.0466914	-51.2043267	f	Porto Alegre	\N	\N	\N	\N
80e21c9a-66ef-4393-93c7-663a24883471	\N	Rua Dr. Olávo Fernandes, 68, Estância Velha, Canoas	f	0	0	(51) 99950-6950	2024-05-14T18:25:04.733Z	2024-05-14T18:25:24.203Z	Escola Irmão Pedro	0	\N	\N	t	\N	\N	\N	\N	\N
35e9c5ed-6b46-4997-b06a-2337690fbd59	\N	Rua Victor Silva, 186 - Camaquã, Porto Alegre - RS, 91910-170	f	0	\N	\N	2024-05-06T03:04:49.441Z	2024-05-12T12:58:27.977Z	Escola São Francisco	100	-30.1078132	-51.2412989	f	Porto Alegre	\N	\N	\N	\N
98c04b11-66df-400c-bc31-cfc0c1ad52f3	\N	Av. Protásio Alves, 6220 - Petrópolis, Porto Alegre - Rs, 91310-001	f	250	250	(51) 9.9978-8352	2024-05-06T03:04:57.286Z	2024-05-14T15:16:19.325Z	Sesc - Protásio Alves	450	-30.0390535	-51.1474315	t	Porto Alegre	\N	\N	\N	\N
c58e54f7-91cf-44c1-9561-00cf5e48b9bc	\N	Estrada José Cardoso Da Costa, 1500, Extrema, Porto Alegre	f	\N	\N	(51) 9.9995-6645	2024-05-10T00:00:00.000Z	2024-05-12T17:51:04.233Z	Aldeia Indígena Mbya Guarani	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
122e242b-3829-40fa-b6ff-78f351101064	\N	Av. Érico Veríssimo, 307 - Menino Deus, Porto Alegre - RS, 90160-181	\N	\N	\N	\N	2024-05-06T03:04:58.407Z	2024-05-08T14:15:41.181Z	Teatro Renascença [DESATIVADO]	0	-30.0474023	-51.2189333	f	Porto Alegre	\N	\N	\N	\N
f5205195-2cf2-4a39-8e30-7761bc63c40d	\N	R. Candiota, 145 - Passo d'Areia, Porto Alegre - RS, 91030-020	t	60	\N	\N	2024-05-06T03:04:47.204Z	2024-05-13T07:41:44.536Z	EEEF Gonçalves Dias - IAPI [DESATIVADO]	0	-30.0105687	-51.1738554	f	Porto Alegre	\N	\N	\N	\N
0e42aab7-480b-451b-b4c0-b7b5956da45d	\N	R. Quintino Bocaiúva, 500 - Moinhos De Vento, Porto Alegre - Rs, 90440-050	t	270	270	https://chat.whatsapp.com/GQXallZnpaV3SSfHIKtkeo	2024-05-06T03:04:52.796Z	2024-05-14T14:07:12.701Z	Gnu - Grêmio Náutico União - Sede Moinhos De Vento	6415	-30.0219344	-51.1980351	f	Porto Alegre	\N	\N	\N	\N
9b4ff79d-87e5-4eff-99fb-e981f3bc3998	\N	Av. Maj. Manoel José Monteiro, 1 - Rubem Berta	t	100	\N	984195082	2024-05-10T00:00:00.000Z	2024-05-13T12:44:35.491Z	EMEF Jean Piaget	250	\N	\N	t	Porto Alegre	\N	\N	\N	\N
e83fde72-4f7d-417d-9a77-1f769e7e95b5	\N	Av. Heitor Vieira 494, Belém Novo	\N	\N	\N	\N	2024-05-07T17:54:51.772Z	2024-05-10T15:58:58.909Z	Abrigo Extremo Sul	400	-30.2108074	-51.182621	f	Porto Alegre	\N	\N	\N	\N
0dab31f3-609c-401a-8863-06a3753efe3b	\N	Rua Guarujá, 910, São José, Canoas	f	0	0	(51) 99430-2640	2024-05-14T18:01:05.414Z	2024-05-14T18:01:20.977Z	Ctg Veteranos	0	\N	\N	t	\N	\N	\N	\N	\N
cc2a6d2e-c85f-45a4-9549-c6df9ab89831	\N	Rua João Dallegrave, 130 - Morro Santana, Porto Alegre - Rs, 91260-170	t	97	97	51 995426464 / 51 33877988 / 51 992200880	2024-05-10T15:45:26.673Z	2024-05-14T13:40:07.831Z	Escola Eef Porto Alegre	424	\N	\N	t	Porto Alegre	\N	\N	\N	\N
05a4563e-f7cd-4257-ab9c-7171acaaefc4	\N	estrada antonio severino 1493 - rubem berta	f	\N	\N	51 99582-1176	2024-05-10T00:00:00.000Z	2024-05-11T21:54:21.919Z	CESMAR MARIO QUINTANA	30	\N	\N	t	Porto Alegre	\N	\N	\N	\N
b7bf1475-49e3-4ed6-a40a-43f9e965cff2	\N	Av. Estados Unidos, 269 - Parque Mal. Rondon, Cachoeirinha - Rs, 94965-150	f	\N	\N	Artur Rossi (51) 9.9306-1418 / Edna (51) 9.9157-7467	2024-05-11T20:54:18.537Z	2024-05-13T14:42:17.019Z	Paróquia Divino Espírito Santo - Cachoeirinha	0	\N	\N	f	Cachoeirinha	\N	\N	\N	\N
4a6bde72-e52a-4c92-9665-45a20133d1b5	\N	AV. Bernadino Silveira Pastoriza, 771 - Bairro Santa Rosa	\N	\N	\N	(51) 98441-4614	2024-05-06T13:43:21.625Z	2024-05-09T01:05:50.442Z	Igreja Betel	0	-29.9912334	-51.1007928	f	Porto Alegre	\N	\N	\N	\N
1921319e-bc0c-4738-ae92-5ee51aa84f9b	\N	Rua Tietê, S/n, Igara, Canoas	f	0	0	(51) 99963-9007	2024-05-14T18:01:54.770Z	2024-05-14T18:02:17.288Z	E.e.e.f. Cel. Vicente Freire	0	\N	\N	t	\N	\N	\N	\N	\N
8bdfbe45-f67e-4ac3-a1a1-3fd2f3f05e31	\N	Av. Boqueirão, 1320, Igara, Canoas	f	0	0	(51) 99911-4955`	2024-05-14T18:13:11.747Z	2024-05-14T18:13:45.605Z	E.e.e.m. Érico Veríssimo	0	\N	\N	t	\N	\N	\N	\N	\N
d6421a14-e3a8-43c5-84cc-445e169043c2	\N	Avenida Artur Emílio Jenisch, 296, Cerro Grande	t	100	100	Ricardo Batista	2024-05-08T21:26:47.766Z	2024-05-12T14:33:09.419Z	Salão Paroquial São José	110	-27.6082282	-53.1656869	f	Porto Alegre	\N	\N	\N	\N
1df06751-fb66-41c7-8467-b51b2e0f0378	\N	Rua Vinte e Quatro de Outubro, 1681	f	\N	\N	51-991212300	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	APAA - Associação de Pais e Amigos Anchietanos	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
b8d3b2f8-1b65-414a-b086-70fd1179bd1b	\N	Av. Dezessete De Abril, 430, Guajuviras, Canoas	f	0	0	(51) 99327-5943	2024-05-14T18:19:38.068Z	2024-05-14T18:21:47.408Z	Emef Erna Wurth	0	\N	\N	t	\N	\N	\N	\N	\N
7f21ccc7-d1de-4a23-b710-260761213000	\N	Rua Coronel Corte Real, 975 - Petrópolis, Porto Alegre - Rs, 90630-080	f	0	0	Vivian (51) 9.8173-1883	2024-05-07T01:04:29.240Z	2024-05-14T10:46:28.616Z	Simers - Sindicato Médico Do Rio Grande Do Sul	644	-30.049224	-51.195563	f	Porto Alegre	\N	\N	\N	\N
02ad39aa-d33a-4cfc-af8e-8b0d2fbe8e12	\N	Rua Alberto Rodrigues De Oliveira, 125, Olaria, Canoas	t	200	0	(51) 99170-2146 / Lidiane(51) 9.8255-1334	2024-05-14T18:24:20.858Z	2024-05-14T21:54:41.730Z	Emef Governador Walter Peracchi De Barcellos	350	\N	\N	t	\N	\N	\N	\N	\N
77a0f4cc-a62d-44bb-bba2-058d1d006d0a	\N	R. Fernando Osório, 1156 - Teresópolis, Porto Alegre - Rs, 91720-330	f	120	120		2024-05-07T01:04:10.560Z	2024-05-14T23:57:30.636Z	Apamecor	170	-30.092865	-51.2058169	t	Porto Alegre	\N	\N	\N	\N
82087ba4-959b-4321-9b90-a259be8b7b34	\N	R. Bolívia, 580, São Luís, Canoas	t	140	0		2024-05-14T18:26:28.826Z	2024-05-15T00:51:40.170Z	Escola Vasco Da Gama	300	\N	\N	t	\N	\N	\N	\N	\N
d86cdbed-4f2a-4bd8-9e4d-91a336f4fa50	\N	Rua Dezessete, 80 - Bom Jesus	t	112	112	51999500294	2024-05-10T15:45:22.305Z	2024-05-14T23:34:57.465Z	Imperiais Da Ponte	1050	\N	\N	t	Porto Alegre	\N	\N	\N	\N
dfff6433-df01-4ee5-b2ff-58df621f635e	\N	Rua Fiat Lux, 33, Igara, Canoas	f	0	0		2024-05-14T18:30:19.852Z	2024-05-14T18:30:37.615Z	Fiat Lux	0	\N	\N	t	\N	\N	\N	\N	\N
f3985a52-5c14-4cbb-b0d3-1702e26c15c5	\N	Estrada Aracaju, 650, Vila Nova	\N	\N	\N	\N	2024-05-07T01:04:21.840Z	2024-05-14T22:12:27.048Z	Ginásio Rede Calábria	160	-30.101955	-51.2172951	f	Porto Alegre	\N	\N	\N	\N
601c5c10-194b-430f-af04-53feafb69d93	\N	Av. São Borja, 1860 - Rio Branco	t	900	\N	\N	2024-05-07T16:14:56.798Z	2024-05-10T10:43:37.587Z	Centro De Eventos - São Leopoldo	810	-29.7813945	-51.1220368	f	São Leopoldo	\N	\N	\N	\N
830e3066-a383-4ef9-9aaf-efc87ad30ed5	\N	Av. Sargento Manoel Raimundo Soares, 753 \nno Gps Colocar Nº 756 Bairro Jardim Carvalho/poa	t	70	70	(51) 992651552	2024-05-10T15:45:31.113Z	2024-05-14T22:21:13.641Z	Tony Esportes	90	\N	\N	t	Porto Alegre	\N	\N	\N	\N
6419664f-4a49-4b1c-8e89-e98cb59566aa	\N	Professor Guerreiro Lima 476	t	61	80		2024-05-10T00:00:00.000Z	2024-05-13T12:34:27.504Z	Igreja Lagoinha Ipiranga	151	\N	\N	t	Porto Alegre	\N	\N	\N	\N
905820e1-6281-4e21-8ec5-9f501a9bae42	\N	Rua Ângelo Barcelos, 35 - Partenon	f	13	\N	\N	2024-05-06T13:46:54.976Z	2024-05-08T21:09:27.001Z	Igreja Quadrangular - Partenon	110	-30.0627072	-51.1767702	f	Porto Alegre	\N	\N	\N	\N
fed7abfb-e144-4dc9-858c-647b97a74c58	\N	Rua Frei Henrique Golland Trindade 425 - Boa Vista	f	\N	\N	51999117488	2024-05-10T00:00:00.000Z	2024-05-12T18:44:43.006Z	União de Cegos do Rio Grande do Sul	20	\N	\N	t	Porto Alegre	\N	\N	\N	\N
f728ff4a-886d-498b-913c-54fd349920bb	\N	Rua Santana 440	f	\N	\N	5199847308	2024-05-10T00:00:00.000Z	2024-05-12T19:13:12.516Z	Ministério público estadual	50	\N	\N	t	Porto Alegre	\N	\N	\N	\N
72f78b69-9021-45da-89a1-004bb8dfa66f	\N	Av. José Brambila 250	t	40	\N	51995394268	2024-05-10T00:00:00.000Z	2024-05-14T03:19:52.509Z	ONG VIDA VIVA	800	\N	\N	t	Porto Alegre	\N	\N	\N	\N
9573e831-471a-4356-acc3-114f8940ab24	\N	Rua Coronel Claudino, 254	t	67	80	(51) 8271-5957/ (51) 99906-6807 / (51) 99107- 6074	2024-05-10T15:45:22.855Z	2024-05-12T18:21:13.699Z	Escola Estadual De Ensino Fundamental Rafael Pinto Bandeira	810	\N	\N	t	Porto Alegre	\N	\N	\N	\N
7648c991-9c53-4950-ac44-824ae0d8e1c7	\N	Edgar Pires De Castro 10195	t	400	\N	(51) 99326-1658	2024-05-06T06:38:37.518Z	2024-05-13T15:13:01.337Z	Probicho	810	-30.2024816	-51.1198484	f	Porto Alegre	\N	\N	\N	\N
fd2d679b-4e9c-45e3-a8e2-4f4db15b7555	\N	Rua Cinco, 60, Vila Das Laranjeiras	f	32	42		2024-05-07T01:04:22.412Z	2024-05-12T20:08:52.798Z	Igreja Assembleia De Deus	90	-30.04661244	-51.12957303	t	Porto Alegre	\N	\N	\N	\N
6a92d9dc-0c0c-40b2-80e9-c2c73465566d	\N	Av Benno Mentz, 1560	f	65	65	51981384557	2024-05-10T15:45:28.890Z	2024-05-14T16:19:14.175Z	Educandário São Luiz	500	\N	\N	f	Porto Alegre	\N	\N	\N	\N
40217bba-4f81-4dda-a5e6-a01fc4acad82	\N	Av. John Kennedy 93, Vila Tereza	f	30	\N	\N	2024-05-07T16:15:24.493Z	2024-05-10T15:23:47.148Z	Igreja Evangelica Assembleia De Deus Congregaçao Vila Tereza - São Leopoldo	150	-29.78845922	-51.12869092	f	São Leopoldo	\N	\N	\N	\N
2f6e9600-8675-4f86-89d5-381a44ef5ab2	igrejapazpoa@gmail.com	Rua Dom Diogo de Souza, 380, Cristo Redentor - PORTO ALEGRE	f	50	50	(51) 9.8168-6964	2024-05-06T13:36:52.372Z	2024-05-10T18:55:11.538Z	Igreja Da Paz	650	-30.0138655	-51.1545577	t	Porto Alegre	\N	\N	\N	\N
bdafa47d-5a42-4f1a-9008-c7f868961b18	\N	Av. João De Cesario, S/n Arroio Da Manteiga	t	120	\N	\N	2024-05-07T16:15:08.821Z	2024-05-09T05:47:39.593Z	Emef Mário Fonseca - São Leopoldo	0	-29.7216634	-51.1875166	f	São Leopoldo	\N	\N	\N	\N
38050655-12ed-4698-bce2-59089feb4d61	\N	Estrada dos batillanas 785	f	28	\N	51997158413	2024-05-10T00:00:00.000Z	2024-05-11T23:12:01.782Z	Recomeçar	990	\N	\N	t	Porto Alegre	\N	\N	\N	\N
f96410fd-dc61-4e49-baf6-1306f57a09de	\N	Travessa sertanejo, 20 Germânia Alvorada	f	\N	\N	51993544980 / 51998873248	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Associação dos moradores do bairro Germânia	0	\N	\N	t	Alvorada	\N	\N	\N	\N
07e75156-50f3-4b34-b518-1a32b5da7919	\N	wenceslau fontoura, ginásio tancredo nevesgin	f	\N	\N	51981918774	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Instituto Esperanza	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
0df801b0-cc89-4bf6-ad00-d6f704af75fb	\N	Rua Jorge Furtado 47	f	\N	\N	51995195069	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Os guardiões da alegria zona norte	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
80541323-333c-4a73-93ae-359861282230	\N	Rua Deodoro, 255 - Mario Quintana	f	\N	\N	51-994113015	2024-05-10T15:45:37.829Z	2024-05-10T15:45:37.829Z	Clínica Esperança Ceacri	0	\N	\N	f	Porto Alegre	\N	\N	\N	\N
f4612089-9f9a-494c-9c2f-0d90cd53e113	\N	Rua Dr Telmo Vergara, 293	f	\N	\N	51996256452	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	PACTOPOA - Programa de Auxílio Comunitário ao Terapêutico de Porto Alegre	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
16f60e8a-b8ab-4bfe-9168-a1d40c083f18	\N	rua nossa senhora aparecida 471, bairro arquipélago	f	\N	\N	51995921360	2024-05-10T00:00:00.000Z	2024-05-10T00:00:00.000Z	Sociedade espirita casa do evangelho - 87380838000136	0	\N	\N	t	Porto Alegre	\N	\N	\N	\N
7dfb239b-1151-4d6c-8bbb-52e3306ff422	\N	Bernardino Silveira Amorim, 1479	f	\N	\N	(51) 98265-8855	2024-05-06T13:40:09.656Z	2024-05-14T20:22:39.202Z	Igreja Impactando Gerações	0	-29.9935653	-51.1088098	f	Porto Alegre	\N	\N	\N	\N
ce1a62bd-3382-40a0-b2ed-3234c2640d66	\N	Est. Do Nazário, 3150, Guajuviras, Canoas	f	0	0	(51) 99825-5479	2024-05-14T18:31:07.159Z	2024-05-14T18:31:30.014Z	Hangar Cultural	0	\N	\N	t	\N	\N	\N	\N	\N
0f4e1dd4-df61-4df0-8afd-bcdfa42cb1df	\N	Rua Dom Pedro Ii, 102, Niterói, Canoas	f	0	0		2024-05-14T18:32:47.551Z	2024-05-14T18:33:05.646Z	Igreja Do Evangelho Quadrangular	0	\N	\N	t	\N	\N	\N	\N	\N
f7682670-c926-4c20-b51f-e1020c03301a	\N	Rua José Bonifácio, 197 , Nossa Senhora Das Graças, Canoas	f	0	0		2024-05-14T18:33:51.253Z	2024-05-14T18:34:07.921Z	Igreja Família De Fé	0	\N	\N	t	\N	\N	\N	\N	\N
7a11cf76-7f92-4734-8936-58c5b67c862c	\N	Rua Dr. Barcelos, 1271, Centro, Canoas	f	0	0		2024-05-14T18:36:02.519Z	2024-05-14T18:36:21.047Z	Liga Canoense	0	\N	\N	t	\N	\N	\N	\N	\N
e894e780-bd73-4b93-81f0-46a94cd7b431	\N	Av. Farroupilha, 8001, São José, Canoas	f	0	0		2024-05-14T18:56:54.994Z	2024-05-14T18:57:14.942Z	Hospital Universitário Ulbra - Pediatria	0	\N	\N	t	\N	\N	\N	\N	\N
813c097b-42e8-43dc-b471-c8aa8f709fdb	\N	Rua Cel. Alberto Rosa, 580, Pelotas	t	139	139	\N	2024-05-08T21:21:09.659Z	2024-05-15T02:17:37.263Z	Ginásio Aabb	0	-31.7701709	-52.3356456	f	Pelotas	\N	\N	\N	\N
\.


--
-- Data for Name: supplies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplies (id, supply_category_id, name, created_at, updated_at) FROM stdin;
377fdec9-9b17-4086-8986-3e04508c4917	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Banana	2024-05-08T16:23:26.186Z	\N
460c72c0-b362-4fe8-a7e8-06aabe57cccd	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas De Frio	2024-05-09T04:26:03.872Z	\N
daeef31b-be12-4950-9d5d-039103a3e257	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Fórmula Número 1 (0-6)	2024-05-13T12:47:29.527Z	\N
73c4e7cb-adf7-4d83-b013-d2643bf92697	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Ketchup	2024-05-13T12:47:57.715Z	\N
d055e235-2b2a-4fc6-8648-ea099aa15a33	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Mostarda	2024-05-13T12:48:15.086Z	\N
20b573c6-d94f-456e-9f0b-d1cb9ad609b9	5c9b6767-5310-461b-977b-906fe16370ae	Pipeto Para Caes Grandes	2024-05-13T12:50:42.381Z	\N
11e28579-d5fc-4738-803b-86c9f144d807	5c9b6767-5310-461b-977b-906fe16370ae	Buscopan	2024-05-13T12:50:58.286Z	\N
2cd15597-9745-43a5-bbe9-84f9c467b45d	5c9b6767-5310-461b-977b-906fe16370ae	Soro	2024-05-08T16:37:26.157Z	\N
02db1cee-b5a4-45e9-ad0b-bb22cada46f8	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Fósforo	2024-05-08T16:39:14.363Z	\N
47cc3a3a-c887-4c02-8f08-410010ea15b4	037ac262-4f35-42e0-83e1-4cdcceedb39c	Colher Descartável	2024-05-08T16:44:23.081Z	\N
0b0cc909-bb05-4234-a005-0a8bbde9ecd8	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Íntima Infantil	2024-05-08T16:45:08.357Z	\N
bb08b985-ca7c-4143-8550-dad6b11e6e31	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Alho	2024-05-09T10:37:04.987Z	\N
01750893-db86-4171-8c01-a41b61309a5d	03fdb0f2-6b50-4895-b970-5793cad80c86	Ração Gatos	2024-05-13T12:57:50.770Z	\N
1c2f0ea6-85c2-4b10-9028-568a751d2690	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Feminina Academia	2024-05-13T13:09:38.917Z	\N
4a963962-95d1-4da2-8260-73d167422452	5c9b6767-5310-461b-977b-906fe16370ae	Gaze	2024-05-08T16:37:54.890Z	\N
b1b07662-1ca5-4dfb-b750-69908ca81721	5c9b6767-5310-461b-977b-906fe16370ae	Permetrina Loção Capilar (piolho)	2024-05-08T16:42:05.759Z	\N
5c6aa175-602e-44c1-90b1-5bf8b7915df7	037ac262-4f35-42e0-83e1-4cdcceedb39c	Descartáveis	2024-05-08T16:42:41.674Z	\N
65a4c3ee-0d66-48c0-9324-950134da1d29	03fdb0f2-6b50-4895-b970-5793cad80c86	Antipulgas - Animais Pequeno Porte	2024-05-08T16:46:01.176Z	\N
7ec537b7-31aa-4a4e-9fba-4ef922665767	fd1f74c4-6723-4ffe-8657-773a943e65c4	Colete Salva Vidas	2024-05-09T10:56:00.254Z	\N
b3b04603-b2a8-4178-a12c-606177a04178	037ac262-4f35-42e0-83e1-4cdcceedb39c	Colheres Descartáveis (grandes/resistentes, Para Refeições)	2024-05-13T13:28:25.456Z	\N
38939273-b35e-49bf-b84f-0a04f747d44e	718d5be3-69c3-4216-97f1-12b690d0eb97	Chupeta/bico	2024-05-08T16:43:39.922Z	\N
25ca1e0d-8c5a-4cdf-b3c6-41ac395d2a79	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Comidas Não Perecíveis	2024-05-08T16:50:36.998Z	\N
b9368d94-0425-4b23-ada4-66f8986f7368	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Água	2024-05-08T16:50:50.272Z	\N
2b408b16-8dbc-41df-b3c8-7efb18d462b7	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina Gg	2024-05-08T16:51:48.422Z	\N
3bc70d84-418a-4aee-bb4d-d14ce0091784	fd1f74c4-6723-4ffe-8657-773a943e65c4	Pilha AA	2024-05-08T16:40:22.164Z	\N
d382afa7-cef6-4e16-89aa-22a5e20562e6	718d5be3-69c3-4216-97f1-12b690d0eb97	Xarope Para Gripe	2024-05-09T12:16:19.103Z	\N
b66abcc8-33e7-4476-b725-a34f7dc90585	be0e4018-ca46-44cd-b814-7681ba98c51a	Vela	2024-05-08T16:38:25.378Z	\N
035742b7-9725-4001-b32d-982b6b0890e5	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Tênis Tamanhos 43, 44, 45	2024-05-13T13:29:09.911Z	\N
e4bedb60-5d9c-4cc6-8ba7-f93d890c6cec	5c9b6767-5310-461b-977b-906fe16370ae	Higiene Pessoal	2024-05-08T16:55:40.238Z	\N
7396a7d2-dd6c-4b9f-a3ac-9a477dc6d2c3	03fdb0f2-6b50-4895-b970-5793cad80c86	Caixa De Transporte	2024-05-08T17:07:31.084Z	\N
20117fd1-1e8a-4c29-9cf4-855a11fc9030	05583098-5f2e-44e2-b874-452ec86d9d3e	Ponto De Resgate	2024-05-08T18:04:48.121Z	\N
21d0b947-aabf-445d-8622-464875e4b937	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina Para Frio (todos Tamanhos)	2024-05-09T12:18:19.892Z	\N
79c7f357-2e62-4ab9-8152-de7165e6dae6	718d5be3-69c3-4216-97f1-12b690d0eb97	Shampoo Em Embalagens Pequenas	2024-05-09T12:25:30.518Z	\N
e3ec602e-3c71-479d-9e13-e69f28d32122	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Plus Size Masculina (58, 60+)	2024-05-13T13:33:37.809Z	\N
43a27a70-3ed5-4a3d-8428-623810c3f717	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas para adultos	2024-05-06T03:04:40.468Z	\N
4a394115-77b5-48e6-bafb-b1f5bc0c8eaf	718d5be3-69c3-4216-97f1-12b690d0eb97	Cadeira De Rodas Higiênica Para Banho	2024-05-08T17:18:20.946Z	\N
9ee6fd99-6604-438c-a3cc-15d2c7f997ed	718d5be3-69c3-4216-97f1-12b690d0eb97	Lavanderia	2024-05-08T17:19:43.648Z	\N
61987ae1-ed89-4be5-8918-0beb83e5d46b	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina Gg	2024-05-08T17:31:14.503Z	\N
99d42576-350e-4fd5-b319-34aa2f8532e6	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Pão De Sanduíche	2024-05-08T17:34:41.486Z	\N
fab30458-721d-4712-90d5-3c15e0e102e9	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Geléia	2024-05-08T17:35:11.214Z	\N
8e5bab94-d594-46dd-a855-7675f5d8231f	5d50d3cf-4e36-4639-813d-d43de8886ac8	Água Sanitária	2024-05-08T17:44:03.674Z	\N
e1d9baf6-5014-468f-9549-2b1853767835	5c9b6767-5310-461b-977b-906fe16370ae	Guarda-chuva	2024-05-08T18:20:28.822Z	\N
4c1473a9-f309-4417-ba8f-c89768cdccaf	5c9b6767-5310-461b-977b-906fe16370ae	Guarda-sol	2024-05-08T18:20:49.289Z	\N
f1afbf07-cd33-409c-b735-aac7f0b36fbc	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Margarina	2024-05-09T12:34:01.807Z	\N
8003eb41-3cc3-4c75-a408-db2001513071	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Mucilon	2024-05-09T12:34:20.059Z	\N
043739b5-1191-46b2-9ee0-4838838464cf	03fdb0f2-6b50-4895-b970-5793cad80c86	Tesoura	2024-05-09T12:34:51.851Z	\N
3a040ebd-225f-4f0c-934c-5b14399fbd4f	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Garrafas Térmicas	2024-05-09T12:37:09.167Z	\N
ef549295-5ce6-485d-8383-458f9e6437bb	c117dd37-82ab-43a6-bf66-d97acef97f6e	Livros	2024-05-08T17:22:40.447Z	\N
455ae326-aa31-4776-91d0-0aa0893660fd	03fdb0f2-6b50-4895-b970-5793cad80c86	Ossinho Ou Semelhantes Para Ansiedade	2024-05-13T14:10:15.191Z	\N
fd54a76a-cdb9-4543-9df6-24baa384e38c	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Suco Em Pó	2024-05-08T17:20:15.836Z	\N
36b4a759-d476-4904-ab8e-475404bb564a	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Íntima (adulto) Feminina E Masculina	2024-05-08T17:21:07.020Z	\N
25d8225d-5de2-491b-ad28-9cd05df3ca78	b3a81a9d-a964-4413-9a33-974a3b4673d1	Balança	2024-05-09T12:35:09.146Z	\N
1ddc00de-781a-49ed-bddd-bdc7b24d5231	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Açucar	2024-05-09T12:51:44.344Z	\N
49269442-ab56-4023-be4f-9201c8ade196	c117dd37-82ab-43a6-bf66-d97acef97f6e	Brinquedos	2024-05-08T17:21:54.215Z	\N
bedefc40-5ec1-469a-88fa-b17736d0dfe1	03fdb0f2-6b50-4895-b970-5793cad80c86	Cama Pet Grande	2024-05-13T14:10:40.808Z	\N
37a627ee-d6f6-4f94-8edc-190c89a3f255	037ac262-4f35-42e0-83e1-4cdcceedb39c	Fraldas G, Gg, M, P	2024-05-13T14:51:31.251Z	\N
77d2613d-eefe-41d5-a786-f6cfa582bb1e	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Colchonete	2024-05-13T15:43:07.789Z	\N
44c1015d-a43a-45b9-a4b9-7eee0d764c45	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas 1 E 2 Anos De Inverno	2024-05-13T17:02:06.636Z	\N
f60d21dd-2b8c-4528-91cb-7435c7075850	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Conjunto De Berço	2024-05-13T17:03:39.257Z	\N
ea69d128-1dd3-49de-8b6e-df772a2ad9a7	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Ovo	2024-05-08T17:35:31.218Z	\N
b9f8cde1-f5dd-45ea-9dc4-e1f9f9a35b79	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Cesta Básica	2024-05-08T17:35:45.730Z	\N
b0d79d6a-8f8a-4341-b23b-5ff455a1d6ce	03fdb0f2-6b50-4895-b970-5793cad80c86	Anticarrapato	2024-05-09T12:39:11.759Z	\N
f6a73f85-9f36-454a-83bf-82fbe0b4f0d8	03fdb0f2-6b50-4895-b970-5793cad80c86	Antipulgas Animais Grandes	2024-05-13T14:11:38.012Z	\N
cbe1445b-256b-4d93-8829-6a1fda8f526c	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Leite	2024-05-08T17:40:51.987Z	\N
3875894c-baf3-48c4-8932-059914a6e27c	5d50d3cf-4e36-4639-813d-d43de8886ac8	Esponjas De Louça	2024-05-08T17:43:31.843Z	\N
5facb97a-2e27-4ddf-bbde-0aeed05bb262	718d5be3-69c3-4216-97f1-12b690d0eb97	Saquinhos Para Montar Kit Higiene	2024-05-08T17:45:03.019Z	\N
e13ffed3-e5cb-48fb-a7a4-9a4358fc18ff	03fdb0f2-6b50-4895-b970-5793cad80c86	Talco	2024-05-09T12:39:29.433Z	\N
120fdccb-4ea6-4c03-a144-a80a55e9a070	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Plus Size Feminino E Masculino	2024-05-13T14:37:13.690Z	\N
1de79252-6c13-466b-ba1a-2e9c009fbfaa	718d5be3-69c3-4216-97f1-12b690d0eb97	Shampoo P/ Bebê	2024-05-13T14:54:13.973Z	\N
dfcde5dc-2359-47d8-9652-ec4606472bbe	718d5be3-69c3-4216-97f1-12b690d0eb97	Sabonete P/ Bebê	2024-05-13T14:54:45.968Z	\N
79224f5f-e140-41f1-a6df-dc1313e11387	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Casaco De Moletom Feminino	2024-05-13T15:14:34.764Z	\N
6e627e3f-e598-4b53-b47f-e5ddabca9f1d	03fdb0f2-6b50-4895-b970-5793cad80c86	Papelão,luva Latex,pano E Tolhas,vonau Injetável,giardicidi 50mg,metronidazol 250mg E Gabapentina 50mg.	2024-05-13T15:14:49.558Z	\N
2247cd19-88cd-47de-8d62-a003564f27f5	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calca De Moletom	2024-05-13T15:24:23.846Z	\N
b59f42a7-43d1-4d00-bf37-ba68127a1d30	037ac262-4f35-42e0-83e1-4cdcceedb39c	Filtro Para Café Tamanho Grande	2024-05-13T15:39:29.798Z	\N
87269af6-7c90-4892-acdf-6369bab311b6	be0e4018-ca46-44cd-b814-7681ba98c51a	Cama Beliche	2024-05-13T15:53:15.843Z	\N
0a8af7cc-f9a9-492c-a180-2396f595b277	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Serragem	2024-05-13T15:54:12.182Z	\N
0eb81d00-fdee-4740-9070-bf23874d35a9	718d5be3-69c3-4216-97f1-12b690d0eb97	Fralda P	2024-05-08T18:22:54.503Z	\N
3edbdcb6-ff0a-4de4-b5c9-24c30de29132	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Masculima	2024-05-09T13:16:35.403Z	\N
48b8392c-9bcf-4b94-abff-33b565af4edd	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Leite	2024-05-13T14:52:17.525Z	\N
340e35f2-a28c-4c48-a114-2e7339c7c735	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Arroz De 1kg	2024-05-13T14:53:51.256Z	\N
ac6f15cf-03fc-4676-9a54-0bb20529c7d2	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Mortadela	2024-05-13T15:07:02.794Z	\N
941b36ba-5f4e-4651-90df-1eaa49bce90f	5c9b6767-5310-461b-977b-906fe16370ae	Vincristina	2024-05-13T15:12:03.335Z	\N
385050b1-969f-43b5-963d-2f5331f9a246	5c9b6767-5310-461b-977b-906fe16370ae	Álcool Em Gel Potes Médios Para Espalha	2024-05-13T15:12:38.344Z	\N
cbb08cdc-a4ec-48d0-812e-66c0448cb12c	037ac262-4f35-42e0-83e1-4cdcceedb39c	Sacos 200l	2024-05-13T15:16:51.056Z	\N
8b01dadc-9350-4968-a95d-cf7790c62021	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça De Moletom	2024-05-13T15:20:54.948Z	\N
655b4563-e2a3-4d27-a2fb-cf8fad8c91e4	03fdb0f2-6b50-4895-b970-5793cad80c86	Saco Plástico Pequeno	2024-05-13T15:29:47.662Z	\N
9e3aa905-3cfb-443a-adcb-e47cd09bf6d5	03fdb0f2-6b50-4895-b970-5793cad80c86	Complexo Vitamínico Para Cães Sênior	2024-05-13T15:30:16.336Z	\N
31420dbb-f6a3-443b-89c1-05344b195408	03fdb0f2-6b50-4895-b970-5793cad80c86	Voluntários para animais	2024-05-08T18:37:32.909Z	\N
d609ed69-9c62-40c2-b80d-e0aeda8de704	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina	2024-05-09T13:19:48.172Z	\N
385c8377-a125-479c-8e96-f896a348320c	037ac262-4f35-42e0-83e1-4cdcceedb39c	Pasta Z (fichario)	2024-05-09T13:37:16.597Z	\N
c6d02d83-82c5-49b6-ab56-a877f9d51e41	be0e4018-ca46-44cd-b814-7681ba98c51a	Cama Geriatria	2024-05-08T18:48:57.398Z	\N
a0260dc1-83f1-4e9a-a2ed-48d011467d86	03fdb0f2-6b50-4895-b970-5793cad80c86	Remédio E Solução Sarnicida (contra Sarna)	2024-05-13T15:42:15.180Z	\N
e8fa365a-302f-4903-9ff5-ff1d37a16ccf	5c9b6767-5310-461b-977b-906fe16370ae	Termômetro	2024-05-13T15:44:13.552Z	\N
1824b541-2769-4c99-8589-ceee946d7181	03fdb0f2-6b50-4895-b970-5793cad80c86	Lar Temporário Para Animais	2024-05-08T18:41:16.545Z	\N
2d93e34c-6997-499e-b4f6-6cd7bbcf8602	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Carne Gado	2024-05-08T19:00:27.534Z	\N
a8ae4a1f-bc8d-4d48-a5ec-ebf618e93781	5d50d3cf-4e36-4639-813d-d43de8886ac8	Veja Limpeza Pesada	2024-05-09T13:23:52.201Z	\N
be7369e0-e867-4443-948e-49b2a2b075b4	5d50d3cf-4e36-4639-813d-d43de8886ac8	Saco De Lixo 30l Ou 50l	2024-05-09T13:24:54.970Z	\N
8dcf60fe-758b-4137-93b6-cac321724df2	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Íntimas (masc E Fem)	2024-05-09T13:33:46.372Z	\N
7961a39a-2493-4821-9dd1-c8c1f6592e5b	037ac262-4f35-42e0-83e1-4cdcceedb39c	Garfo Descartável	2024-05-13T17:22:30.165Z	\N
2cdfa6cc-5f3d-4858-a3ee-13f0a6c7eaf3	718d5be3-69c3-4216-97f1-12b690d0eb97	Material De Higiene	2024-05-13T17:25:18.023Z	\N
dd17b384-d3a2-416c-bbc7-85002af4092a	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Camisetas (manga Longa)	2024-05-09T13:32:45.825Z	\N
5770494e-2cbb-435f-ba4d-048a90c9e0bc	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Aveia Em Flocos	2024-05-08T18:49:32.016Z	\N
ca0612fa-aa62-42ec-b333-ea09d667e48a	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Cafeteira Industrial	2024-05-09T13:36:01.772Z	\N
85ef977c-f904-47de-bdfc-4c4a02ee09a1	03fdb0f2-6b50-4895-b970-5793cad80c86	Potinho De Raçao	2024-05-13T17:24:42.571Z	\N
450614ac-762f-4109-bc13-d8c72066abc7	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Abrigo Feminino E Masculino	2024-05-13T17:28:49.493Z	\N
8cf0a287-9e40-4b91-a979-82533a8918c1	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Cobertor Casal	2024-05-13T18:31:18.557Z	\N
625c609a-b15e-4ba2-b400-52c8cb885ff0	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina (inverno E Verão)	2024-05-13T18:50:40.295Z	\N
d1160a75-b9fe-4ef6-a10b-52a3e3cd0588	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Feminina (inverno E Verão)	2024-05-13T18:51:01.419Z	\N
1d5eae87-630d-4d94-9f48-ec4032c000de	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Infantil (todas Idades)	2024-05-13T18:51:29.885Z	\N
ce040718-1eeb-4246-bd4f-6231070f2d76	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calçado Infantil (25 A 34)	2024-05-13T18:56:16.517Z	\N
f9ae8487-c283-437c-a42c-d5cc4b6ed388	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Cadeira De Rodas	2024-05-08T18:50:38.601Z	\N
8b2c49f5-c34f-4ac9-abb0-5810c10e3dcb	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Massa	2024-05-08T19:00:09.775Z	\N
bcd499a9-ddd9-479e-a057-c9f058178eaf	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Carne Frango	2024-05-08T19:00:36.369Z	\N
311fefbe-063e-4fe9-af1f-3afd0fb2e6fb	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Escorredor De Massa	2024-05-09T13:35:36.880Z	\N
9dfdc7a5-d7cc-450e-9549-f35c7be8a91c	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Bebe (rn)	2024-05-09T13:38:30.675Z	\N
5880fcb0-dd0e-4681-b97d-a1f501152fc6	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Bolacha Doce	2024-05-09T14:04:46.921Z	\N
88fa7edf-2f9d-43e9-b983-86aa6fc63374	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Bolacha Salgada	2024-05-09T14:05:06.121Z	\N
91abb062-c815-448b-9efb-817a6b860808	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Galão De Água Vazio	2024-05-09T14:31:55.109Z	\N
81c95bb4-5c9e-4d4a-b1cb-0dbcf89781a0	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Travesseiro	2024-05-09T14:33:31.029Z	\N
a16b02b5-c7bb-4eab-bf78-0d9b073566d8	5c9b6767-5310-461b-977b-906fe16370ae	Potes De Plástico	2024-05-09T14:35:48.309Z	\N
9721c6b8-9405-4236-a98e-b41ea3484d2e	03fdb0f2-6b50-4895-b970-5793cad80c86	Carrapaticida	2024-05-09T14:49:58.380Z	\N
9e8aa41c-d2ba-4ae6-88b1-7aa98bc51062	5d50d3cf-4e36-4639-813d-d43de8886ac8	Produtos De Limpeza	2024-05-09T14:51:18.793Z	\N
ab9131f3-cfb0-4df9-9043-b022f5e8b9ab	5d50d3cf-4e36-4639-813d-d43de8886ac8	Esponja De Aço	2024-05-09T16:22:02.873Z	\N
12c0a839-cec3-4991-827c-7448fbdf63e0	5d50d3cf-4e36-4639-813d-d43de8886ac8	Material De Limpeza	2024-05-13T17:25:37.576Z	\N
3848f679-2b54-42ae-a996-8048b2a2f0fc	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Caixa De Café	2024-05-13T17:27:06.361Z	\N
e1b9a6e4-3375-4a3c-999b-9761065315c5	5d50d3cf-4e36-4639-813d-d43de8886ac8	Lenço Desinfetante	2024-05-13T17:36:03.999Z	\N
03429f9e-7621-4749-8981-1d56d13c8ec5	03fdb0f2-6b50-4895-b970-5793cad80c86	Bactrim Suspensao	2024-05-13T17:46:42.086Z	\N
e6a02eb8-8a23-4646-b0fd-fbf064cc1cf0	03fdb0f2-6b50-4895-b970-5793cad80c86	Glicopan	2024-05-13T17:47:15.821Z	\N
37b6d4e1-224f-4fa5-a39a-efc511bab38a	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Leite Neocate	2024-05-09T13:50:18.325Z	\N
927feebd-0ad5-4b70-aa85-e813941b6498	03fdb0f2-6b50-4895-b970-5793cad80c86	Patê para cachorro	2024-05-08T19:33:09.711Z	\N
6cc30b69-59f6-4eb5-bae8-dc681541cca4	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Absorvente De Cama Para Idosos	2024-05-09T13:52:34.054Z	\N
128514c2-90c9-4ab1-9ba8-47a02e780ecc	037ac262-4f35-42e0-83e1-4cdcceedb39c	Bobina De Sacos Transparentes	2024-05-09T14:05:59.881Z	\N
e4378f90-b675-45a1-8cad-d142a3e272cc	03fdb0f2-6b50-4895-b970-5793cad80c86	Bactrim 400mg	2024-05-13T17:46:26.759Z	\N
139d16e8-b314-499a-925a-f725cef15e5b	03fdb0f2-6b50-4895-b970-5793cad80c86	Luva De Procedimento	2024-05-13T17:48:11.812Z	\N
5aac6b69-af17-4c0e-b0d0-1621211bc14c	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Cesta Básica	2024-05-08T19:32:41.996Z	\N
f74837d7-d4b4-4224-be14-a6d0df76ea8f	5c9b6767-5310-461b-977b-906fe16370ae	Vermífugo	2024-05-09T14:48:13.831Z	\N
6d915a63-c6ae-4d4a-a343-6752d0d68efd	03fdb0f2-6b50-4895-b970-5793cad80c86	Simparic	2024-05-09T14:48:55.304Z	\N
e87c2f41-f417-4ee0-b818-9adfe7c790e9	5c9b6767-5310-461b-977b-906fe16370ae	Colchões	2024-05-09T14:50:29.319Z	\N
538fec8f-971c-4307-aa82-074501c46e25	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Sacola Grande	2024-05-13T18:28:22.159Z	\N
3631657e-b8d0-4ab2-9db4-f78cef3d6322	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça Masculina G	2024-05-13T18:44:19.349Z	\N
cd143579-907b-42fd-80e6-929c7d6f8879	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça Masculina Gg	2024-05-13T18:44:43.961Z	\N
ec1b2c02-6e31-4bc6-a345-ed73ee9adcd7	5c9b6767-5310-461b-977b-906fe16370ae	Contato: Luciana 51 99903-2069	2024-05-13T18:49:44.668Z	\N
95d28aa1-fca7-4df2-97ee-4daa1330ee10	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Bonés	2024-05-08T19:34:25.886Z	\N
9c17284c-d379-4b76-9d87-5c573b5eec6c	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Tênis Masculino (38 E Maiores)	2024-05-08T19:35:25.844Z	\N
30afd32d-4464-488e-a212-e4b9ad9ea5bc	037ac262-4f35-42e0-83e1-4cdcceedb39c	Prato Descartável	2024-05-08T19:37:16.791Z	\N
465e690a-4ac3-4e71-a35a-d8305acb93fc	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Criança 2 Anos - Menino	2024-05-09T16:08:19.159Z	\N
40721135-21c7-4017-9be9-b5d030c22d54	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntários Para Cuidados Com Crianças	2024-05-09T16:23:49.913Z	\N
f267cbb5-a5e2-4bbb-9a84-60eddcdf922d	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Sapatos Masculinos	2024-05-13T18:35:10.253Z	\N
4f5dbb59-d5ca-4550-a6e6-6e62f8583198	5d50d3cf-4e36-4639-813d-d43de8886ac8	Perfex	2024-05-08T19:37:45.207Z	\N
945b1d7a-17ac-4646-92ef-018669cee133	718d5be3-69c3-4216-97f1-12b690d0eb97	Sabonete Líquido	2024-05-08T19:38:13.589Z	\N
3b7a9689-8c41-4090-9084-5b8e31a1d7d5	718d5be3-69c3-4216-97f1-12b690d0eb97	Repelente Infantil	2024-05-09T16:17:57.838Z	\N
24e95cd1-71cf-406f-b256-80ce535f8e65	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Capa De Chuva	2024-05-09T16:19:43.180Z	\N
ea2c6721-693d-496e-8442-a2381d48430b	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Molho De Tomate	2024-05-09T16:52:08.714Z	\N
64ef52e6-fcdd-414d-9049-aebdbe271fe5	718d5be3-69c3-4216-97f1-12b690d0eb97	Pomada De Assadura	2024-05-09T16:52:31.064Z	\N
876548db-d180-4083-96ba-cddcb86134b0	718d5be3-69c3-4216-97f1-12b690d0eb97	Talco Infantil	2024-05-09T16:52:48.993Z	\N
a4dc501b-20a2-43c2-921a-392314316473	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Recém Nascido	2024-05-09T16:53:06.531Z	\N
b2595c5c-ffe8-4396-a2c8-ea6e4d8d4e6a	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça De Moletom	2024-05-09T17:03:46.704Z	\N
646d25fc-788e-4853-a7a3-29190186b477	c117dd37-82ab-43a6-bf66-d97acef97f6e	Caneta De Tecido	2024-05-09T16:20:11.899Z	\N
cee04875-1bf0-4e86-af49-409087ae3598	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Roupa De Cama E Banho	2024-05-13T18:52:08.258Z	\N
23b10d12-8b2f-4104-a225-f42da80a2c80	5c9b6767-5310-461b-977b-906fe16370ae	Fralda Geriátrica ( Xg)	2024-05-13T18:56:38.967Z	\N
05ff837b-7e24-4a6e-9b40-0b3ac0bd0ee2	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Infantil (4 A 10)	2024-05-13T18:57:11.002Z	\N
171de76a-606f-4166-92f7-dee09be2774b	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calçado Masculino (39 A 43)	2024-05-13T18:57:50.217Z	\N
191b3241-5fce-4d0a-ae67-7d42049c4a09	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas De Moletom Masculino Tam G E Gg	2024-05-13T19:00:13.586Z	\N
b35ee0d2-6f36-4238-b786-77e38da86fa2	03fdb0f2-6b50-4895-b970-5793cad80c86	Meloxitan Injetável	2024-05-13T19:07:31.958Z	\N
aa5e1169-a9dc-4b38-a824-9e204b7d88b2	5c9b6767-5310-461b-977b-906fe16370ae	Dexametasoa 4mg	2024-05-13T19:11:48.370Z	\N
d48b1e31-a22b-4924-8463-2e129441a0c6	5c9b6767-5310-461b-977b-906fe16370ae	Biperideno 2mg	2024-05-13T19:12:26.789Z	\N
dbdadb3d-4d78-4e29-967d-6fdef07844ec	5c9b6767-5310-461b-977b-906fe16370ae	Dapagliflozina 10mg	2024-05-13T19:13:10.798Z	\N
ad5309be-19f5-4a4a-9aaa-b8e70e933078	5c9b6767-5310-461b-977b-906fe16370ae	Equipo Soro	2024-05-13T19:13:49.099Z	\N
96845fed-3b96-4423-9378-6b3b3f1d4ce6	5c9b6767-5310-461b-977b-906fe16370ae	Doxazosina 2mg	2024-05-13T19:14:14.281Z	\N
9b73fb30-c29c-4081-9dca-836c62ad99a6	5c9b6767-5310-461b-977b-906fe16370ae	1 Geladeira 110v	2024-05-13T19:18:04.800Z	\N
721c2a8c-a8a8-4a05-8cbf-a641bae1616f	5c9b6767-5310-461b-977b-906fe16370ae	10 Cestos De Lixo 50 E 100 Litros	2024-05-13T19:18:37.050Z	\N
69559371-3258-40ed-a727-5f868b6477da	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Asculinas P	2024-05-13T19:46:11.007Z	\N
f69b28ac-667a-446d-adf5-72564c0d4dab	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Masculinas P	2024-05-13T19:46:57.999Z	\N
09024c0a-be30-49c8-a5f9-9d779af6e0c7	5d50d3cf-4e36-4639-813d-d43de8886ac8	Saco Plástico 5kg	2024-05-08T19:40:33.788Z	\N
c4976a72-788e-4360-ad86-bb4939bebcc2	5d50d3cf-4e36-4639-813d-d43de8886ac8	Pano de chão	2024-05-08T19:41:02.010Z	\N
7ce8ca85-b7a2-47d3-a070-37bfba009ac0	037ac262-4f35-42e0-83e1-4cdcceedb39c	Embalagem De Marmita	2024-05-09T16:40:26.606Z	\N
970603df-a58e-4cbf-94f1-4aff2c5743a1	037ac262-4f35-42e0-83e1-4cdcceedb39c	Embalagem De Marmita	2024-05-09T16:40:49.020Z	\N
de046a3e-c365-4393-b53e-3789a6711797	037ac262-4f35-42e0-83e1-4cdcceedb39c	Luva 6,5 E 8,0 Estéril	2024-05-13T19:02:48.727Z	\N
c1e974f6-1fe3-4aed-938d-4f45117fef5e	5c9b6767-5310-461b-977b-906fe16370ae	Ff	2024-05-13T19:15:52.095Z	\N
486c8aae-eb62-4148-990d-61f4e88abdb5	5c9b6767-5310-461b-977b-906fe16370ae	Protetor Auricular 60	2024-05-13T19:16:29.874Z	\N
9e9c2ba5-8e1b-4575-a2b0-82e4534f2bad	5c9b6767-5310-461b-977b-906fe16370ae	20m De Lona Preta	2024-05-13T19:17:12.555Z	\N
90d80e5a-8239-4983-b8aa-fa5c5b4c2967	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Alface	2024-05-13T19:34:45.986Z	\N
919d8585-40a8-45e9-b619-b9e7a7ba20ea	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Chimia	2024-05-08T19:41:34.707Z	\N
fd79a476-6a50-4389-a496-ca34724ff38e	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Plus Size	2024-05-09T16:49:33.521Z	\N
8b670613-fb90-465c-b3e3-b48f4cc27c70	037ac262-4f35-42e0-83e1-4cdcceedb39c	Garrafa Pet Ou Galões Vazios	2024-05-09T17:05:03.698Z	\N
dc359231-d372-495a-a9e0-2bbd47965809	718d5be3-69c3-4216-97f1-12b690d0eb97	Absorvente	2024-05-09T17:08:51.953Z	\N
219e46d3-688f-4021-b7b4-3a1ab5722aa1	718d5be3-69c3-4216-97f1-12b690d0eb97	Pente Fino	2024-05-09T17:29:34.522Z	\N
fe2a788c-2163-41bd-a0b0-a43855b5bd38	5c9b6767-5310-461b-977b-906fe16370ae	B12 Intramuscular	2024-05-13T19:14:32.517Z	\N
880f900c-2a75-4208-bf39-6b86914f61d6	5c9b6767-5310-461b-977b-906fe16370ae	Filtro De Papel Tamanho 100 - 10 Cx	2024-05-13T19:16:10.002Z	\N
ea4b0be9-5142-440e-9ae6-6c388321d3e9	5c9b6767-5310-461b-977b-906fe16370ae	Tapa Olho 60	2024-05-13T19:16:50.553Z	\N
4212a820-3ffe-45ce-975f-7bdf304bf9f0	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Água Mineral	2024-05-13T19:42:52.059Z	\N
319870a5-c97e-48b4-b5b8-4d05fcc09fdc	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Cestas Básicas	2024-05-13T20:15:37.745Z	\N
76aec8f8-b5d7-45ad-aa2c-fc23b6599a7e	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Tomate	2024-05-13T20:46:19.986Z	\N
daf1d8ba-68d5-413d-9006-3309b176e923	b3a81a9d-a964-4413-9a33-974a3b4673d1	Segurança Para O Local	2024-05-13T20:48:25.825Z	\N
9f9a0d1e-8b74-4c27-9d07-7d986bcc9bbe	03fdb0f2-6b50-4895-b970-5793cad80c86	Nutralife	2024-05-13T20:56:54.400Z	\N
ceebd729-eecc-420e-8e90-f764a487b202	5c9b6767-5310-461b-977b-906fe16370ae	Fraldas Geriatricas	2024-05-07T10:51:23.876Z	2024-05-08T05:07:57.203Z
867d8951-dffb-4cbd-9d50-1550a15fa1c7	03fdb0f2-6b50-4895-b970-5793cad80c86	Seringa 1ml	2024-05-13T20:57:30.876Z	\N
dff8384d-e10c-4093-b077-96969c67a159	03fdb0f2-6b50-4895-b970-5793cad80c86	Seringa 5ml	2024-05-13T20:57:51.475Z	\N
606a9ed3-b5f7-4d63-8da9-c65adf0a927a	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas leves	2024-05-07T02:19:28.533Z	2024-05-07T02:40:33.000Z
f94729df-e289-49d8-b55c-19ebdbfd783c	718d5be3-69c3-4216-97f1-12b690d0eb97	Toalha de Banho	2024-05-08T19:49:18.408Z	\N
68ef2021-4411-4328-8c65-a2a9d9b37fce	03fdb0f2-6b50-4895-b970-5793cad80c86	Cateter	2024-05-09T16:51:57.864Z	\N
af26cae5-8bae-420c-8052-782b9598fded	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Leite	2024-05-09T16:53:22.224Z	\N
4418e35c-a14f-4b98-8b45-b8a822bbe23b	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Femininas P	2024-05-13T19:45:15.503Z	\N
ce7b5319-085e-4ad3-85be-432762ef52c9	5c9b6767-5310-461b-977b-906fe16370ae	Agua	2024-05-13T20:15:10.766Z	\N
cd6ef0ed-beb8-4987-bed0-6690360221ae	5c9b6767-5310-461b-977b-906fe16370ae	Saquinho De Sacolé	2024-05-13T20:43:16.957Z	\N
162b6d02-6c95-470a-b7c8-03fa75c335fb	b3a81a9d-a964-4413-9a33-974a3b4673d1	Médicos	2024-05-13T20:49:32.880Z	\N
860776d6-b97a-431f-b089-faee9ca777bc	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Médicos	2024-05-08T20:20:34.937Z	\N
63a59ee2-0622-4383-b74b-c3a8d4d484b3	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Técnico De Enfermagem	2024-05-08T20:21:18.465Z	\N
c4651198-a582-43ed-98cc-0b96d53ec91e	037ac262-4f35-42e0-83e1-4cdcceedb39c	Touca Descartável	2024-05-08T20:28:26.729Z	\N
be3edd3b-5dff-496b-9f1f-07bd0907d6a7	5d50d3cf-4e36-4639-813d-d43de8886ac8	Desentupidor - Diabo Verde	2024-05-08T20:49:46.553Z	\N
56ca5929-dc59-47f0-a24f-52ddd8c25de9	718d5be3-69c3-4216-97f1-12b690d0eb97	Fio Dental	2024-05-08T20:50:47.070Z	\N
fb2766d8-4f6f-4615-a4ec-56ab17622a06	5c9b6767-5310-461b-977b-906fe16370ae	Paracetamol em gotas	2024-05-08T20:18:42.706Z	\N
4c170954-1c43-4928-9014-d3b057e4a5ca	5d50d3cf-4e36-4639-813d-d43de8886ac8	Pano de limpeza	2024-05-08T20:30:07.933Z	\N
899fe5dd-d0bd-40df-93ed-b57eb46fcfab	718d5be3-69c3-4216-97f1-12b690d0eb97	Lenço Umedecido	2024-05-09T17:07:56.236Z	\N
21c26bde-bccb-45c2-b21f-41fb00a1fb2d	5c9b6767-5310-461b-977b-906fe16370ae	Roupas Intimas	2024-05-09T17:20:40.155Z	\N
58c821b8-2ea7-4b55-aab6-2b63837aa86e	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Plus Size	2024-05-13T20:18:40.540Z	\N
f76cd266-64e7-4968-854b-6308be0fe2a5	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Enfermeiros	2024-05-08T20:20:45.933Z	\N
38f84d3e-7f75-46a7-ad35-080b277112ac	5d50d3cf-4e36-4639-813d-d43de8886ac8	Luvas para limpeza	2024-05-08T20:23:18.338Z	\N
e4b0ddb9-594e-4790-856a-339c77d3aee1	5c9b6767-5310-461b-977b-906fe16370ae	Sacolas Plásticas Médias	2024-05-13T20:43:46.626Z	\N
6bca959f-afc2-434e-a716-c6ce6fe71b70	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Arroz	2024-05-13T20:44:51.806Z	\N
82fe2a73-a292-488d-b227-3302bd06496d	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Cebola	2024-05-13T20:45:13.963Z	\N
c8f8e336-8a2a-487a-9fc8-2ee6b610c7fe	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Cebola	2024-05-13T20:45:42.212Z	\N
695ea3e2-3cf8-4525-b731-f951c51dfeff	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Touca De Cozinha	2024-05-13T20:47:07.320Z	\N
0278e13b-28e9-4e18-a7af-c2f1b2d28053	03fdb0f2-6b50-4895-b970-5793cad80c86	Sachê Para Gato	2024-05-13T20:55:58.500Z	\N
9176dc97-5389-4f27-8730-9ef99d88903f	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Casacos Quentes Infantis	2024-05-13T20:56:12.305Z	\N
04456c45-5a31-4e24-9217-26480097eed6	03fdb0f2-6b50-4895-b970-5793cad80c86	Petmilk	2024-05-13T20:56:36.523Z	\N
0d89328b-9fbe-4bc0-981f-c5241f35b175	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Tênis Infantil	2024-05-13T20:57:01.471Z	\N
896bcf95-5d4a-4673-b628-4077bdd3c9d2	03fdb0f2-6b50-4895-b970-5793cad80c86	Seringa 10ml	2024-05-13T20:58:07.088Z	\N
ad2964e7-c67c-4872-bf4a-6cc060f703a6	03fdb0f2-6b50-4895-b970-5793cad80c86	Agulha Cinza Ou Roxa	2024-05-13T20:58:47.627Z	\N
c8976b11-580c-4656-935f-10efe10a8206	037ac262-4f35-42e0-83e1-4cdcceedb39c	Jornal	2024-05-13T20:59:39.229Z	\N
446366df-d941-4d6f-9bcf-09bfc4c2a9c8	5c9b6767-5310-461b-977b-906fe16370ae	Não Precisa De Voluntários!	2024-05-13T21:39:49.409Z	\N
55f952e7-5d63-431b-b2ef-8f70c771e857	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Beliches	2024-05-13T21:52:37.916Z	\N
62bd5d05-ba37-497a-a1a1-56795813790d	718d5be3-69c3-4216-97f1-12b690d0eb97	Escova de dentes	2024-05-06T03:04:51.666Z	\N
5e19dcf8-680f-4755-a69f-be4080c95e6f	5c9b6767-5310-461b-977b-906fe16370ae	Termômetro	2024-05-08T20:51:53.085Z	\N
f78852fc-2874-4921-9dc4-7f9106c21233	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Íntima Plus Size	2024-05-09T17:52:40.192Z	\N
5d5ba6d2-2853-4b3c-aecb-5f86a8e75707	03fdb0f2-6b50-4895-b970-5793cad80c86	Cama Pet	2024-05-09T17:57:25.874Z	\N
5ee91e2e-a7c2-449a-bb80-ac78b28b3767	03fdb0f2-6b50-4895-b970-5793cad80c86	Ração Filhote Gatos	2024-05-09T18:00:46.282Z	\N
f7916ade-1729-4e90-a42e-cba73f262692	5c9b6767-5310-461b-977b-906fe16370ae	Não Precisa De Voluntários (não Considerar Necessidade De Voluntários Para A Tarde)	2024-05-13T21:40:45.243Z	\N
1e6622ef-802b-4be0-982e-88f13dfd88df	fd1f74c4-6723-4ffe-8657-773a943e65c4	Papagaio - Urinar	2024-05-08T21:34:14.162Z	\N
578809ce-d533-43df-ad00-3e61af85d73c	fd1f74c4-6723-4ffe-8657-773a943e65c4	Pás	2024-05-06T03:04:52.222Z	\N
2472c739-1444-45de-bdde-3941a67a473e	fd1f74c4-6723-4ffe-8657-773a943e65c4	Papagaio - Urinar	2024-05-08T21:33:28.614Z	\N
20521d7d-4f86-4840-8543-0d68e84f1d7f	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Íntima Feminina Plus Size	2024-05-09T17:54:40.093Z	\N
eb705387-0d48-4762-be63-4c281a8b1d8e	5d50d3cf-4e36-4639-813d-d43de8886ac8	Sacos De Lixo 50l E 100l	2024-05-09T18:03:32.900Z	\N
bd2a5ee3-0fc6-4777-b4d1-4bb38ebbd0d4	718d5be3-69c3-4216-97f1-12b690d0eb97	Fralda M	2024-05-09T18:24:26.506Z	\N
1f136e6b-3881-4341-b169-5a4ec852c888	718d5be3-69c3-4216-97f1-12b690d0eb97	Xampu Para Bebês	2024-05-09T18:25:55.443Z	\N
5f805e7a-39fc-4759-936c-9a0097a5b8a6	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Linguiça	2024-05-09T18:57:51.602Z	\N
bbca6f5f-96e5-4329-8a54-c0a618d5f99e	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Infantil Menina	2024-05-09T19:41:43.399Z	\N
2417b138-3451-4da2-9172-f06ee77a6b1d	5c9b6767-5310-461b-977b-906fe16370ae	Não Precisa De Voluntários (não Considerar Item Abaixo: "voluntários - Tarde")	2024-05-13T21:43:17.278Z	\N
d6a8c7f3-3b0c-4430-99c5-fab632a5490c	5c9b6767-5310-461b-977b-906fe16370ae	Não Precisa De Voluntários (não Considerar Item Acima: "voluntários - Tarde")	2024-05-13T21:43:59.868Z	\N
87d09650-d0e9-4203-867e-b6e167a1171b	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Femininas	2024-05-08T22:24:37.933Z	\N
b8086ace-c3c7-4fa5-905f-ad1d4e64e990	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Diversas	2024-05-08T22:37:58.446Z	\N
cc0b7c15-55bd-426c-9637-12db360bc034	5c9b6767-5310-461b-977b-906fe16370ae	Tomate	2024-05-08T22:57:51.053Z	\N
2b6abce0-4abb-4341-b6e5-960d73ca6645	5c9b6767-5310-461b-977b-906fe16370ae	Saladas	2024-05-08T23:01:03.100Z	\N
4b7e6463-949e-4a9a-8198-0ee4245a63df	5c9b6767-5310-461b-977b-906fe16370ae	Seringa De Insulina	2024-05-08T23:04:12.264Z	\N
5c11dcf2-bc1a-4529-bd10-66c0dd7772d8	5d50d3cf-4e36-4639-813d-d43de8886ac8	Veneno Para Formiga	2024-05-09T17:55:58.090Z	\N
f3981a34-0d70-4791-b234-9d9026b27f5b	5c9b6767-5310-461b-977b-906fe16370ae	Soro Hospitalar	2024-05-13T23:23:27.158Z	\N
4206e979-d31c-4306-b9cf-bac8abb1b7ba	5c9b6767-5310-461b-977b-906fe16370ae	Cebola	2024-05-08T23:00:33.846Z	\N
29798ae4-8aa1-4ce0-85aa-07b86273c32e	5c9b6767-5310-461b-977b-906fe16370ae	Coletes Reflexivos Ou Tnt	2024-05-08T23:09:30.574Z	\N
715fb8d2-6acd-4b2b-8164-79de7fef3fec	03fdb0f2-6b50-4895-b970-5793cad80c86	Probiótico para animais	2024-05-08T22:38:22.434Z	\N
a944ad5c-36b6-417f-aa37-7b8c6a825d01	03fdb0f2-6b50-4895-b970-5793cad80c86	Guia	2024-05-09T17:57:59.257Z	\N
8a491c1d-0a91-4135-b7f7-85a460eb44ba	4f95853f-d5e1-487d-8086-6ddfaf2bbab7	Frigobar	2024-05-08T22:39:54.512Z	\N
768e744a-7637-4e64-b5fb-e7ff295ae993	03fdb0f2-6b50-4895-b970-5793cad80c86	Vaga Para 1 Animal	2024-05-13T23:23:47.441Z	\N
ebaec0d9-c191-495b-88af-6949707ab812	5c9b6767-5310-461b-977b-906fe16370ae	Luva G	2024-05-08T23:02:52.100Z	\N
abf86d41-3ba4-4dde-b0ac-3468fe06ba87	5c9b6767-5310-461b-977b-906fe16370ae	Seringa 3 E 5ml Com Agulha 70x30	2024-05-08T23:04:51.633Z	\N
ace11dbc-d8fc-4d92-8692-72534bdee8be	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Infantil Menino	2024-05-08T23:09:35.360Z	\N
8c80d8dc-10c1-45a8-a307-1626632db409	5c9b6767-5310-461b-977b-906fe16370ae	O Abrigo Será Encerrado No Dia 15/05	2024-05-13T23:56:56.976Z	\N
d87b626c-0bff-48ff-b457-29cc838cf86e	5c9b6767-5310-461b-977b-906fe16370ae	Prednizolona Para Animais	2024-05-14T00:40:49.816Z	\N
4f162c9f-b72a-4661-a8f2-1cb269353d24	03fdb0f2-6b50-4895-b970-5793cad80c86	Petisco Para Animais	2024-05-14T00:41:51.794Z	\N
93191078-a8ff-426a-9d67-8725626ad31d	037ac262-4f35-42e0-83e1-4cdcceedb39c	Descarpack Caixa	2024-05-08T23:11:10.194Z	\N
8a6bee81-d3a5-4f61-abc0-a2f56977eb4d	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Infantil 8-10 Anos	2024-05-08T23:46:11.580Z	\N
ec86de23-73b3-45f1-a5c7-a2715dc64796	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Infantil 3-4 Anos	2024-05-08T23:47:08.907Z	\N
70c5fbed-2863-4a0e-bdb0-f07a6f424802	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Infantil 5-6 Anos	2024-05-08T23:47:24.382Z	\N
d4a48129-b591-4504-a205-589bd90bd350	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Feminina G	2024-05-08T23:49:50.324Z	\N
c20019f9-5d76-42b2-b993-73a62a2c7f6d	5c9b6767-5310-461b-977b-906fe16370ae	Erva Mate	2024-05-09T00:14:46.598Z	\N
ebfbd0bc-1356-4086-9255-d5a2dcc7c660	718d5be3-69c3-4216-97f1-12b690d0eb97	Elástico Para Cabelo	2024-05-09T00:15:31.123Z	\N
b15fee1e-5c89-4b46-a5b2-fb1991f57c13	037ac262-4f35-42e0-83e1-4cdcceedb39c	Sacos de lixo	2024-05-08T23:38:42.299Z	\N
c957dded-1e08-4e25-a2f8-80d111aef57b	718d5be3-69c3-4216-97f1-12b690d0eb97	Fralda G	2024-05-09T18:24:42.757Z	\N
d4911ed9-d013-48bb-a763-c5e41e7d61e4	b3a81a9d-a964-4413-9a33-974a3b4673d1	Veterinario- Turno Da Noite	2024-05-14T00:03:10.651Z	\N
3814a22f-b8a5-426e-ac21-138c2d62a0ba	05583098-5f2e-44e2-b874-452ec86d9d3e	Meias Infantil E Adulto	2024-05-14T00:10:26.406Z	\N
8f2d2855-7c53-418f-929b-222e431be3b7	b3a81a9d-a964-4413-9a33-974a3b4673d1	Veterinários	2024-05-06T03:04:54.479Z	\N
1beeba95-3034-4e3b-b332-fde4a0b09258	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Bebê 0-01 Ano	2024-05-08T23:46:32.354Z	\N
3ee51ac3-056c-4e53-9062-93df16dac1b3	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Infantil 1-3 Anos	2024-05-08T23:46:51.551Z	\N
bc029ecf-f1db-4d05-b032-a87b79985300	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Infantil 7-8 Anos	2024-05-08T23:47:37.475Z	\N
e577da2f-4900-45db-8d72-9b45cd5cd8c1	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina M	2024-05-08T23:48:29.236Z	\N
418b48c8-ab44-4999-8b06-8ab1415db000	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina Gg	2024-05-08T23:48:48.674Z	\N
7f8e851f-d072-469a-bf7c-1d04b14b18b4	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina Plus Size	2024-05-08T23:49:11.672Z	\N
410ee4d8-32eb-4f30-8b89-175ad8252c4b	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Feminina Plus Size	2024-05-08T23:50:06.686Z	\N
df6f02b6-0a8d-4313-a21b-bdc111db66a8	037ac262-4f35-42e0-83e1-4cdcceedb39c	Sacola Grande Para Cesta Básica	2024-05-09T00:06:42.071Z	\N
10ce0297-ae31-49b4-9a0c-bb164cd19353	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Feminina GG	2024-05-08T23:49:58.491Z	\N
93e6682e-6c2a-40aa-a18a-df386c244d3d	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Bombona Vazia 20l	2024-05-09T18:30:36.691Z	\N
0fbe9d5e-6114-4f3a-8b06-19cca85093ea	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Carne Congelada	2024-05-09T18:54:39.868Z	\N
e6ba25e0-1181-49a7-88e8-79c586ddadaa	d7627977-1c42-48a8-abe5-45422ddc97df	Caixa Organizadora Para Itens Infantis	2024-05-14T00:19:05.986Z	\N
167a03f7-d6bb-405e-8d75-87bf915543e8	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Infantil 10-14 Anos	2024-05-08T23:47:52.257Z	\N
aa2abcfe-f957-46e6-89b7-73810b3dfcf6	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina G	2024-05-08T23:48:38.266Z	\N
50272a9e-53dc-4e57-a56b-57f226b22933	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calçados	2024-05-08T23:56:33.106Z	\N
63884b8e-600b-4c94-948c-1e39365223c4	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Fronhas	2024-05-09T00:14:36.843Z	\N
0bf4b415-78ee-4301-b064-b55f4fa6a1f2	5c9b6767-5310-461b-977b-906fe16370ae	Massinha De Modelar	2024-05-09T00:17:12.762Z	\N
352af921-b2eb-4ca8-9775-5f124c622d6b	5c9b6767-5310-461b-977b-906fe16370ae	Sacos de lixo	2024-05-09T00:30:43.062Z	\N
51727155-6b86-4777-865e-f7b85eba83ea	03fdb0f2-6b50-4895-b970-5793cad80c86	Pallets	2024-05-09T00:05:11.092Z	\N
2a8e82ce-897c-4ce2-a611-1c5cbbb562d5	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Cenoura	2024-05-09T18:54:09.433Z	\N
5a68adc5-f0cc-44f6-99e4-12cd88662d08	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Achocolatado	2024-05-09T18:57:33.121Z	\N
4daad41e-b84e-4d36-876b-48a1f82a0c5b	5c9b6767-5310-461b-977b-906fe16370ae	Gás 45 Kg	2024-05-09T19:36:04.174Z	\N
6b883c42-f01c-4280-aebf-570c10276c60	037ac262-4f35-42e0-83e1-4cdcceedb39c	Luva Descartável	2024-05-14T00:39:08.894Z	\N
5eda163a-d542-43c4-9a50-ccd004411f2e	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa De Inverno Infantil 3 A 12 Anos	2024-05-14T00:43:45.093Z	\N
49e5686b-1fe3-42bd-b667-729ca65cd778	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntário - Manhã	2024-05-09T02:22:51.818Z	\N
172c7042-1a1a-4ed0-9cd7-9f818efde80a	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Pó De Café	2024-05-09T18:58:22.776Z	\N
aac33dfd-3626-4bac-a5d3-50ad6a8d69b7	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Cadarço	2024-05-09T19:03:07.808Z	\N
b8053337-313e-439a-ab78-93389a94b8e8	03fdb0f2-6b50-4895-b970-5793cad80c86	Ração Gastro Intestinal	2024-05-14T00:41:22.214Z	\N
724bf57e-7cad-4f73-a2c1-502e2bb8560f	b3a81a9d-a964-4413-9a33-974a3b4673d1	Médico	2024-05-14T00:46:19.600Z	\N
e5f41a78-0434-425c-b824-aff55a752052	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Guarda Chuva	2024-05-14T00:55:33.134Z	\N
97ccc4fb-5c0a-45ea-a5c5-c08cd531b2d1	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calçado 40 (masc/fem)	2024-05-14T01:04:12.626Z	\N
6ecf5b89-427f-420d-b208-b1affbdb6dd1	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Feijão	2024-05-09T02:25:52.045Z	\N
1fde16af-ef8a-4686-b021-cafc1c5179cf	5c9b6767-5310-461b-977b-906fe16370ae	Medicamentos prescritos	2024-05-06T03:04:57.286Z	2024-05-07T21:30:20.591Z
5e41a301-df2c-4b07-9b4d-6fde4be7206e	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calçado 37 (masc/fem)	2024-05-14T01:03:47.496Z	\N
8fe8f879-5cc8-4670-a13d-9d2d6bb24017	b3a81a9d-a964-4413-9a33-974a3b4673d1	Assistentes Sociais	2024-05-06T03:04:57.286Z	\N
0c31a10b-64ed-447b-8e41-d84664302671	5c9b6767-5310-461b-977b-906fe16370ae	Carrinho De Bebe	2024-05-09T03:18:57.393Z	\N
6390b091-e28c-4b25-9f51-d96c0ad34e79	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça De Moletom (g, Gg, Xxg)	2024-05-14T01:04:39.526Z	\N
92b4df0f-45fc-48e9-971d-6dac320380e7	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa De Menino (01 A 14 Anos)	2024-05-14T01:05:03.405Z	\N
a96f078d-2d33-4da4-b2b5-7d86d51ba507	5c9b6767-5310-461b-977b-906fe16370ae	Teste Covid	2024-05-14T01:08:49.527Z	\N
f922ba72-e34e-4c72-8cb4-6339d905b5c0	5c9b6767-5310-461b-977b-906fe16370ae	Teste Dengue	2024-05-14T01:09:22.038Z	\N
b0c86acd-1f28-4ee1-baa8-18c7c918d49d	d7627977-1c42-48a8-abe5-45422ddc97df	Pente Fino (piolho)	2024-05-14T01:13:17.421Z	\N
9d0e7d72-7bb7-4bcd-b49e-5af65224893a	5c9b6767-5310-461b-977b-906fe16370ae	Corrente/cadeado Para Bicicleta	2024-05-09T21:52:58.849Z	\N
70f0cc2e-b5b6-4fe6-8824-a5390d566069	03fdb0f2-6b50-4895-b970-5793cad80c86	Antipulga - Gatos	2024-05-09T21:59:47.995Z	\N
01143932-fcb6-433b-8ae4-e491802a41d3	03fdb0f2-6b50-4895-b970-5793cad80c86	Sache - Cachorro	2024-05-09T22:00:14.379Z	\N
538b2fe7-f31b-4edc-ade4-ced630b607db	5d50d3cf-4e36-4639-813d-d43de8886ac8	Esfregão De Aço	2024-05-14T01:05:36.665Z	\N
d7f296ff-11e1-45cf-a360-7989c69affb1	5d50d3cf-4e36-4639-813d-d43de8886ac8	Pano de prato	2024-05-07T01:00:43.134Z	\N
0cdc9330-0237-41e1-916d-d5ae801f383a	03fdb0f2-6b50-4895-b970-5793cad80c86	Peiteira M	2024-05-09T22:02:03.970Z	\N
65d76d06-ff09-40b5-8df8-ead5c4cabe2e	c117dd37-82ab-43a6-bf66-d97acef97f6e	Brinquedos	2024-05-09T22:01:36.412Z	\N
1ef4c263-4e2b-4271-af56-2a4d8717c85c	be0e4018-ca46-44cd-b814-7681ba98c51a	Mesa De Plástico	2024-05-14T01:34:22.418Z	\N
6e9a8909-a27a-43f0-8945-7dfec5174372	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Tapete Eva	2024-05-14T01:35:18.016Z	\N
0e951a76-4e9e-4df3-a4c0-71221e1886d2	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Batata Doce	2024-05-14T01:42:30.112Z	\N
664ee223-1340-43d1-9ae5-13685ec9b22b	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Abobrinha	2024-05-14T01:43:14.746Z	\N
39a516e1-1d99-4300-9b1f-afc9ca68bc69	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Limão	2024-05-14T01:45:49.998Z	\N
4a96f026-b754-46ea-88b2-37624e604ad3	03fdb0f2-6b50-4895-b970-5793cad80c86	Alimento Pastoso Em Lata (cães)	2024-05-14T01:51:43.814Z	\N
c8bf430d-7110-4e29-90b8-405b1c79254d	03fdb0f2-6b50-4895-b970-5793cad80c86	Alimento Pastoso Em Lata (gatos)	2024-05-14T01:52:04.726Z	\N
00d20b3f-9f40-46f7-9cf5-33dcac97094f	03fdb0f2-6b50-4895-b970-5793cad80c86	Comedouro	2024-05-14T01:52:38.522Z	\N
f1570b6d-f756-493e-a151-115f51f1e747	718d5be3-69c3-4216-97f1-12b690d0eb97	Fralda Gg	2024-05-09T22:26:49.919Z	\N
1976695e-a2d4-46c5-afa8-438094954f48	718d5be3-69c3-4216-97f1-12b690d0eb97	Shampoo Infantil	2024-05-09T22:30:04.148Z	\N
387fbf07-bb94-4471-9db3-f6a2eec3e772	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Moranga Cabotiá	2024-05-14T01:44:03.031Z	\N
2f6dc320-55e1-4832-8fce-a7ddf9ee661a	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Chuchu	2024-05-14T01:44:31.504Z	\N
b2f1c6ff-93dc-4d8d-8365-36bcfc0eb1fd	03fdb0f2-6b50-4895-b970-5793cad80c86	Antipulgas	2024-05-06T18:37:45.921Z	2024-05-07T17:04:43.980Z
3704be1c-459a-4c7d-a18c-34dfd3a1c6cd	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Mantas	2024-05-09T22:29:04.971Z	\N
b3f244b6-07e4-41d2-ace6-a3e2fc93281b	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Repolho	2024-05-14T01:44:58.865Z	\N
c4d56ef3-9ee0-4af2-bc94-64394f166252	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Laranja	2024-05-14T01:46:08.640Z	\N
3c1b608c-abe0-4f61-a6f5-dedca499fbf3	c117dd37-82ab-43a6-bf66-d97acef97f6e	Folha A4	2024-05-09T23:29:59.452Z	\N
be775eea-c7fc-4162-8f94-6bddc5c33e2f	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Qwdpokqwdopjikopwqd	2024-05-14T05:43:15.293Z	\N
09fa01c2-c48c-4d7d-b910-adc3109dc041	718d5be3-69c3-4216-97f1-12b690d0eb97	Cotonete	2024-05-09T22:31:16.660Z	\N
c84192e1-0605-4b6f-8302-99aa29116f1f	5d50d3cf-4e36-4639-813d-d43de8886ac8	Saco De Lixo 100l	2024-05-09T22:33:13.861Z	\N
5d2691d5-f880-411e-a4c2-e61577985a55	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Suco	2024-05-14T11:53:17.114Z	\N
ddd006a5-eac6-44de-ad77-b9386f25ef9c	037ac262-4f35-42e0-83e1-4cdcceedb39c	Copos	2024-05-06T03:05:01.751Z	\N
03cb9712-4f2d-420a-b280-f760e0dac839	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Leite Condensado	2024-05-09T23:28:02.753Z	\N
d0d08e71-113d-4a7b-9ae1-ae73ec4509ef	5c9b6767-5310-461b-977b-906fe16370ae	Folha A3	2024-05-09T23:29:46.322Z	\N
5d954f15-2faa-4c18-89be-883d47c19405	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calcinha M	2024-05-09T23:32:50.071Z	\N
bb658f0c-11bd-47be-ab4c-d656c34edc5b	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Copos Descartáveis 180 Ml	2024-05-14T11:54:24.313Z	\N
0d90cc33-ff13-420c-bfa3-2e155200aa07	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Pantufas	2024-05-09T23:30:45.884Z	\N
7be88738-a1ec-46ff-af28-01cdba37440a	5c9b6767-5310-461b-977b-906fe16370ae	Caixa De Transporte	2024-05-09T23:46:40.743Z	\N
873f0443-1ed1-4044-ae2e-da17f59ddfc0	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Agua Potavel	2024-05-09T23:47:07.149Z	\N
329140fb-9803-4f82-9334-b2b485cd1b65	03fdb0f2-6b50-4895-b970-5793cad80c86	Simparic Porte G	2024-05-14T12:57:39.240Z	\N
6795ba1a-3908-4edf-95e6-96c61b21914e	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Presunto	2024-05-14T12:59:27.022Z	\N
5cac0471-262c-4408-8fd7-00e99f5a9869	5c9b6767-5310-461b-977b-906fe16370ae	Kits de primeiros socorros	2024-05-06T03:05:02.870Z	2024-05-06T06:21:16.435Z
fbe933e1-c88c-4ec8-9a83-4cd88ceefcb6	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Racao	2024-05-09T23:47:26.651Z	\N
2d16c993-d60f-49fb-ad83-b1f2cac4fe59	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Queijo	2024-05-14T12:58:56.301Z	\N
e3136fbf-05df-4991-b838-ce36d3bc2d3d	03fdb0f2-6b50-4895-b970-5793cad80c86	Tolhas	2024-05-14T13:19:40.903Z	\N
6ab655f5-0dbe-4e4c-9edf-d6bd4d4ca8c2	03fdb0f2-6b50-4895-b970-5793cad80c86	Roupas Pet	2024-05-14T13:26:48.359Z	\N
6c72a74f-0eae-481a-93a5-4d1b0e607ce0	03fdb0f2-6b50-4895-b970-5793cad80c86	Mantas Ou Cobertas	2024-05-14T13:28:17.654Z	\N
c00803c6-01e0-49ed-b030-3cf5c67f54e0	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Cadeira De Rodas Infantil (10 Anos)	2024-05-14T13:28:25.845Z	\N
a67daf19-d5c9-4021-a189-c89adc8cb051	718d5be3-69c3-4216-97f1-12b690d0eb97	Lixa de unha	2024-05-06T18:39:02.084Z	2024-05-06T19:21:00.937Z
7d077d4d-2f97-4c24-9e73-e64765a3b2f8	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Cama alta para cadeirante 	2024-05-06T19:23:10.433Z	2024-05-07T00:57:04.927Z
3f9591df-328d-467f-b556-0872762b09a8	03fdb0f2-6b50-4895-b970-5793cad80c86	Caixas de transporte para pets	2024-05-06T19:21:42.638Z	2024-05-07T01:00:55.601Z
9c28c037-b76a-443a-9e9d-33312e926174	037ac262-4f35-42e0-83e1-4cdcceedb39c	Copos Plasticos	2024-05-10T00:34:41.282Z	\N
3a2b4c6a-9e59-4f3a-be7b-c8399bb3a201	5c9b6767-5310-461b-977b-906fe16370ae	Colher Para Refeiçao	2024-05-10T00:35:20.383Z	\N
d84d154b-d509-4f04-b042-c1e4f506aed2	5c9b6767-5310-461b-977b-906fe16370ae	Ração Senior	2024-05-10T00:35:38.846Z	\N
242ff884-0ac2-47a1-850e-cf1829423692	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Sucos De Caixinhas	2024-05-10T01:26:13.126Z	\N
c2e9e058-dc82-4466-b3c1-fba6796e36a6	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Polenta Grossa	2024-05-10T01:30:34.267Z	\N
cdac9413-68ad-4382-9be0-b8a5877b5d8c	5d50d3cf-4e36-4639-813d-d43de8886ac8	Papel Para Secar Mão	2024-05-10T01:47:34.339Z	\N
dfbf27f0-d560-4aea-aba6-532a6346b994	037ac262-4f35-42e0-83e1-4cdcceedb39c	Talheres Descartáveis	2024-05-10T01:49:54.540Z	\N
6716f08d-fa4f-48a3-8507-4c0bcbee5535	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Íntimas Infantis	2024-05-14T13:15:56.012Z	\N
e6e9ccb4-6608-49b3-bc7a-fabc4e6fdff4	5d50d3cf-4e36-4639-813d-d43de8886ac8	Panos De Chão	2024-05-14T13:16:38.142Z	\N
4e3b5069-295f-47ff-803a-4dfa23930107	5c9b6767-5310-461b-977b-906fe16370ae	Colírio Lacri Ou Systane	2024-05-14T13:16:52.356Z	\N
bcf3a747-91fc-4daa-9900-3dc1b30a6c60	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Isqueiro	2024-05-14T13:17:28.620Z	\N
d504cfeb-beed-4253-8d42-0e3a6c883170	03fdb0f2-6b50-4895-b970-5793cad80c86	Colírii Still	2024-05-14T13:17:56.148Z	\N
42b6aceb-3e7a-4123-bfc7-dff305d16709	03fdb0f2-6b50-4895-b970-5793cad80c86	Coleira Pequena Para Gato	2024-05-14T13:21:15.020Z	\N
2f521961-1ed9-4602-9d20-beeeee59c5ba	03fdb0f2-6b50-4895-b970-5793cad80c86	Luva Latex	2024-05-14T13:21:49.686Z	\N
e04a6c7b-a808-4343-a5c5-7809179b80cd	5d50d3cf-4e36-4639-813d-d43de8886ac8	Luvas Limpeza	2024-05-14T13:22:46.347Z	\N
2ae85dd6-9b1a-47e2-8eb9-c06c08316d8b	03fdb0f2-6b50-4895-b970-5793cad80c86	Onsior	2024-05-14T13:23:30.387Z	\N
a8c8c088-c127-474b-af7b-8431bf6513d0	03fdb0f2-6b50-4895-b970-5793cad80c86	Previcox	2024-05-14T13:24:18.974Z	\N
92f43fac-a809-4c60-b9fb-eff7dd29a8bb	5d50d3cf-4e36-4639-813d-d43de8886ac8	Saco De Lixo 110l	2024-05-14T13:25:48.148Z	\N
04739dc8-0a12-4c38-94e9-f20b696796a5	03fdb0f2-6b50-4895-b970-5793cad80c86	Carproflan,condroton Ou Similar E Librela 20mg	2024-05-14T13:25:48.682Z	\N
edcb4032-d028-48ee-9811-b6004b277877	718d5be3-69c3-4216-97f1-12b690d0eb97	Repelente 	2024-05-06T18:13:49.217Z	2024-05-07T23:58:02.815Z
ddfd8cc9-02db-4c9c-b59c-c4f03459607c	718d5be3-69c3-4216-97f1-12b690d0eb97	Algodão 	2024-05-06T18:38:28.696Z	2024-05-06T19:20:30.868Z
eadb6611-5c04-4050-9be4-fd2b4eacd182	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Margarina	2024-05-10T01:29:44.915Z	\N
db326b44-ce02-443b-bbe1-deec70fa9a7b	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça Legging	2024-05-10T01:32:23.928Z	\N
2a088703-bffe-491a-8e62-4c9f796024d1	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça De Moletom Masculina	2024-05-10T01:32:48.117Z	\N
61735e25-7502-4864-9a02-cbec10b78700	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Casaco De Moletom Masculino	2024-05-10T01:33:12.619Z	\N
ae38df39-82a8-4e18-8fb7-d28ff55a9ee4	03fdb0f2-6b50-4895-b970-5793cad80c86	Arranhador De Gato	2024-05-14T13:20:30.331Z	\N
fcc2aee3-3a74-45a7-a590-961a2f78050d	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Lanches	2024-05-06T21:06:37.666Z	2024-05-07T23:33:34.888Z
ddd88a43-eb5a-416a-9ed1-2be44c5982a8	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Marmitas	2024-05-06T21:06:26.336Z	2024-05-07T23:32:42.141Z
6c8684ed-85ad-49c0-a76e-cb34e7538f4d	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Café	2024-05-10T01:26:40.532Z	\N
51f89876-fee4-4887-a74d-351d12ca4c5e	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Pipoca	2024-05-10T01:26:58.025Z	\N
6374669b-f8a0-433b-a6af-349529a9e31a	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Tomate	2024-05-10T01:28:37.735Z	\N
a0da9ec6-caf6-4939-a844-39534055b9e2	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Pepino	2024-05-10T01:28:58.833Z	\N
bdf7609e-a731-4480-874a-7ed5a8de5627	5d50d3cf-4e36-4639-813d-d43de8886ac8	Sacos De Lixo Fortes (100l E 200l)	2024-05-10T01:37:14.724Z	\N
8f000e6a-c3cf-43ea-a947-f5df7150caa4	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa De Cama	2024-05-10T01:57:49.043Z	\N
32c8b84b-f427-472b-91fb-150008246e85	be0e4018-ca46-44cd-b814-7681ba98c51a	Colchão	2024-05-10T01:57:13.451Z	\N
96afd89c-f294-47d5-be96-919c7cdacce1	4f95853f-d5e1-487d-8086-6ddfaf2bbab7	Abajure Ou Luminária	2024-05-10T02:01:26.897Z	\N
572c112b-7886-4136-ad9e-5198c14bb222	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Panelas	2024-05-14T13:30:55.166Z	\N
b7349827-482c-4c5c-b0eb-7627a8380c16	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas íntimas	2024-05-07T01:04:09.440Z	\N
723e8686-19d8-4b51-a250-e05885d9e081	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Óleo De Soja	2024-05-10T02:07:50.494Z	\N
177af46d-db63-49b3-bc1a-8d74136fb359	03fdb0f2-6b50-4895-b970-5793cad80c86	Antibiótico - Profilaxia Cães	2024-05-14T13:45:30.479Z	\N
f2b36d7a-84ca-49f5-a2ad-c281c80ca7aa	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Tenis Feminino E Masculino Acima De Tamanho 37	2024-05-14T13:51:22.392Z	\N
94701e72-8ebc-43e7-885a-9e2a810ad1e7	718d5be3-69c3-4216-97f1-12b690d0eb97	Pente	2024-05-06T22:36:04.108Z	\N
cf61184d-0ffb-4443-9a63-231432a3bed1	5d50d3cf-4e36-4639-813d-d43de8886ac8	Produtos de desinfecção (cloro, álcool)	2024-05-06T03:04:39.334Z	2024-05-06T05:21:34.414Z
8ec08775-c401-4a5e-b52d-681cc468601c	fd1f74c4-6723-4ffe-8657-773a943e65c4	Extintor	2024-05-10T09:28:25.644Z	\N
fe9b91bf-1e73-4dac-9ad7-d06fb9f22ca0	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas De Frio M/g/gg	2024-05-14T14:05:03.999Z	\N
38d96b67-2247-416a-af68-6b2b7ae65ad4	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Cueca P	2024-05-14T14:07:12.293Z	\N
bd742c5e-9257-4f16-a572-b4571d98db90	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Toalha de Banho	2024-05-06T22:57:50.533Z	\N
c4d3a5b9-3679-4acf-ab91-15a34761ce78	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Luvas De Frio	2024-05-14T14:21:37.669Z	\N
dd565638-4773-4712-91e1-4a3478c8fa6a	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas plus size	2024-05-06T22:37:48.923Z	\N
7e221be5-cacb-4b5d-96b7-4d0b65d04295	5d50d3cf-4e36-4639-813d-d43de8886ac8	Álcool	2024-05-10T11:05:43.114Z	\N
aac720f4-bda4-4035-bf3a-4d00c76809a7	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Cueca M	2024-05-14T14:06:48.187Z	\N
c51c47b6-4fad-45d6-9d30-f2b9c98f76f5	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Cuecas Tamanhos P M G	2024-05-14T14:13:48.877Z	\N
43f09bc7-2da9-4fe2-884d-987f1f11856c	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Mantas De Pescoço	2024-05-14T14:26:13.550Z	\N
eb3caab6-6357-4757-86b2-efaf8d691de7	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calçados Infantis	2024-05-06T22:38:28.312Z	\N
0d3f2a26-0bec-4cee-9c9b-62b7dd53345c	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Agasalho Masculino G/gg	2024-05-10T11:23:43.281Z	\N
1174922e-fe33-4f48-b3dc-12f61af89e90	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Batata	2024-05-10T12:09:45.412Z	\N
c40c44b2-037b-46f4-b8e1-86d7b8a3f990	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Sazon	2024-05-10T12:10:45.231Z	\N
9f1c1e9f-d658-4d88-8f67-f3758ff0de44	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Caneta Insulina Tresiba (degludeca)	2024-05-14T14:41:26.430Z	\N
3e2c22be-5ac0-4b10-ba0c-150ee9f33100	fd1f74c4-6723-4ffe-8657-773a943e65c4	Cadeiras (tipo de praia)	2024-05-06T06:25:17.677Z	\N
f51bc934-80c1-4fb6-858f-38f701e88dd9	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Bermuda Masculina	2024-05-06T22:39:38.319Z	\N
3e85a0d3-2717-44bb-8b4b-8ce1a0d2374d	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntário - Manhã	2024-05-06T06:26:39.694Z	2024-05-07T16:46:56.492Z
1bcc741b-ea23-434a-bd52-b2d878369a49	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Creme De Leite	2024-05-10T12:10:21.046Z	\N
ba4466e9-61e1-4f84-8e98-7dda7b416e1b	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Bacon	2024-05-10T12:11:01.974Z	\N
a5fdc109-911e-468e-9742-b2f7ca5d8f62	718d5be3-69c3-4216-97f1-12b690d0eb97	Escova E Pente De Cabelo	2024-05-14T14:45:55.622Z	\N
97e97f0c-9508-4e34-96c4-575978f13f8a	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Caneta Insulina Lispro Humalog (	2024-05-14T14:47:09.031Z	\N
4fadfa90-c80e-43d9-8717-8bcd4c93ebe7	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Caneta Novorapid Flexpen Asparte	2024-05-14T14:47:48.530Z	\N
0fe3738e-658c-4cb5-a8b5-431583445b3c	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina	2024-05-14T14:48:29.798Z	\N
d5997185-4ea3-4ab6-96ec-6f608084527a	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Tênis 46	2024-05-14T14:49:14.088Z	\N
3982cd82-d50b-4d04-8f31-8f29bf7735d3	5d50d3cf-4e36-4639-813d-d43de8886ac8	Bombril	2024-05-10T13:36:42.583Z	\N
aaac0c48-ca57-43cc-964f-8f7216f954e4	5c9b6767-5310-461b-977b-906fe16370ae	Caneta Insulina Glargin (glargina)	2024-05-14T14:46:17.233Z	\N
c419557c-c8f6-4e05-8595-614e5445bd88	718d5be3-69c3-4216-97f1-12b690d0eb97	Sabonete De Rosto	2024-05-14T15:01:16.243Z	\N
9db48ec1-52a5-4ecd-a7f0-7ba3e30d0d63	718d5be3-69c3-4216-97f1-12b690d0eb97	Creme Para Pentear Infantil	2024-05-14T15:05:25.881Z	\N
f545aabc-a4a4-4166-b8ea-6e993dd80e7d	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Blusão, Casaco E Moletom Adulto (todos Os Tamanhos)	2024-05-14T15:08:51.311Z	\N
ca0ef946-0de3-47a2-a0cb-df72de35aeec	718d5be3-69c3-4216-97f1-12b690d0eb97	Prestobarba	2024-05-06T22:51:29.224Z	2024-05-06T22:51:38.321Z
bdf3ea04-9dc4-4219-bdc3-b84cde19f707	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Blusão Feminino G E Gg	2024-05-14T15:10:28.951Z	\N
9cd61380-022a-40f2-a262-a9ec97230017	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Brócolis	2024-05-14T15:25:59.249Z	\N
d2023ffb-a9d3-4ec8-b9a5-1247e039e3da	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Mandioca	2024-05-14T15:26:16.763Z	\N
1aceea21-c442-4aaf-875f-20e344a542b9	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Pimentão	2024-05-14T15:27:27.617Z	\N
432604fd-e8eb-467f-8eef-e34065113c25	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Maquina De Retirar Leite (manual)	2024-05-14T15:42:26.967Z	\N
ed51c185-ec13-4530-a33e-330c8ddd9bc2	5c9b6767-5310-461b-977b-906fe16370ae	Roupas Maculinas	2024-05-14T15:43:11.953Z	\N
38f2c85a-d46f-4cd4-92a6-70cd8b55851a	718d5be3-69c3-4216-97f1-12b690d0eb97	Papel higiênico	2024-05-06T06:28:41.690Z	2024-05-07T12:12:59.464Z
304ce901-889c-4339-b4d5-32b6e33e8d00	5c9b6767-5310-461b-977b-906fe16370ae	Calcinhas	2024-05-14T15:44:08.278Z	\N
1d3ead20-463d-404c-923a-e236bee7917d	5c9b6767-5310-461b-977b-906fe16370ae	Pasta De Dente	2024-05-14T15:48:13.362Z	\N
763d4db1-d593-4192-8481-3535284ad87d	4f95853f-d5e1-487d-8086-6ddfaf2bbab7	Computador	2024-05-14T15:48:33.495Z	\N
4cffa928-96fd-4f5a-89bc-50ccde8d5d6f	5c9b6767-5310-461b-977b-906fe16370ae	Desodorantes	2024-05-14T15:48:41.709Z	\N
ed0e5e53-3cc8-498b-a62a-f7d3a115d0c6	5c9b6767-5310-461b-977b-906fe16370ae	Produtos De Limpeza	2024-05-14T15:48:58.503Z	\N
69b90d1e-4f3b-4597-bb34-5d269a07fdd6	5c9b6767-5310-461b-977b-906fe16370ae	Vacina Para Covid	2024-05-14T15:49:21.898Z	\N
2de1e0fe-6bc4-4454-be92-02a01a59e820	5c9b6767-5310-461b-977b-906fe16370ae	Sabão Em Pó	2024-05-14T15:49:24.402Z	\N
468fd58a-21d2-447e-828c-3af01effbbe2	5c9b6767-5310-461b-977b-906fe16370ae	Água Sanitária	2024-05-14T15:49:43.313Z	\N
647d1fd0-cc5f-46d2-9350-51ff61b15c7a	5c9b6767-5310-461b-977b-906fe16370ae	Vacina Para Influenza	2024-05-14T15:49:43.614Z	\N
21bd512a-dc3d-470d-a9f6-f4dd2e445642	5c9b6767-5310-461b-977b-906fe16370ae	Vacina Hepatite A	2024-05-14T15:50:12.082Z	\N
4f44cc87-8684-4327-9fb6-0a55d3464020	fd1f74c4-6723-4ffe-8657-773a943e65c4	Caixa de papelão 	2024-05-06T23:03:28.667Z	\N
2323bf86-445a-410d-89fc-01c6b2ea36ea	037ac262-4f35-42e0-83e1-4cdcceedb39c	Copos Descartáveis Pequenos (50 E 100ml)	2024-05-10T13:59:15.268Z	\N
0bac5a5c-e260-41eb-806e-46397862d868	5c9b6767-5310-461b-977b-906fe16370ae	Roupas Masculinas De Moletom G A Xxg (casacos E Calças)	2024-05-10T14:04:07.012Z	\N
f8e618b1-c99d-4183-85f7-0b2c4407321f	718d5be3-69c3-4216-97f1-12b690d0eb97	Condicionador Infantil	2024-05-14T15:04:54.179Z	\N
8d107eda-f83e-4f4c-9a21-3dd19ffc09de	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Camiseta Masculina (todos Os Tamanhos)	2024-05-14T15:09:42.665Z	\N
af187ce2-eca4-4a8e-a5d3-6ab6fe8e7c87	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Ármario Com Chave	2024-05-14T15:23:52.911Z	\N
4003cd8e-8536-41f7-a7fa-3c9bc622adf1	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Bergamotas	2024-05-14T15:24:49.165Z	\N
6a220720-6fa3-42cc-8101-621da51b521f	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas para frio	2024-05-06T06:29:59.865Z	\N
6a7b9aab-b9ca-4dcb-bbbe-c2186631888f	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Abóbora	2024-05-14T15:26:32.187Z	\N
4734b699-3a7e-4769-9fa1-dd07d4554f98	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Nabo	2024-05-14T15:26:43.027Z	\N
0a12c892-0352-4a3c-9a31-0e9103d85204	5c9b6767-5310-461b-977b-906fe16370ae	Cuecas	2024-05-14T15:43:28.840Z	\N
53c264d7-8472-4f8f-a863-f56752e9be71	5c9b6767-5310-461b-977b-906fe16370ae	Meias	2024-05-14T15:43:42.225Z	\N
d75c791b-592a-4e7d-87f2-012f0e0e9295	5c9b6767-5310-461b-977b-906fe16370ae	Desinfetante	2024-05-14T15:49:11.609Z	\N
2bcb78ac-03c5-4707-bb2d-ef679465e2a1	5c9b6767-5310-461b-977b-906fe16370ae	Talheres Descartáveis	2024-05-14T15:50:06.440Z	\N
90878eb1-2d46-44f5-b231-b271742b4d71	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Beterraba	2024-05-14T15:53:21.182Z	\N
99988da7-974f-44e6-b427-87a3c4528ae1	5c9b6767-5310-461b-977b-906fe16370ae	Cadeira De Rodas 150kg +	2024-05-14T15:54:53.639Z	\N
fcf37cf9-f636-46a3-8b0d-3edb13364e69	5c9b6767-5310-461b-977b-906fe16370ae	Produtos De Higiene	2024-05-14T15:56:05.209Z	\N
866fa138-912d-469a-aec0-fd6fa14a300a	5c9b6767-5310-461b-977b-906fe16370ae	Roupas Plus Size Frio	2024-05-14T15:56:24.001Z	\N
4bde0809-6c52-4ae5-bf78-17f5f3595eb7	5c9b6767-5310-461b-977b-906fe16370ae	Roupas De 10 - 14 Anos	2024-05-14T15:56:41.218Z	\N
eb6aad71-eb82-425a-97fc-3bbeda495f69	5c9b6767-5310-461b-977b-906fe16370ae	Voluntários Para Recreação	2024-05-14T15:58:20.019Z	\N
c4e92203-12a1-4b5a-b4b2-79f5da4bb597	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Couve Flor	2024-05-14T15:58:46.604Z	\N
40fa4d35-6f69-4fd9-9697-c6944fec01a2	5c9b6767-5310-461b-977b-906fe16370ae	Fraldas Descartáveis Todos Os Tam Menos M	2024-05-14T15:58:50.222Z	\N
1beaa417-91ee-4ccc-b779-a4c2a5a81807	5d50d3cf-4e36-4639-813d-d43de8886ac8	Sabão Em Barra	2024-05-10T14:28:50.050Z	\N
b3dbcd74-cbaa-45af-852c-a0433220aa2a	718d5be3-69c3-4216-97f1-12b690d0eb97	Pasta De Dente Infantil	2024-05-10T14:30:30.549Z	\N
ea75bc9f-86a7-41ba-b9c3-66ecee82860d	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Cueca Gg	2024-05-10T14:35:01.641Z	\N
a405abfb-5aba-42e1-bd0f-e8a346a42305	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Íntimas Femininas	2024-05-10T14:36:02.018Z	\N
25bf800d-f0df-4ff2-bcd8-3e7eb4433e08	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Blusão G	2024-05-10T14:37:28.588Z	\N
1aa1cd13-4803-4871-8bd6-a8006a6cf52a	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Casacos	2024-05-10T14:46:00.148Z	\N
c22f92e8-d065-455e-867d-534f12705bbf	03fdb0f2-6b50-4895-b970-5793cad80c86	Esparadrapo	2024-05-10T15:22:24.183Z	\N
f75e7cd2-be77-4358-b281-90a943e1d983	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Meia	2024-05-10T15:27:58.707Z	\N
d54d1746-ddc6-4492-8ed4-969696bb38af	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Mistura Para Bolo	2024-05-14T15:07:00.328Z	\N
f8e2fa5f-850f-4833-946e-5034de5671df	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Cesta Báscia	2024-05-14T15:13:44.793Z	\N
9f1e180f-c481-4edb-9a81-164801514aec	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Biombo	2024-05-14T15:23:33.566Z	\N
f478c31a-a034-44bc-b2db-a9a9a21b15b0	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Mesas Infantis	2024-05-14T15:24:04.443Z	\N
a9c5cfe0-a05c-4e45-b38a-f5db5f837304	5d50d3cf-4e36-4639-813d-d43de8886ac8	Vassouras e rodos	2024-05-06T06:29:59.865Z	2024-05-06T15:41:53.232Z
1418ce67-28b1-4db5-b95d-b32619b72b4c	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Prateleira De Ferro	2024-05-14T15:24:24.298Z	\N
46a96020-73ec-4d2e-aa5a-d9f35697df46	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Rabanete	2024-05-14T15:26:55.386Z	\N
e3a0f59f-5fb8-48ad-b589-4d6f9a789edc	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Produtos Perecíveis	2024-05-14T15:29:42.625Z	\N
3dd6c27c-33fa-481d-97ae-b40a3987cef3	5c9b6767-5310-461b-977b-906fe16370ae	Tênis	2024-05-14T15:44:32.665Z	\N
2b25ddf5-d86b-4527-a267-06951926feeb	5c9b6767-5310-461b-977b-906fe16370ae	Escova De Dente	2024-05-14T15:48:29.663Z	\N
e966d8d8-9212-49c6-a1c2-385a61edab45	718d5be3-69c3-4216-97f1-12b690d0eb97	Escova De Dentes Infantil	2024-05-10T14:30:48.718Z	\N
540d800e-cf37-4bdc-91f8-d00b8edb52b9	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Cueca G	2024-05-10T14:34:37.695Z	\N
1e034a7e-15d4-45a4-bf77-5695f066aff9	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Blusão Gg	2024-05-10T14:37:41.534Z	\N
f8c5ed02-4833-4676-9247-907d4ac9cafe	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Lençol De Casal	2024-05-10T14:39:33.797Z	\N
9fa75236-5a40-4ee2-89ae-feb9934ef0c2	5c9b6767-5310-461b-977b-906fe16370ae	Meias	2024-05-14T15:57:22.700Z	\N
a8a72f8f-404e-48af-9943-fa165177a787	5c9b6767-5310-461b-977b-906fe16370ae	Alimentos Não Perecíveis	2024-05-14T15:57:49.896Z	\N
38028f59-3dc9-4556-a56a-7d2fbb7ed895	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Blusões	2024-05-10T14:46:19.266Z	\N
88d78894-1dd5-45cd-b525-634008cb5ecb	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Marmitas (alimento Para Consumo Rápido)	2024-05-14T16:08:52.559Z	\N
23b8bef8-4a21-4eb6-b4fa-a10f50b563e7	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Chinelo 35/36	2024-05-14T16:13:19.922Z	\N
182dd6ab-89fc-4d72-9193-713804f0a05a	5c9b6767-5310-461b-977b-906fe16370ae	Colchões De Espuma (para Substituir Infláveis Danificados)	2024-05-14T16:14:27.803Z	\N
8106f142-2548-464f-ba9c-2d0044974bd3	5c9b6767-5310-461b-977b-906fe16370ae	Roupas Masculinas	2024-05-14T16:38:02.223Z	\N
83e648cc-f565-4407-8377-d2b2522f3b7f	5c9b6767-5310-461b-977b-906fe16370ae	Cuecas Infantis Grandes	2024-05-14T16:39:09.898Z	\N
80590162-dc28-4b03-838e-dc1def107e65	5c9b6767-5310-461b-977b-906fe16370ae	Cuecas Adultos G	2024-05-14T16:40:00.225Z	\N
77bb6f0a-4ba6-4ec2-b831-f120d7a25da1	5c9b6767-5310-461b-977b-906fe16370ae	Calcinhas Adulto G	2024-05-14T16:40:20.361Z	\N
9b5e0298-63d9-49b6-ad1d-c912aac2d437	718d5be3-69c3-4216-97f1-12b690d0eb97	Desodorantes	2024-05-14T16:41:56.909Z	\N
1043a736-81a6-43d1-8e45-746105b0c122	5c9b6767-5310-461b-977b-906fe16370ae	Luva De Limpeza	2024-05-14T16:45:07.649Z	\N
43b19c6a-6e15-4c33-8ca9-a67bf4a10be2	03fdb0f2-6b50-4895-b970-5793cad80c86	Ração Gastro Intestinal Para Gato (seca E Lata)	2024-05-14T17:33:59.155Z	\N
fcafaccc-e1b1-4ced-9f5d-ade800f5789c	5d50d3cf-4e36-4639-813d-d43de8886ac8	Luva P	2024-05-14T17:35:08.742Z	\N
c96b4e99-1a18-4795-8570-9db2701e07a0	03fdb0f2-6b50-4895-b970-5793cad80c86	Cerenia	2024-05-14T17:37:51.806Z	\N
2440606c-888a-4b54-9823-85025ab9a02c	718d5be3-69c3-4216-97f1-12b690d0eb97	Talco	2024-05-14T17:38:10.144Z	\N
fd4d50d8-f345-4996-b245-13b827fc416a	5c9b6767-5310-461b-977b-906fe16370ae	Ondansetrona	2024-05-10T15:17:33.843Z	\N
21da2418-e978-41cb-90a8-d7e677b4d577	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Cueca	2024-05-10T15:27:40.241Z	\N
92aa3e09-f5bc-4645-bad3-7f13d40043fc	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Lingerie	2024-05-10T15:28:26.584Z	\N
d001c64f-33b0-4d50-a8c1-1b62084c6e00	5d50d3cf-4e36-4639-813d-d43de8886ac8	Balde	2024-05-10T15:31:58.122Z	\N
fbdf04e4-b743-4fba-9a05-0bdfe8d40a05	5c9b6767-5310-461b-977b-906fe16370ae	Colchões De Espuma	2024-05-14T16:13:42.796Z	\N
9e9ad9af-339b-4a7b-9ee1-4a2ee21045b8	5c9b6767-5310-461b-977b-906fe16370ae	Embalagens Marmitex Descartáveis	2024-05-14T16:14:49.818Z	\N
23e13876-7ac0-401f-b99d-5b7161533e5b	5c9b6767-5310-461b-977b-906fe16370ae	Talheres Descartáveis	2024-05-14T16:15:10.228Z	\N
931206af-51cc-4484-9948-109051aca4d5	5c9b6767-5310-461b-977b-906fe16370ae	Copos Descartáveis	2024-05-14T16:15:24.091Z	\N
ed48b4d0-0869-43b7-b973-9afa2916b53f	5c9b6767-5310-461b-977b-906fe16370ae	Simeticona	2024-05-10T15:18:17.264Z	\N
6bb91459-f5bb-4199-a447-3413c1b96573	5c9b6767-5310-461b-977b-906fe16370ae	Dipirona 500mg	2024-05-10T15:21:32.187Z	\N
12b9119d-04f0-4ec6-990c-76a28f0dcb82	03fdb0f2-6b50-4895-b970-5793cad80c86	Cobertor Para Pets	2024-05-10T15:22:51.569Z	\N
af969f99-eb8a-48be-89a8-028dc76417ad	5d50d3cf-4e36-4639-813d-d43de8886ac8	Pá De Lixo	2024-05-10T15:31:43.995Z	\N
c4e94a84-f6d2-48a3-a391-8c2491cc8b21	718d5be3-69c3-4216-97f1-12b690d0eb97	Secador De Cabelo	2024-05-10T15:53:06.501Z	\N
921c891e-502e-4e96-b556-e13e1ef2e728	5c9b6767-5310-461b-977b-906fe16370ae	Roupa Infantil Menino	2024-05-14T16:38:16.696Z	\N
1c1c7bc5-787f-4f02-b532-4e95b722f3c2	5c9b6767-5310-461b-977b-906fe16370ae	Chinelos Para Adultos	2024-05-14T16:38:40.350Z	\N
463c4b4d-dec4-4f40-9f6f-fe44474e8447	5c9b6767-5310-461b-977b-906fe16370ae	Meias	2024-05-14T16:40:34.881Z	\N
afff9f35-95b8-48b8-8489-9ea908ae6ac5	5c9b6767-5310-461b-977b-906fe16370ae	Toalhas	2024-05-14T16:40:44.496Z	\N
45ec530c-046f-4c3d-93f7-16f30389bbf7	5c9b6767-5310-461b-977b-906fe16370ae	Desentupidor De Vaso	2024-05-14T16:46:07.272Z	\N
0fd65d26-3ded-4e6d-aeb1-36071d9678d8	5c9b6767-5310-461b-977b-906fe16370ae	Bucha	2024-05-14T16:46:48.219Z	\N
88c61442-7576-41f7-b80d-6783d0ff95e4	5c9b6767-5310-461b-977b-906fe16370ae	Baldes/bacias	2024-05-14T16:48:22.513Z	\N
51df415f-3624-4066-ab38-25d6101e7c5a	5c9b6767-5310-461b-977b-906fe16370ae	Coleiras Para Pet	2024-05-14T16:48:56.610Z	\N
732e5025-ec82-434e-bcc2-77897cf33685	5c9b6767-5310-461b-977b-906fe16370ae	Cobertores Para Pet	2024-05-14T16:49:16.509Z	\N
03ce9af4-367a-4ff3-be16-8014eb017f2f	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Tempero Para Alimentos	2024-05-10T16:02:45.838Z	\N
e0a4593b-5e8f-4f1e-89de-e584e8cdc843	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Doce De Leite / Mumu	2024-05-10T16:03:08.253Z	\N
6d451ef8-e962-423c-8fc8-5fb0eb848766	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Fórmula infantil	2024-05-06T06:40:57.551Z	\N
bb89b62d-0d6b-471d-8617-872dabdca89c	5c9b6767-5310-461b-977b-906fe16370ae	Calcinhas Infantis G	2024-05-14T16:39:39.786Z	\N
e05de4f9-3be7-451a-ab2b-f83ccf69fe90	718d5be3-69c3-4216-97f1-12b690d0eb97	Cortador De Unha	2024-05-14T16:41:38.503Z	\N
d7bcc63a-2ac5-475b-b2a6-f0134b451b98	718d5be3-69c3-4216-97f1-12b690d0eb97	Creme De Cabelo	2024-05-14T16:43:11.672Z	\N
2534868d-bb4c-421f-8149-0641a599fb8a	718d5be3-69c3-4216-97f1-12b690d0eb97	Aparelho De Barbear	2024-05-14T16:43:51.794Z	\N
1ab617ae-01e8-412d-a0c2-9fbea777d832	718d5be3-69c3-4216-97f1-12b690d0eb97	Fralda Geriátrica Gg	2024-05-14T16:44:21.702Z	\N
1d8bc41e-217b-498d-97ab-9f01ca364490	5c9b6767-5310-461b-977b-906fe16370ae	Prendedores	2024-05-14T16:48:04.498Z	\N
b2d2741f-bfc6-4a0b-b6bf-79b7f3b19b02	5c9b6767-5310-461b-977b-906fe16370ae	Escova De Roupa	2024-05-14T16:48:40.748Z	\N
7492b38b-e683-4568-b758-83fd1b7ffbce	03fdb0f2-6b50-4895-b970-5793cad80c86	Ração Cocota	2024-05-14T17:00:09.750Z	\N
eef4aedb-49e6-4ccd-880a-e1143ce6e43a	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntários (tarde)	2024-05-14T17:05:52.089Z	\N
24d16477-578f-45cd-8d85-2ed13db715cf	5c9b6767-5310-461b-977b-906fe16370ae	Desinfetante	2024-05-14T17:21:28.828Z	\N
be3432b6-88a6-4f2b-a2f1-2ec47d80f6ac	5c9b6767-5310-461b-977b-906fe16370ae	Bucha	2024-05-14T17:22:05.598Z	\N
e2def3cf-3787-4066-a106-2c663c008510	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Pães	2024-05-14T17:24:07.222Z	\N
761e4265-2f75-46a2-8cf3-16b8a5a69963	fd1f74c4-6723-4ffe-8657-773a943e65c4	Lanternas	2024-05-06T13:11:26.213Z	\N
d5bee376-7afa-40f0-8b05-77f984e6c12a	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Gás De Cozinha	2024-05-10T15:54:19.634Z	\N
cc97a641-e6f4-4a9a-aa1e-6138d4de999c	5c9b6767-5310-461b-977b-906fe16370ae	Travesseiros	2024-05-14T17:17:11.957Z	\N
bea62622-d057-4d13-b821-c4f144611495	5c9b6767-5310-461b-977b-906fe16370ae	Cesta Básica	2024-05-14T17:23:37.191Z	\N
9bb109e1-e0b8-4796-be8a-80dc64f83f1a	5c9b6767-5310-461b-977b-906fe16370ae	Vacina Para Raiva	2024-05-14T17:36:14.431Z	\N
cb12e508-7dc4-4a23-8141-246c8396edab	be0e4018-ca46-44cd-b814-7681ba98c51a	Biombos	2024-05-14T17:41:33.416Z	\N
0262de4e-b408-44d3-9f6c-d9a205da311d	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	100 Marmitas	2024-05-14T18:24:32.923Z	\N
b8cbcd9a-70e8-4e98-817c-bcf168bdcdf8	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Amido De Milho	2024-05-14T18:29:05.435Z	\N
f30bfe21-95b2-43b3-bab3-6c1ff82de4cc	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Carne Suína	2024-05-14T18:31:03.684Z	\N
c4e9958c-a153-4824-96c9-2622e87e9745	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Calabreza	2024-05-14T19:04:55.644Z	\N
71f33e8e-791f-4224-a8f0-67bb8557b0c0	5d50d3cf-4e36-4639-813d-d43de8886ac8	Escova Para Lavar Roupa	2024-05-14T19:10:28.999Z	\N
627d5fe7-e05b-4929-9a4f-3c06eaf61fca	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Mochila Escolar E Estojo	2024-05-14T19:12:24.324Z	\N
18b45eb3-755c-4d38-a974-2857f6b30638	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntário - Tarde	2024-05-06T06:40:57.551Z	\N
4bd475d3-779b-45bb-b9f9-7a6052bc41fb	718d5be3-69c3-4216-97f1-12b690d0eb97	Lenços umedecidos	2024-05-06T13:07:37.962Z	\N
924e9906-692e-460a-bfe4-de2a6c33a5f1	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Travesseiro	2024-05-06T13:08:07.375Z	\N
b5e87f98-0f0b-44b3-bf9c-81b84bab76d4	fd1f74c4-6723-4ffe-8657-773a943e65c4	Extensão	2024-05-06T13:08:44.782Z	\N
6b1d5955-578e-4b7c-a66a-118060c94901	718d5be3-69c3-4216-97f1-12b690d0eb97	Álcool em gel	2024-05-06T13:12:57.281Z	\N
d25db3bc-0812-4d28-a03f-ff51419cf15d	03fdb0f2-6b50-4895-b970-5793cad80c86	Tapete higiênico	2024-05-06T13:13:20.027Z	\N
b8f75b02-c99d-4a54-91a2-01e66617b676	03fdb0f2-6b50-4895-b970-5793cad80c86	Brinquedos para cães	2024-05-06T13:13:37.196Z	\N
13a4afa8-2b27-43c2-8ac1-0a2b29ce7832	037ac262-4f35-42e0-83e1-4cdcceedb39c	Papel toalha	2024-05-06T13:13:55.587Z	\N
6763caea-7b53-466a-a9b3-40ebfac0f9bb	5d50d3cf-4e36-4639-813d-d43de8886ac8	Baldes	2024-05-06T13:14:13.712Z	\N
fcc4957f-124a-41ff-b0eb-920627f9112d	5c9b6767-5310-461b-977b-906fe16370ae	Cobertor - Estou Levando	2024-05-10T15:57:44.666Z	\N
7da89e60-0ae8-4bf0-a19d-15e41ad7c467	5c9b6767-5310-461b-977b-906fe16370ae	Prebiótico (beneflora)	2024-05-14T17:34:31.940Z	\N
f68942f9-99e4-4452-979e-83a68815ab4c	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Salsichão	2024-05-14T18:32:17.847Z	\N
9e6662ae-0354-4bf7-a7cc-457bbe6ffe6e	03fdb0f2-6b50-4895-b970-5793cad80c86	Pote para comida	2024-05-06T13:18:31.597Z	2024-05-07T19:05:03.881Z
e82f2b29-1394-4325-a728-f3dd20f1c6bf	718d5be3-69c3-4216-97f1-12b690d0eb97	Mamadeira	2024-05-06T13:17:45.797Z	2024-05-07T18:53:47.204Z
d03c6c8e-efc7-450b-9300-ade4cdcfced9	fd1f74c4-6723-4ffe-8657-773a943e65c4	Luvas Tamanho M Ou P	2024-05-10T16:15:08.749Z	\N
358f41de-a752-424e-8ec1-ae88b68a7334	5d50d3cf-4e36-4639-813d-d43de8886ac8	Cordas De Varal	2024-05-14T19:08:59.351Z	\N
61dddb1e-13b3-4f2f-96e9-faa1efd7a0e6	03fdb0f2-6b50-4895-b970-5793cad80c86	Guias Fortes Para Cães	2024-05-14T19:16:39.207Z	\N
f85299f5-8a6b-460b-bb56-44c893dc79c2	b3a81a9d-a964-4413-9a33-974a3b4673d1	Voluntários Para Instalar Manta Asfáltica	2024-05-14T19:42:15.921Z	\N
234f79d6-5cda-485a-a604-3da165c4989a	c117dd37-82ab-43a6-bf66-d97acef97f6e	Quebra-cabeças Adulto	2024-05-14T19:52:26.284Z	\N
698cc13d-06c1-49ad-b7b1-d233009009c4	c117dd37-82ab-43a6-bf66-d97acef97f6e	Caça Palavras	2024-05-14T19:52:39.992Z	\N
96015ec9-b6d9-4ab2-9bac-b2e8375bb6b5	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Colchão	2024-05-10T16:26:20.914Z	\N
6deba02c-b927-4d0b-bdae-8af35430e787	5d50d3cf-4e36-4639-813d-d43de8886ac8	Lixeira Grande	2024-05-10T16:31:37.208Z	\N
7a841996-d096-4752-b071-263d1166fcbc	fd1f74c4-6723-4ffe-8657-773a943e65c4	Galochas Variadas (masculino E Feminino)	2024-05-10T17:35:20.971Z	\N
118cbd0b-c262-45d4-a8d6-0090cdb0842a	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntários Para Domingo 12/05 (turno Manhã E Turno Tarde)	2024-05-10T16:51:08.755Z	\N
dddc18c7-f4d7-43d6-9007-40599f10cc16	4f95853f-d5e1-487d-8086-6ddfaf2bbab7	Chaleira Elétrica	2024-05-10T16:30:27.160Z	\N
c8644a2b-90a2-4f10-8008-26c9ae5ff5b0	4f95853f-d5e1-487d-8086-6ddfaf2bbab7	Chaleira Eletrica	2024-05-10T17:29:27.646Z	\N
0dad780b-d2e5-43e3-be3c-1528a7a834a8	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Mochila Para Criança	2024-05-14T19:11:34.310Z	\N
8fe7a2a4-557e-4521-b644-38bce26e5d1d	03fdb0f2-6b50-4895-b970-5793cad80c86	Comedouros Para Cães E Gatos	2024-05-14T19:16:04.811Z	\N
02d596a5-c59c-48fc-833f-02a9e567a312	718d5be3-69c3-4216-97f1-12b690d0eb97	Fralda Geriátrica G	2024-05-10T17:11:24.524Z	\N
474cc566-0a60-4f1a-8e48-40558fe39170	03fdb0f2-6b50-4895-b970-5793cad80c86	Leitos para animais	2024-05-06T13:37:34.424Z	2024-05-07T17:09:10.751Z
8efd91e0-8521-43ba-b45d-790d08c854e0	fd1f74c4-6723-4ffe-8657-773a943e65c4	Botas De Chuva	2024-05-10T17:28:52.071Z	\N
d1341b2e-7a67-4b11-87d8-e62f53cbf83e	4f95853f-d5e1-487d-8086-6ddfaf2bbab7	Bombonas De Água	2024-05-10T17:19:16.619Z	\N
d30b4170-8f35-475d-a143-6e01a60b2f29	718d5be3-69c3-4216-97f1-12b690d0eb97	Creme Hidratante	2024-05-14T19:48:02.417Z	\N
7ff537b9-37a7-4f7f-a4d1-cbb083881e8a	03fdb0f2-6b50-4895-b970-5793cad80c86	Tapete Sanitizante	2024-05-14T20:24:54.362Z	\N
4ea770b3-a691-4abe-8d7f-354f3f592fa1	fd1f74c4-6723-4ffe-8657-773a943e65c4	Sacos De Areia Para Conter Entrada De Agua	2024-05-14T20:25:31.423Z	\N
7cdd14da-e6e7-43b9-a66d-560346221e38	5c9b6767-5310-461b-977b-906fe16370ae	Solução Otológica (para Limpar Ouvido)	2024-05-14T20:25:36.778Z	\N
7982a520-ecc8-4cf9-a8be-2bd40550bd31	718d5be3-69c3-4216-97f1-12b690d0eb97	Pente/Escova de cabelo	2024-05-07T03:58:23.847Z	2024-05-07T14:23:28.103Z
899285d0-a01e-4307-9fc0-78c1268ee129	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas De Inverno Para Crianças, Especialmente Meninos	2024-05-10T16:44:03.572Z	\N
46b4ece1-549d-489c-bddd-74e8c61cca3f	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Telha De Fibrocimento 5mm	2024-05-14T20:02:37.149Z	\N
e6bc7980-98a4-468f-99d9-17b00e991e5b	03fdb0f2-6b50-4895-b970-5793cad80c86	Soro Fisiológico	2024-05-14T20:24:12.502Z	\N
c38cb955-8acf-462f-baec-1fa555f92df9	05583098-5f2e-44e2-b874-452ec86d9d3e	Barcos	2024-05-06T13:39:34.827Z	\N
12c780fb-9a09-4c15-bc5f-d93d5ea1177b	718d5be3-69c3-4216-97f1-12b690d0eb97	Banheiro Químico	2024-05-10T17:29:20.263Z	\N
44db9d4b-9b17-42ad-96f5-c078cf1b008c	03fdb0f2-6b50-4895-b970-5793cad80c86	Nuxcelll Fel 10 Unid	2024-05-14T20:26:35.314Z	\N
9ec3507a-8600-43e2-9471-39f3fc1c01f9	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	7 Kg De Guisado	2024-05-14T20:57:16.954Z	\N
0ac4446e-f606-452c-9a58-5f76ce84c008	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	•7 Kg De Pernil De Porco	2024-05-14T20:57:55.233Z	\N
40e27c43-ea54-4bc0-a0b6-3fefc08fec26	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça Masculina	2024-05-10T19:01:00.791Z	\N
cd70dd89-2f3d-4a2f-afac-ad65d7129029	5c9b6767-5310-461b-977b-906fe16370ae	Itraconazol	2024-05-14T21:37:17.729Z	\N
ef206d20-b798-4215-bebb-e53afd8f4a69	718d5be3-69c3-4216-97f1-12b690d0eb97	Kit Higiene Pessoal	2024-05-10T19:30:52.922Z	\N
24f8abd9-07e3-461d-baef-6a356d960f55	5d50d3cf-4e36-4639-813d-d43de8886ac8	Kit Limpeza	2024-05-10T19:31:41.736Z	\N
55020e2d-1413-46ab-9b94-b31d48f87bd4	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Feminina	2024-05-10T19:33:34.905Z	\N
87569fc9-dfaf-477d-b4c7-e34a80b7bfd4	5c9b6767-5310-461b-977b-906fe16370ae	Micropore	2024-05-10T19:49:56.379Z	\N
95776a6b-3df2-413b-91ab-bb5595deed09	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Mistura Salgada Para Pães	2024-05-14T22:07:07.213Z	\N
8c8e0634-dbfb-4055-9dfe-5a3b9615daa0	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Coberta	2024-05-14T22:12:26.677Z	\N
007f0871-0767-4fbb-87d4-c4a36618a63e	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina	2024-05-10T19:33:48.025Z	\N
a01832c8-765b-4e22-b421-b15a6d533a01	03fdb0f2-6b50-4895-b970-5793cad80c86	Ração Cão Raças Pequenas	2024-05-14T22:24:17.655Z	\N
7137cf53-9bea-4a5f-a70b-c2ae81202d90	fd1f74c4-6723-4ffe-8657-773a943e65c4	Notebook (Novo/Usado)	2024-05-07T15:30:49.948Z	\N
bf7f0124-f552-4ab4-8db2-0db1fb4728d8	fd1f74c4-6723-4ffe-8657-773a943e65c4	Lanternas	2024-05-07T15:31:41.173Z	\N
01b0f1a3-354a-4f7a-a724-c022801d0734	03fdb0f2-6b50-4895-b970-5793cad80c86	Tapete higiênico	2024-05-07T07:32:25.144Z	2024-05-07T14:13:12.312Z
6f0169e7-5ca9-4bbc-83f8-78cea1443551	5d50d3cf-4e36-4639-813d-d43de8886ac8	Álcool Líquido	2024-05-10T19:53:22.520Z	\N
e1075af4-70c1-4124-b93b-20149f24e57b	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Lençol De Solteiro	2024-05-10T20:18:15.194Z	\N
e3a566f8-4b17-41a1-9753-7dc84fa1c53a	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça De Moletom - Feminina	2024-05-10T21:05:54.286Z	\N
16c00c8f-5d4f-49bf-8142-4c0b53e7309d	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Bicos	2024-05-14T22:30:04.365Z	\N
b7e47f23-8750-42b6-820c-2497ecb85c55	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Pincel Atômico	2024-05-14T22:42:24.951Z	\N
4e578b85-f185-4a4d-aed5-5d43f0c05afb	03fdb0f2-6b50-4895-b970-5793cad80c86	Guias De Gatos E Cachorros	2024-05-14T23:10:22.054Z	\N
ffcb9277-8ecb-44b6-9e5f-ac2a6811e65d	5c9b6767-5310-461b-977b-906fe16370ae	Termometros	2024-05-14T23:34:22.645Z	\N
8f528aeb-d345-42a8-b01f-48156c9d589f	5d50d3cf-4e36-4639-813d-d43de8886ac8	Luvas para limpeza	2024-05-07T03:57:55.605Z	2024-05-07T17:30:34.281Z
65bc4ea4-a0db-4ac4-b343-b9d587be224b	5d50d3cf-4e36-4639-813d-d43de8886ac8	Pano de chão	2024-05-07T00:59:52.551Z	2024-05-07T12:15:06.926Z
14ce7f98-2cb3-46ce-bc13-d0f420c5921c	03fdb0f2-6b50-4895-b970-5793cad80c86	Ração úmida	2024-05-07T07:33:00.942Z	2024-05-07T14:12:59.394Z
c2d8b7f0-b0cc-4d81-b935-77c12baa9b0e	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Farinha de polenta	2024-05-07T04:00:39.815Z	2024-05-07T14:22:50.791Z
f20e10e5-5a6e-4fb2-9ef3-23e691b8d2db	5c9b6767-5310-461b-977b-906fe16370ae	Insulina	2024-05-07T14:27:19.999Z	2024-05-07T17:30:59.674Z
c8d5bcc7-cbe3-4767-8724-2d9065d1824d	fd1f74c4-6723-4ffe-8657-773a943e65c4	Coletes	2024-05-07T15:32:31.821Z	\N
e30c8efd-29f1-4414-9f5e-080b7e1f6fa3	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Veterinários	2024-05-07T14:24:08.809Z	2024-05-07T21:23:58.316Z
eb1d5056-8b9b-455d-a179-172a747e3f20	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Oléo	2024-05-07T04:01:20.516Z	2024-05-07T14:22:57.654Z
38554698-fae0-469c-b8c5-e07cbadf4f30	037ac262-4f35-42e0-83e1-4cdcceedb39c	Luvas	2024-05-07T14:30:15.257Z	2024-05-07T17:31:40.328Z
7c445fba-0410-4e80-83b6-abd88b245c15	5c9b6767-5310-461b-977b-906fe16370ae	Pomada De Nebacetin	2024-05-10T19:55:34.242Z	\N
15c5deb2-4734-430f-8d16-1dacd80e0295	03fdb0f2-6b50-4895-b970-5793cad80c86	Sacola Plástica De Mercado	2024-05-14T22:47:42.670Z	\N
73d62b87-49ae-48d7-9001-868839648b25	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Vinagre	2024-05-07T14:29:14.893Z	2024-05-07T17:30:54.226Z
1606cc85-7ef0-4864-8cf1-15e9722a8115	03fdb0f2-6b50-4895-b970-5793cad80c86	Caixas de papelão 	2024-05-07T14:24:23.432Z	2024-05-07T16:45:16.155Z
6f880b12-b5b7-4317-80a6-65940c3b8304	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Lenha	2024-05-10T20:17:46.824Z	\N
d246ce3d-165b-462b-a2f5-e6234b505067	5c9b6767-5310-461b-977b-906fe16370ae	Remédio de controle especial	2024-05-07T11:54:20.805Z	2024-05-07T22:50:49.154Z
074e66ce-a845-4244-886e-8db3f76f5742	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça De Moletom - Feminina	2024-05-10T21:04:48.657Z	\N
1de20395-c5ed-4f98-9090-166ffe118c11	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntário P/ Cuidar Dos Animais	2024-05-10T21:32:09.580Z	\N
a1e9e0d1-cf48-4f52-8f41-cc24e44a9cce	5c9b6767-5310-461b-977b-906fe16370ae	Sal	2024-05-10T21:51:56.828Z	\N
9f24ba1c-03a0-43c4-8745-9029555af354	5c9b6767-5310-461b-977b-906fe16370ae	Vinagre	2024-05-10T21:52:32.037Z	\N
52808a2f-f878-4f2d-8c8d-17c2861358e8	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Verdura	2024-05-10T22:17:37.334Z	\N
3ce35ddd-0dac-41f9-88a9-27a509c5df0b	be0e4018-ca46-44cd-b814-7681ba98c51a	Colchão Solteiro	2024-05-10T20:59:53.507Z	\N
eb2b3f21-b0e6-45fd-914a-7d6c82b1747b	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Açúcar	2024-05-14T23:32:39.452Z	\N
8a5acec2-0892-4d50-95f1-9518a094ede0	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Açucar	2024-05-14T23:33:08.390Z	\N
55bf190c-f2eb-4f80-89f0-76dec0843ad4	718d5be3-69c3-4216-97f1-12b690d0eb97	Absorventes higiênicos	2024-05-06T13:46:54.975Z	\N
24a56430-28ea-465e-8287-af19639b18ce	5c9b6767-5310-461b-977b-906fe16370ae	Sucos	2024-05-07T12:25:56.943Z	2024-05-08T00:07:36.586Z
001e3bdc-a463-4cea-a4f1-6bb36cd67d5f	03fdb0f2-6b50-4895-b970-5793cad80c86	Jornal	2024-05-07T15:13:38.029Z	\N
e162ec59-91e5-4621-8a2a-05848cd0f368	718d5be3-69c3-4216-97f1-12b690d0eb97	Toalha de Banho	2024-05-07T14:28:15.278Z	2024-05-08T14:44:37.136Z
dcd3f6fb-7b64-4fad-8da4-d57f83e30d5c	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Casaco G E Gg Masculino	2024-05-10T21:02:09.315Z	\N
578824f0-d728-4f59-8a73-763fd55cd08e	5c9b6767-5310-461b-977b-906fe16370ae	Toddy	2024-05-14T23:54:33.819Z	\N
287b133c-72d1-4a8e-9cc9-0e8077149204	5c9b6767-5310-461b-977b-906fe16370ae	Açucar	2024-05-14T23:56:15.218Z	\N
bf17bf73-7164-4331-b4ce-b3db7c44fadb	5c9b6767-5310-461b-977b-906fe16370ae	Leite Materno	2024-05-14T23:57:05.148Z	\N
f1b74773-b106-4ac4-81e3-57de81858b7e	5c9b6767-5310-461b-977b-906fe16370ae	Baldes/	2024-05-14T23:58:16.753Z	\N
e8c4291e-0cbf-44f5-8a68-408f87f203c8	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Waffer	2024-05-15T00:46:45.919Z	\N
651af48c-91c0-42c1-8bed-c61264c53eb0	03fdb0f2-6b50-4895-b970-5793cad80c86	Luvas Para Pegar Gatos	2024-05-15T00:48:02.307Z	\N
81e1553d-ffd4-4ab3-9c0b-87062aeda6a9	5d50d3cf-4e36-4639-813d-d43de8886ac8	Sabão em pó 	2024-05-06T21:09:51.663Z	2024-05-07T13:15:52.340Z
158fb67d-00f8-4752-be65-4108101bdd7f	5c9b6767-5310-461b-977b-906fe16370ae	Enlatados (ervilha e milho)	2024-05-07T12:27:25.425Z	2024-05-07T14:23:53.668Z
4e619f2b-0e02-4842-8b1d-410ff44038cd	718d5be3-69c3-4216-97f1-12b690d0eb97	Cortador de unhas	2024-05-07T15:13:03.999Z	\N
a08d8756-9721-40b8-8146-07bec3bbed9b	5c9b6767-5310-461b-977b-906fe16370ae	Peiteira/Coleira Grande	2024-05-07T06:59:57.279Z	2024-05-07T13:11:05.290Z
5a1ad7fc-c94e-4d69-9151-ee106ba29e1d	5c9b6767-5310-461b-977b-906fe16370ae	Dipirona Injetável 	2024-05-07T06:59:28.401Z	2024-05-07T13:11:19.021Z
84f83b15-aa13-4b74-8c81-b769f429a6db	718d5be3-69c3-4216-97f1-12b690d0eb97	Pasta de dente	2024-05-07T12:29:23.801Z	2024-05-07T14:26:19.590Z
e95f427a-d290-44f2-a54b-81a6e3847252	03fdb0f2-6b50-4895-b970-5793cad80c86	Casinha para cachorro 	2024-05-07T13:50:27.956Z	\N
9717b995-f922-4e7e-970b-c0275d597c01	5c9b6767-5310-461b-977b-906fe16370ae	Arroz	2024-05-10T21:45:52.232Z	\N
7d861778-7335-4765-90b7-e57ef5a9799f	5c9b6767-5310-461b-977b-906fe16370ae	Açúcar	2024-05-10T21:52:15.197Z	\N
0bd6022d-21b2-47d1-8a71-1f679b62541c	5c9b6767-5310-461b-977b-906fe16370ae	Massa	2024-05-10T21:52:41.827Z	\N
c7912559-1554-4014-a088-2bbf51ca6da3	5c9b6767-5310-461b-977b-906fe16370ae	Massa	2024-05-10T21:52:57.434Z	\N
81b2e05e-41cf-4bb0-96c2-a622640e6f85	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Frutas	2024-05-10T22:17:51.571Z	\N
35205809-7647-40b4-bdd6-11b7d1b6bf51	5c9b6767-5310-461b-977b-906fe16370ae	Supositório Adulto	2024-05-10T22:21:40.168Z	\N
bea72070-859a-4327-8bd8-dba0a8ada786	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Arroz	2024-05-10T22:28:04.901Z	\N
1d3bbf0a-b9d6-4766-884c-5dbcf5f941e2	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Açúcar	2024-05-10T22:29:01.441Z	\N
bff6f569-ddb2-455f-a4e9-202182a4c940	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Energéticos	2024-05-15T00:57:52.325Z	\N
945268c6-faf9-4b7b-a8b1-b016bd2dd0dd	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa De Neoprene	2024-05-15T00:59:15.182Z	\N
a28f63c9-cd42-40fc-ac77-ca5c73d26439	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Touca Térmica	2024-05-15T00:59:28.206Z	\N
88336b36-ddc0-40dc-9615-0ad868418e8f	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Botas 36 Ao 44	2024-05-15T00:59:54.286Z	\N
84cad0e5-c559-471b-8fc3-de467afc4685	718d5be3-69c3-4216-97f1-12b690d0eb97	Shampoo	2024-05-07T13:38:28.737Z	2024-05-08T11:33:20.259Z
c905ca5a-0564-4d2a-b9b9-585cbce1cc62	718d5be3-69c3-4216-97f1-12b690d0eb97	Gilete	2024-05-07T13:38:56.167Z	2024-05-08T11:33:37.402Z
e3f884bd-3dc5-480f-8bfe-c0be33d26f43	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Arroz	2024-05-10T21:46:36.001Z	\N
6942f871-6e35-4eeb-a3ff-8edc8959aa22	5c9b6767-5310-461b-977b-906fe16370ae	Feijão	2024-05-10T21:51:20.135Z	\N
c096c90d-0710-4804-801c-e5a2b8d14e6f	5c9b6767-5310-461b-977b-906fe16370ae	Óleo De Cozinha	2024-05-10T21:51:39.520Z	\N
e85a86ec-1e72-4318-ab4b-3c4faadbec45	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Massa	2024-05-10T22:28:18.286Z	\N
e22bf0ca-5fef-46f2-bc54-a3b627d41080	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Óleo De Cozinha	2024-05-10T22:28:43.386Z	\N
2b15a0d1-c356-4b44-ae7b-eee12605e171	5d50d3cf-4e36-4639-813d-d43de8886ac8	Carro De Limpeza	2024-05-10T22:44:58.320Z	\N
b4560b93-cb36-4deb-a37b-e8207fedf8dd	c117dd37-82ab-43a6-bf66-d97acef97f6e	Bola	2024-05-10T21:55:34.338Z	\N
cdc6895e-3653-4d75-b48d-e55d8062343a	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas De Inverno	2024-05-15T00:58:33.430Z	\N
0fc4d439-3e5d-460d-aefb-c54583690db3	03fdb0f2-6b50-4895-b970-5793cad80c86	Papelão	2024-05-06T14:02:17.547Z	\N
90c6ddc2-a574-47eb-a2d3-3c79b801e4fb	03fdb0f2-6b50-4895-b970-5793cad80c86	Lonas	2024-05-06T14:02:30.223Z	\N
04156fe1-e392-4283-a919-1e25908dbec1	718d5be3-69c3-4216-97f1-12b690d0eb97	Creme para assaduras	2024-05-06T13:51:04.758Z	2024-05-08T11:33:51.168Z
367ed746-6c87-41d9-a29e-bf3540360ccf	718d5be3-69c3-4216-97f1-12b690d0eb97	Shampoo	2024-05-06T18:13:25.687Z	\N
39bc837b-b026-4a73-b987-efbba14a889f	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Travesseiro	2024-05-06T17:47:34.865Z	\N
9ef89eb7-35f7-43bb-86ac-4d5df6516fbe	5c9b6767-5310-461b-977b-906fe16370ae	Shampoo	2024-05-10T22:24:56.877Z	\N
6d503bcc-8fd1-4547-bd52-08f521913a16	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça Moleton	2024-05-10T22:26:53.770Z	\N
4ce2c392-ee74-49d4-a339-4903ebeb6a1f	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Pratos Descartáveis	2024-05-15T01:25:37.334Z	\N
68c9670c-99fb-438a-8169-66cc1ce66313	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntário - Noite	2024-05-06T03:04:46.078Z	2024-05-07T02:33:38.167Z
0b478819-4e8c-4b0a-b96a-dc9e267b7dd9	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Meias	2024-05-06T18:14:20.158Z	\N
580c2fac-3c42-48d2-b79b-2fbc7b6fc7b0	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Chinelos	2024-05-06T18:14:29.874Z	\N
7e27194f-1be3-419b-a219-6427362e732d	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Chuveiro 220	2024-05-10T23:14:24.011Z	\N
d034ab5c-92ef-4847-9014-b5114b17cc66	5c9b6767-5310-461b-977b-906fe16370ae	Fraldas	2024-05-10T23:30:56.968Z	\N
a09441c5-46c4-426b-8da7-e356c731475b	5c9b6767-5310-461b-977b-906fe16370ae	Termômetro	2024-05-07T12:52:29.431Z	2024-05-07T19:00:05.501Z
6b3962b3-33dd-422e-bdda-35dbe0afa554	718d5be3-69c3-4216-97f1-12b690d0eb97	Fraldas Adultas	2024-05-06T18:12:40.033Z	\N
683a84ad-681b-4971-a3ba-59694387304b	5c9b6767-5310-461b-977b-906fe16370ae	Luvas	2024-05-07T12:52:51.471Z	\N
b9b2ba22-62c1-429f-839c-65990c47a3e7	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Fórmula Infantil (aptamil, Nan, Etc)	2024-05-10T23:59:39.576Z	\N
c7493f68-4e46-453d-9bf0-36fff3189bf7	718d5be3-69c3-4216-97f1-12b690d0eb97	Escova De Dentes	2024-05-11T01:00:22.886Z	\N
7dafb07f-4bf3-46ce-8c1a-5750397b51c0	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntários Noite	2024-05-11T01:00:59.239Z	\N
d01c1d11-e401-4151-b0ec-52c26ce54b32	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Água potável	2024-05-06T18:30:38.341Z	2024-05-08T05:53:38.452Z
6347a939-ad2c-458e-a097-17fdb7ef34b1	718d5be3-69c3-4216-97f1-12b690d0eb97	Toalha de Banho	2024-05-07T10:10:11.988Z	2024-05-08T00:31:52.381Z
d8c5a353-d026-4fd4-b1f3-2bcf2f75b921	be0e4018-ca46-44cd-b814-7681ba98c51a	Caixas Organizadoras	2024-05-11T04:01:23.539Z	\N
4c523d27-7d78-4338-9fef-43a2bc8bdb82	718d5be3-69c3-4216-97f1-12b690d0eb97	Papel	2024-05-11T04:43:25.312Z	\N
53e92ec3-dfcb-4ac2-adf4-0fd1fa963756	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Leite	2024-05-11T04:54:49.334Z	\N
10452b3d-de90-4562-b57d-a94f9212d22f	03fdb0f2-6b50-4895-b970-5793cad80c86	Tonel Grande Com Tampa	2024-05-11T11:11:30.431Z	\N
9be8995e-d9db-41e5-9aa8-2ef4d0411fd2	5c9b6767-5310-461b-977b-906fe16370ae	Teste	2024-05-11T11:11:45.406Z	\N
77282a94-c627-46ab-a22d-3d19cc00d3c7	5c9b6767-5310-461b-977b-906fe16370ae	Máscara	2024-05-07T12:53:06.219Z	\N
46bd3422-75e0-4d67-b492-97f0e14dd403	5c9b6767-5310-461b-977b-906fe16370ae	Termômetro	2024-05-06T18:36:44.265Z	2024-05-07T00:57:42.676Z
66a98038-4588-431c-814d-0c440c4683af	718d5be3-69c3-4216-97f1-12b690d0eb97	Pasta De Dente	2024-05-11T11:48:35.034Z	\N
2ca22b44-7d15-4524-9999-290a2925af6f	b3a81a9d-a964-4413-9a33-974a3b4673d1	Médicos	2024-05-06T18:35:41.360Z	\N
abe67b83-3fdc-4e39-82ec-a15c49630b4d	5c9b6767-5310-461b-977b-906fe16370ae	Medidores de pressão arterial 	2024-05-06T18:37:19.661Z	2024-05-07T00:57:36.638Z
2ac83258-0e18-4373-9edc-d78286bc955c	5d50d3cf-4e36-4639-813d-d43de8886ac8	Saco De Lixo Grande	2024-05-11T13:21:26.026Z	\N
26b02d43-3025-4538-8484-afb26c44a010	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Bolsas Grandes E Mochilas	2024-05-11T13:27:20.513Z	\N
1cbeb09b-1870-4cbb-ac44-c3d850745958	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Íntima Plus Size Feminima (a Partir Do G3)	2024-05-11T13:33:05.326Z	\N
8ffbd7b9-7097-44b3-9a88-5dad7e78f3bc	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Farinha De Milho	2024-05-11T13:22:18.155Z	\N
a0129157-a9e1-471f-b72a-47995daa79ab	718d5be3-69c3-4216-97f1-12b690d0eb97	Manteiga De Cacau	2024-05-11T13:28:28.177Z	\N
b59e4cc1-39fb-4cd4-b426-4b6d38067fe7	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Blusão Adulto	2024-05-11T13:30:56.079Z	\N
04293a65-283f-4b8d-b7ab-aec478bba1b4	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Plus Size Feminina (a Partir Do G3)	2024-05-11T13:31:52.297Z	\N
6ecf6803-0257-45eb-975d-ce7f8ea98f1e	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Cueca Infantil Tamanho 3	2024-05-11T13:40:33.205Z	\N
6d7f15cc-54da-493c-ab77-2d4ebe2dfdeb	718d5be3-69c3-4216-97f1-12b690d0eb97	Toalha De Rosto	2024-05-11T13:55:42.225Z	\N
9815d990-5db6-4875-9dfa-1197812a9bfa	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Tênis (masc/fem/inf)	2024-05-11T14:18:07.602Z	\N
3edb0a60-0bbf-4332-9fd1-8de317091fca	03fdb0f2-6b50-4895-b970-5793cad80c86	Ração Cachorro	2024-05-11T14:37:22.769Z	\N
18d94578-316e-4036-985f-956e5667b81f	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Fórmula Infantil - Nestogeno 1 A 3 Anos	2024-05-11T14:40:01.669Z	\N
3bb8fb06-b376-4489-80fe-59826066e849	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Massa	2024-05-11T14:49:08.380Z	\N
2b97d1b4-544b-4a93-bf2b-665412432bc6	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça Infantil Masc 1-5 Anos	2024-05-11T13:45:39.755Z	\N
17319b12-0d9f-4d54-b516-3a1d2c0ff396	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa De Inverno Infantil	2024-05-11T14:37:57.360Z	\N
81476608-e806-4a25-ad0f-c976bb29dd31	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Alimentos	2024-05-11T14:38:27.009Z	\N
2c493101-799b-406c-9943-3cc8a75370f0	718d5be3-69c3-4216-97f1-12b690d0eb97	Pasta De Dente Infantil	2024-05-11T14:39:00.594Z	\N
5e4b4b53-a13b-483c-a783-5576e0225d82	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Coberta	2024-05-11T14:54:44.453Z	\N
74a97d09-1b3c-4d33-9d1f-5272532daf53	5c9b6767-5310-461b-977b-906fe16370ae	Espaçador Infantil Para Bombinha	2024-05-11T15:04:27.665Z	\N
5d7dee46-9a08-4faf-adf8-5b341231f09a	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntário - Noite	2024-05-07T01:04:16.726Z	\N
7c193fb6-e93e-4542-a8b8-f32710ff3c7e	5c9b6767-5310-461b-977b-906fe16370ae	Espaçador Baby	2024-05-11T15:06:07.579Z	\N
ed80871e-ea7b-4734-a64f-156d6290fcf1	5c9b6767-5310-461b-977b-906fe16370ae	Fluoxetina 20mg	2024-05-11T15:06:32.935Z	\N
57e3cb62-1c89-4543-bb4f-5dcfcf8f4936	5c9b6767-5310-461b-977b-906fe16370ae	Nistatina Solução Oral	2024-05-11T15:08:37.647Z	\N
46c21b60-cd85-426c-ab78-b2dfbbab9e4e	4f95853f-d5e1-487d-8086-6ddfaf2bbab7	Microondas	2024-05-11T15:23:35.900Z	\N
de84c8b2-5ac1-468e-821e-983d7529228b	5c9b6767-5310-461b-977b-906fe16370ae	Cefalexina 500mg	2024-05-11T15:09:29.915Z	\N
83c7d111-7d55-4bf4-b61d-8fa5fbcfb012	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Iogurte	2024-05-11T15:20:17.827Z	\N
aa9552af-cddc-4b51-8a55-175767b04c59	5c9b6767-5310-461b-977b-906fe16370ae	Luvas Descart	2024-05-11T15:10:03.448Z	\N
4ae6c9da-c2d7-4381-a309-a938b0258122	5c9b6767-5310-461b-977b-906fe16370ae	Luvas Descartáveis	2024-05-11T15:10:19.110Z	\N
df887393-215b-4be9-acc7-e2eb66565ae5	5c9b6767-5310-461b-977b-906fe16370ae	Pomada Nistatina	2024-05-11T15:21:58.737Z	\N
b903d733-7b7e-413b-96b5-b9772d84c3df	5c9b6767-5310-461b-977b-906fe16370ae	Banheira	2024-05-11T16:00:22.850Z	\N
d276802d-0992-4f87-b5fa-04e5ee6a10c1	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Frutas	2024-05-11T16:00:46.505Z	\N
34c71dfe-0f7d-4b8f-8625-fa88449ac76d	4f95853f-d5e1-487d-8086-6ddfaf2bbab7	Ferro De Passar	2024-05-11T15:23:18.689Z	\N
57b1bc7b-1bb1-4f92-85b5-8a5cd313c64c	4f95853f-d5e1-487d-8086-6ddfaf2bbab7	Forno Elétrico	2024-05-11T15:23:54.643Z	\N
799e9f43-b5e8-4484-be33-09c442390253	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Alimentos Não Perecíveis	2024-05-11T15:38:33.662Z	\N
59904744-08b6-4c32-b82d-b21f8c96bdaf	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calçado Maculino 44	2024-05-11T15:42:32.799Z	\N
faa1f789-94e9-4d9a-89cc-fcf29e20a51d	037ac262-4f35-42e0-83e1-4cdcceedb39c	Copo Isopor	2024-05-11T16:01:26.041Z	\N
bc5b8611-704c-4ea1-b321-995f1b181de3	718d5be3-69c3-4216-97f1-12b690d0eb97	Protetor Diário	2024-05-11T16:01:49.782Z	\N
5dce43b9-05a8-43d6-a679-80ac421846d8	5c9b6767-5310-461b-977b-906fe16370ae	Bico	2024-05-11T16:00:08.422Z	\N
2218d1d3-1131-4597-b242-adc85848d351	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina De Frio M-g	2024-05-11T16:42:58.008Z	\N
463b2006-ff25-4d63-8b79-17666b4b4d02	5c9b6767-5310-461b-977b-906fe16370ae	Leite	2024-05-11T16:43:08.131Z	\N
cd66b753-ee1e-414f-8975-0881b9d636b2	4f95853f-d5e1-487d-8086-6ddfaf2bbab7	Extensão Elétrica	2024-05-11T17:04:48.027Z	\N
7edd1812-c62d-4742-919a-c9240b41a160	05583098-5f2e-44e2-b874-452ec86d9d3e	Helicópteros	2024-05-07T01:04:20.663Z	\N
7f9d1ef1-8ebe-4c57-a931-a3e45caa5794	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calçado Infantil Masculino 33/34	2024-05-11T16:44:21.718Z	\N
27411da6-fbb8-41a1-aaf2-54588452c9b4	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calcinha Infantil	2024-05-11T17:07:52.972Z	\N
04d628e5-8b14-42af-bbcd-800af7328d7b	4f95853f-d5e1-487d-8086-6ddfaf2bbab7	Aquecedor Elétrico	2024-05-11T17:01:49.225Z	\N
63b4f328-50d6-45a8-9780-2e795efffaa6	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Agasalhos	2024-05-11T17:47:57.935Z	\N
b43c65c7-d321-4b29-9536-7e40bfd01300	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Intimas Plus Size	2024-05-11T17:11:36.945Z	\N
1a91ad10-10e2-4d05-8727-69f724f076f2	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Água Não Potável	2024-05-11T17:50:54.827Z	\N
ef90a8b3-a3f1-42b9-bcca-81c496e641fc	5c9b6767-5310-461b-977b-906fe16370ae	Roupa De Inverno Infantil	2024-05-11T18:20:52.577Z	\N
0fa75023-eb3b-47a6-b535-d14dfb8c139f	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Palets	2024-05-11T17:56:07.933Z	\N
0b36b132-05b8-421d-b1b1-955c4b96f520	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Carne Moída	2024-05-11T18:25:52.330Z	\N
db7e7a3f-51c5-4186-9656-7869389c7716	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Touca	2024-05-11T18:45:22.207Z	\N
61c906b1-396f-4221-8637-7096bc08a004	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina	2024-05-11T18:46:22.768Z	\N
88b8e542-7cbe-4175-a37e-30bf2c58c6ce	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calcinha G E Gg	2024-05-11T18:46:58.260Z	\N
31744df9-e04a-443f-a78f-3b9be14e7adf	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Tênis Adulto	2024-05-11T18:50:23.111Z	\N
1cb5b5ed-304f-4fcf-950a-b08827115a46	03fdb0f2-6b50-4895-b970-5793cad80c86	Anti Toxico Para Cães	2024-05-11T19:20:15.169Z	\N
fa855264-b42a-4559-b976-1a55f6ee9d9b	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Lonas	2024-05-11T18:25:20.494Z	\N
950a9045-f3c3-42d7-bf59-d42c5ef42d29	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntários	2024-05-11T18:30:36.144Z	\N
84d5b5f4-3c06-4b70-946e-dd258278c7b2	5c9b6767-5310-461b-977b-906fe16370ae	Medicamentos Comuns	2024-05-11T18:36:45.143Z	\N
6fae2ee9-649c-44e0-b07d-be18bc295d5a	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Tênis Infantil	2024-05-11T18:50:09.382Z	\N
133878fc-7cf2-49a2-b6a9-1407c6e64602	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça Moletom M	2024-05-11T18:50:54.645Z	\N
b9c9bef3-a1b6-4d94-98cf-e331e23bca4b	5c9b6767-5310-461b-977b-906fe16370ae	Lonas Para Proteção Da Chuva	2024-05-11T18:56:21.977Z	\N
b02cec28-dac2-42ec-a552-0558f598fa51	5c9b6767-5310-461b-977b-906fe16370ae	Remédios básicos	2024-05-07T01:04:29.815Z	\N
66616847-1e8e-4ea3-bb70-a02aa8b7a33c	5c9b6767-5310-461b-977b-906fe16370ae	Tênis 36-39	2024-05-11T19:05:38.642Z	\N
64d32a92-257f-4051-8628-9a79d8f6f9cc	5c9b6767-5310-461b-977b-906fe16370ae	Calça Com Elástico F E M	2024-05-11T19:16:11.933Z	\N
118fd9a6-3082-41a6-9f88-1fe24bf59b00	5c9b6767-5310-461b-977b-906fe16370ae	Dersani	2024-05-11T19:16:45.424Z	\N
d3b07a6a-3b36-4bf3-a4dd-2bfeaace33bc	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas De Calor	2024-05-11T18:39:46.152Z	\N
ada0b299-35c4-46cd-96fd-9d71b4cc0720	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Cueca G E Gg	2024-05-11T18:46:31.361Z	\N
52b5339a-b922-4d1a-9e58-b4a614cf5369	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça Moletom G	2024-05-11T18:51:07.596Z	\N
3a7b0aad-01bf-4f9d-b420-78b0f1e625a5	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Calça Moletom Gg	2024-05-11T18:51:27.186Z	\N
76c0cb36-9ee0-422f-8050-b422ff53b9d3	b3a81a9d-a964-4413-9a33-974a3b4673d1	Psicólogos	2024-05-07T01:04:26.394Z	\N
4ff95cea-fbd8-4b79-8fde-04173c44b400	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça Moletom Gg	2024-05-11T18:51:57.712Z	\N
ab840b70-dabb-4815-a8d9-5122baf2d7e8	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Quentes Para Crianças (1-16 Anos)	2024-05-11T19:05:15.729Z	\N
8b52634a-b86a-404c-b75e-947944b30430	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Para Pets - Todos Os Tamanhos	2024-05-11T19:08:42.294Z	\N
63245717-adcb-473a-bfb0-1530e637bb7d	037ac262-4f35-42e0-83e1-4cdcceedb39c	Marmitas De Isopor	2024-05-11T19:13:14.573Z	\N
45d237c3-1423-40ba-ae56-665d7fb95f6c	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Moletom Feminino Emasculino	2024-05-11T19:22:39.242Z	\N
a4f73ff7-1c89-42b8-84d2-8983e7b7fd6d	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Café Solúvel	2024-05-11T19:17:31.984Z	\N
40c59877-4ebe-4c3f-bd87-ea8236ea6cff	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntários Médicos	2024-05-11T19:33:24.060Z	\N
6e71e6ec-9335-4db3-a0bd-4cfc3bed41f9	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntários Veterinários	2024-05-11T19:36:38.237Z	\N
e48e48a7-5052-48ab-b175-fb29a7c864db	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntários Psicólogos	2024-05-11T19:36:53.847Z	\N
4682d405-9a3e-435d-bb33-e249f72935a5	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Maçã	2024-05-11T19:40:28.249Z	\N
4dc99795-1b87-49b9-b0af-4a65c8ea7422	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntário Dentista (fratura)	2024-05-11T19:53:01.890Z	\N
8a241182-20e5-4340-be5e-53cce9a4667d	718d5be3-69c3-4216-97f1-12b690d0eb97	Pinça	2024-05-11T19:54:00.620Z	\N
9cf774c5-4ca4-45ba-9cc2-6989d84f9569	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Agasalho Infatil Feminino	2024-05-11T19:55:59.368Z	\N
52224d1e-f797-48b2-8dfa-3e550e4cf4ce	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Agasalho Infatil Masculino	2024-05-11T19:56:17.639Z	\N
053d6422-e791-474c-9820-90252e04da58	03fdb0f2-6b50-4895-b970-5793cad80c86	Cobertores	2024-05-11T19:58:44.901Z	\N
1d02a2b6-3aed-4dd4-acd1-27acb87856f3	718d5be3-69c3-4216-97f1-12b690d0eb97	Fralda Geriátrica	2024-05-11T20:00:27.618Z	\N
27f24e80-5a77-4a37-82d2-91005886f79e	5c9b6767-5310-461b-977b-906fe16370ae	Colchão Piramidal	2024-05-11T20:00:57.413Z	\N
5397e56a-a55f-459d-b24b-64c117581feb	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Inseticida	2024-05-11T20:01:31.670Z	\N
8e9067fe-0ca2-4e3f-95c6-d9177b6f3b51	03fdb0f2-6b50-4895-b970-5793cad80c86	Ração 	2024-05-07T01:04:28.092Z	\N
0676bbe1-5bb4-4bd1-94b6-7a5038ecd41e	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Infantil	2024-05-11T19:42:18.268Z	\N
2cb3a6b6-9a04-40b4-a48c-20a2644fee72	718d5be3-69c3-4216-97f1-12b690d0eb97	Espelho Individual	2024-05-11T19:54:19.725Z	\N
51ccecbb-1d21-447c-9d62-d5b3d2775905	03fdb0f2-6b50-4895-b970-5793cad80c86	Manta - Pet	2024-05-11T19:49:02.550Z	\N
5703a677-4bf8-42fb-a66b-e9c29b50e4fe	5c9b6767-5310-461b-977b-906fe16370ae	Cama De Hospital	2024-05-11T19:59:53.312Z	\N
328d3f80-abfe-4c86-ba31-9399e4d9f2a6	fd1f74c4-6723-4ffe-8657-773a943e65c4	Alicate de corte	2024-05-07T15:32:51.813Z	\N
8a8e86cf-24e0-4a87-b660-1a8d884bbacc	fd1f74c4-6723-4ffe-8657-773a943e65c4	Capacete	2024-05-07T15:34:35.893Z	\N
ae3c2c9b-44da-4c00-9755-74880c3f9da1	fd1f74c4-6723-4ffe-8657-773a943e65c4	Capas de chuva	2024-05-07T15:35:05.106Z	\N
f88381ee-7e98-4806-9fb4-acd4f1c328ec	fd1f74c4-6723-4ffe-8657-773a943e65c4	Corda 10 OU 11 ML	2024-05-07T15:33:47.105Z	\N
a1f41da4-7c34-46c6-a6bf-446db9063b96	fd1f74c4-6723-4ffe-8657-773a943e65c4	Óculos de proteção	2024-05-07T15:32:05.485Z	\N
01d3d6df-cd76-4f62-9c39-ddd968a9a634	718d5be3-69c3-4216-97f1-12b690d0eb97	Papel higiênico	2024-05-07T14:56:19.458Z	\N
14bb5f33-7c73-441d-a3b6-27fd7348dce3	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas para crianças	2024-05-07T01:04:29.240Z	2024-05-08T13:50:01.985Z
d66cd87f-0651-472d-a3e3-74e7fe481760	fd1f74c4-6723-4ffe-8657-773a943e65c4	Macas	2024-05-07T15:33:09.807Z	\N
844fa0a8-93a3-481e-8221-d6d385274281	fd1f74c4-6723-4ffe-8657-773a943e65c4	Macacão para resgate	2024-05-07T15:36:18.104Z	\N
90d760be-3781-4bf7-ae91-5f74027bb1d8	fd1f74c4-6723-4ffe-8657-773a943e65c4	Tesourão	2024-05-07T15:34:10.520Z	\N
321d9059-1be7-4d23-a279-7d4e6072a548	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa De Frio Masculina	2024-05-11T20:02:30.548Z	\N
d254df9f-d108-42f2-933e-3a67e2ee89ca	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa De Frio Infantil 13-14 Anos	2024-05-11T20:03:50.777Z	\N
19b620fd-2c12-45dd-92c2-a44eff97ca23	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Camisa Manga Longa Infantil Masculina	2024-05-11T20:08:19.368Z	\N
a6bf37fb-1ae0-4682-881f-a213db5b4323	5c9b6767-5310-461b-977b-906fe16370ae	Meia Infantil	2024-05-11T20:08:44.255Z	\N
78e9e9be-0d18-4553-9a6f-691462e8db06	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntários Para Escala	2024-05-11T20:09:08.189Z	\N
8ed9323e-cc0d-4d4d-afa1-1bdbf3a66268	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Chinelos Infantis	2024-05-11T20:09:53.582Z	\N
bbe40b2f-8869-4d19-8f3d-ecb8383ce4ca	5c9b6767-5310-461b-977b-906fe16370ae	Escova De Dente	2024-05-11T20:11:50.735Z	\N
11c6d26d-d148-49c7-bcfd-cf2ce6be4022	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Malas de Viagem	2024-05-07T12:54:02.766Z	\N
35f6046a-c2a2-4e4b-a857-f8de763e229a	037ac262-4f35-42e0-83e1-4cdcceedb39c	Pratos	2024-05-06T03:04:50.554Z	2024-05-07T14:13:49.822Z
7b1ffe8e-6cb1-46b9-b85c-dcb380da4aa4	03fdb0f2-6b50-4895-b970-5793cad80c86	Roupas de Camas 	2024-05-07T14:24:57.964Z	2024-05-07T16:45:37.760Z
9e66cff1-37e1-4631-8251-c7b03b287ada	718d5be3-69c3-4216-97f1-12b690d0eb97	Luvas	2024-05-07T15:09:08.115Z	\N
8fb6def6-cdcf-4f6d-ad1c-e6d4049fab4a	5c9b6767-5310-461b-977b-906fe16370ae	Butorfanol	2024-05-11T20:14:13.052Z	\N
2c98279b-bbd2-4645-96a3-51edb69cf509	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Lentilha	2024-05-07T14:26:42.725Z	2024-05-07T17:31:22.022Z
aa228cb7-d1cc-4304-86df-41971e73e607	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Camisa Manga Longa	2024-05-11T20:07:44.211Z	\N
acfe9257-ddff-4600-97ec-b8b512dd6eee	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Camiseta Manga Curta Masculina	2024-05-11T20:09:17.498Z	\N
036aff85-2f8c-434b-87fd-35b46627c5ac	718d5be3-69c3-4216-97f1-12b690d0eb97	Desodorante Aerosol	2024-05-11T20:15:15.939Z	\N
5360ddf0-2cef-4ed6-9097-7b6ad85de3c9	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Blusas Ggg	2024-05-11T20:15:32.618Z	\N
71f5fc2f-29f2-430c-86f5-79b33f4f825e	5c9b6767-5310-461b-977b-906fe16370ae	Pastilha Para Garganta	2024-05-11T20:19:03.731Z	\N
4bf4cd5b-4156-409b-a3ce-8b3f96366f7c	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Mamão	2024-05-11T20:22:21.414Z	\N
4fcbd1d7-d0dc-46a1-96a9-88199dc075f1	5c9b6767-5310-461b-977b-906fe16370ae	Ivermectina	2024-05-11T20:23:08.781Z	\N
0c91997a-e357-4fad-a220-7ed67d9d4100	5c9b6767-5310-461b-977b-906fe16370ae	Imosec	2024-05-11T20:23:35.840Z	\N
024cd66e-f35f-405b-bd88-705d071be713	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Íntima Masculina G E Gg	2024-05-11T20:30:14.108Z	\N
03c98160-18b1-46fa-8477-d85d784987b4	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Leite Em Pó 0 Meses A 12 Anos	2024-05-11T20:42:06.395Z	\N
c8e0a4e5-963c-41b0-a9a0-dc814215cb7c	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Grampeador	2024-05-11T20:15:57.383Z	\N
7b1d884c-19e6-49a0-badc-e98dbd02de07	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calçados 38-39-40	2024-05-11T20:16:01.757Z	\N
2a9edf46-7b97-4f71-8144-15a60614e095	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Pantufa Infantil	2024-05-11T20:16:42.666Z	\N
835ed21d-0c9f-481c-bcfa-9f3235f88ad5	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Pijamas Inverno	2024-05-11T20:16:59.135Z	\N
f8ba58b3-6549-49b7-b400-81ce225d365d	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Farinha	2024-05-07T13:40:11.092Z	\N
2b72c607-f5b6-4907-88e9-1a2d50045b18	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Açúcar	2024-05-07T13:40:25.423Z	\N
b8db7c1c-a3ff-4eac-b14e-d0915bbd2270	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Elástico/atílio De Boracha	2024-05-11T20:17:57.518Z	\N
2af85206-62f0-48a7-b5f5-c889498c8b18	5c9b6767-5310-461b-977b-906fe16370ae	Spray Para Garganta	2024-05-11T20:19:20.640Z	\N
0774d214-1b04-4d83-90bb-bf30662b9a5a	718d5be3-69c3-4216-97f1-12b690d0eb97	Creme De Pentear	2024-05-11T20:20:10.609Z	\N
38ce9b58-53ff-4a90-a73d-2c869c07a5b3	5c9b6767-5310-461b-977b-906fe16370ae	Ibuprofeno 600mg	2024-05-11T20:21:30.011Z	\N
831c20bd-c64f-4dbb-9b72-bd33b1ee9c5c	5c9b6767-5310-461b-977b-906fe16370ae	Laxante	2024-05-11T20:21:46.856Z	\N
b910c015-09ec-4052-968e-a29db81d5912	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina G E Gg	2024-05-11T20:30:37.743Z	\N
b5edb6c0-dfe7-4a27-a6cb-182bb82acd29	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça Moletom 10-14	2024-05-11T20:16:21.669Z	\N
3453dec4-2fa0-4a3d-a053-0af80abdc82c	5c9b6767-5310-461b-977b-906fe16370ae	Fita Adesiva Crepe	2024-05-11T20:16:54.712Z	\N
fa852d9b-c583-49ac-b5a7-95927e861285	5c9b6767-5310-461b-977b-906fe16370ae	Calça Masculina Geral	2024-05-11T20:18:13.703Z	\N
df954afb-bd57-422c-ab70-de3787cb7880	5d50d3cf-4e36-4639-813d-d43de8886ac8	Mop Giratório	2024-05-11T20:22:15.049Z	\N
6aa9af23-caa5-40d6-b91d-ef297e5ec4f4	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Meia Infantil 22-40	2024-05-11T20:24:23.945Z	\N
9ef7585a-4ac6-4602-b155-70543434a547	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Cebolaa	2024-05-11T20:27:26.567Z	\N
b7eeeb89-0615-4af4-b284-51f3486c7c9e	5d50d3cf-4e36-4639-813d-d43de8886ac8	Propé	2024-05-11T20:31:42.909Z	\N
121a7dac-5f7a-45cc-8c1f-1c86f8b8dcdd	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Íntima Feminina G E Gg	2024-05-11T20:33:26.090Z	\N
314310e7-152c-448d-9252-35537ffa272d	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Infanto Juvenil 4-16 Anos	2024-05-11T20:34:38.307Z	\N
7f0bba22-b51c-4d05-b9fe-d561872971a3	5c9b6767-5310-461b-977b-906fe16370ae	Capa De Chuva G	2024-05-11T20:39:16.421Z	\N
04a2d64b-69c0-4f6b-8975-4d41b4f43327	5c9b6767-5310-461b-977b-906fe16370ae	Casacos Quentes Para Adultos	2024-05-11T20:39:37.065Z	\N
30761767-ad87-46f1-8d11-68dffe654ee1	fd1f74c4-6723-4ffe-8657-773a943e65c4	Gasolina	2024-05-11T20:47:50.749Z	\N
e0ce41a6-fe23-42eb-9ee5-d9c0e21e5833	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça Jeans	2024-05-11T20:53:31.778Z	\N
85132717-39a0-41bb-8409-6ecf6ec77019	5d50d3cf-4e36-4639-813d-d43de8886ac8	Vassouras	2024-05-07T16:14:51.207Z	\N
e3f24520-666e-47d0-ad10-73a9110b3ad4	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Masculinas Todos Os Tamanhos	2024-05-11T20:47:36.505Z	\N
748f49f1-b979-4ecd-93af-5c62df9302ae	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Adolescente	2024-05-11T20:47:52.684Z	\N
9553af2c-3c73-4c34-ab7f-1001c1c34e86	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Intimas Masculino	2024-05-11T20:51:57.453Z	\N
fedbbfb1-777d-4914-b6fd-184e9de0e7e5	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Bebe	2024-05-11T20:56:41.997Z	\N
61fd5d1d-656b-404d-8168-aea8a0c9ffd9	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Chinelos Feminino	2024-05-11T21:53:04.922Z	\N
1a11bf91-5128-4a26-bacf-d81f559695eb	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Intimas Feminino	2024-05-11T20:52:06.726Z	\N
e48d36c1-f6b4-47f4-9123-17681ed99941	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Chá	2024-05-11T20:56:08.354Z	\N
9f8f90ad-55b1-4549-b4b8-2755c3eb1b10	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa De Inverno	2024-05-11T21:33:13.284Z	\N
acc5c092-aef5-4a76-981d-80a2c847086b	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Livros De Criança	2024-05-11T21:46:21.771Z	\N
1c5dde39-a7d9-4a17-82a4-6b4e43f25b6c	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Atum	2024-05-11T22:07:19.035Z	\N
552e881e-ed4a-414b-914e-36a0dd85d0a4	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Sardinha	2024-05-11T22:07:34.105Z	\N
15e4dafd-4196-4bb8-aedb-7c391f9514df	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calçados 31 A 42	2024-05-11T22:09:08.937Z	\N
8ea367f1-09ca-4195-92e6-94f3bb00f618	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Instrumentos/brinquedos Musicais (crianças)	2024-05-11T21:47:38.881Z	\N
3b212543-48ca-43a5-9f42-20b506425a83	c117dd37-82ab-43a6-bf66-d97acef97f6e	Material Escolar	2024-05-11T22:00:45.590Z	\N
1d2b769c-5dfe-41ae-aec9-03266ff78cb5	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntário Assistente Social	2024-05-11T22:13:45.438Z	\N
329ef2f3-32ec-4987-8089-c7f02ffd7aaf	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Legumes	2024-05-11T22:18:50.197Z	\N
32a2463b-506d-4ab4-8789-2ebecb70ce4e	718d5be3-69c3-4216-97f1-12b690d0eb97	Lâmina De Barbear	2024-05-11T22:29:09.468Z	\N
528e2a82-0523-4110-8894-20ee1a60be69	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Alimento Perecível	2024-05-11T22:35:42.129Z	\N
229f0eb8-0663-4ab0-b471-5028f1bf1e72	c117dd37-82ab-43a6-bf66-d97acef97f6e	Jogos Para Atividades Com As Crianças	2024-05-11T22:36:00.248Z	\N
aa03f3e6-ff18-49aa-b06c-3bfeb64c71ae	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Estilete	2024-05-11T22:54:47.413Z	\N
0039d5e9-4cc5-4b47-b034-225da8e4fc19	5c9b6767-5310-461b-977b-906fe16370ae	Curativos	2024-05-11T22:13:29.104Z	\N
a7012e24-590a-4197-bf55-6f4f5392cf8b	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Blusas Gg	2024-05-11T23:10:38.011Z	\N
8e216fb9-2ce0-4804-9263-b29e8a1eeb71	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calças Gg	2024-05-11T23:11:04.015Z	\N
86cad6e9-5244-4991-9340-eed4798547ae	037ac262-4f35-42e0-83e1-4cdcceedb39c	Copos Descartáveis	2024-05-11T23:25:11.776Z	\N
a9b67a55-6742-4c3f-98ad-af8a69c05686	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntário - Tarde	2024-05-07T16:14:55.673Z	\N
b7d18ff2-d390-46e0-8cb2-d6bcfe27e7b6	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calçado Feminino	2024-05-11T22:41:49.209Z	\N
160ef3da-52f4-4dcb-9d1b-27fc1d9f651f	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Caneta Bic	2024-05-11T22:54:09.307Z	\N
b56b869f-3adf-4626-903f-13727027801f	5d50d3cf-4e36-4639-813d-d43de8886ac8	Bom Ar	2024-05-11T22:55:31.624Z	\N
6ebdfdfa-c7b7-42c3-972c-a15b921d4e66	718d5be3-69c3-4216-97f1-12b690d0eb97	Xampu Para Piolho	2024-05-11T22:56:26.411Z	\N
27bc61d5-5d38-4060-a362-785a4c2c061c	5c9b6767-5310-461b-977b-906fe16370ae	Fita Hgt	2024-05-11T22:59:57.689Z	\N
6dcb288d-7023-4375-8fb7-fcad84f946e2	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Tipoia Velpeau	2024-05-11T23:01:39.570Z	\N
ad6d006f-06d6-41e6-adaa-6c265225c8e7	5c9b6767-5310-461b-977b-906fe16370ae	Insumos Para Internação Veterinário	2024-05-11T23:14:27.638Z	\N
55c702ec-d2b4-494d-9082-3985dbeb3a28	03fdb0f2-6b50-4895-b970-5793cad80c86	Casinha Para Gato	2024-05-11T23:15:54.473Z	\N
d580d7f8-a8be-4212-9ed8-8e1d52f4c384	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Marmitas - 100	2024-05-11T23:20:14.098Z	\N
ab7786c6-8133-42c0-871e-6bbacca60c5e	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Água Mineral - 200 Litros	2024-05-11T23:20:34.655Z	\N
004a49df-0306-4891-9cbf-2b40d050c318	4f95853f-d5e1-487d-8086-6ddfaf2bbab7	Maquina De Lavar Roupas 110 V	2024-05-11T23:00:17.462Z	\N
f057afa8-7569-4d01-aae5-809e3c17a1e2	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Etiquetas Adesivas	2024-05-11T23:11:29.545Z	\N
42b139ee-4c4b-4714-ab0c-bd92689d6260	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Açúcar	2024-05-11T23:29:11.425Z	\N
faeac6fc-4c69-4e2b-9b15-b47e85af78ba	03fdb0f2-6b50-4895-b970-5793cad80c86	Teste De Fiv E Felv	2024-05-11T23:57:29.196Z	\N
1e82efdb-7aaf-4f66-adfa-beb849657760	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Barra De Cereal	2024-05-12T00:10:52.374Z	\N
3e580c9b-a7d3-4b37-ad53-e9ec9f63e479	5c9b6767-5310-461b-977b-906fe16370ae	Estradiol 1 Mg	2024-05-12T00:25:54.221Z	\N
c732940a-aa1a-4882-bab3-59783d515947	5c9b6767-5310-461b-977b-906fe16370ae	Epsironactona 100mg	2024-05-12T00:26:30.469Z	\N
bc43d2f6-7c4f-4d38-8269-b66b085fcb8a	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Carne Em Geral	2024-05-12T00:27:56.653Z	\N
e54ecc47-ddb8-487a-aa3d-2d091a55b830	718d5be3-69c3-4216-97f1-12b690d0eb97	Barbeador Descartável	2024-05-12T00:12:05.510Z	\N
e2f71e7c-b16a-419c-82ee-ae353712e406	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Maçarico	2024-05-12T00:55:09.178Z	\N
b355c6b7-f9c9-4b2f-92a2-bb7f8adeb790	718d5be3-69c3-4216-97f1-12b690d0eb97	Shampoo Infantil	2024-05-12T00:55:30.966Z	\N
b445feb3-6ae1-4998-ac1f-ad71adef656f	5d50d3cf-4e36-4639-813d-d43de8886ac8	Amaciante	2024-05-12T00:58:20.417Z	\N
16f81e02-611e-4f34-b438-2dfd3fe94bd6	03fdb0f2-6b50-4895-b970-5793cad80c86	Fralda Grande Porte Pet	2024-05-12T00:51:00.845Z	\N
28114a40-6489-4712-b5ba-5968b0fc8fd9	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntário - Manhã	2024-05-07T16:14:59.073Z	\N
14e49cb6-9951-4a0d-bf60-20f4b046b6f8	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Botijão De Gás	2024-05-12T00:54:51.728Z	\N
77396dd0-9afa-4ae9-9a10-1d796a79b8c0	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Manta Asfáltica	2024-05-12T00:55:30.042Z	\N
0d0b7439-82c1-4030-8d40-3dd94753eb40	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça Moletom Feminino	2024-05-12T00:59:26.859Z	\N
7fe4cd2a-9bec-419a-aaae-aa89761c5566	5c9b6767-5310-461b-977b-906fe16370ae	Calça Moletom Masculino	2024-05-12T01:00:08.622Z	\N
652b4e71-8aec-46f6-a361-fe78ac0efe10	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça De Moletom 7-16 Anos	2024-05-12T01:05:23.033Z	\N
429d3f0b-54fe-44b4-9f45-81581cc5cc4b	80111414-1c1d-4566-ba6f-1373a53997ac	Modem Móvel Para Internet	2024-05-12T01:57:43.361Z	\N
92b76470-db2f-49fd-959d-e32dabb734a7	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Pulseiras De Identificação	2024-05-12T01:58:06.623Z	\N
73124159-e4fb-4edb-881b-36a99bace25c	03fdb0f2-6b50-4895-b970-5793cad80c86	Água Para Pets	2024-05-12T01:23:31.364Z	\N
b84e2a5f-8dc0-4e03-8581-9aace16bc227	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Caixa Organizadora Para Roupas E Calçados	2024-05-12T01:50:50.085Z	\N
8302c3b8-4ef3-4cb4-816c-a0a9d788c22b	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Chinelos 36 A 39	2024-05-12T02:01:59.710Z	\N
bebcebf5-673a-49af-a02b-168c11dd0dd9	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Fraldas Bebê	2024-05-12T02:04:13.034Z	\N
b02a8127-4baa-439d-96d0-4895e606f3d1	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça Jeans Feminina	2024-05-12T02:04:38.064Z	\N
d7a5e2bf-48a5-4808-b427-8116d795f939	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Adoçante	2024-05-12T02:05:23.406Z	\N
7e184744-f42f-4756-b713-a0cde81e35cb	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Cadernos	2024-05-12T01:51:57.184Z	\N
8b9e4699-6c7a-46a1-86c2-da3d3867cd40	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Cadeira De Plástico	2024-05-12T01:51:58.530Z	\N
1eaffd04-3a73-45a1-9729-3d28de16c87e	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Nobrake - Estabilizador De Computador	2024-05-12T01:59:06.949Z	\N
a3e547e1-3b29-43e5-838f-d66e36b12187	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Fita Dupla Face	2024-05-12T02:02:37.767Z	\N
911f55b0-51f3-47ec-b80f-23fee83a5d72	5d50d3cf-4e36-4639-813d-d43de8886ac8	Álcool Gel	2024-05-12T02:04:52.594Z	\N
feabdbad-dc62-4ffc-8683-3f5853fbaea9	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Nescau	2024-05-12T02:05:47.657Z	\N
91f2ff2e-6a60-44fe-9f1a-5d5b94c0629e	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Descascador De Legumes	2024-05-12T02:06:45.150Z	\N
a22f8d3b-6143-428d-a0ab-9fa02cbd5933	037ac262-4f35-42e0-83e1-4cdcceedb39c	Faca Com E Sem Ponta	2024-05-12T02:12:02.838Z	\N
03806df4-f5df-48c6-b084-4993af23dcb9	5d50d3cf-4e36-4639-813d-d43de8886ac8	Escova Para Limpar Mamadeira	2024-05-12T02:13:56.568Z	\N
5aad0adb-f132-45f7-b2bb-248f3d8dfacf	037ac262-4f35-42e0-83e1-4cdcceedb39c	Pratos-copos-talheres-guardanapos	2024-05-12T02:09:49.495Z	\N
6cadf62b-c44a-4184-aa09-a3dd33fb9676	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Panela De Pressão Grande	2024-05-12T02:16:38.029Z	\N
c4cb72e4-042f-457b-a18e-6233e2bb2b9f	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Caixinhas De Chá	2024-05-12T02:14:56.881Z	\N
78608d77-3c39-4d10-83bf-d9ec1fa96361	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Banana-maçã	2024-05-12T02:15:32.098Z	\N
9be951da-e5a4-4c2d-8216-16351db048f6	5d50d3cf-4e36-4639-813d-d43de8886ac8	Perflex	2024-05-12T02:16:00.145Z	\N
3b247bc2-b6da-45e4-9109-cc199c29f41b	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Café Pronto	2024-05-12T02:25:46.845Z	\N
c2e2516b-559f-4189-bf17-c962964d66a3	5c9b6767-5310-461b-977b-906fe16370ae	Atadura	2024-05-12T02:28:13.138Z	\N
8f31cc80-5d62-422d-8f53-0f521bbec7b1	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Quentes 10 A 16 Anos	2024-05-12T02:30:22.903Z	\N
524ad35e-7967-4ebf-96d8-cdf0f56d1e81	718d5be3-69c3-4216-97f1-12b690d0eb97	Sabonetes	2024-05-07T16:15:03.641Z	\N
9651eb11-619a-41cd-8e4b-7629ff6bef34	4f95853f-d5e1-487d-8086-6ddfaf2bbab7	Geladeira 110v	2024-05-12T03:20:33.926Z	\N
cd9c4c7a-b1d1-4b85-9a90-a1968b1dc420	718d5be3-69c3-4216-97f1-12b690d0eb97	Pasta de dente	2024-05-07T16:15:04.207Z	\N
b21ed5e8-0f57-4852-8755-7df401dbea9c	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Capa De Chuva Gg	2024-05-12T03:22:58.981Z	\N
4dade5ab-d146-4a28-bc3a-40f11844d86b	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Megafone	2024-05-12T03:47:06.260Z	\N
2da60344-b6ae-4028-99e4-a5e4bded0551	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Pasta De Documento	2024-05-12T04:02:20.259Z	\N
d1af0c2b-4e1f-4cbe-9f97-722264b50722	03fdb0f2-6b50-4895-b970-5793cad80c86	Peiteira P	2024-05-12T05:03:04.436Z	\N
d34f6cfc-a2d4-4456-8f61-9f3daae702a2	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Caneta Permanente	2024-05-12T05:51:39.829Z	\N
3767b065-0ed4-4a52-a2e7-cc2e119740f2	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Menino De (4 A 16 Anos)	2024-05-12T11:01:01.612Z	\N
e15b969f-d5fe-48cf-80ea-443be9dc5785	03fdb0f2-6b50-4895-b970-5793cad80c86	Medicamentos veterinários	2024-05-07T16:15:07.663Z	\N
ee8da859-0ae9-4344-b778-19478e468148	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Lona Grossa	2024-05-12T11:52:20.674Z	\N
b47dcd5b-0abe-44e1-bb92-d2b77e529edd	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Lençol De Solteiro Com Elástico	2024-05-12T11:53:01.940Z	\N
ff30edb6-ad8b-4b10-80ba-da7d2ef786f7	037ac262-4f35-42e0-83e1-4cdcceedb39c	Talheres	2024-05-07T16:15:08.236Z	\N
6614f568-a5dc-4d13-90b8-8e5563088e9d	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Leite	2024-05-12T11:52:25.218Z	\N
c68df5a4-5564-4810-8a23-d83e7030cd15	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Chinelo Masc	2024-05-12T12:05:10.331Z	\N
0690d265-7ef9-4254-8384-ad5cc97a35c9	5d50d3cf-4e36-4639-813d-d43de8886ac8	Escova De Vaso	2024-05-12T12:08:21.287Z	\N
676c22c2-00f3-4f6a-a833-f1d5f5c3b54f	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Infantil Até 12 Anos	2024-05-12T13:03:31.669Z	\N
790861c7-f54f-4579-8859-bfe139177c0b	05583098-5f2e-44e2-b874-452ec86d9d3e	Carros	2024-05-07T16:15:10.541Z	\N
fe759238-aa02-4e06-94e5-cd2222df803b	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calçados Masculino Acima De 40	2024-05-12T13:04:30.860Z	\N
da31cce8-8f58-4e67-b299-b42991224a79	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Gg E Xg Feminina E Masculina	2024-05-12T13:05:11.429Z	\N
5d9c4653-df10-4748-b65d-47196c34f644	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Lt Casa Pátio Canil Separado	2024-05-12T13:29:02.891Z	\N
3ccc7bd1-183d-4f51-9044-a523376e1a58	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Voluntários Para Organizar Roupas	2024-05-12T13:41:02.403Z	\N
597488e8-bf87-48c5-abf6-e75a4dda7491	03fdb0f2-6b50-4895-b970-5793cad80c86	Compressa Cirúrgica	2024-05-12T13:41:51.238Z	\N
b8352000-3e89-4d63-949b-3e51bd73f7f7	03fdb0f2-6b50-4895-b970-5793cad80c86	Gaze Pct	2024-05-12T13:42:11.654Z	\N
f217bb6b-8218-4858-b030-633bb3b96eb8	03fdb0f2-6b50-4895-b970-5793cad80c86	Campos Plásticos	2024-05-12T13:42:27.973Z	\N
43d955ab-e615-4fa7-ad45-6492000fb9e9	03fdb0f2-6b50-4895-b970-5793cad80c86	Fios Nylon	2024-05-12T13:43:29.873Z	\N
99552dea-ee0d-4992-8dd7-b1fb700e70aa	03fdb0f2-6b50-4895-b970-5793cad80c86	Fios Poliglecaprone	2024-05-12T13:44:05.614Z	\N
323abc48-2457-4792-8845-d4d932a12c9a	5c9b6767-5310-461b-977b-906fe16370ae	Sevoflurano / Isoflurano	2024-05-12T13:44:44.372Z	\N
f73c4835-f33f-4dbe-89bd-e93ac4c2c279	5c9b6767-5310-461b-977b-906fe16370ae	Agenoxi	2024-05-12T13:45:53.573Z	\N
dc7bdb2e-37ca-4624-9bbc-21bbcb7af3bd	5c9b6767-5310-461b-977b-906fe16370ae	Agenoxi	2024-05-12T13:46:43.973Z	\N
9a8a5c61-fc58-4505-a808-8d5024545ef7	5c9b6767-5310-461b-977b-906fe16370ae	Meloxican	2024-05-12T13:46:54.063Z	\N
ac176047-bdf1-472b-b369-240e15eab15d	5c9b6767-5310-461b-977b-906fe16370ae	Bupivocaina Sem Vaso	2024-05-12T13:47:21.453Z	\N
b2d422a6-fae3-4c55-b86e-936db8d28729	03fdb0f2-6b50-4895-b970-5793cad80c86	Equipos	2024-05-12T13:48:01.048Z	\N
8d47cfb0-0925-4e88-bf2b-2bb9fb2a4a90	5c9b6767-5310-461b-977b-906fe16370ae	Traqueotubos	2024-05-12T13:48:44.142Z	\N
3e45d816-1e64-4b91-a91e-22d47fd9da75	5c9b6767-5310-461b-977b-906fe16370ae	Adrenalina	2024-05-12T13:49:28.181Z	\N
eecafd84-d96c-4c05-bc1e-04c8bc2da2bd	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa De Frio Infantil Feminino	2024-05-12T14:11:35.228Z	\N
25062b5d-9484-4b02-8eb2-338898b34844	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa De Frio Infantil Masculino	2024-05-12T14:12:39.599Z	\N
e0e4e01c-881f-4117-8c0d-5d911a4269b9	037ac262-4f35-42e0-83e1-4cdcceedb39c	Luva M	2024-05-12T14:36:21.669Z	\N
e72b98da-d578-40c6-b666-4ee0165207e1	5c9b6767-5310-461b-977b-906fe16370ae	Amoxilina	2024-05-12T14:37:21.828Z	\N
4baf7449-d259-45a3-b3cd-8fcfb9f6aa2e	5c9b6767-5310-461b-977b-906fe16370ae	Cravulanato 875	2024-05-12T14:37:37.547Z	\N
35a209cb-e678-4c4e-a274-217f7eab4221	5d50d3cf-4e36-4639-813d-d43de8886ac8	Plástico Filme	2024-05-12T14:38:20.826Z	\N
d3a77238-af0d-4cb7-a684-758f8089d39e	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Bule	2024-05-12T14:38:43.390Z	\N
00a3e128-7af5-4fbd-aa99-ae33e46124fc	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Touca Para Cozinhar	2024-05-12T14:52:36.722Z	\N
ea854ef5-7ef7-48ca-9d4b-570cbf0c545f	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Crachá Para Identificação	2024-05-12T14:52:59.105Z	\N
35c000d9-4475-4826-92ff-37a09b8de131	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Blusa Frio 8 - 16 Anos	2024-05-12T14:58:57.404Z	\N
318b0858-0973-4a83-ab97-95c8e85c78ea	03fdb0f2-6b50-4895-b970-5793cad80c86	Teste Rápido Leptospirose	2024-05-12T15:13:22.030Z	\N
599ad06b-2791-44c6-a0ae-9b67fa182ba1	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Geléia	2024-05-12T15:13:22.801Z	\N
248d9ed4-d09c-45b1-a458-586a0bc06c50	03fdb0f2-6b50-4895-b970-5793cad80c86	Mirtz 0,2 Mg	2024-05-12T15:13:56.870Z	\N
3ff4dd29-40d6-47ae-8e61-e441b36d6166	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Sutiã	2024-05-12T15:14:14.431Z	\N
6ad8b08c-2457-45aa-8589-013e0b73d0a4	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calcinha	2024-05-12T15:14:30.205Z	\N
54a7e449-dcd5-423a-af8c-11ed71b85389	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Livros De Pintura	2024-05-12T15:20:52.672Z	\N
47b957dd-c43b-4b27-8dad-07f8f9e88f4e	03fdb0f2-6b50-4895-b970-5793cad80c86	Avental Cirúrgico	2024-05-12T13:41:32.277Z	\N
43580a44-4423-4194-b34f-6bd85607c327	03fdb0f2-6b50-4895-b970-5793cad80c86	Lâmina Bisturi 15 E 20	2024-05-12T13:43:05.345Z	\N
748b65d0-3957-4eaf-ae95-65c5acd74601	5c9b6767-5310-461b-977b-906fe16370ae	Butorfano/beniv	2024-05-12T13:46:34.107Z	\N
781e5146-e4f5-4d72-93dc-e23624de4435	5c9b6767-5310-461b-977b-906fe16370ae	Lidocaína Sem Vaso	2024-05-12T13:47:39.505Z	\N
70a2d253-1b9c-4ed0-9048-c793c86ee0a0	5c9b6767-5310-461b-977b-906fe16370ae	Ringer Lactato	2024-05-12T13:48:27.156Z	\N
0e2f55b5-8a6b-4ef9-b83b-6115bd47ff9c	5c9b6767-5310-461b-977b-906fe16370ae	Atropina	2024-05-12T13:49:04.664Z	\N
5268f29f-d02c-40e3-ac07-f35147c1a9cc	5c9b6767-5310-461b-977b-906fe16370ae	Efedrina	2024-05-12T13:49:16.346Z	\N
26b80625-c48e-4e18-8248-be193f1c93e6	5c9b6767-5310-461b-977b-906fe16370ae	Propofol	2024-05-12T13:45:00.119Z	\N
dc6041a7-f911-4ae8-9c43-3480bd31667a	5c9b6767-5310-461b-977b-906fe16370ae	Metadona/morfina	2024-05-12T13:45:24.269Z	\N
e484c6d1-41ed-4b58-aa7c-561e0ddfc01e	5c9b6767-5310-461b-977b-906fe16370ae	Ampicilina	2024-05-12T13:49:44.472Z	\N
fc383a72-fcea-45a2-86d5-0aa5faa37fad	718d5be3-69c3-4216-97f1-12b690d0eb97	Esponja Para Banho	2024-05-12T13:55:45.921Z	\N
0b337793-9dbf-4ae8-b21f-a8aedbc1a915	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Bolo	2024-05-12T14:10:43.898Z	\N
657d8978-fd31-4356-86ba-69a3cf9887b2	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Neston	2024-05-12T14:10:04.975Z	\N
1ff95ef9-1d26-473f-9b56-0e2152b9a681	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Farinha Láctea	2024-05-12T14:10:26.535Z	\N
dd6c8774-52ca-4c3f-9125-06ad4b0e2747	fd1f74c4-6723-4ffe-8657-773a943e65c4	Cordas	2024-05-07T16:15:15.125Z	\N
3622021b-0727-4d94-97ae-3c264a032621	03fdb0f2-6b50-4895-b970-5793cad80c86	Toalha Para Pet	2024-05-12T14:19:55.984Z	\N
fb5074d1-71b7-4737-afd5-30e6323e9fc9	03fdb0f2-6b50-4895-b970-5793cad80c86	Pano Para Pet	2024-05-12T14:20:09.007Z	\N
a3c54809-48b7-494d-9e81-2895a1f5c217	5c9b6767-5310-461b-977b-906fe16370ae	Vonau Injetável	2024-05-12T14:20:30.378Z	\N
98b80385-0a11-41f8-b15d-8d460652fce4	5c9b6767-5310-461b-977b-906fe16370ae	Metronidazol 250 Mg	2024-05-12T14:23:19.439Z	\N
aa5db4cb-8efc-4482-8dfc-aee10949e3f4	5c9b6767-5310-461b-977b-906fe16370ae	Gabapentina 50 Mg	2024-05-12T14:23:58.318Z	\N
12441ef6-2583-4e7e-9aae-8f3bf89147e6	fd1f74c4-6723-4ffe-8657-773a943e65c4	Lanternas	2024-05-07T16:15:15.709Z	\N
fe4921f1-0f3a-471a-a4ba-eb92dc6fcbbe	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntário Com Carro	2024-05-12T14:35:25.701Z	\N
f0d92aa4-8b09-44a8-a513-575b956ace5f	5c9b6767-5310-461b-977b-906fe16370ae	Giardicidi 50 Mg	2024-05-12T14:21:54.404Z	\N
647445b0-6c3c-4669-b1b4-fb92fd5920db	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Perfex	2024-05-12T14:39:14.784Z	\N
e121df46-f1e7-4703-a9c7-3c98f23363f0	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Espelho Para Banheiro	2024-05-12T14:40:44.809Z	\N
688d2abd-d8f4-4356-b9cc-db8148905b6f	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Ovos	2024-05-12T14:46:54.244Z	\N
67f5833c-24b8-4004-87ca-514f302cf734	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Íntimas De Criança E Adolescente	2024-05-12T14:48:03.930Z	\N
b99656ae-fc0f-4016-8261-91cd43a69c62	03fdb0f2-6b50-4895-b970-5793cad80c86	Comida Úmida De Prescrição Para Cachorros	2024-05-12T14:48:26.985Z	\N
770fd1b3-e792-4127-88f9-7d7a47224363	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Colchões	2024-05-07T16:15:17.493Z	\N
4505e4ab-6789-4612-acdf-8d3c492476ea	03fdb0f2-6b50-4895-b970-5793cad80c86	Correntes	2024-05-12T14:49:34.769Z	\N
3e9aa91a-308e-4698-a131-8e4cb28c398c	03fdb0f2-6b50-4895-b970-5793cad80c86	Capa De Chuva Pet	2024-05-12T14:51:16.253Z	\N
79039fe7-7ae3-410a-913e-49cd816aeca1	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Etiqueta Identificação Voluntários	2024-05-12T14:52:27.542Z	\N
f0acd27c-a496-46a3-a2ba-bea24049ea20	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas Femininas E Masculinas G E Gg	2024-05-12T14:53:55.636Z	\N
d15cbac6-90ef-4c69-ac74-d4bab7389448	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Bolinho	2024-05-12T15:02:11.726Z	\N
eaefed6b-0638-4d5a-86c1-42801b2b1ac7	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Barrinhas	2024-05-12T15:02:30.762Z	\N
b318e22b-b401-4432-81c5-a2ef54cdacb7	5d50d3cf-4e36-4639-813d-d43de8886ac8	Suco Sem Açucar	2024-05-12T15:10:24.269Z	\N
39854bdb-bb2e-4dc4-a08e-d1fc9c280ebb	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Lençóis	2024-05-07T16:15:18.057Z	\N
69ed1694-a1a1-4163-80c4-bcedc9a7dbd7	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Técnico De Enfermagem - Noite	2024-05-12T15:14:22.033Z	\N
30862163-26c5-40b6-893f-1d32139a5240	03fdb0f2-6b50-4895-b970-5793cad80c86	Colírio - Lacri Ou Systane	2024-05-12T15:14:34.597Z	\N
cb69b4b0-b164-43ed-ad6e-c0c3ca3ad93e	037ac262-4f35-42e0-83e1-4cdcceedb39c	Sacos de lixo	2024-05-07T16:15:18.057Z	\N
ecf975c3-add4-4e4a-8190-6789936ce9ae	03fdb0f2-6b50-4895-b970-5793cad80c86	Churu Para Os Gatos	2024-05-12T15:15:00.720Z	\N
0cbd1092-87c3-4877-a265-adb83eef128d	037ac262-4f35-42e0-83e1-4cdcceedb39c	Saco De Lixo 30l (resistente)	2024-05-12T15:45:48.125Z	\N
9cc1b7be-8b64-46f0-9d23-4103b9851257	5d50d3cf-4e36-4639-813d-d43de8886ac8	Sabão Líquido	2024-05-12T16:00:55.393Z	\N
a46e43f3-6678-402a-93de-efa7f8d42006	5d50d3cf-4e36-4639-813d-d43de8886ac8	Esponja	2024-05-12T16:03:10.750Z	\N
365c0732-be69-4de2-960e-d8f6d726bd48	03fdb0f2-6b50-4895-b970-5793cad80c86	Floral Calmante Pet	2024-05-12T16:09:40.944Z	\N
1bae9ae8-c59e-430c-b7e0-176e307d4a99	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Gazebo	2024-05-12T16:15:39.672Z	\N
7d8f08bd-0994-433f-890d-29690027bf6a	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Bolachas	2024-05-12T16:28:07.271Z	\N
dd65466a-5978-4879-80b8-be543d285774	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Fermento	2024-05-12T16:29:20.016Z	\N
324fc117-cf6b-4367-a7f1-8eb595c01377	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Tenis Feminino E Masculino Todos Os Tamanhos	2024-05-12T18:03:27.721Z	\N
ca9bc34e-c208-4a72-a365-408377a89314	03fdb0f2-6b50-4895-b970-5793cad80c86	Vermífugo Pra Gato	2024-05-12T17:41:35.555Z	\N
03df84a0-a3a2-42ff-b299-a9b30ffb52bd	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Casinhas De Cachorro	2024-05-12T18:08:34.821Z	\N
19237243-240d-4b13-b4b5-1cc2ae01571d	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Todynho	2024-05-12T18:09:29.112Z	\N
63683e0b-eb4b-4e46-99f4-377ca5bb26f0	718d5be3-69c3-4216-97f1-12b690d0eb97	Fraldas	2024-05-07T16:15:22.152Z	\N
c777f376-391c-4bff-b548-e19a8bf34ad6	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Papelão	2024-05-12T18:44:01.417Z	\N
77dd7bcd-f06b-4b11-8ae3-22cf778065e5	5d50d3cf-4e36-4639-813d-d43de8886ac8	Produto De Limpeza	2024-05-12T18:44:42.634Z	\N
62365799-1047-4107-bbc7-473df401eadb	5c9b6767-5310-461b-977b-906fe16370ae	Água Destilada Injetável	2024-05-12T19:55:39.277Z	\N
2f918372-5531-4e84-90a5-4520583e738c	5d50d3cf-4e36-4639-813d-d43de8886ac8	Pano De Limpeza	2024-05-12T19:56:24.684Z	\N
58f96d4b-1e5c-43a8-a202-8deb9d6ae422	4f95853f-d5e1-487d-8086-6ddfaf2bbab7	Impressora	2024-05-12T19:57:36.258Z	\N
9b92c2b9-8478-41da-9f2b-043ac372d20d	fd1f74c4-6723-4ffe-8657-773a943e65c4	Fita Isolante	2024-05-12T19:23:29.977Z	\N
d0699992-1962-4d21-97a5-63b7781f5440	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Fita Antiderrapante	2024-05-12T19:26:43.681Z	\N
776fde8c-1579-4b59-824e-a74bd1eb7018	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Massa De Bolo	2024-05-12T19:50:46.084Z	\N
f06d81a9-4cbd-4543-a79c-cdd9d02e553b	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Caneca Reutilizável	2024-05-12T19:57:06.261Z	\N
6f6a3e0c-d8c8-468f-b8d2-13370a988b72	5c9b6767-5310-461b-977b-906fe16370ae	Impressora Foto 📲	2024-05-12T19:57:57.836Z	\N
60a6078f-6aa7-43b1-acf7-660c25bd221e	718d5be3-69c3-4216-97f1-12b690d0eb97	Borracha De Cabelo	2024-05-12T19:58:24.020Z	\N
a25f338f-1fed-4412-844a-7e16962eb051	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Leite	2024-05-12T20:01:38.937Z	\N
e9199d5b-b091-4c0f-a1ae-614a6089eb30	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Fita Crepe	2024-05-12T20:02:07.419Z	\N
bf6f8778-d7d2-4d3b-8703-99de5e3caa5e	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Roupa De Cama Infantil	2024-05-12T20:22:38.130Z	\N
3a2d5542-e160-4192-974e-c0b0938b6b98	05583098-5f2e-44e2-b874-452ec86d9d3e	Jetskis	2024-05-07T16:15:26.829Z	\N
b2cddf26-7859-498f-95a0-76ef177196a5	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Auxiliar Veterinário	2024-05-12T20:04:22.827Z	\N
13f53b5e-8aa5-4212-999e-3da835a5b1d8	fd1f74c4-6723-4ffe-8657-773a943e65c4	Régua De Luz	2024-05-12T20:06:26.213Z	\N
69a463f6-2a70-4736-98ff-a63127c968ef	718d5be3-69c3-4216-97f1-12b690d0eb97	Barbeador Descartável	2024-05-12T20:47:49.402Z	\N
f9e4ebb7-1f4d-4a20-b18c-9d5e4d3984a0	5d50d3cf-4e36-4639-813d-d43de8886ac8	Desinfetante	2024-05-12T21:12:51.845Z	\N
180bed77-0c81-45d1-be29-b094c8263533	718d5be3-69c3-4216-97f1-12b690d0eb97	Desodorante Feminino	2024-05-12T21:15:14.501Z	\N
8e596eea-5ab7-480b-a22f-2af852198a92	03fdb0f2-6b50-4895-b970-5793cad80c86	Coleiras	2024-05-07T16:15:27.420Z	\N
e332e031-a18e-4407-81e9-660530260e64	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Cobertores	2024-05-07T16:20:45.101Z	\N
20d95bd9-0113-4b90-914e-7e1083cb5cd6	03fdb0f2-6b50-4895-b970-5793cad80c86	Lonas	2024-05-07T14:23:26.626Z	2024-05-07T16:45:25.577Z
8812cea7-01bc-4c7f-892d-cd0071589195	718d5be3-69c3-4216-97f1-12b690d0eb97	Desodorante Masculino	2024-05-12T21:15:01.335Z	\N
a736cad0-9135-4ac2-bb96-d40350b52658	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Sal	2024-05-07T16:39:42.208Z	2024-05-08T05:19:07.187Z
0fe9ff90-4190-4341-b775-986d9dd18bd5	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Tênis	2024-05-07T16:39:27.415Z	\N
c8642f4a-7ee0-49a7-aec8-e18eab2e2c69	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Enlatados	2024-05-07T16:40:04.034Z	\N
d8b0c9ec-39a1-44e4-9ccf-36b439e39368	718d5be3-69c3-4216-97f1-12b690d0eb97	Escova de cabelo	2024-05-07T00:58:52.951Z	2024-05-07T17:04:35.596Z
83c733cc-e2b0-4d93-990e-e2e05bf5187c	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Filtro de café 	2024-05-07T04:00:00.126Z	2024-05-07T17:31:15.639Z
5b5efd8a-6467-4496-bc81-966fbc441b54	fd1f74c4-6723-4ffe-8657-773a943e65c4	Extensão	2024-05-07T07:00:38.959Z	2024-05-07T17:42:21.699Z
2d2a7f10-0aa2-4c87-b5a8-3441cb569f10	5d50d3cf-4e36-4639-813d-d43de8886ac8	Itens de limpeza	2024-05-07T17:28:20.834Z	2024-05-07T23:57:30.045Z
2df34cb2-b419-4cd9-bac0-fee998327fd6	5d50d3cf-4e36-4639-813d-d43de8886ac8	Desinfetante	2024-05-06T18:12:00.180Z	2024-05-07T16:59:06.062Z
3810ff6f-2c32-4a64-a1c6-37be86fdaec6	c117dd37-82ab-43a6-bf66-d97acef97f6e	Jogo de cartas, baralho, dama e dominó, etc	2024-05-07T17:11:13.587Z	\N
fb004352-1213-42f9-a764-1f7a0cb34dd0	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas	2024-05-12T21:52:16.050Z	\N
0a238fb4-a6f0-4d93-9a1b-02245afa2513	5d50d3cf-4e36-4639-813d-d43de8886ac8	Corda de varal	2024-05-07T01:01:47.341Z	2024-05-07T17:04:07.635Z
f3eb355a-4868-48af-befc-38a8a565c8e4	5d50d3cf-4e36-4639-813d-d43de8886ac8	Rodo	2024-05-07T17:03:59.038Z	2024-05-07T20:48:47.209Z
e4cfa4d9-183d-42a4-8c39-994c734d8b49	718d5be3-69c3-4216-97f1-12b690d0eb97	Pomadas	2024-05-07T16:41:00.761Z	2024-05-07T22:09:16.657Z
f92f19df-fcfc-4187-ba73-3457c765e71a	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Sachê de molho	2024-05-07T04:00:20.696Z	2024-05-07T17:30:18.941Z
4bccd468-7b89-49f0-93d5-c761ff91c6fb	5c9b6767-5310-461b-977b-906fe16370ae	Pomada para assadura	2024-05-07T17:32:59.808Z	\N
f78c85b4-fcac-4854-970b-d80f201d5aa3	718d5be3-69c3-4216-97f1-12b690d0eb97	Itens de higiena pessoal	2024-05-07T17:33:29.768Z	2024-05-08T02:58:34.522Z
c0c07df3-6215-4b07-8240-f462315ec075	718d5be3-69c3-4216-97f1-12b690d0eb97	Kit Higiene Infantil	2024-05-12T21:58:04.851Z	\N
5a7c7193-ac38-4376-8ee4-d18034315a7c	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Turno da madrugada	2024-05-07T17:32:12.898Z	2024-05-07T22:42:10.227Z
0fe671e5-1f19-4370-ae9d-8e49afa92aba	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas grandes	2024-05-07T17:32:49.810Z	\N
b3d663ed-c0db-441a-83e8-0e4b0db58825	b3a81a9d-a964-4413-9a33-974a3b4673d1	Fisioterapeutas	2024-05-07T17:47:58.711Z	\N
ab74a1e0-5969-4d81-b28a-706ab2920afd	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Cueca Infantil Tamanho 6+	2024-05-12T22:06:11.643Z	\N
fe6cc6f1-779b-46d5-aa3f-7f57e08fecfa	be0e4018-ca46-44cd-b814-7681ba98c51a	Varal De Roupas	2024-05-12T22:07:10.872Z	\N
ca78881a-d77f-4292-87eb-24fafb1706e7	5d50d3cf-4e36-4639-813d-d43de8886ac8	Kit De Limpeza	2024-05-12T22:18:49.087Z	\N
c6995a7c-5298-490e-af14-8feaaedc3e7b	718d5be3-69c3-4216-97f1-12b690d0eb97	Kit De Higiene	2024-05-12T22:19:12.136Z	\N
cc5459a2-9b43-486b-8c3f-99c507c68562	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Sucos	2024-05-07T17:54:28.175Z	2024-05-08T15:40:07.474Z
55884181-02a9-4036-94ac-c6c2645deaef	03fdb0f2-6b50-4895-b970-5793cad80c86	Antibioticos - Shotapen	2024-05-07T18:13:42.153Z	2024-05-08T15:18:07.045Z
924ef7e4-1f7d-45ef-94a7-bd53435bf207	5c9b6767-5310-461b-977b-906fe16370ae	Fibra Alimentar Em Pó	2024-05-12T22:40:22.216Z	\N
35da1e4a-c8d2-4d9f-bd0b-ceec81216994	5c9b6767-5310-461b-977b-906fe16370ae	Ventilador	2024-05-07T17:57:30.883Z	2024-05-07T17:59:47.471Z
52634f35-73b2-4c60-99c9-1ec886f6e4b3	718d5be3-69c3-4216-97f1-12b690d0eb97	Sabonete infantil 	2024-05-07T18:54:26.469Z	\N
7d0f8cf5-9f10-4822-bcde-6b94d1738065	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calça moleton masculina - G	2024-05-07T18:59:23.302Z	2024-05-07T22:07:11.854Z
65437ee2-7b21-4796-a360-9ad17c50aef5	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Chinelos masculinos	2024-05-07T18:47:32.409Z	\N
8df22c40-25d7-4f96-8bc6-0fe734f948d3	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Lanches	2024-05-07T19:01:34.488Z	2024-05-08T00:05:43.458Z
46862e71-22b7-4023-ba93-2936050c6f9f	718d5be3-69c3-4216-97f1-12b690d0eb97	Toalha de Banho	2024-05-07T19:44:31.500Z	2024-05-07T19:51:17.148Z
1822d9b2-10f4-4e0d-a39a-b987ed707fae	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Moletom G/GG 	2024-05-07T18:59:39.453Z	2024-05-07T22:06:39.002Z
29a5dd12-fba3-49db-8c3a-13f706d195d7	03fdb0f2-6b50-4895-b970-5793cad80c86	Jornal	2024-05-07T18:58:47.125Z	\N
d98b2225-e6b9-4ba5-9085-ccdcc1d56af9	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa íntima masculina	2024-05-07T18:59:06.683Z	\N
115de606-b9d6-475b-953b-d838d8783dd6	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Pão	2024-05-07T17:55:03.463Z	2024-05-08T15:40:18.018Z
d7e04a50-cb47-40c5-a5d0-6155b9704cde	5c9b6767-5310-461b-977b-906fe16370ae	Protetor Auricular Para Ruídos	2024-05-12T22:41:29.618Z	\N
3c7d2c99-9efc-40f2-a97d-9bab659b7fd8	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Nescau Em Pó	2024-05-12T22:44:21.731Z	\N
63aacfa9-9d2d-45b3-90c5-c59af6de6f12	037ac262-4f35-42e0-83e1-4cdcceedb39c	Garfo e faca	2024-05-07T18:35:53.995Z	2024-05-07T18:36:34.363Z
8ef123b0-d60f-49b5-b4ef-1e015247b760	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	sapatos masculinos - tênis	2024-05-07T18:47:57.599Z	\N
1114f512-17b1-4c26-927e-5d9888029183	718d5be3-69c3-4216-97f1-12b690d0eb97	Creme de pentear	2024-05-07T19:01:22.550Z	\N
869ed149-9375-4fac-a687-d5450b53ceb8	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas femininas G/GG	2024-05-07T19:45:19.557Z	\N
0eb6f7b8-4a6c-4e0d-a518-bfdf5c46fa22	5d50d3cf-4e36-4639-813d-d43de8886ac8	Prendedor de roupas	2024-05-07T19:53:36.526Z	\N
d52b7643-1731-48cb-9859-797c159d67b7	03fdb0f2-6b50-4895-b970-5793cad80c86	Areia de gato	2024-05-07T18:36:13.682Z	2024-05-07T20:58:38.430Z
91c1ee8c-c4bc-4858-86cb-c47b80846004	03fdb0f2-6b50-4895-b970-5793cad80c86	Coberta para Pets	2024-05-07T18:57:48.647Z	\N
b1d8f194-15ac-4490-b062-d45434d41966	037ac262-4f35-42e0-83e1-4cdcceedb39c	Fita Durex larga	2024-05-07T19:03:33.691Z	\N
4ae4acec-ee0d-40f3-931c-37759e97ecff	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Café	2024-05-07T18:17:19.515Z	2024-05-08T13:53:07.673Z
36294c41-22ed-4750-afdd-ce758eff8a26	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Marmitas	2024-05-07T19:11:51.938Z	\N
27493e1f-4f5c-4149-aabf-9c4f6697a35f	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Macarrão	2024-05-07T18:18:07.151Z	2024-05-08T13:54:06.355Z
27c3707c-4a0b-4b43-8f8c-1b4bba103aa9	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Travesseiro	2024-05-07T18:46:56.688Z	\N
4124cef6-ffc1-40b7-8cb0-8b4a89dab6f2	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Frios	2024-05-07T20:39:29.055Z	\N
3aaefd40-754e-434d-b4af-180fdd60174c	5c9b6767-5310-461b-977b-906fe16370ae	Tatames	2024-05-07T18:22:58.756Z	2024-05-07T22:50:42.364Z
bd92845d-ebfc-4a62-94e8-881649dba98e	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Bermudas	2024-05-07T18:44:09.774Z	\N
cab34f52-bc3e-46d8-96f0-f5b20c7ca485	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Toalha de Banho	2024-05-07T18:46:46.309Z	\N
9af075ac-8d39-4843-8907-02ccb6b5910b	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Marmitas	2024-05-06T13:18:11.085Z	2024-05-07T18:53:22.475Z
64398b22-667d-43c5-8b68-17010f9927eb	03fdb0f2-6b50-4895-b970-5793cad80c86	Suplemento Pet	2024-05-12T23:14:57.885Z	\N
67063252-a1a8-4dc9-9b2e-61f3c58715c4	03fdb0f2-6b50-4895-b970-5793cad80c86	Teste De Cinomose	2024-05-12T23:15:37.397Z	\N
d2123a82-91a0-4f30-896b-61ee15ade670	718d5be3-69c3-4216-97f1-12b690d0eb97	Condicionador 	2024-05-07T19:05:57.847Z	\N
59ce1afa-2583-4810-b726-e8fa4c7e5464	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Potes (marmitex)	2024-05-07T19:47:18.039Z	2024-05-07T19:52:55.413Z
ba8261f2-7bfc-4714-9697-fae8668698ca	03fdb0f2-6b50-4895-b970-5793cad80c86	Parvovirose	2024-05-12T23:15:56.829Z	\N
2b87fe91-5cb1-44e6-adc6-706ed3537648	03fdb0f2-6b50-4895-b970-5793cad80c86	Fiv/felv	2024-05-12T23:16:49.728Z	\N
d4bfdb7f-b11d-405d-99c6-99c135eb89d4	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Casacos masculinos M/G/GG	2024-05-07T19:46:35.349Z	2024-05-07T22:06:56.156Z
7baf0c84-7658-4f5d-829a-36f6194c154f	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Proteínas	2024-05-07T20:37:14.193Z	\N
4c4b59cc-d639-4952-87e3-107c61c2a673	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Farinha de trigo	2024-05-07T20:39:56.596Z	\N
1b45a959-c141-4d5b-a112-49cc10985fa1	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Alimentos para consumo rápido (Leite, bolacha, suco, etc)	2024-05-07T20:40:23.082Z	\N
a1b158ff-170f-455e-93b1-adaaa18f104e	03fdb0f2-6b50-4895-b970-5793cad80c86	Leishmaniose	2024-05-12T23:16:34.777Z	\N
3ac0d7d4-9de0-4869-a18f-00cd6d0eefe7	03fdb0f2-6b50-4895-b970-5793cad80c86	Termômetro Pet	2024-05-12T23:17:31.454Z	\N
f9be3465-b660-4e00-a5c7-0c876cb8f34c	5c9b6767-5310-461b-977b-906fe16370ae	Estetoscópio	2024-05-12T23:18:01.574Z	\N
7c906f4f-f23c-4367-97d3-db1bb27fca73	03fdb0f2-6b50-4895-b970-5793cad80c86	Balança De Precisão	2024-05-12T23:18:45.963Z	\N
f140de4d-306f-4925-9dc3-bdef9bfcbaae	03fdb0f2-6b50-4895-b970-5793cad80c86	Herbalvet Ou Vet+20	2024-05-12T23:20:56.642Z	\N
b813d3b5-bf55-443b-b1a4-be3d426af4e9	718d5be3-69c3-4216-97f1-12b690d0eb97	Fralda RN	2024-05-07T20:55:03.541Z	\N
52bd1913-9ae1-413d-8258-205049df62e6	718d5be3-69c3-4216-97f1-12b690d0eb97	Roupa íntima feminina	2024-05-07T21:32:40.164Z	\N
2477f44f-2324-4eec-a191-10ad25b564e9	03fdb0f2-6b50-4895-b970-5793cad80c86	Caixa de areia (gato)	2024-05-07T18:36:00.053Z	2024-05-07T20:58:52.736Z
07249168-622c-442a-a00a-5264f3a26f74	05583098-5f2e-44e2-b874-452ec86d9d3e	Caminhão Pipa	2024-05-07T20:56:33.956Z	\N
ab8709c7-2655-4f0f-b1bc-68363acf5f87	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Leite em pó	2024-05-07T22:57:09.823Z	\N
15121282-bdc8-4096-845b-974401b2e6aa	718d5be3-69c3-4216-97f1-12b690d0eb97	Shampoo	2024-05-07T15:34:57.838Z	2024-05-07T23:57:51.857Z
5a4901b0-14eb-4c88-92ff-bb82aff88094	718d5be3-69c3-4216-97f1-12b690d0eb97	Máscara	2024-05-07T22:41:31.631Z	\N
60852499-daab-47a4-a8b1-330951fe3eb2	03fdb0f2-6b50-4895-b970-5793cad80c86	Jornal	2024-05-07T22:16:40.116Z	\N
85255f2d-f774-48bb-aeec-66b711ebcd2c	03fdb0f2-6b50-4895-b970-5793cad80c86	Tatames	2024-05-07T18:57:34.515Z	2024-05-07T22:00:03.748Z
c1ab18aa-8133-465e-b850-354e70b8b9a5	ad0b5516-3eba-4368-8724-5cfb6a3ea2d3	Caixa De Feira	2024-05-12T23:53:02.223Z	\N
79930f4e-e408-4332-b8af-5510f34bccc2	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Lençol	2024-05-13T00:17:02.277Z	\N
cc4fe301-5eaa-4792-bfd0-33ee4f4a64ad	718d5be3-69c3-4216-97f1-12b690d0eb97	Desodorante roll-on sem álcool	2024-05-07T21:31:40.304Z	2024-05-08T14:26:58.669Z
e904d182-a778-4fac-94fb-61cfc5b6a8ba	5c9b6767-5310-461b-977b-906fe16370ae	Fita Durex larga	2024-05-07T22:40:24.728Z	\N
caa77bd6-4cf9-44a5-aa24-2e68c899081a	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Arroz	2024-05-07T22:35:15.159Z	2024-05-08T00:17:04.836Z
01794c4c-0038-4330-a478-0d10c85fb2d0	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Feijão 	2024-05-07T22:34:57.148Z	2024-05-08T00:17:10.414Z
f013501e-e9ea-478f-af0d-648f96244b14	718d5be3-69c3-4216-97f1-12b690d0eb97	Roupa íntima masculina	2024-05-07T21:33:03.055Z	2024-05-08T14:22:34.274Z
39b95236-1136-4154-b79d-a03b7e04be02	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntário - Madrugada	2024-05-07T21:59:55.400Z	2024-05-08T02:47:00.501Z
294b5457-2501-434a-8b58-b386256e4f04	03fdb0f2-6b50-4895-b970-5793cad80c86	Banho E Tosa	2024-05-13T00:04:46.487Z	\N
524bb8ae-a002-41f4-971c-807f9d3c016c	5c9b6767-5310-461b-977b-906fe16370ae	Shampoo Para Piolho	2024-05-13T00:14:03.227Z	\N
2a340b8d-52f2-4c15-9424-fc97bb70dc30	05583098-5f2e-44e2-b874-452ec86d9d3e	Caminhões	2024-05-07T22:12:30.701Z	\N
74dc7f47-7298-418b-9b5b-04c47914721b	5c9b6767-5310-461b-977b-906fe16370ae	Repelente	2024-05-07T22:41:12.321Z	\N
1ca48fb5-6df6-4884-ac61-9c9760041ee1	fd1f74c4-6723-4ffe-8657-773a943e65c4	Lonas	2024-05-07T23:13:18.203Z	2024-05-08T15:41:16.899Z
47f6a9ff-9285-4814-8697-29045eb4ac49	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas plus size	2024-05-07T23:30:40.840Z	\N
a1c072fc-9a1d-4f28-a543-b6f21a7863c0	037ac262-4f35-42e0-83e1-4cdcceedb39c	Luvas	2024-05-07T23:01:21.080Z	\N
2f3a8fa1-713c-4e53-82c9-d95a0383c345	037ac262-4f35-42e0-83e1-4cdcceedb39c	Fraldas Geriatricas	2024-05-07T22:53:43.814Z	\N
5473935f-6588-4ee8-ba0d-ec90f9d6b6fd	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Camiseta Manga Curta	2024-05-13T00:18:07.257Z	\N
d7169b4a-e0ef-469b-8427-f2191ebe432b	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina	2024-05-07T23:33:14.902Z	\N
fcfdeaeb-0760-4f93-bac9-76b804551ce9	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Suco de caixinha	2024-05-06T18:20:45.034Z	2024-05-07T23:58:12.123Z
5992e29f-0982-4f26-b0fd-7b44fc6c08fd	5c9b6767-5310-461b-977b-906fe16370ae	Oléo	2024-05-07T22:35:34.804Z	2024-05-08T00:17:33.694Z
e4e767ff-be22-4c15-99a3-fac2b97683df	718d5be3-69c3-4216-97f1-12b690d0eb97	Shampoo	2024-05-08T01:21:03.786Z	\N
5e3faa0a-8bf7-4182-b057-cec38d4bed2d	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Travesseiro	2024-05-08T00:33:52.817Z	\N
025d81fb-d637-469e-b992-697aece2e53d	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina De Inverno G/gg	2024-05-13T00:44:39.838Z	\N
bbdd5c64-f80e-4233-9928-7931fe5e3703	03fdb0f2-6b50-4895-b970-5793cad80c86	Seringas	2024-05-08T00:13:21.171Z	\N
b00827d0-bac9-4338-8afd-7fae5a79612f	fd1f74c4-6723-4ffe-8657-773a943e65c4	Luva de Latex Descartável	2024-05-08T01:12:45.846Z	2024-05-08T12:54:54.549Z
ad9a4dad-3dc5-46b3-b387-889fc5b0b186	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Masculina Adulta	2024-05-08T01:16:12.507Z	\N
8c4ed7fa-8b92-492e-bf05-94d2fd4f5016	5d50d3cf-4e36-4639-813d-d43de8886ac8	Detergente	2024-05-08T01:16:53.833Z	2024-05-08T01:17:04.276Z
eb01d39b-e347-4a3f-a0ea-f59f916a2236	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Sapato Masculino 	2024-05-08T01:19:28.222Z	\N
6d965a4b-3b38-4418-a95e-b0aec0e0eb7a	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Leite em pó	2024-05-08T01:20:13.517Z	\N
3a9fc3a5-6dcb-423f-812e-3175b59ea51c	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Feijão	2024-05-08T01:21:36.563Z	\N
69732c83-e2ee-481f-b4c5-e55932e8d51f	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Azeite	2024-05-08T01:21:45.114Z	\N
4fe297e6-4d45-445e-93a1-0f59f9fb5d68	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Sapato Infantil 	2024-05-08T01:21:57.223Z	\N
c38e4aa6-bc90-4592-ae7d-95d93de12ec4	5c9b6767-5310-461b-977b-906fe16370ae	Polenta	2024-05-08T01:28:16.543Z	\N
c1e4ef3f-0d86-418f-9d9f-05f028246bed	718d5be3-69c3-4216-97f1-12b690d0eb97	Fralda XG e XXG	2024-05-08T01:35:51.498Z	\N
4d57d380-9335-4127-83fc-a54c7feeb0aa	5c9b6767-5310-461b-977b-906fe16370ae	Freezer	2024-05-08T01:47:36.020Z	2024-05-08T01:48:06.476Z
5e2c418e-729b-4f4f-bef7-db807ca37de3	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Ventilador	2024-05-08T02:03:21.070Z	\N
603dec10-b1e7-4034-aa4b-b0362347387b	5d50d3cf-4e36-4639-813d-d43de8886ac8	Latas de lixo	2024-05-08T01:38:27.257Z	\N
61a8eb1b-7e23-43bd-8ad2-edc43843314b	037ac262-4f35-42e0-83e1-4cdcceedb39c	Copos Descartáveis 180ml	2024-05-13T03:27:31.275Z	\N
3f4a6357-7a1b-4c64-a48b-7c6136e3f472	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Gatorade/Isotônico	2024-05-08T01:39:16.288Z	\N
634649db-5f8b-47b8-a034-f3a78c53dbfe	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntário - Madrugada	2024-05-06T13:04:28.501Z	2024-05-08T01:41:08.441Z
dbcb6fc3-02b4-4e31-8924-ed56f0e6ecc1	718d5be3-69c3-4216-97f1-12b690d0eb97	Itens de higiena pessoal	2024-05-08T01:44:33.184Z	\N
e4f030c3-a985-4cc0-8336-9b55e1acc79f	5d50d3cf-4e36-4639-813d-d43de8886ac8	Itens de limpeza	2024-05-08T01:44:43.317Z	\N
53743f4f-eded-4145-b56e-224eab9471ec	fd1f74c4-6723-4ffe-8657-773a943e65c4	Luz de Emergência	2024-05-08T01:09:38.515Z	2024-05-08T12:55:33.404Z
24857c6e-7fe5-45e8-9cc5-c5858390c06d	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Molho de tomate	2024-05-08T02:04:25.978Z	2024-05-08T02:05:38.414Z
5c1839cf-e5e9-4963-9018-c4d6f9ac5aeb	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Plástico filme	2024-05-08T02:04:43.531Z	2024-05-08T15:41:02.235Z
0f0fffef-ec91-4dc1-b8ac-41d189b1b026	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Gelo	2024-05-08T02:43:15.092Z	\N
fc763265-b328-4fa5-9975-307e97ec35ca	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Calçado masculino	2024-05-08T02:44:34.563Z	2024-05-08T02:44:44.370Z
5ea0fec2-32ed-4302-9ef1-1daac2556be9	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Máquina de lavar roupa	2024-05-08T02:47:32.148Z	\N
496185c5-16e8-4576-9778-0514ca727dbc	718d5be3-69c3-4216-97f1-12b690d0eb97	Aparelho de barbear	2024-05-07T16:22:03.975Z	2024-05-08T02:58:00.013Z
66329b48-ccaf-4fa1-a2f6-3ad4ff61b82d	037ac262-4f35-42e0-83e1-4cdcceedb39c	Sacolinhas plasticas para kits 	2024-05-08T12:02:03.845Z	\N
e99b7beb-668d-45f0-b368-6fad52f284a5	5c9b6767-5310-461b-977b-906fe16370ae	Itens de limpeza	2024-05-07T10:53:21.931Z	2024-05-08T05:08:02.387Z
a75e630a-4b6f-4b5e-b013-12770df0a6f8	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Suco de caixinha	2024-05-08T10:49:05.414Z	\N
721ae863-981f-4184-ad2d-e0b0b5d7647e	6e6aaf88-b9fb-4a38-ab92-0db63c30e3f8	Voluntários Para Cozinha	2024-05-13T11:58:02.432Z	\N
14274ddb-ffb6-429c-9aa2-e68ece7d1ab9	03fdb0f2-6b50-4895-b970-5793cad80c86	Remédios para pets	2024-05-08T04:30:16.167Z	\N
112f1380-ebef-4697-87e8-7cb8a1e05cf7	718d5be3-69c3-4216-97f1-12b690d0eb97	Sacolas ou sacos plásticos 	2024-05-08T10:30:46.714Z	\N
883fd833-4187-4b99-82a4-0afc665a899a	5c9b6767-5310-461b-977b-906fe16370ae	Gás	2024-05-08T10:42:44.915Z	\N
2c0eabfd-5c22-4174-b93d-b814a7706b9e	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Embalagem descartável para as marmitas	2024-05-08T02:04:02.781Z	2024-05-08T15:41:08.945Z
251dcbe0-fcd2-47d9-9527-3de6aaf26281	5c9b6767-5310-461b-977b-906fe16370ae	Azitotromicina	2024-05-08T10:46:19.201Z	\N
d1afbc6f-fcab-421a-89fc-10bec2fdd4ff	5c9b6767-5310-461b-977b-906fe16370ae	Colírio 	2024-05-08T10:46:51.353Z	\N
a257142f-813f-4450-bf2c-8ce9a51d86ed	5c9b6767-5310-461b-977b-906fe16370ae	Antibiótico 	2024-05-08T10:47:09.989Z	\N
2d3cf6fc-8424-47d6-8908-903526827010	03fdb0f2-6b50-4895-b970-5793cad80c86	Ração 	2024-05-08T11:52:30.536Z	\N
974734e0-3a85-47e5-92bb-a7eb378c3c93	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Xampu Adulto	2024-05-13T12:42:14.307Z	\N
f3c395aa-63af-4264-99e0-2bd29760c62e	718d5be3-69c3-4216-97f1-12b690d0eb97	Lenços umedecidos	2024-05-08T13:41:01.048Z	\N
22d6eaff-3933-418f-9287-7e45c300bfad	718d5be3-69c3-4216-97f1-12b690d0eb97	Cortador de unhas	2024-05-08T13:42:53.302Z	\N
063d43f1-9f08-4943-8f82-b51aa4e49924	718d5be3-69c3-4216-97f1-12b690d0eb97	Pomada para assadura	2024-05-08T13:29:57.355Z	\N
e6d4396b-4097-4acf-a4e8-aac46722ad68	5d50d3cf-4e36-4639-813d-d43de8886ac8	Pá de lixo	2024-05-08T13:40:00.766Z	2024-05-08T13:50:30.458Z
59991d33-10e6-48af-be3e-274fa5960fc2	718d5be3-69c3-4216-97f1-12b690d0eb97	Itens para criança 	2024-05-08T13:28:07.915Z	\N
689c1d43-a7ee-4b95-97df-1558fbfcb863	718d5be3-69c3-4216-97f1-12b690d0eb97	Desodorante 	2024-05-08T13:28:40.632Z	\N
ffc9891b-43d3-4134-8e9c-7ada4690d076	718d5be3-69c3-4216-97f1-12b690d0eb97	Sabonete glicerinado (para machucados)	2024-05-08T13:29:09.801Z	\N
8980a8e1-5aa6-4168-8cd6-e06f6ab9275a	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Refrigerante pequeno	2024-05-08T10:49:37.352Z	2024-05-08T13:44:39.386Z
060bd404-4214-469e-bac3-ea801400ea5e	037ac262-4f35-42e0-83e1-4cdcceedb39c	Sacolinhas plasticas para kits 	2024-05-08T13:35:17.661Z	\N
15129370-e9f5-4797-87cf-225625bc7642	718d5be3-69c3-4216-97f1-12b690d0eb97	Guardanapo de papel	2024-05-08T13:34:41.526Z	\N
73fbacb1-0736-49ec-8873-80ddd65608a2	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa íntima masculina e feminina	2024-05-08T13:35:25.096Z	\N
c31acdf4-e0c4-44a1-b95f-ac267fa6b75f	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa plus size	2024-05-08T13:35:50.123Z	\N
a1f3cbac-ed68-4875-85a3-dae686767837	5d50d3cf-4e36-4639-813d-d43de8886ac8	Pá de lixo	2024-05-08T13:38:46.819Z	\N
9092081f-0160-44ed-bc7d-2aa1819390f5	5c9b6767-5310-461b-977b-906fe16370ae	Hipoglós	2024-05-08T13:39:38.007Z	2024-05-08T13:41:09.036Z
92542ce7-d1b9-4da5-9c93-38698fd0f042	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas GG	2024-05-08T13:42:27.646Z	\N
9798cd10-1d06-42a0-921b-83e17b91a90c	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Bolachinha 	2024-05-08T10:49:27.210Z	2024-05-08T13:44:33.386Z
c8ce7a65-be98-4e38-beaa-b9907dc003e9	718d5be3-69c3-4216-97f1-12b690d0eb97	Fraldas Geriátricas	2024-05-08T13:44:27.004Z	\N
a8c18a44-ec60-4a19-8e96-785c49de9630	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Toddynho	2024-05-08T10:48:50.546Z	2024-05-08T13:44:16.982Z
b8598db7-a21f-4bba-8ed4-d0317b0a5df8	718d5be3-69c3-4216-97f1-12b690d0eb97	Xampu Infantil	2024-05-13T12:42:50.387Z	\N
4eb7c42e-8499-438d-9298-3ca063eca896	60d6808e-9d13-484d-84a4-2ca35d42b3a6	Pallets	2024-05-08T14:38:08.709Z	\N
a3b72470-8acf-43e6-a60e-e81685fb330d	03fdb0f2-6b50-4895-b970-5793cad80c86	Luvas	2024-05-08T14:20:56.180Z	\N
7a8d33b7-5d02-4c6a-9df8-9cecd60e43ed	718d5be3-69c3-4216-97f1-12b690d0eb97	Tapete higiênico	2024-05-08T14:39:13.786Z	\N
31ed387d-9786-44eb-88fb-3e19e00ba53a	037ac262-4f35-42e0-83e1-4cdcceedb39c	Touca Descartável	2024-05-08T14:37:58.920Z	\N
8cecd68c-96df-49c9-a31f-364684470302	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Fórmula Número 2 (6-12)	2024-05-13T12:48:09.863Z	\N
f040d5f7-db89-4068-a735-9c0082f30710	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Sapato masculino 43/44	2024-05-08T14:18:29.029Z	\N
599bee49-16ea-4ea6-9a4a-ae3043926417	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Frutas	2024-05-08T14:19:56.118Z	\N
32c65e0d-592c-4003-b071-bb11449e6de8	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Açúcar 1kg	2024-05-13T12:49:10.200Z	\N
d3076d4b-a694-4325-b6bd-cf0753ee8605	5c9b6767-5310-461b-977b-906fe16370ae	Carprofeno	2024-05-13T12:50:24.731Z	\N
8550fcc0-103c-46ee-a632-7cbb45f1b74a	037ac262-4f35-42e0-83e1-4cdcceedb39c	Talher Descartável 	2024-05-08T14:25:04.086Z	\N
33ad04bc-0c6c-4137-98c2-4ad8ca9559ef	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Alimentos Diets	2024-05-08T14:25:38.271Z	\N
bfc24026-7f89-4a46-b9d3-b5ea5046d2d9	5c9b6767-5310-461b-977b-906fe16370ae	Agemoxi	2024-05-13T12:51:32.110Z	\N
6ee709d9-f990-41e3-9f92-a75f8d5e4855	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Ração gato	2024-05-08T14:37:05.612Z	\N
3b38eca1-e08a-451f-aa40-d2138daa2b08	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa Xxx G - Masculina	2024-05-13T12:59:32.647Z	\N
ecfa6079-84f1-41f8-a86f-cf0e133a135e	5d50d3cf-4e36-4639-813d-d43de8886ac8	Sacolas Para Montar Kits	2024-05-08T14:45:46.856Z	\N
aa508257-4477-47e7-8c39-77b8b39fe8bb	5c9b6767-5310-461b-977b-906fe16370ae	Remédio para piolho	2024-05-08T15:03:41.319Z	\N
f33825fd-e6b0-47bb-80c0-80aef8a42e19	718d5be3-69c3-4216-97f1-12b690d0eb97	Xampu Adulto	2024-05-13T13:02:15.483Z	\N
70ca14b1-0240-4bc7-902c-903fbe74da31	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Filtro de café 	2024-05-08T15:05:41.441Z	\N
25f492ea-fb52-4085-929c-6a53ee6a0537	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Capa De Chuva Resistente	2024-05-13T13:27:31.982Z	\N
fea081c1-7939-4516-97a5-f2cd49177577	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupa íntima 	2024-05-08T15:34:51.112Z	\N
58c7d1c9-8e7f-4d68-8ede-da32a40500bc	a3e3bdf8-0be4-4bdc-a3b0-b40ba931be5f	Achocolatado pronto	2024-05-07T17:54:39.064Z	2024-05-08T15:40:13.834Z
258deaa1-d4c1-4e51-9a29-9883f68d506d	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas plus size masculino	2024-05-08T15:58:57.509Z	\N
2fe71172-ab32-490e-91ae-0ec727bd3d52	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas plus size feminina	2024-05-08T15:59:23.476Z	\N
fcffd019-56c9-4949-8a10-6b6f5104291c	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas íntimas plus size feminina	2024-05-08T15:59:59.447Z	\N
d1a27ea2-0281-4c95-9154-6509ede0f2dd	bf8b5e09-544f-4eff-9bb7-6220aaa34a85	Roupas íntimas plus size masculina	2024-05-08T16:00:15.861Z	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, login, password, phone, created_at, updated_at, "accessLevel", "lastName") FROM stdin;
84ba4031-5d2a-4d08-92c4-d408b1fc9a01	Khaian	51986442912	$2b$10$CRQosa6H1EtMkHcx/BsOGu0seHoaKm95KQ2Dl3x.PO7yW2WnlM5we	51986442912	2024-05-12T02:46:19.948Z	\N	Staff	Khaian
29805419-78ec-435f-9fb3-41f3102d9b4d	Kiwi	51981424282	$2b$10$5hu.XO8xmATx8wrTSSppveHVlgjR8wyKnHCsXreOH4bmJ2dW3RN0.	51981424282	2024-05-08T19:01:24.205Z	\N	Staff	Kiwi
90d1d707-3b34-4c9d-a025-b26dcc035304	Flávia	51997522219	$2b$10$QUEKmG.q/sQsW0HRzl/pkuG3Px.6kNJXGzIXJRLrqfKp5WVv3m8.K	51997522219	2024-05-08T16:30:13.413Z	\N	Staff	Flávia
7b945635-bd9e-4303-a82f-bf2020ac991a	Luiza	11977901702	$2b$10$ans713ppfQV3bJSZqfBpUe/JQ5pXGQoVCC7vh9Cv2CQcZ.4ymOnS6	11977901702	2024-05-12T21:10:25.080Z	\N	Staff	Buscatti
c2adf14c-d19b-4f33-8d24-539daea23742	Betina	19998965005	$2b$10$DNMWE67PtvU8fbDtiA0HZOjre3ovAehEYW4iyLmXcq7Ooq4pkxqH2	19998965005	2024-05-12T21:12:23.590Z	\N	Staff	Faccioni
0bffa8f5-1e8d-455a-bd72-19ab9cc3f18c	Guilherme	51982698262	$2b$10$8HltNdzCoEKFoBYAjRYle.9M9ymiZkJzsU13EpOgEcZIxM7EsErr6	51982698262	2024-05-11T13:37:40.792Z	\N	Admin	Kudiess
a8a90d10-897f-4696-9be0-4943cd0dc63a	Martina	51992598168	$2b$10$JmTmoAy81i5yQgV6TlcX8urTqpMy969Tn2auu772PEoHG4RXm3SgK	51992598168	2024-05-11T13:32:22.317Z	\N	Admin	Martina
2a59c526-6ee4-4cb6-acbb-3d4968203153	Vitória	51996632125	$2b$10$VTcAypqQxjJ9SWNCiZd/heksN/G1XpCWvFCvhHDy2MerIkRFtXI0e	51996632125	2024-05-11T13:43:31.129Z	\N	Admin	Prates
470c4697-7d92-497b-af6c-0033e92d0e39	Fernanda	51991928272	$2b$10$BbQWn/w4W0S5UScNXTm6o.H075DmAGIfFzck0kefO3jhEaK6RybOq	51991928272	2024-05-11T13:43:59.525Z	\N	Admin	Gasperin
e82f476a-1574-4dd2-a4c4-1c1f0117db12	Rhuam	51992047974	$2b$10$vcgCucLQgLCvcg.jaYqtbem.iK3QFqocmRhlp6RLr01fx0H/kkEda	51992047974	2024-05-05T22:06:11.390Z	2024-05-11T13:44:50.104Z	Admin	Estevam
b76d69fe-a01e-4e09-9a7b-d8e2f2be6778	Daniela	995189224	$2b$10$vAI9NxBPTCfiKtpuVm8FQ.nKtOdfVuwZoJHfeCdXv73WWXeUyrAbe	995189224	2024-05-11T17:48:56.695Z	\N	DistributionCenter	Bonesi
e9095154-c23b-4b58-9bcd-d86b2f178d7a	Gabriel	992269446	$2b$10$DDHCHCacBiG0mjBUHl8eh.rXn4oG/RlxlAJreZOi2f1VEAolgyw9K	992269446	2024-05-11T17:49:11.407Z	\N	DistributionCenter	Mancuso
359bf612-0a01-409f-b6c7-58cc1d036dcc	Sabrina	998313108	$2b$10$IrWky7pGNREdbi.GScJiG.l8PJogxDcshzHWtRcypbbBfTy2sYxQG	998313108	2024-05-11T19:10:30.118Z	\N	DistributionCenter	Hennemann
677e7772-788a-4aed-b4da-268b00117a2d	Daniel	51997635839	$2b$10$B5OPdR8k6UR/c9nCoPUhdeo2ScE00GgqU71upDc6tXcjoZy9jhOfO	51997635839	2024-05-11T21:46:08.285Z	\N	Staff	Severino
43287099-3523-4e0a-8919-cae4f31e221e	Lúcia	51981566767	$2b$10$he/RUsc5bZef/aeAV8oRTOIGRAYaHfKgvXnGGw.gW/exb6kAPNzYW	51981566767	2024-05-11T21:27:19.022Z	\N	Staff	Anversa
ee09490c-8d19-4b90-ad3c-4c86b1e2ea4e	Marianne	51999433518	$2b$10$nEF66PeDfZnVvFJ8Kkzg2eZhuKbQTyK8P5GK1ltCQ/D8ewAlnvxgS	51999433518	2024-05-12T23:39:28.278Z	\N	Staff	Bundan
83495699-d24f-4ee8-b38b-6d626fd70a50	Michelle	51996099905	$2b$10$6yQXJmv8a.8x5/MCIao5kOoij12ZTf6lyZwBjRzTXNnxBsuIxhcuq	51996099905	2024-05-12T23:39:03.140Z	\N	Staff	Bundan
e0306bc0-8c29-429a-bbd2-384f48d4f993	Dinho	31996675945	$2b$10$V4hFTbT7MrskROc4TI2lNe6gAd0g7U1niziAPycFueLhPJRFIfoGm	31996675945	2024-05-05T22:04:59.468Z	2024-05-09T17:56:55.037Z	Admin	Duarte
493c1562-bfbb-416f-80fd-934170127c1e	Klaus	51984269923	$2b$10$lWOrymC0XYx8mOrXVxH/iearHroOnsPj4gGyOo7Ef3Ox/7QCyO0cq	51984269923	2024-05-09T01:23:15.197Z	\N	Admin	Riffel
f9076897-55f3-42ba-9b97-d5f59da236cc	Juliana	5199965099	$2b$10$w2rpZlPEIT8b90ngWFIXS.E9UunBxwgNdvjzWYodyebJMA5VUpJH.	5199965099	2024-05-13T11:41:23.826Z	\N	Staff	PMPA
c46ed8c7-8b31-477b-9a90-a1abc9f43371	Patrícia	51992966082	$2b$10$PIGFIocNbZh0hxD4f9poiumLeZfkj4zJ4zYYC4.ZtT1v2JhTIC3P2	51992966082	2024-05-14T14:33:26.953Z	\N	Admin	Soares
\.


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: category_supplies category_supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_supplies
    ADD CONSTRAINT category_supplies_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: shelter_managers shelter_managers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shelter_managers
    ADD CONSTRAINT shelter_managers_pkey PRIMARY KEY (shelter_id, user_id);


--
-- Name: shelter_supplies shelter_supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shelter_supplies
    ADD CONSTRAINT shelter_supplies_pkey PRIMARY KEY (shelter_id, supply_id);


--
-- Name: shelters shelters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shelters
    ADD CONSTRAINT shelters_pkey PRIMARY KEY (id);


--
-- Name: supplies supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplies_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: category_supplies_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX category_supplies_name_key ON public.category_supplies USING btree (name);


--
-- Name: shelters_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX shelters_name_key ON public.shelters USING btree (name);


--
-- Name: shelters_pix_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX shelters_pix_key ON public.shelters USING btree (pix);


--
-- Name: users_login_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_login_key ON public.users USING btree (login);


--
-- Name: users_phone_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_phone_key ON public.users USING btree (phone);


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: shelter_managers shelter_managers_shelter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shelter_managers
    ADD CONSTRAINT shelter_managers_shelter_id_fkey FOREIGN KEY (shelter_id) REFERENCES public.shelters(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: shelter_managers shelter_managers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shelter_managers
    ADD CONSTRAINT shelter_managers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: shelter_supplies shelter_supplies_shelter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shelter_supplies
    ADD CONSTRAINT shelter_supplies_shelter_id_fkey FOREIGN KEY (shelter_id) REFERENCES public.shelters(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: shelter_supplies shelter_supplies_supply_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shelter_supplies
    ADD CONSTRAINT shelter_supplies_supply_id_fkey FOREIGN KEY (supply_id) REFERENCES public.supplies(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: supplies supplies_supply_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplies_supply_category_id_fkey FOREIGN KEY (supply_category_id) REFERENCES public.category_supplies(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: DATABASE "sos_rs_db"; Type: ACL; Schema: -; Owner: postgres
--

GRANT CONNECT ON DATABASE "sos_rs_db" TO rdsadmin;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO staffsos;
GRANT ALL ON SCHEMA public TO rdsadmin;


--
-- Name: TABLE _prisma_migrations; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public._prisma_migrations TO staffsos;
GRANT ALL ON TABLE public._prisma_migrations TO rdsadmin;


--
-- Name: TABLE category_supplies; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.category_supplies TO staffsos;
GRANT ALL ON TABLE public.category_supplies TO rdsadmin;


--
-- Name: TABLE sessions; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.sessions TO staffsos;
GRANT ALL ON TABLE public.sessions TO rdsadmin;


--
-- Name: TABLE shelter_managers; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.shelter_managers TO staffsos;
GRANT ALL ON TABLE public.shelter_managers TO rdsadmin;


--
-- Name: TABLE shelter_supplies; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.shelter_supplies TO staffsos;
GRANT ALL ON TABLE public.shelter_supplies TO rdsadmin;


--
-- Name: TABLE shelters; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.shelters TO staffsos;
GRANT ALL ON TABLE public.shelters TO rdsadmin;


--
-- Name: TABLE supplies; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.supplies TO staffsos;
GRANT ALL ON TABLE public.supplies TO rdsadmin;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.users TO staffsos;
GRANT ALL ON TABLE public.users TO rdsadmin;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO rdsadmin;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO rdsadmin;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT ON TABLES TO staffsos;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO rdsadmin;


--
-- PostgreSQL database dump complete
--

