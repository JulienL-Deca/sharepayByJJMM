
--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: Martin
--

COPY public.events (id, name, status, owner_id) FROM stdin;
354e3ffb-da5b-41e8-a1cc-5d14ab91c4fd	Réunion équipe	t	6fdf8002-7709-4211-9357-a05eb79312a2
\.


--
-- Data for Name: expense_participants; Type: TABLE DATA; Schema: public; Owner: Martin
--

COPY public.expense_participants (id, expense_id, participant_id) FROM stdin;
2c8fdddd-238b-4dc9-a9e5-c7f46b9c05b3	c2323369-4dc3-49e8-9e15-5288b705b102	f23648bb-f19c-40fc-a9c5-7595463c1728
b7010e56-5d6e-498c-81fa-80f2036c4ee8	c2323369-4dc3-49e8-9e15-5288b705b102	df728937-693c-4106-b0c9-e366bdcea0ab
d09fbdf7-9d51-4587-a3f5-994fec72d514	c2323369-4dc3-49e8-9e15-5288b705b102	0c02449d-6e19-4857-86a2-1444c4ea8bbc
617f52a1-c6e8-44d8-b8a7-a2b125e9631e	c2323369-4dc3-49e8-9e15-5288b705b102	7a394339-1ea9-4b7f-b5dc-29bb260bc72f
4a8b8484-0160-46c7-9aef-c8b34a96092f	4a895f5c-d376-4d75-9d1c-46865a44924a	f01c9ec2-1fa9-4090-aab4-e1ca2934f94b
01feb29a-5137-488d-9aa4-9aaf6134c58d	4a895f5c-d376-4d75-9d1c-46865a44924a	a21c340d-4287-4142-8400-f3c4fd3a92dd
185a972b-75ae-4aee-8f37-605cf19a671a	4a895f5c-d376-4d75-9d1c-46865a44924a	f23648bb-f19c-40fc-a9c5-7595463c1728
34bcb8cd-582c-40d0-b345-d6c899b8aa5c	4a895f5c-d376-4d75-9d1c-46865a44924a	df728937-693c-4106-b0c9-e366bdcea0ab
aa2ffa4b-2207-46ac-a001-9fe231acf140	4a895f5c-d376-4d75-9d1c-46865a44924a	0c02449d-6e19-4857-86a2-1444c4ea8bbc
132c866c-4e98-4ac6-ba6e-4b8d685e8176	4a895f5c-d376-4d75-9d1c-46865a44924a	7a394339-1ea9-4b7f-b5dc-29bb260bc72f
77893fef-b09b-4f40-aadf-ff2db2629cd9	636dd9d3-a96a-42a0-94b5-07283a9f8091	7a394339-1ea9-4b7f-b5dc-29bb260bc72f
22c3a2ae-4ccd-4d31-a20b-8b574a8b162c	636dd9d3-a96a-42a0-94b5-07283a9f8091	df728937-693c-4106-b0c9-e366bdcea0ab
\.


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: Martin
--

COPY public.expenses (id, date, amount, description, paid_by, event_id) FROM stdin;
c2323369-4dc3-49e8-9e15-5288b705b102	2018-05-15	10040	Squash	f23648bb-f19c-40fc-a9c5-7595463c1728	354e3ffb-da5b-41e8-a1cc-5d14ab91c4fd
4a895f5c-d376-4d75-9d1c-46865a44924a	2018-05-15	3000	Bières pour tous	f01c9ec2-1fa9-4090-aab4-e1ca2934f94b	354e3ffb-da5b-41e8-a1cc-5d14ab91c4fd
636dd9d3-a96a-42a0-94b5-07283a9f8091	2018-05-15	1800	2ème tournée	0c02449d-6e19-4857-86a2-1444c4ea8bbc	354e3ffb-da5b-41e8-a1cc-5d14ab91c4fd
\.


--
-- Data for Name: participants; Type: TABLE DATA; Schema: public; Owner: Martin
--

