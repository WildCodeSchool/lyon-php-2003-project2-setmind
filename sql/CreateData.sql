/* dbname set_mind */
SET FOREIGN_KEY_CHECKS=0;
/* Creation users */
INSERT INTO set_mind.user (first_name, last_name, email, pseudo, password, final_score, answer_id, profil_id, date_creation, parts_id_body, parts_id_battery, parts_id_brain, parts_id_hemlet, parts_id_left_arm, parts_id_right_arm, parts_id_left_leg, parts_id_right_leg) VALUES ('Guillaume', 'SetMindTeam', 'actix2013@gmail.com', 'R.Guille Olivaw', null, null,1,2, DEFAULT, null, null, null, null, null, null, null, null);
INSERT INTO set_mind.user (first_name, last_name, email, pseudo, password, final_score, answer_id, profil_id, date_creation, parts_id_body, parts_id_battery, parts_id_brain, parts_id_hemlet, parts_id_left_arm, parts_id_right_arm, parts_id_left_leg, parts_id_right_leg) VALUES ('Lisa', 'SetMindTeam', 'lisa3@gmail.com', 'R.Lisa Olivaw', null, null, 5, 2, DEFAULT, null, null, null, null, null, null, null, null);
INSERT INTO set_mind.user (first_name, last_name, email, pseudo, password, final_score, answer_id, profil_id, date_creation, parts_id_body, parts_id_battery, parts_id_brain, parts_id_hemlet, parts_id_left_arm, parts_id_right_arm, parts_id_left_leg, parts_id_right_leg) VALUES ('Ben Kenobi', 'SetMindTeam', 'ben.kenobi@gmail.com', 'R.Ben Olivaw', null, 10, null, 2, DEFAULT, null, null, null, null, null, null, null, null);
INSERT INTO set_mind.user (first_name, last_name, email, pseudo, password, final_score, answer_id, profil_id, date_creation, parts_id_body, parts_id_battery, parts_id_brain, parts_id_hemlet, parts_id_left_arm, parts_id_right_arm, parts_id_left_leg, parts_id_right_leg) VALUES ('Ben Vador', 'SetMindTeam', 'ben.vador@gmail.com', 'R.Vador Olivaw', null, 11, null, 2, DEFAULT, null, null, null, null, null, null, null, null);

/* creation range */
INSERT INTO set_mind.`range` (name) VALUES ('2095');
INSERT INTO set_mind.`range` (name) VALUES ('2096');
INSERT INTO set_mind.`range` (name) VALUES ('2097');
INSERT INTO set_mind.`range` (name) VALUES ('2098');
INSERT INTO set_mind.`range` (name) VALUES ('2099');
INSERT INTO set_mind.`range` (name) VALUES ('2100');
INSERT INTO set_mind.`range` (name) VALUES ('2101');

/* creation Qustion 1 */
INSERT INTO set_mind.question (contenu, numeros) VALUES ('Choisi parmis ces robot celui  qui tu prefere ? ', 1);
/* answer Question 1 */
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('Wall-e', 1, 2, 25, null);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('C3-PO', 1, 3, 50, null);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('R.Daneel Olivaw', 1, 4, 0, null);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('T-800', 1, 5, 75, null);

/* creation Qustion 2 et reponse Q2.1*/
INSERT INTO set_mind.question (contenu, numeros) VALUES ('Wall-e : De ces activitées quelle est ta préféré ? ', 2);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('Tout ranger , classer , trier !', 2, null, 50, null);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('Ecraser, concasser, empiler !', 2, null, 75, null);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('Receuillir , aider , cultiver !', 2, null, 25, null);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('REcherche un ou une amie fidele !', 2, null, 0, null);

/* creation reponses Q2.2 */
INSERT INTO set_mind.question (contenu, numeros) VALUES ('C3-PO : De ces activitées quelle est ta préféré ? ', 3);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('Soutenir la rsistance !', 3, null, 25, null);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('Me faire repararer par R2-D2 !', 3, null, 50, null);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('Parler plusieurs million de dialectes !', 3, null, 0, null);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('Avoir été construit par Dark Vador', 3, null, 75, null);

