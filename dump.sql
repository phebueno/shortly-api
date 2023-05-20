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
    token integer NOT NULL,
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
    visits integer DEFAULT 0,
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



--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (1, 'www.asdf.com.br', 'aaasdf', 1, 0, '2023-05-19 16:56:46.929151');
INSERT INTO public.urls VALUES (8, 'www.asdf.com.br', 'o03NZW7igmzzWBGyw1ytF', 1, 0, '2023-05-19 17:05:47.738868');
INSERT INTO public.urls VALUES (9, 'www.asdf.com.br', 'umj5fxcrat_m6-bZo6WYs', 1, 0, '2023-05-19 17:15:25.476036');
INSERT INTO public.urls VALUES (10, 'www.asdf.com.br', 'j77skrnw', 1, 0, '2023-05-19 17:22:15.078672');
INSERT INTO public.urls VALUES (11, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'qeDvpCay', 1, 0, '2023-05-19 17:25:19.94952');
INSERT INTO public.urls VALUES (12, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'e27nLBzj', 1, 0, '2023-05-19 17:27:19.902232');
INSERT INTO public.urls VALUES (14, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'D-Ggkh_s', 1, 0, '2023-05-19 17:31:07.99792');
INSERT INTO public.urls VALUES (15, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'vxnph0nf', 1, 0, '2023-05-19 17:31:37.992043');
INSERT INTO public.urls VALUES (16, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'M1_jsqfG', 1, 0, '2023-05-19 17:39:47.957155');
INSERT INTO public.urls VALUES (17, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'vx_dfd9O', 1, 0, '2023-05-19 17:39:57.532918');
INSERT INTO public.urls VALUES (18, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'fSsbfkq5', 1, 0, '2023-05-19 17:41:29.379027');
INSERT INTO public.urls VALUES (19, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', '1ekK1oJA', 1, 0, '2023-05-19 17:42:10.776407');
INSERT INTO public.urls VALUES (20, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', '40ahkF1T', 1, 0, '2023-05-19 17:42:29.017144');
INSERT INTO public.urls VALUES (21, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'Wt6dQYmP', 1, 0, '2023-05-19 17:45:12.884205');
INSERT INTO public.urls VALUES (22, 'https://www.notion.so', '2jlcu0Ct', 1, 0, '2023-05-19 17:45:37.068476');
INSERT INTO public.urls VALUES (23, 'https://www.notion.so', '89edpro2', 1, 0, '2023-05-19 17:46:32.988792');
INSERT INTO public.urls VALUES (24, 'https://www.notion.so', 'G4n0hVkD', 1, 0, '2023-05-19 17:47:04.422955');
INSERT INTO public.urls VALUES (25, 'https://www.notion.so', 'GvYjukPQ', 1, 0, '2023-05-19 17:47:17.85474');
INSERT INTO public.urls VALUES (26, 'https://www.notion.so', '8l1xhzW1', 1, 0, '2023-05-19 17:47:19.668068');
INSERT INTO public.urls VALUES (28, 'https://www.notion.so', 'a0pceq_U', 1, 0, '2023-05-19 17:50:11.420959');
INSERT INTO public.urls VALUES (29, 'https://www.notion.so', 'uA9Pd3HI', 1, 0, '2023-05-19 17:50:39.546596');
INSERT INTO public.urls VALUES (30, 'https://www.notion.so', '8pqcZliQ', 1, 0, '2023-05-19 17:50:41.50949');
INSERT INTO public.urls VALUES (31, 'https://www.notion.so', 'TsiNOo1x', 1, 0, '2023-05-19 17:51:23.843845');
INSERT INTO public.urls VALUES (38, 'https://www.notion.so', 'xeuCUT6n', 1, 0, '2023-05-19 17:55:55.984676');
INSERT INTO public.urls VALUES (39, 'https://www.notion.so', 'HgXdZh_4', 1, 0, '2023-05-19 17:55:59.806271');
INSERT INTO public.urls VALUES (40, 'https://www.notion.so', 'a__w1Tl_', 1, 0, '2023-05-19 18:44:05.903593');
INSERT INTO public.urls VALUES (41, 'https://www.notion.so', 'DCtNINxs', 1, 0, '2023-05-19 18:44:17.086183');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'jooj', 'fcbgomes@aaa.com', '123456', '2023-05-19 15:41:05.370807');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 41, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


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