COPY public.participants (id, nickname, user_id) FROM stdin;
20f02f37-ba09-4c85-9d86-9f94db9cbc49	Jiao	00f41ad3-1f65-4650-b122-b3c0b272632d
87b83e34-d0bb-4dbe-85f0-da936c560a6b	Julien	00f41ad3-1f65-4650-b122-b3c0b272632d
660fca9b-4c5f-425c-ae99-f059d474084b	Matt	00f41ad3-1f65-4650-b122-b3c0b272632d
9894ec2e-aa62-4ea4-8fde-8363724e3057	Martin	00f41ad3-1f65-4650-b122-b3c0b272632d
2360e246-23f1-4c39-9c94-ebad8aeda4b9	Fenn	00f41ad3-1f65-4650-b122-b3c0b272632d
e196fbfd-187e-4d8a-b03b-4290e753d01c	Thomas	00f41ad3-1f65-4650-b122-b3c0b272632d
f01c9ec2-1fa9-4090-aab4-e1ca2934f94b	Jiao	6fdf8002-7709-4211-9357-a05eb79312a2
a21c340d-4287-4142-8400-f3c4fd3a92dd	Julien	6fdf8002-7709-4211-9357-a05eb79312a2
f23648bb-f19c-40fc-a9c5-7595463c1728	Matt	6fdf8002-7709-4211-9357-a05eb79312a2
df728937-693c-4106-b0c9-e366bdcea0ab	Martin	6fdf8002-7709-4211-9357-a05eb79312a2
0c02449d-6e19-4857-86a2-1444c4ea8bbc	Fenn	6fdf8002-7709-4211-9357-a05eb79312a2
7a394339-1ea9-4b7f-b5dc-29bb260bc72f	Kevin	6fdf8002-7709-4211-9357-a05eb79312a2
b01b837f-e74c-40e3-bbda-d485fc9872de	Jiao	b59695ff-7398-4d0b-bcdf-3b4c640f1231
d54273b9-2406-4b4f-b68f-16ca26ee5523	Julien	b59695ff-7398-4d0b-bcdf-3b4c640f1231
80f6e1f4-e2c7-4c07-bbc1-03dd4b050109	Matt	b59695ff-7398-4d0b-bcdf-3b4c640f1231
2ca641c0-b1fa-46d6-9928-fcc9f5528aec	Martin	b59695ff-7398-4d0b-bcdf-3b4c640f1231
341efe91-cc8d-45a4-a0b1-c31c95c1a53c	Thomas	b59695ff-7398-4d0b-bcdf-3b4c640f1231
6ea49abd-00d9-4498-8200-850d5bae7e22	Kevin	b59695ff-7398-4d0b-bcdf-3b4c640f1231
60d61c3f-44aa-4c0d-bbb3-49cfdfac8ee5	Jiao	f8ad19d3-0992-4a61-b87d-536c9245fba1
07363585-87b7-4a0d-ba0f-afa69fc680a4	Julien	f8ad19d3-0992-4a61-b87d-536c9245fba1
4be66b6d-82c0-47af-b38c-5eea1a34950d	Matt	f8ad19d3-0992-4a61-b87d-536c9245fba1
7b210b14-811e-4804-9f57-e8e176aa01db	Martin	f8ad19d3-0992-4a61-b87d-536c9245fba1
9782cb10-05bb-4d92-b8c9-305e9616e053	Thomas	f8ad19d3-0992-4a61-b87d-536c9245fba1
46b4c5a2-876e-441b-b763-6f6f30aac6ed	Kevin	f8ad19d3-0992-4a61-b87d-536c9245fba1
a98655c6-9f7e-4b0d-86bc-3fba567b872b	Vincent	f8ad19d3-0992-4a61-b87d-536c9245fba1
a9515ba6-73eb-42cb-8955-4883e1ae0af6	Xavier	f8ad19d3-0992-4a61-b87d-536c9245fba1
\.


--
-- Data for Name: userlogin; Type: TABLE DATA; Schema: public; Owner: Martin
--

COPY public.userlogin (id, last_name, first_name, email, password) FROM stdin;
00f41ad3-1f65-4650-b122-b3c0b272632d	LITTLER	Julien	julien.littler@decathlon.com	1234
6fdf8002-7709-4211-9357-a05eb79312a2	DELORME	Martin	martin.delorme@decathlon.com	1234
f8ad19d3-0992-4a61-b87d-536c9245fba1	DEBACK	Matthieu	matthieu.deback@decathlon.com	1234
b59695ff-7398-4d0b-bcdf-3b4c640f1231	LI	Jiao	jiao.li@decathlon.com	1234
\.

