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

SELECT * FROM participants WHERE user_id = '6fdf8002-7709-4211-9357-a05eb79312a2'; --to be sure I use participants.id from Martin user_id (owner of the event
