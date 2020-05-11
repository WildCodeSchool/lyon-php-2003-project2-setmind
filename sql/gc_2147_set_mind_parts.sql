SET FOREIGN_KEY_CHECKS = 0;

/* parts create */
INSERT INTO set_mind.parts (id, name, type, visual, color, special_ability, strenght, speed, capacity, setmind, `left`,
                            `right`, bottom, top, center, grade, date_creation, range_id)
VALUES (66, '2147-AA-body', 'Body', '/assets/images/parts/2147-AA-body.png', 'violet', 'bad', 0, 0, 0, 0, 0, 0, 0, 0, 1,
        0, '2020-05-10 18:19:57', 2);
INSERT INTO set_mind.parts (id, name, type, visual, color, special_ability, strenght, speed, capacity, setmind, `left`,
                            `right`, bottom, top, center, grade, date_creation, range_id)
VALUES (67, '2147-AA-hemlet', 'hemlet', '/assets/images/parts/2147-AA-hemlet.png', 'violet', 'bad', 0, 0, 0, 0, 0, 0, 0,
        1, 1, 0, '2020-04-16 11:57:12', 2);
INSERT INTO set_mind.parts (id, name, type, visual, color, special_ability, strenght, speed, capacity, setmind, `left`,
                            `right`, bottom, top, center, grade, date_creation, range_id)
VALUES (68, '2147-AA-right_arm', 'Arm', '/assets/images/parts/2147-AA-right_arm.png', 'violet', 'bad', 5, 0, 0, 0, 0, 1,
        0, 0, 0, 0, '2020-04-16 11:57:12', 2);
INSERT INTO set_mind.parts (id, name, type, visual, color, special_ability, strenght, speed, capacity, setmind, `left`,
                            `right`, bottom, top, center, grade, date_creation, range_id)
VALUES (69, '2147-AA-left_arm', 'Arm', '/assets/images/parts/2147-AA-left_arm.png', 'violet', 'bad', 5, 0, 0, 0, 0, 1,
        0, 0, 0, 0, '2020-04-16 11:57:12', 2);
INSERT INTO set_mind.parts (id, name, type, visual, color, special_ability, strenght, speed, capacity, setmind, `left`,
                            `right`, bottom, top, center, grade, date_creation, range_id)
VALUES (70, '2147-AA-right_leg', 'Leg', '/assets/images/parts/2147-AA-right_leg.png', 'violet', 'bad', 0, 5, 0, 0, 0, 1,
        0, 0, 0, 0, '2020-04-16 11:57:12', 2);
INSERT INTO set_mind.parts (id, name, type, visual, color, special_ability, strenght, speed, capacity, setmind, `left`,
                            `right`, bottom, top, center, grade, date_creation, range_id)
VALUES (71, '2147-AA-left_leg', 'Leg', '/assets/images/parts/2147-AA-left_leg.png', 'violet', 'bad', 0, 5, 0, 0, 0, 1,
        0, 0, 0, 0, '2020-04-16 11:57:12', 2);

/* parts update */
UPDATE set_mind.parts
SET name            = '2147-AA-body',
    type            = 'Body',
    visual          = '/assets/images/parts/2147-AA-body.png',
    color           = 'violet',
    special_ability = 'bad',
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
WHERE id = 66;
UPDATE set_mind.parts
SET name            = '2147-AA-hemlet',
    type            = 'hemlet',
    visual          = '/assets/images/parts/2147-AA-hemlet.png',
    color           = 'violet',
    special_ability = 'bad',
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
    date_creation   = '2020-04-16 11:57:12',
    range_id        = 2
WHERE id = 67;
UPDATE set_mind.parts
SET name            = '2147-AA-right_arm',
    type            = 'Arm',
    visual          = '/assets/images/parts/2147-AA-right_arm.png',
    color           = 'violet',
    special_ability = 'bad',
    strenght        = 5,
    speed           = 0,
    capacity        = 0,
    setmind         = 0,
    `left`          = 0,
    `right`         = 1,
    bottom          = 0,
    top             = 0,
    center          = 0,
    grade           = 0,
    date_creation   = '2020-04-16 11:57:12',
    range_id        = 2
WHERE id = 68;
UPDATE set_mind.parts
SET name            = '2147-AA-left_arm',
    type            = 'Arm',
    visual          = '/assets/images/parts/2147-AA-left_arm.png',
    color           = 'violet',
    special_ability = 'bad',
    strenght        = 5,
    speed           = 0,
    capacity        = 0,
    setmind         = 0,
    `left`          = 0,
    `right`         = 1,
    bottom          = 0,
    top             = 0,
    center          = 0,
    grade           = 0,
    date_creation   = '2020-04-16 11:57:12',
    range_id        = 2
WHERE id = 69;
UPDATE set_mind.parts
SET name            = '2147-AA-right_leg',
    type            = 'Leg',
    visual          = '/assets/images/parts/2147-AA-right_leg.png',
    color           = 'violet',
    special_ability = 'bad',
    strenght        = 0,
    speed           = 5,
    capacity        = 0,
    setmind         = 0,
    `left`          = 0,
    `right`         = 1,
    bottom          = 0,
    top             = 0,
    center          = 0,
    grade           = 0,
    date_creation   = '2020-04-16 11:57:12',
    range_id        = 2
WHERE id = 70;
UPDATE set_mind.parts
SET name            = '2147-AA-left_leg',
    type            = 'Leg',
    visual          = '/assets/images/parts/2147-AA-left_leg.png',
    color           = 'violet',
    special_ability = 'bad',
    strenght        = 0,
    speed           = 5,
    capacity        = 0,
    setmind         = 0,
    `left`          = 0,
    `right`         = 1,
    bottom          = 0,
    top             = 0,
    center          = 0,
    grade           = 0,
    date_creation   = '2020-04-16 11:57:12',
    range_id        = 2
WHERE id = 71;

/* envelops */
INSERT INTO set_mind.envelop (id, name, date_creation, parts_id_body, parts_id_battery, parts_id_brain, parts_id_hemlet,
                              parts_id_left_arm, parts_id_right_arm, parts_id_left_leg, parts_id_right_leg)
VALUES (11, 'badonall', '2020-05-06 11:10:51', 66, 2, 4, 67, 69, 68, 71, 70);
