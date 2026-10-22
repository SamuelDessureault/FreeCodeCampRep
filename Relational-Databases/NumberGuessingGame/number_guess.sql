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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 95);
INSERT INTO public.games VALUES (2, 2, 59);
INSERT INTO public.games VALUES (3, 1, 265);
INSERT INTO public.games VALUES (4, 1, 973);
INSERT INTO public.games VALUES (5, 1, 950);
INSERT INTO public.games VALUES (6, 3, 543);
INSERT INTO public.games VALUES (7, 4, 900);
INSERT INTO public.games VALUES (8, 3, 217);
INSERT INTO public.games VALUES (9, 3, 292);
INSERT INTO public.games VALUES (10, 3, 215);
INSERT INTO public.games VALUES (11, 6, 846);
INSERT INTO public.games VALUES (12, 7, 220);
INSERT INTO public.games VALUES (13, 6, 577);
INSERT INTO public.games VALUES (14, 6, 413);
INSERT INTO public.games VALUES (15, 6, 647);
INSERT INTO public.games VALUES (16, 8, 247);
INSERT INTO public.games VALUES (17, 9, 465);
INSERT INTO public.games VALUES (18, 8, 120);
INSERT INTO public.games VALUES (19, 8, 650);
INSERT INTO public.games VALUES (20, 8, 283);
INSERT INTO public.games VALUES (21, 10, 68);
INSERT INTO public.games VALUES (22, 11, 338);
INSERT INTO public.games VALUES (23, 10, 257);
INSERT INTO public.games VALUES (24, 10, 803);
INSERT INTO public.games VALUES (25, 10, 777);
INSERT INTO public.games VALUES (26, 5, 10);
INSERT INTO public.games VALUES (27, 12, 481);
INSERT INTO public.games VALUES (28, 13, 830);
INSERT INTO public.games VALUES (29, 12, 640);
INSERT INTO public.games VALUES (30, 12, 657);
INSERT INTO public.games VALUES (31, 12, 637);
INSERT INTO public.games VALUES (32, 15, 872);
INSERT INTO public.games VALUES (33, 16, 560);
INSERT INTO public.games VALUES (34, 15, 363);
INSERT INTO public.games VALUES (35, 15, 342);
INSERT INTO public.games VALUES (36, 15, 84);
INSERT INTO public.games VALUES (37, 17, 67);
INSERT INTO public.games VALUES (38, 18, 726);
INSERT INTO public.games VALUES (39, 17, 859);
INSERT INTO public.games VALUES (40, 17, 728);
INSERT INTO public.games VALUES (41, 17, 829);
INSERT INTO public.games VALUES (42, 19, 983);
INSERT INTO public.games VALUES (43, 20, 37);
INSERT INTO public.games VALUES (44, 19, 890);
INSERT INTO public.games VALUES (45, 19, 150);
INSERT INTO public.games VALUES (46, 19, 801);
INSERT INTO public.games VALUES (47, 21, 359);
INSERT INTO public.games VALUES (48, 22, 861);
INSERT INTO public.games VALUES (49, 21, 263);
INSERT INTO public.games VALUES (50, 21, 721);
INSERT INTO public.games VALUES (51, 21, 400);
INSERT INTO public.games VALUES (52, 23, 394);
INSERT INTO public.games VALUES (53, 24, 675);
INSERT INTO public.games VALUES (54, 23, 632);
INSERT INTO public.games VALUES (55, 23, 708);
INSERT INTO public.games VALUES (56, 23, 168);
INSERT INTO public.games VALUES (57, 25, 981);
INSERT INTO public.games VALUES (58, 25, 621);
INSERT INTO public.games VALUES (59, 26, 93);
INSERT INTO public.games VALUES (60, 26, 662);
INSERT INTO public.games VALUES (61, 25, 675);
INSERT INTO public.games VALUES (62, 25, 176);
INSERT INTO public.games VALUES (63, 25, 224);
INSERT INTO public.games VALUES (64, 27, 20);
INSERT INTO public.games VALUES (65, 27, 708);
INSERT INTO public.games VALUES (66, 28, 966);
INSERT INTO public.games VALUES (67, 28, 260);
INSERT INTO public.games VALUES (68, 27, 343);
INSERT INTO public.games VALUES (69, 27, 185);
INSERT INTO public.games VALUES (70, 27, 781);
INSERT INTO public.games VALUES (71, 29, 529);
INSERT INTO public.games VALUES (72, 29, 775);
INSERT INTO public.games VALUES (73, 30, 783);
INSERT INTO public.games VALUES (74, 30, 551);
INSERT INTO public.games VALUES (75, 29, 396);
INSERT INTO public.games VALUES (76, 29, 385);
INSERT INTO public.games VALUES (77, 29, 520);
INSERT INTO public.games VALUES (78, 31, 677);
INSERT INTO public.games VALUES (79, 31, 799);
INSERT INTO public.games VALUES (80, 32, 129);
INSERT INTO public.games VALUES (81, 32, 774);
INSERT INTO public.games VALUES (82, 31, 283);
INSERT INTO public.games VALUES (83, 31, 749);
INSERT INTO public.games VALUES (84, 31, 387);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1792708183901');
INSERT INTO public.users VALUES (2, 'user_1792708183900');
INSERT INTO public.users VALUES (3, 'user_1792709154461');
INSERT INTO public.users VALUES (4, 'user_1792709154460');
INSERT INTO public.users VALUES (5, 'samuel');
INSERT INTO public.users VALUES (6, 'user_1792709260964');
INSERT INTO public.users VALUES (7, 'user_1792709260963');
INSERT INTO public.users VALUES (8, 'user_1792709394127');
INSERT INTO public.users VALUES (9, 'user_1792709394126');
INSERT INTO public.users VALUES (10, 'user_1792709474107');
INSERT INTO public.users VALUES (11, 'user_1792709474106');
INSERT INTO public.users VALUES (12, 'user_1792709553646');
INSERT INTO public.users VALUES (13, 'user_1792709553645');
INSERT INTO public.users VALUES (14, 'pat');
INSERT INTO public.users VALUES (15, 'user_1792709620099');
INSERT INTO public.users VALUES (16, 'user_1792709620098');
INSERT INTO public.users VALUES (17, 'user_1792709721640');
INSERT INTO public.users VALUES (18, 'user_1792709721639');
INSERT INTO public.users VALUES (19, 'user_1792709727879');
INSERT INTO public.users VALUES (20, 'user_1792709727878');
INSERT INTO public.users VALUES (21, 'user_1792709736383');
INSERT INTO public.users VALUES (22, 'user_1792709736382');
INSERT INTO public.users VALUES (23, 'user_1792709740845');
INSERT INTO public.users VALUES (24, 'user_1792709740844');
INSERT INTO public.users VALUES (25, 'user_1792709804767');
INSERT INTO public.users VALUES (26, 'user_1792709804766');
INSERT INTO public.users VALUES (27, 'user_1792709865417');
INSERT INTO public.users VALUES (28, 'user_1792709865416');
INSERT INTO public.users VALUES (29, 'user_1792709877355');
INSERT INTO public.users VALUES (30, 'user_1792709877354');
INSERT INTO public.users VALUES (31, 'user_1792709916588');
INSERT INTO public.users VALUES (32, 'user_1792709916587');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 84, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 32, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

