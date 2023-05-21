--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "urlDefault" text NOT NULL,
    "urlShort" text NOT NULL,
    "userId" integer NOT NULL,
    visits integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, '64b52183-d2a4-4c93-96a2-dd986259a802', '2023-05-20 01:00:04.948305');
INSERT INTO public.sessions VALUES (2, 1, 'b5ae4f58-64b1-4e9a-bae3-584a5c18d238', '2023-05-20 01:00:08.349223');
INSERT INTO public.sessions VALUES (3, 1, 'c52cc520-37ba-42c2-b40f-bd347dad544a', '2023-05-20 01:01:51.392787');
INSERT INTO public.sessions VALUES (4, 1, 'b76123e7-e119-4077-9aec-1ab23239952f', '2023-05-20 01:02:08.762638');
INSERT INTO public.sessions VALUES (5, 3, 'b4b37381-d8c4-43c9-b4f9-eed7ec6b4a26', '2023-05-20 01:11:00.258982');
INSERT INTO public.sessions VALUES (6, 5, '271f634c-b1b7-419f-83e2-875115777a8a', '2023-05-20 01:25:21.775463');
INSERT INTO public.sessions VALUES (7, 6, 'adf23f2f-b352-4833-bea9-6b72d94e5664', '2023-05-20 02:38:47.54441');
INSERT INTO public.sessions VALUES (8, 8, '23373e59-68f0-4baf-ab5b-1130d195b5a5', '2023-05-20 19:59:46.978599');
INSERT INTO public.sessions VALUES (9, 17, '77def116-b1e5-41b5-9daf-41044f3b118e', '2023-05-20 21:09:32.660902');
INSERT INTO public.sessions VALUES (10, 6, '0a8c8a6b-256a-40dd-83ec-3bc7f497f335', '2023-05-20 21:11:16.834107');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (9, 'https://www.notion.so', 'JtDfV4TJ', 1, 0, '2023-05-20 01:24:02.662876');
INSERT INTO public.urls VALUES (10, 'https://www.notion.so', 'EWnzrcHw', 3, 0, '2023-05-20 01:24:18.728663');
INSERT INTO public.urls VALUES (2, 'https://www.notion.so', 'CVho0ua9', 1, 11, '2023-05-20 01:16:11.153989');
INSERT INTO public.urls VALUES (19, 'https://store.steampowered.com/', 'UgKQnJB-', 8, 0, '2023-05-20 21:02:27.06861');
INSERT INTO public.urls VALUES (20, 'https://store.steampowered.com/', 'AJ9yNjni', 8, 0, '2023-05-20 21:02:39.740787');
INSERT INTO public.urls VALUES (21, 'https://store.steampowered.com/', 'edsYG6N-', 8, 0, '2023-05-20 21:02:49.461284');
INSERT INTO public.urls VALUES (22, 'https://store.steampowered.com/', 'yaVkZfuR', 8, 1, '2023-05-20 21:02:50.094374');
INSERT INTO public.urls VALUES (23, 'https://store.steampowered.com/', 'YoTHgnmC', 17, 0, '2023-05-20 21:10:09.776513');
INSERT INTO public.urls VALUES (24, 'https://store.steampowered.com/', '0VPrY5Oa', 17, 0, '2023-05-20 21:10:10.280867');
INSERT INTO public.urls VALUES (25, 'https://store.steampowered.com/', 'ZjgN_70O', 17, 0, '2023-05-20 21:10:10.758815');
INSERT INTO public.urls VALUES (26, 'https://store.steampowered.com/', 'I-wlSrRe', 17, 2, '2023-05-20 21:10:11.181452');
INSERT INTO public.urls VALUES (27, 'https://store.steampowered.com/', 'G0NZ0VRV', 6, 2, '2023-05-20 21:12:30.443653');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'asdf', 'asdd@gaaafbm.com', '$2b$10$fYyLod.s9tDhfj4pPd.xIOEOn1rfvgbqPGzoa5/OXfvAe4RGwJFP.', '2023-05-20 00:54:27.824515');
INSERT INTO public.users VALUES (3, 'asdf', 'fcbg@hotmail.com', '$2b$10$REIi/fmMKihM2lPPtR4MAeqYLSaT88DtvBgegFU2HenGyzfY6nFh6', '2023-05-20 01:10:48.563853');
INSERT INTO public.users VALUES (5, 'fernando', 'fcbgomes@gmail.com', '$2b$10$hYUCDNsVR3ARUfh.lHzwTu1KKwkOV0vhAUtXElvAH3mMRuje0MSA.', '2023-05-20 01:25:06.88502');
INSERT INTO public.users VALUES (6, 'jooj', 'jooj@jo.com', '$2b$10$ei52aY5oPUYN1dPcDqKEgekS5WX3up7y1olIToOz3i4iij3noVKcm', '2023-05-20 02:38:37.682886');
INSERT INTO public.users VALUES (8, 'pheruzik', 'fernando@hotmail.com', '$2b$10$iiJzxWVQHWo.dsfa61l1SOrmN3iDlenBNWqf4A2rO.PHaX1NlakGC', '2023-05-20 19:59:38.370793');
INSERT INTO public.users VALUES (9, 'pheruzikaa', 'ffffffo@hotmail.com', '$2b$10$ti1sem4NdQmVT5dG75gDautLiVzOwbwsOQzpS6V8qccrn0L2yQt5S', '2023-05-20 21:07:41.469473');
INSERT INTO public.users VALUES (10, 'pheruzaeg', 'faaaafo@hotmail.com', '$2b$10$gDyQ0VqmUzlinFVhwlMR3.irn.9CaecOuWJHLRjBud4eHUY0U3Ld6', '2023-05-20 21:07:46.469323');
INSERT INTO public.users VALUES (11, 'pheraaa', 'fdngz@hotmail.com', '$2b$10$q8iHrfs7XufIMSqcXT/QGenCMeoR2IMwVvl8Q1h05ZTeCJwI/gQUm', '2023-05-20 21:07:50.530163');
INSERT INTO public.users VALUES (12, 'wwwww', 'zd@hotmail.com', '$2b$10$vpe1bf8/SCgzdVP0Q9As8Ow8wKPyPKUp/YNpr8ZLPRJuaZR1sqpUe', '2023-05-20 21:07:54.975372');
INSERT INTO public.users VALUES (13, 'zzdhzdw', 'zzdzdd@hotmail.com', '$2b$10$9EVO8fInLBGwyizPXpkX/O2GXp6059IlSD5QkrNAloK8NmTSHaQyG', '2023-05-20 21:08:01.256562');
INSERT INTO public.users VALUES (14, 'zzfffffff', 'aa@hotmail.com', '$2b$10$JpKWDOutb9pWUYdDsEuSWeVmr0jg6DmjSXja.x/1jmV3MBHk0M6Fq', '2023-05-20 21:08:06.676882');
INSERT INTO public.users VALUES (16, 'aegaegff', 'sddrgzds@hotmail.com', '$2b$10$umkTfY75zk3OCzsXYn3wDubodrOlP3MFYPZHdq5glOWRQ.muL4vj.', '2023-05-20 21:08:12.589068');
INSERT INTO public.users VALUES (17, 'iza', 'iza@hotmail.com', '$2b$10$ue49ZlurIiApl4.NPM6jhurABoUTYOSYqaeILWDflAdSNZN/YHyZ2', '2023-05-20 21:09:18.33153');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 10, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 27, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 17, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_urlShort_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_urlShort_key" UNIQUE ("urlShort");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

