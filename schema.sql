--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: event_expenses; Type: TABLE; Schema: public; Owner: Matthieu
--

CREATE TABLE public.event_expenses (
    id uuid NOT NULL,
    eventid uuid,
    expenseid uuid
);


ALTER TABLE public.event_expenses OWNER TO "Matthieu";

--
-- Name: events; Type: TABLE; Schema: public; Owner: Matthieu
--

CREATE TABLE public.events (
    eventid uuid NOT NULL,
    name character varying,
    status character varying,
    owner uuid
);


ALTER TABLE public.events OWNER TO "Matthieu";

--
-- Name: expense_participants; Type: TABLE; Schema: public; Owner: Matthieu
--

CREATE TABLE public.expense_participants (
    id uuid NOT NULL,
    expenseid uuid,
    participantid uuid
);


ALTER TABLE public.expense_participants OWNER TO "Matthieu";

--
-- Name: expenses; Type: TABLE; Schema: public; Owner: Matthieu
--

CREATE TABLE public.expenses (
    expenseid uuid NOT NULL,
    date date,
    amount_paid smallint,
    description character varying,
    paid_by uuid
);


ALTER TABLE public.expenses OWNER TO "Matthieu";

--
-- Name: participants; Type: TABLE; Schema: public; Owner: Matthieu
--

CREATE TABLE public.participants (
    participantid uuid NOT NULL,
    nickname character varying
);


ALTER TABLE public.participants OWNER TO "Matthieu";

--
-- Name: userlogin; Type: TABLE; Schema: public; Owner: Matthieu
--

CREATE TABLE public.userlogin (
    userloginid uuid NOT NULL,
    last_name character varying,
    first_name character varying,
    email character varying,
    password character varying
);


ALTER TABLE public.userlogin OWNER TO "Matthieu";

--
-- Data for Name: event_expenses; Type: TABLE DATA; Schema: public; Owner: Matthieu
--

COPY public.event_expenses (id, eventid, expenseid) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: Matthieu
--

COPY public.events (eventid, name, status, owner) FROM stdin;
\.


--
-- Data for Name: expense_participants; Type: TABLE DATA; Schema: public; Owner: Matthieu
--

COPY public.expense_participants (id, expenseid, participantid) FROM stdin;
\.


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: Matthieu
--

COPY public.expenses (expenseid, date, amount_paid, description, paid_by) FROM stdin;
\.


--
-- Data for Name: participants; Type: TABLE DATA; Schema: public; Owner: Matthieu
--

COPY public.participants (participantid, nickname) FROM stdin;
\.


--
-- Data for Name: userlogin; Type: TABLE DATA; Schema: public; Owner: Matthieu
--

COPY public.userlogin (userloginid, last_name, first_name, email, password) FROM stdin;
\.


--
-- Name: event_expenses event_expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: Matthieu
--

ALTER TABLE ONLY public.event_expenses
    ADD CONSTRAINT event_expenses_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: Matthieu
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (eventid);


--
-- Name: expense_participants expense_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: Matthieu
--

ALTER TABLE ONLY public.expense_participants
    ADD CONSTRAINT expense_participants_pkey PRIMARY KEY (id);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: Matthieu
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (expenseid);


--
-- Name: participants participants_pkey; Type: CONSTRAINT; Schema: public; Owner: Matthieu
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_pkey PRIMARY KEY (participantid);


--
-- Name: userlogin userlogin_pkey; Type: CONSTRAINT; Schema: public; Owner: Matthieu
--

ALTER TABLE ONLY public.userlogin
    ADD CONSTRAINT userlogin_pkey PRIMARY KEY (userloginid);


--
-- Name: event_expenses event_expenses_eventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Matthieu
--

ALTER TABLE ONLY public.event_expenses
    ADD CONSTRAINT event_expenses_eventid_fkey FOREIGN KEY (eventid) REFERENCES public.events(eventid);


--
-- Name: event_expenses event_expenses_expenseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Matthieu
--

ALTER TABLE ONLY public.event_expenses
    ADD CONSTRAINT event_expenses_expenseid_fkey FOREIGN KEY (expenseid) REFERENCES public.expenses(expenseid);


--
-- Name: events events_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Matthieu
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_owner_fkey FOREIGN KEY (owner) REFERENCES public.userlogin(userloginid);


--
-- Name: expense_participants expense_participants_expenseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Matthieu
--

ALTER TABLE ONLY public.expense_participants
    ADD CONSTRAINT expense_participants_expenseid_fkey FOREIGN KEY (expenseid) REFERENCES public.expenses(expenseid);


--
-- Name: expense_participants expense_participants_participantid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Matthieu
--

ALTER TABLE ONLY public.expense_participants
    ADD CONSTRAINT expense_participants_participantid_fkey FOREIGN KEY (participantid) REFERENCES public.participants(participantid);


--
-- Name: expenses expenses_paid_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Matthieu
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_paid_by_fkey FOREIGN KEY (paid_by) REFERENCES public.participants(participantid);


--
-- PostgreSQL database dump complete
--

