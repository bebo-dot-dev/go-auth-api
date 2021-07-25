--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)

-- Started on 2021-07-24 04:43:35 BST

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

DROP DATABASE auth_data;
--
-- TOC entry 3066 (class 1262 OID 26312)
-- Name: auth_data; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE auth_data WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_GB.UTF-8';


ALTER DATABASE auth_data OWNER TO postgres;

\connect auth_data

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
-- TOC entry 2 (class 3079 OID 26313)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 256 (class 1255 OID 26399)
-- Name: add_account(integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.add_account(p_account_type_id integer, p_username character varying, p_password character varying) RETURNS integer
    LANGUAGE sql
    AS $$
INSERT INTO public.accounts
(
	account_type_id, 
	username, 
	account_password
)
SELECT
	p_account_type_id,
	p_username,
	crypt(p_password, gen_salt('md5'))
WHERE
    NOT EXISTS (SELECT id FROM public.accounts WHERE username = p_username)
	RETURNING id;
$$;


ALTER FUNCTION public.add_account(p_account_type_id integer, p_username character varying, p_password character varying) OWNER TO postgres;

--
-- TOC entry 243 (class 1255 OID 26351)
-- Name: authenticate(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.authenticate(p_username character varying, p_password character varying) RETURNS TABLE(account_id integer, authenticated boolean)
    LANGUAGE sql
    AS $$
SELECT
	id,
	(a.account_password = crypt(p_password, a.account_password)) Authenticated
FROM
	public.accounts a
WHERE
	a.username = p_username
$$;


ALTER FUNCTION public.authenticate(p_username character varying, p_password character varying) OWNER TO postgres;

--
-- TOC entry 244 (class 1255 OID 26352)
-- Name: create_account(smallint, character varying, character varying, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.create_account(p_account_type_id smallint, p_username character varying, p_password character varying, INOUT p_account_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN	
	INSERT INTO public.accounts
	(
		account_type_id,
		username,
		account_password
	)
	VALUES
	(
		p_account_type_id,	
		p_username,
		crypt(p_password, gen_salt('md5'))
	)
	RETURNING id INTO p_account_id;
END
$$;


ALTER PROCEDURE public.create_account(p_account_type_id smallint, p_username character varying, p_password character varying, INOUT p_account_id integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 26353)
-- Name: account_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_type (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.account_type OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 26359)
-- Name: account_type_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."account_type_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."account_type_Id_seq" OWNER TO postgres;

--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 202
-- Name: account_type_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."account_type_Id_seq" OWNED BY public.account_type.id;


--
-- TOC entry 203 (class 1259 OID 26361)
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    account_type_id integer NOT NULL,
    created_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    username text NOT NULL,
    account_password text NOT NULL,
    account_status_id integer DEFAULT 1 NOT NULL,
    accept_marketing boolean DEFAULT true NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 26370)
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO postgres;

--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 204
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- TOC entry 205 (class 1259 OID 26372)
-- Name: record_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.record_status (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.record_status OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 26378)
-- Name: record_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.record_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.record_status_id_seq OWNER TO postgres;

--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 206
-- Name: record_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.record_status_id_seq OWNED BY public.record_status.id;


--
-- TOC entry 2911 (class 2604 OID 26380)
-- Name: account_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type ALTER COLUMN id SET DEFAULT nextval('public."account_type_Id_seq"'::regclass);


--
-- TOC entry 2915 (class 2604 OID 26381)
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- TOC entry 2916 (class 2604 OID 26382)
-- Name: record_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record_status ALTER COLUMN id SET DEFAULT nextval('public.record_status_id_seq'::regclass);


--
-- TOC entry 3055 (class 0 OID 26353)
-- Dependencies: 201
-- Data for Name: account_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_type (id, name) FROM stdin;
1	Superuser
2	BusinessUser
3	EndUser
\.


--
-- TOC entry 3057 (class 0 OID 26361)
-- Dependencies: 203
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (id, account_type_id, created_timestamp, username, account_password, account_status_id, accept_marketing) FROM stdin;
28	1	2021-05-04 20:57:32.236737	joe	$1$NCC.yPHg$SsommUHmnvJY86l/Gjuxu.	1	t
29	3	2021-07-24 03:04:23.363166	joe2	$1$yeUjX3Ci$uhSeyWQLVsFjW.k12j.kr0	1	t
\.


--
-- TOC entry 3059 (class 0 OID 26372)
-- Dependencies: 205
-- Data for Name: record_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.record_status (id, name) FROM stdin;
1	Active
2	Disabled
3	Deleted
\.


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 202
-- Name: account_type_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."account_type_Id_seq"', 3, true);


--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 204
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_seq', 36, true);


--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 206
-- Name: record_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.record_status_id_seq', 3, true);


--
-- TOC entry 2918 (class 2606 OID 26384)
-- Name: account_type AccountType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type
    ADD CONSTRAINT "AccountType_pkey" PRIMARY KEY (id);


--
-- TOC entry 2920 (class 2606 OID 26386)
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 2922 (class 2606 OID 26388)
-- Name: record_status record_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record_status
    ADD CONSTRAINT record_status_pkey PRIMARY KEY (id);


--
-- TOC entry 2923 (class 2606 OID 26389)
-- Name: accounts accounts_account_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_account_status_id_fkey FOREIGN KEY (account_status_id) REFERENCES public.record_status(id);


--
-- TOC entry 2924 (class 2606 OID 26394)
-- Name: accounts accounts_account_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_account_type_id_fkey FOREIGN KEY (account_type_id) REFERENCES public.account_type(id);


-- Completed on 2021-07-24 04:43:36 BST

--
-- PostgreSQL database dump complete
--

