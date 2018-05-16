--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.4

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


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: events; Type: TABLE; Schema: public; Owner: Julien
--

CREATE TABLE public.events (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying,
    status boolean,
    owner_id uuid
);


ALTER TABLE public.events OWNER TO "Julien";

--
-- Name: expense_participants; Type: TABLE; Schema: public; Owner: Julien
--

CREATE TABLE public.expense_participants (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    expense_id uuid,
    participant_id uuid
);


ALTER TABLE public.expense_participants OWNER TO "Julien";

--
-- Name: expenses; Type: TABLE; Schema: public; Owner: Julien
--

CREATE TABLE public.expenses (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    date date,
    amount smallint,
    description character varying,
    paid_by uuid,
    event_id uuid
);


ALTER TABLE public.expenses OWNER TO "Julien";

--
-- Name: participants; Type: TABLE; Schema: public; Owner: Julien
--

CREATE TABLE public.participants (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    nickname character varying,
    user_id uuid
);


ALTER TABLE public.participants OWNER TO "Julien";

--
-- Name: userlogin; Type: TABLE; Schema: public; Owner: Julien
--

CREATE TABLE public.userlogin (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    last_name character varying,
    first_name character varying,
    email character varying,
    password character varying
);


ALTER TABLE public.userlogin OWNER TO "Julien";

--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: Julien
--

COPY public.events (id, name, status, owner_id) FROM stdin;
\.


--
-- Data for Name: expense_participants; Type: TABLE DATA; Schema: public; Owner: Julien
--

COPY public.expense_participants (id, expense_id, participant_id) FROM stdin;
\.


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: Julien
--

COPY public.expenses (id, date, amount, description, paid_by, event_id) FROM stdin;
\.


--
-- Data for Name: participants; Type: TABLE DATA; Schema: public; Owner: Julien
--

COPY public.participants (id, nickname, user_id) FROM stdin;
\.


--
-- Data for Name: userlogin; Type: TABLE DATA; Schema: public; Owner: Julien
--

COPY public.userlogin (id, last_name, first_name, email, password) FROM stdin;
\.


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: Julien
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: expense_participants expense_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: Julien
--

ALTER TABLE ONLY public.expense_participants
    ADD CONSTRAINT expense_participants_pkey PRIMARY KEY (id);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: Julien
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- Name: participants participants_pkey; Type: CONSTRAINT; Schema: public; Owner: Julien
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_pkey PRIMARY KEY (id);


--
-- Name: userlogin userlogin_pkey; Type: CONSTRAINT; Schema: public; Owner: Julien
--

ALTER TABLE ONLY public.userlogin
    ADD CONSTRAINT userlogin_pkey PRIMARY KEY (id);


--
-- Name: events events_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Julien
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.userlogin(id);


--
-- Name: expense_participants expense_participants_expense_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Julien
--

ALTER TABLE ONLY public.expense_participants
    ADD CONSTRAINT expense_participants_expense_id_fkey FOREIGN KEY (expense_id) REFERENCES public.expenses(id);


--
-- Name: expense_participants expense_participants_participant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Julien
--

ALTER TABLE ONLY public.expense_participants
    ADD CONSTRAINT expense_participants_participant_id_fkey FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: expenses expenses_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Julien
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: expenses expenses_paid_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Julien
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_paid_by_fkey FOREIGN KEY (paid_by) REFERENCES public.participants(id);


--
-- Name: participants participants_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Julien
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.userlogin(id);


--
-- PostgreSQL database dump complete
--
