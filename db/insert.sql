--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: rehearsal_rooms; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: rehearsals; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: attends; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Name: file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: klaus
--

SELECT pg_catalog.setval('file_id_seq', 1, false);


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: instruments; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: performances; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: venue; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: is_at; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: keys; Type: TABLE DATA; Schema: public; Owner: klaus
--

INSERT INTO keys (name) VALUES ('C');
INSERT INTO keys (name) VALUES ('G');
INSERT INTO keys (name) VALUES ('D');
INSERT INTO keys (name) VALUES ('A');
INSERT INTO keys (name) VALUES ('E');
INSERT INTO keys (name) VALUES ('B');
INSERT INTO keys (name) VALUES ('F#');
INSERT INTO keys (name) VALUES ('Gb');
INSERT INTO keys (name) VALUES ('Db');
INSERT INTO keys (name) VALUES ('Ab');
INSERT INTO keys (name) VALUES ('Eb');
INSERT INTO keys (name) VALUES ('Bb');
INSERT INTO keys (name) VALUES ('F');
INSERT INTO keys (name) VALUES ('Am');
INSERT INTO keys (name) VALUES ('Em');
INSERT INTO keys (name) VALUES ('Bm');
INSERT INTO keys (name) VALUES ('F#m');
INSERT INTO keys (name) VALUES ('C#m');
INSERT INTO keys (name) VALUES ('G#m');
INSERT INTO keys (name) VALUES ('D#m');
INSERT INTO keys (name) VALUES ('Ebm');
INSERT INTO keys (name) VALUES ('Bbm');
INSERT INTO keys (name) VALUES ('Fm');
INSERT INTO keys (name) VALUES ('Cm');
INSERT INTO keys (name) VALUES ('Gm');
INSERT INTO keys (name) VALUES ('Dm');


--
-- Data for Name: performance_comments; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: played_at; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: practice_status; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: practiced_at; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: klaus
--

INSERT INTO roles (name) VALUES ('member');
INSERT INTO roles (name) VALUES ('manager');
INSERT INTO roles (name) VALUES ('admin');


--
-- Data for Name: priviledges; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: rehearsal_comments; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: saved_as; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: score_comments; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Name: scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: klaus
--

SELECT pg_catalog.setval('scores_id_seq', 1, false);


--
-- Data for Name: song_comments; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- Data for Name: written_for; Type: TABLE DATA; Schema: public; Owner: klaus
--



--
-- PostgreSQL database dump complete
--