INSERT INTO userlogin (last_name, first_name, email) --insert users
VALUES ('DELORME', 'Martin', 'martin.delorme@decathlon.com');
INSERT INTO userlogin (last_name, first_name, email)
VALUES ('JIAO', 'Li', 'jiao.li@decathlon.com');
INSERT INTO userlogin (last_name, first_name, email)
VALUES ('DEBACK', 'Matthieu', 'matthieu.deback@decathlon.com');
INSERT INTO userlogin (last_name, first_name, email)
VALUES ('LITTLER', 'Julien', 'julien.littler@decathlon.com');

INSERT INTO participants (nickname, user_id) --insert part for Julien
VALUES ('Jiao', '00f41ad3-1f65-4650-b122-b3c0b272632d');
INSERT INTO participants (nickname, user_id)
VALUES ('Julien', '00f41ad3-1f65-4650-b122-b3c0b272632d');
INSERT INTO participants (nickname, user_id)
VALUES ('Matt', '00f41ad3-1f65-4650-b122-b3c0b272632d');
INSERT INTO participants (nickname, user_id)
VALUES ('Martin', '00f41ad3-1f65-4650-b122-b3c0b272632d');
INSERT INTO participants (nickname, user_id)
VALUES ('Fenn', '00f41ad3-1f65-4650-b122-b3c0b272632d');
INSERT INTO participants (nickname, user_id)
VALUES ('Thomas', '00f41ad3-1f65-4650-b122-b3c0b272632d');

INSERT INTO participants (nickname, user_id) --insert part for Martin
VALUES ('Jiao', '6fdf8002-7709-4211-9357-a05eb79312a2');
INSERT INTO participants (nickname, user_id)
VALUES ('Julien', '6fdf8002-7709-4211-9357-a05eb79312a2');
INSERT INTO participants (nickname, user_id)
VALUES ('Matt', '6fdf8002-7709-4211-9357-a05eb79312a2');
INSERT INTO participants (nickname, user_id)
VALUES ('Martin', '6fdf8002-7709-4211-9357-a05eb79312a2');
INSERT INTO participants (nickname, user_id)
VALUES ('Fenn', '6fdf8002-7709-4211-9357-a05eb79312a2');
INSERT INTO participants (nickname, user_id)
VALUES ('Kevin', '6fdf8002-7709-4211-9357-a05eb79312a2');

INSERT INTO participants (nickname, user_id) --insert part for Jiao
VALUES ('Jiao', 'b59695ff-7398-4d0b-bcdf-3b4c640f1231');
INSERT INTO participants (nickname, user_id)
VALUES ('Julien', 'b59695ff-7398-4d0b-bcdf-3b4c640f1231');
INSERT INTO participants (nickname, user_id)
VALUES ('Matt', 'b59695ff-7398-4d0b-bcdf-3b4c640f1231');
INSERT INTO participants (nickname, user_id)
VALUES ('Martin', 'b59695ff-7398-4d0b-bcdf-3b4c640f1231');
INSERT INTO participants (nickname, user_id)
VALUES ('Thomas', 'b59695ff-7398-4d0b-bcdf-3b4c640f1231');
INSERT INTO participants (nickname, user_id)
VALUES ('Kevin', 'b59695ff-7398-4d0b-bcdf-3b4c640f1231');

INSERT INTO participants (nickname, user_id) --insert part for Matthieu
VALUES ('Jiao', 'f8ad19d3-0992-4a61-b87d-536c9245fba1');
INSERT INTO participants (nickname, user_id)
VALUES ('Julien', 'f8ad19d3-0992-4a61-b87d-536c9245fba1');
INSERT INTO participants (nickname, user_id)
VALUES ('Matt', 'f8ad19d3-0992-4a61-b87d-536c9245fba1');
INSERT INTO participants (nickname, user_id)
VALUES ('Martin', 'f8ad19d3-0992-4a61-b87d-536c9245fba1');
INSERT INTO participants (nickname, user_id)
VALUES ('Thomas', 'f8ad19d3-0992-4a61-b87d-536c9245fba1');
INSERT INTO participants (nickname, user_id)
VALUES ('Kevin', 'f8ad19d3-0992-4a61-b87d-536c9245fba1');
INSERT INTO participants (nickname, user_id)
VALUES ('Vincent', 'f8ad19d3-0992-4a61-b87d-536c9245fba1');
INSERT INTO participants (nickname, user_id)
VALUES ('Xavier', 'f8ad19d3-0992-4a61-b87d-536c9245fba1');