/* creation reponses Q2.3 */
INSERT INTO set_mind.question (contenu, numeros) VALUES ('R.Deneel : De ces activitées quelle est ta préféré ? ', 4);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('Un robot ne peut porter atteinte à un être humain ni, restant passif, laisser cet être humain exposé au danger. ', 4, null, 25 , null);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('Un robot doit obéir aux ordres donnés par les êtres humains, sauf si de tels ordres sont en contradiction avec la Première Loi. ', 4, null, 50, null);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('Un robot doit protéger son existence dans la mesure où cette protection n''entre pas en contradiction avec la Première ou la Deuxième Loi.', 4, null, 75, null);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('Je choisie la loi 0.' , 4, null, 0, null);

/* creation reponse Q2.4 */
INSERT INTO set_mind.question (contenu, numeros) VALUES ('T-800 : De ces activitées quelle est ta préféré ? ', 5);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('Jhon connor is the best !', 5, null, 75, null);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('I love cyberdine !', 5, null, 75, null);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('Trop cool de hacker les distributeurs de monaie !', 5, null, 50, null);
INSERT INTO set_mind.answer (contenu, question_id, next_question_id, value_score, user_id) VALUES ('Repartir dans le passer pour tuer mes enemis !', 5, null, 75, null);

/* creation d'une envelope */
INSERT INTO set_mind.envelop (name, date_creation, parts_id_body, parts_id_battery, parts_id_brain, parts_id_hemlet, parts_id_left_arm, parts_id_right_arm, parts_id_left_leg, parts_id_right_leg)VALUES ('CarniLol_default', DEFAULT, 1, 2, 4, 3, 6, 5, 8, 7);
INSERT INTO set_mind.envelop (name, date_creation, parts_id_body, parts_id_battery, parts_id_brain, parts_id_hemlet, parts_id_left_arm, parts_id_right_arm, parts_id_left_leg, parts_id_right_leg)VALUES ('CarniLol_Barbar', DEFAULT, 1, 2, 4, 3, 6, 5, 8, 7);
INSERT INTO set_mind.envelop (name, date_creation, parts_id_body, parts_id_battery, parts_id_brain, parts_id_hemlet, parts_id_left_arm, parts_id_right_arm, parts_id_left_leg, parts_id_right_leg)VALUES ('CarniLol_Normal', DEFAULT, 1, 2, 4, 3, 6, 5, 8, 7);
INSERT INTO set_mind.envelop (name, date_creation, parts_id_body, parts_id_battery, parts_id_brain, parts_id_hemlet, parts_id_left_arm, parts_id_right_arm, parts_id_left_leg, parts_id_right_leg)VALUES ('CarniLol_Speed', DEFAULT,1, 2, 4, 3, 9, 5, 8, 7);
INSERT INTO set_mind.envelop (name, date_creation, parts_id_body, parts_id_battery, parts_id_brain, parts_id_hemlet, parts_id_left_arm, parts_id_right_arm, parts_id_left_leg, parts_id_right_leg)VALUES ('CarniLol_Genius', DEFAULT, 1, 2, 4, 3, 9, 5, 8, 7);

/* creation des profils */
INSERT INTO set_mind.profil (name, image, score_max, score_min) VALUES ('Warior', 'null', 150, 125);
INSERT INTO set_mind.profil (name, image, score_max, score_min) VALUES ('Genius','null', 0, 49);
INSERT INTO set_mind.profil (name, image, score_max, score_min) VALUES ('Normal','null', 50, 124);

/* creation des données des liens profil_enveloppes */
INSERT INTO set_mind.profil_envelops (profil_id, envelop_id)VALUES (1, 2);
INSERT INTO set_mind.profil_envelops (profil_id, envelop_id)VALUES (3, 3);
INSERT INTO set_mind.profil_envelops (profil_id, envelop_id)VALUES (3, 4);
INSERT INTO set_mind.profil_envelops (profil_id, envelop_id)VALUES (3, 1);
INSERT INTO set_mind.profil_envelops (profil_id, envelop_id)VALUES (2, 2);
INSERT INTO set_mind.profil_envelops (profil_id, envelop_id)VALUES (2, 1);

