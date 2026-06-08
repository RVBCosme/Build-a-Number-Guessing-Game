--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: number_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Name: number_guess_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.number_guess_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.number_guess_user_id_seq OWNER TO freecodecamp;

--
-- Name: number_guess_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.number_guess_user_id_seq OWNED BY public.number_guess.user_id;


--
-- Name: number_guess user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess ALTER COLUMN user_id SET DEFAULT nextval('public.number_guess_user_id_seq'::regclass);


--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES (1, 'johndoe', 0, NULL);
INSERT INTO public.number_guess VALUES (3, 'user_1780933740255', 2, 300);
INSERT INTO public.number_guess VALUES (2, 'user_1780933740256', 5, 209);
INSERT INTO public.number_guess VALUES (5, 'user_1780934752208', 2, 227);
INSERT INTO public.number_guess VALUES (4, 'user_1780934752209', 5, 78);
INSERT INTO public.number_guess VALUES (7, 'user_1780935003092', 2, 290);
INSERT INTO public.number_guess VALUES (6, 'user_1780935003093', 5, 362);
INSERT INTO public.number_guess VALUES (9, 'user_1780935122206', 2, 588);
INSERT INTO public.number_guess VALUES (8, 'user_1780935122207', 5, 437);
INSERT INTO public.number_guess VALUES (11, 'user_1780935452585', 2, 242);
INSERT INTO public.number_guess VALUES (10, 'user_1780935452586', 5, 128);
INSERT INTO public.number_guess VALUES (13, 'user_1780936699685', 2, 77);
INSERT INTO public.number_guess VALUES (12, 'user_1780936699686', 5, 52);
INSERT INTO public.number_guess VALUES (15, 'REne', 0, NULL);
INSERT INTO public.number_guess VALUES (16, 'Vincent', 1, 52);
INSERT INTO public.number_guess VALUES (17, 'ellora', 1, 13);
INSERT INTO public.number_guess VALUES (18, 'nanay', 1, 9);
INSERT INTO public.number_guess VALUES (19, 'test nga', 1, 10);
INSERT INTO public.number_guess VALUES (20, 'Ellora', 0, NULL);
INSERT INTO public.number_guess VALUES (21, 'testuser123', 0, NULL);
INSERT INTO public.number_guess VALUES (22, 'quicktest', 0, NULL);
INSERT INTO public.number_guess VALUES (23, 'testinsert', 1, 5);
INSERT INTO public.number_guess VALUES (24, 'completetest', 1, 10);
INSERT INTO public.number_guess VALUES (14, 'Rene', 1, 11);


--
-- Name: number_guess_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.number_guess_user_id_seq', 24, true);


--
-- Name: number_guess number_guess_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess
    ADD CONSTRAINT number_guess_pkey PRIMARY KEY (user_id);


--
-- Name: number_guess number_guess_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess
    ADD CONSTRAINT number_guess_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

