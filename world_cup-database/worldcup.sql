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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (65, 2018, 'Final', 172, 173, 4, 2);
INSERT INTO public.games VALUES (66, 2018, 'Third Place', 174, 175, 2, 0);
INSERT INTO public.games VALUES (67, 2018, 'Semi-Final', 173, 175, 2, 1);
INSERT INTO public.games VALUES (68, 2018, 'Semi-Final', 172, 174, 1, 0);
INSERT INTO public.games VALUES (69, 2018, 'Quarter-Final', 173, 176, 3, 2);
INSERT INTO public.games VALUES (70, 2018, 'Quarter-Final', 175, 177, 2, 0);
INSERT INTO public.games VALUES (71, 2018, 'Quarter-Final', 174, 178, 2, 1);
INSERT INTO public.games VALUES (72, 2018, 'Quarter-Final', 172, 179, 2, 0);
INSERT INTO public.games VALUES (73, 2018, 'Eighth-Final', 175, 180, 2, 1);
INSERT INTO public.games VALUES (74, 2018, 'Eighth-Final', 177, 181, 1, 0);
INSERT INTO public.games VALUES (75, 2018, 'Eighth-Final', 174, 182, 3, 2);
INSERT INTO public.games VALUES (76, 2018, 'Eighth-Final', 178, 183, 2, 0);
INSERT INTO public.games VALUES (77, 2018, 'Eighth-Final', 173, 184, 2, 1);
INSERT INTO public.games VALUES (78, 2018, 'Eighth-Final', 176, 185, 2, 1);
INSERT INTO public.games VALUES (79, 2018, 'Eighth-Final', 179, 186, 2, 1);
INSERT INTO public.games VALUES (80, 2018, 'Eighth-Final', 172, 187, 4, 3);
INSERT INTO public.games VALUES (81, 2014, 'Final', 188, 187, 1, 0);
INSERT INTO public.games VALUES (82, 2014, 'Third Place', 189, 178, 3, 0);
INSERT INTO public.games VALUES (83, 2014, 'Semi-Final', 187, 189, 1, 0);
INSERT INTO public.games VALUES (84, 2014, 'Semi-Final', 188, 178, 7, 1);
INSERT INTO public.games VALUES (85, 2014, 'Quarter-Final', 189, 190, 1, 0);
INSERT INTO public.games VALUES (86, 2014, 'Quarter-Final', 187, 174, 1, 0);
INSERT INTO public.games VALUES (87, 2014, 'Quarter-Final', 178, 180, 2, 1);
INSERT INTO public.games VALUES (88, 2014, 'Quarter-Final', 188, 172, 1, 0);
INSERT INTO public.games VALUES (89, 2014, 'Eighth-Final', 178, 191, 2, 1);
INSERT INTO public.games VALUES (90, 2014, 'Eighth-Final', 180, 179, 2, 0);
INSERT INTO public.games VALUES (91, 2014, 'Eighth-Final', 172, 192, 2, 0);
INSERT INTO public.games VALUES (92, 2014, 'Eighth-Final', 188, 193, 2, 1);
INSERT INTO public.games VALUES (93, 2014, 'Eighth-Final', 189, 183, 2, 1);
INSERT INTO public.games VALUES (94, 2014, 'Eighth-Final', 190, 194, 2, 1);
INSERT INTO public.games VALUES (95, 2014, 'Eighth-Final', 187, 181, 1, 0);
INSERT INTO public.games VALUES (96, 2014, 'Eighth-Final', 174, 195, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (172, 'France');
INSERT INTO public.teams VALUES (173, 'Croatia');
INSERT INTO public.teams VALUES (174, 'Belgium');
INSERT INTO public.teams VALUES (175, 'England');
INSERT INTO public.teams VALUES (176, 'Russia');
INSERT INTO public.teams VALUES (177, 'Sweden');
INSERT INTO public.teams VALUES (178, 'Brazil');
INSERT INTO public.teams VALUES (179, 'Uruguay');
INSERT INTO public.teams VALUES (180, 'Colombia');
INSERT INTO public.teams VALUES (181, 'Switzerland');
INSERT INTO public.teams VALUES (182, 'Japan');
INSERT INTO public.teams VALUES (183, 'Mexico');
INSERT INTO public.teams VALUES (184, 'Denmark');
INSERT INTO public.teams VALUES (185, 'Spain');
INSERT INTO public.teams VALUES (186, 'Portugal');
INSERT INTO public.teams VALUES (187, 'Argentina');
INSERT INTO public.teams VALUES (188, 'Germany');
INSERT INTO public.teams VALUES (189, 'Netherlands');
INSERT INTO public.teams VALUES (190, 'Costa Rica');
INSERT INTO public.teams VALUES (191, 'Chile');
INSERT INTO public.teams VALUES (192, 'Nigeria');
INSERT INTO public.teams VALUES (193, 'Algeria');
INSERT INTO public.teams VALUES (194, 'Greece');
INSERT INTO public.teams VALUES (195, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 96, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 195, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

