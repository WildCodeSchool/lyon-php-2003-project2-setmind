SET FOREIGN_KEY_CHECKS = 0;


/* ajout des parts si existe pas */
INSERT INTO set_mind.parts (id, name, type, visual, color, special_ability, strenght, speed, capacity, setmind, `left`,
                            `right`, bottom, top, center, grade, date_creation, range_id)
VALUES (72, '2148-AA-left_leg', 'Leg', '/assets/images/parts/2148-AA-left_leg.png', 'blue', 'very bad', 0, 35, 0, 0, 0,
        1, 0, 0, 0, 0, '2020-05-10 19:15:36', 3);
INSERT INTO set_mind.parts (id, name, type, visual, color, special_ability, strenght, speed, capacity, setmind, `left`,
                            `right`, bottom, top, center, grade, date_creation, range_id)
VALUES (73, '2148-AA-right_leg', 'Leg', '/assets/images/parts/2148-AA-right_leg.png', 'blue', 'very bad', 0, 35, 0, 0,
        0, 1, 0, 0, 0, 0, '2020-05-10 19:15:36', 3);
INSERT INTO set_mind.parts (id, name, type, visual, color, special_ability, strenght, speed, capacity, setmind, `left`,
                            `right`, bottom, top, center, grade, date_creation, range_id)
VALUES (74, '2148-AA-hemlet', 'hemlet', '/assets/images/parts/2148-AA-hemlet.png', 'blue', 'very bad', 0, 0, 0, 0, 0, 0,
        0, 1, 1, 0, '2020-05-10 19:17:28', 2);
INSERT INTO set_mind.parts (id, name, type, visual, color, special_ability, strenght, speed, capacity, setmind, `left`,
                            `right`, bottom, top, center, grade, date_creation, range_id)
VALUES (75, '2148-AA-body', 'Body', '/assets/images/parts/2148-AA-body.png', 'blue', 'very bad', 0, 0, 0, 0, 0, 0, 0, 0,
        1, 0, '2020-05-10 18:19:57', 2);
INSERT INTO set_mind.parts (id, name, type, visual, color, special_ability, strenght, speed, capacity, setmind, `left`,
                            `right`, bottom, top, center, grade, date_creation, range_id)
VALUES (76, 'XXXX-XX-noarm', 'Arm', '/assets/images/parts/xxxx-xx-noarm.png', 'white', 'no', 0, 0, 0, 0, 1, 1, 0, 0, 0,
        0, '2020-05-10 18:19:57', 2);

/* mise a jour des parts si existent */
UPDATE set_mind.parts
SET name            = '2148-AA-left_leg',
    type            = 'Leg',
    visual          = '/assets/images/parts/2148-AA-left_leg.png',
    color           = 'blue',
    special_ability = 'very bad',
    strenght        = 0,
    speed           = 35,
    capacity        = 0,
    setmind         = 0,
    `left`          = 0,
    `right`         = 1,
    bottom          = 0,
    top             = 0,
    center          = 0,
    grade           = 0,
    date_creation   = '2020-05-10 19:15:36',
    range_id        = 3
WHERE id = 72;
UPDATE set_mind.parts
SET name            = '2148-AA-right_leg',
    type            = 'Leg',
    visual          = '/assets/images/parts/2148-AA-right_leg.png',
    color           = 'blue',
    special_ability = 'very bad',
    strenght        = 0,
    speed           = 35,
    capacity        = 0,
    setmind         = 0,
    `left`          = 0,
    `right`         = 1,
    bottom          = 0,
    top             = 0,
    center          = 0,
    grade           = 0,
    date_creation   = '2020-05-10 19:15:36',
    range_id        = 3
WHERE id = 73;
UPDATE set_mind.parts
SET name            = '2148-AA-hemlet',
    type            = 'hemlet',
    visual          = '/assets/images/parts/2148-AA-hemlet.png',
    color           = 'blue',
    special_ability = 'very bad',
    strenght        = 0,
    speed           = 0,
    capacity        = 0,
    setmind         = 0,
    `left`          = 0,
    `right`         = 0,
    bottom          = 0,
    top             = 1,
    center          = 1,
    grade           = 0,
    date_creation   = '2020-05-10 19:17:28',
    range_id        = 2
WHERE id = 74;
UPDATE set_mind.parts
SET name            = '2148-AA-body',
    type            = 'Body',
    visual          = '/assets/images/parts/2148-AA-body.png',
    color           = 'blue',
    special_ability = 'very bad',
    strenght        = 0,
    speed           = 0,
    capacity        = 0,
    setmind         = 0,
    `left`          = 0,
    `right`         = 0,
    bottom          = 0,
    top             = 0,
    center          = 1,
    grade           = 0,
    date_creation   = '2020-05-10 18:19:57',
    range_id        = 2
WHERE id = 75;
UPDATE set_mind.parts
SET name            = 'XXXX-XX-noarm',
    type            = 'Arm',
    visual          = '/assets/images/parts/xxxx-xx-noarm.png',
    color           = 'white',
    special_ability = 'no',
    strenght        = 0,
    speed           = 0,
    capacity        = 0,
    setmind         = 0,
    `left`          = 1,
    `right`         = 1,
    bottom          = 0,
    top             = 0,
    center          = 0,
    grade           = 0,
    date_creation   = '2020-05-10 18:19:57',
    range_id        = 2
WHERE id = 76;

/* creation de l'envelope */
INSERT INTO set_mind.envelop (id, name, date_creation, parts_id_body, parts_id_battery, parts_id_brain, parts_id_hemlet,
                              parts_id_left_arm, parts_id_right_arm, parts_id_left_leg, parts_id_right_leg)
VALUES (12, 'viteslow', '2020-05-06 11:10:51', 75, 57, 4, 74, 76, 76, 72, 73);