/* Creation des parts */
INSERT INTO set_mind.parts (name, type, visual, color, special_ability, strenght, speed, capacity, charge, `left`, `right`, bottom, top, center, grade, date_creation, range_id) VALUES ('body-2045-AA', 'Body', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, DEFAULT, DEFAULT, 1);
INSERT INTO set_mind.parts (name, type, visual, color, special_ability, strenght, speed, capacity, charge, `left`, `right`, bottom, top, center, grade, date_creation, range_id) VALUES ('battery-2045-AA', 'Baterry', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 100, 50, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, DEFAULT, DEFAULT, 1);
INSERT INTO set_mind.parts (name, type, visual, color, special_ability, strenght, speed, capacity, charge, `left`, `right`, bottom, top, center, grade, date_creation, range_id) VALUES ('hemlet-2045-AA', 'hemlet', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 1, DEFAULT, DEFAULT, 1);
INSERT INTO set_mind.parts (name, type, visual, color, special_ability, strenght, speed, capacity, charge, `left`, `right`, bottom, top, center, grade, date_creation, range_id) VALUES ('brain-2045-AA', 'Brain', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 1, DEFAULT, DEFAULT, 1);
INSERT INTO set_mind.parts (name, type, visual, color, special_ability, strenght, speed, capacity, charge, `left`, `right`, bottom, top, center, grade, date_creation, range_id) VALUES ('right_arm-2045-AA', 'Arm', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 0, 1, DEFAULT, 0, 0, DEFAULT, DEFAULT, 1);
INSERT INTO set_mind.parts (name, type, visual, color, special_ability, strenght, speed, capacity, charge, `left`, `right`, bottom, top, center, grade, date_creation, range_id) VALUES ('left_arm-2045-AA', 'Arm', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 0, DEFAULT, 0, 0, DEFAULT, DEFAULT, 1);
INSERT INTO set_mind.parts (name, type, visual, color, special_ability, strenght, speed, capacity, charge, `left`, `right`, bottom, top, center, grade, date_creation, range_id) VALUES ('right_leg-2045-AA', 'Leg', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 0, 1, DEFAULT, 0, 0, DEFAULT, DEFAULT, 1);
INSERT INTO set_mind.parts (name, type, visual, color, special_ability, strenght, speed, capacity, charge, `left`, `right`, bottom, top, center, grade, date_creation, range_id) VALUES ('left_leg-2045-AA', 'Leg', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 0, DEFAULT, 0, 0, DEFAULT, DEFAULT, 1);
INSERT INTO set_mind.parts (name, type, visual, color, special_ability, strenght, speed, capacity, charge, `left`, `right`, bottom, top, center, grade, date_creation, range_id) VALUES ('right_arm-2045-AB', 'Arm', 'right_arm-2045-AB.png', 'red', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 0, 1, DEFAULT, 0, 0, DEFAULT, DEFAULT, 1);
INSERT INTO set_mind.parts (name, type, visual, color, special_ability, strenght, speed, capacity, charge, `left`, `right`, bottom, top, center, grade, date_creation, range_id) VALUES ('left_arm-2045-AB', 'Arm','right_arm-2045-AB.png', 'red', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 0, DEFAULT, 0, 0, DEFAULT, DEFAULT, 1);
INSERT INTO set_mind.parts (name, type, visual, color, special_ability, strenght, speed, capacity, charge, `left`, `right`, bottom, top, center, grade, date_creation, range_id) VALUES ('right_leg-2045-AB', 'Leg','right_arm-2045-AB.png', 'red', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 0, 1, DEFAULT, 0, 0, DEFAULT, DEFAULT, 1);
INSERT INTO set_mind.parts (name, type, visual, color, special_ability, strenght, speed, capacity, charge, `left`, `right`, bottom, top, center, grade, date_creation, range_id) VALUES ('left_leg-2045-AB', 'Leg', 'right_arm-2045-AB.png', 'red', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 0, DEFAULT, 0, 0, DEFAULT, DEFAULT, 1);
