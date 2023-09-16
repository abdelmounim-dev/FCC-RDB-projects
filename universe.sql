--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    diameter numeric(10,2),
    is_periodic boolean,
    discovery_year integer,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size integer,
    age integer,
    has_black_hole boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size integer,
    has_atmosphere boolean,
    is_inhabited boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(50),
    distance_from_star numeric(10,2),
    has_ring boolean,
    is_habitable boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(50),
    mass numeric(10,2),
    temperature integer,
    is_main_sequence boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 15.00, true, 1705, 'Famous periodic comet visible every 76 years');
INSERT INTO public.comet VALUES (2, 'Comet NEOWISE', 5.00, true, 2020, 'Bright comet visible in the Northern Hemisphere');
INSERT INTO public.comet VALUES (3, 'Comet Hale-Bopp', 40.00, true, 1995, 'One of the brightest comets of the 20th century');
INSERT INTO public.comet VALUES (4, 'Comet ISON', 2.00, true, 2012, 'Comet with high expectations but disintegrated');
INSERT INTO public.comet VALUES (5, 'Comet Lovejoy', 3.00, true, 2011, 'Known for surviving close encounters with the Sun');
INSERT INTO public.comet VALUES (6, 'Comet Wild 2', 5.00, false, 1978, 'Visited by the Stardust spacecraft in 2004');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 13000, true, 'The galaxy containing our Solar System');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, 14000, true, 'A neighboring spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50000, 8000, false, 'A smaller nearby galaxy');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 30000, 12000, true, 'A spiral galaxy with a prominent dust lane');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 25000, 10000, false, 'Known for its interacting galaxies');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 35000, 11000, false, 'A face-on spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1737, false, false, 13);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, false, false, 14);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, false, false, 14);
INSERT INTO public.moon VALUES (4, 'Europa', 1561, true, false, 15);
INSERT INTO public.moon VALUES (5, 'Titan', 2575, true, false, 16);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634, true, false, 15);
INSERT INTO public.moon VALUES (7, 'Enceladus', 252, true, false, 16);
INSERT INTO public.moon VALUES (8, 'Triton', 2707, true, false, 17);
INSERT INTO public.moon VALUES (9, 'Charon', 606, false, false, 18);
INSERT INTO public.moon VALUES (10, 'Oberon', 761, false, false, 19);
INSERT INTO public.moon VALUES (11, 'Titania', 788, false, false, 19);
INSERT INTO public.moon VALUES (12, 'Lapetus', 914, false, false, 16);
INSERT INTO public.moon VALUES (13, 'Phoebe', 213, false, false, 16);
INSERT INTO public.moon VALUES (14, 'Callisto', 2410, true, false, 15);
INSERT INTO public.moon VALUES (15, 'Rhea', 764, true, false, 16);
INSERT INTO public.moon VALUES (16, 'Dione', 560, true, false, 16);
INSERT INTO public.moon VALUES (17, 'Hyperion', 143, false, false, 16);
INSERT INTO public.moon VALUES (18, 'Iapetus', 1436, false, false, 16);
INSERT INTO public.moon VALUES (19, 'Miranda', 471, true, false, 20);
INSERT INTO public.moon VALUES (20, 'Ariel', 578, true, false, 21);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 'Terrestrial', 0.39, false, false, 7);
INSERT INTO public.planet VALUES (14, 'Venus', 'Terrestrial', 0.72, false, false, 7);
INSERT INTO public.planet VALUES (15, 'Mars', 'Terrestrial', 1.52, false, false, 7);
INSERT INTO public.planet VALUES (16, 'Jupiter', 'Gas Giant', 5.20, true, false, 11);
INSERT INTO public.planet VALUES (17, 'Saturn', 'Gas Giant', 9.58, true, false, 11);
INSERT INTO public.planet VALUES (18, 'Uranus', 'Ice Giant', 19.22, true, false, 13);
INSERT INTO public.planet VALUES (19, 'Neptune', 'Ice Giant', 30.05, true, false, 13);
INSERT INTO public.planet VALUES (20, 'Kepler-186f', 'Exoplanet', 0.36, false, true, 9);
INSERT INTO public.planet VALUES (21, 'Gliese 581c', 'Exoplanet', 0.07, false, true, 8);
INSERT INTO public.planet VALUES (22, 'Gliese 581d', 'Exoplanet', 0.22, false, true, 8);
INSERT INTO public.planet VALUES (23, 'Gliese 581g', 'Exoplanet', 0.28, false, true, 8);
INSERT INTO public.planet VALUES (24, 'Proxima b', 'Exoplanet', 0.05, false, true, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Alpha Centauri B', 'K-type', 0.01, 5260, true, 1);
INSERT INTO public.star VALUES (8, 'Polaris', 'F-type', 0.03, 6000, true, 1);
INSERT INTO public.star VALUES (9, 'Sirius B', 'A-type', 0.02, 25000, true, 1);
INSERT INTO public.star VALUES (10, 'Arcturus', 'K-type', 0.50, 4300, true, 1);
INSERT INTO public.star VALUES (11, 'VY Canis Majoris', 'M-type', 0.60, 3000, true, 1);
INSERT INTO public.star VALUES (12, 'Vega', 'A-type', 0.04, 9600, true, 1);
INSERT INTO public.star VALUES (13, 'Betelgeuse', 'M-type', 0.80, 3500, false, 2);
INSERT INTO public.star VALUES (14, 'Alpha Centauri A', 'G-type', 0.03, 5790, true, 1);
INSERT INTO public.star VALUES (15, 'Rigel', 'B-type', 0.70, 12100, true, 2);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