INSERT INTO events (name, status, owner_id) --Insert event Réunion équipe
VALUES ('Réunion équipe', true, '6fdf8002-7709-4211-9357-a05eb79312a2');

INSERT INTO expenses (date, amount, description, paid_by, event_id) --Insert expense Squash
VALUES ('2018-05-15', 10040, 'Squash', 'f23648bb-f19c-40fc-a9c5-7595463c1728', '354e3ffb-da5b-41e8-a1cc-5d14ab91c4fd');

INSERT INTO expense_participants (expense_id, participant_id) --Squash benefits to 4 people including the payer, Matt
VALUES ('c2323369-4dc3-49e8-9e15-5288b705b102', 'f23648bb-f19c-40fc-a9c5-7595463c1728');
INSERT INTO expense_participants (expense_id, participant_id)
VALUES ('c2323369-4dc3-49e8-9e15-5288b705b102', 'df728937-693c-4106-b0c9-e366bdcea0ab');
INSERT INTO expense_participants (expense_id, participant_id)
VALUES ('c2323369-4dc3-49e8-9e15-5288b705b102', '0c02449d-6e19-4857-86a2-1444c4ea8bbc');
INSERT INTO expense_participants (expense_id, participant_id)
VALUES ('c2323369-4dc3-49e8-9e15-5288b705b102', '7a394339-1ea9-4b7f-b5dc-29bb260bc72f');

INSERT INTO expenses (date, amount, description, paid_by, event_id) --Insert expense Bières
VALUES ('2018-05-15', 3000, 'Bières pour tous', 'f01c9ec2-1fa9-4090-aab4-e1ca2934f94b', '354e3ffb-da5b-41e8-a1cc-5d14ab91c4fd');

INSERT INTO expense_participants (expense_id, participant_id)  --Bière benefits to all 6 people including the payer, Jiao
VALUES ('4a895f5c-d376-4d75-9d1c-46865a44924a', 'f01c9ec2-1fa9-4090-aab4-e1ca2934f94b');
INSERT INTO expense_participants (expense_id, participant_id)
VALUES ('4a895f5c-d376-4d75-9d1c-46865a44924a', 'a21c340d-4287-4142-8400-f3c4fd3a92dd');
INSERT INTO expense_participants (expense_id, participant_id)
VALUES ('4a895f5c-d376-4d75-9d1c-46865a44924a', 'f23648bb-f19c-40fc-a9c5-7595463c1728');
INSERT INTO expense_participants (expense_id, participant_id)
VALUES ('4a895f5c-d376-4d75-9d1c-46865a44924a', 'df728937-693c-4106-b0c9-e366bdcea0ab');
INSERT INTO expense_participants (expense_id, participant_id)
VALUES ('4a895f5c-d376-4d75-9d1c-46865a44924a', '0c02449d-6e19-4857-86a2-1444c4ea8bbc');
INSERT INTO expense_participants (expense_id, participant_id)
VALUES ('4a895f5c-d376-4d75-9d1c-46865a44924a', '7a394339-1ea9-4b7f-b5dc-29bb260bc72f');

INSERT INTO expenses (date, amount, description, paid_by, event_id) --Insert expense 2ème tournée
VALUES ('2018-05-15', 1800, '2ème tournée', '0c02449d-6e19-4857-86a2-1444c4ea8bbc', '354e3ffb-da5b-41e8-a1cc-5d14ab91c4fd');

INSERT INTO expense_participants (expense_id, participant_id)  --2ème tournée benefits to 2 people but the payer, Fenn
VALUES ('636dd9d3-a96a-42a0-94b5-07283a9f8091', '7a394339-1ea9-4b7f-b5dc-29bb260bc72f');
INSERT INTO expense_participants (expense_id, participant_id)
VALUES ('636dd9d3-a96a-42a0-94b5-07283a9f8091', 'df728937-693c-4106-b0c9-e366bdcea0ab');

SELECT * FROM participants WHERE user_id = 'f8ad19d3-0992-4a61-b87d-536c9245fba1'; --to be sure I use participants.id from Martin user_id (owner of the event
