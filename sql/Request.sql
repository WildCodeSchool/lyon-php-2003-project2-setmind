
# Requette permetant de retrouner la liste des parts utilisées
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN envelop as E ON p.id = E.parts_id_battery
UNION
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN envelop as E ON p.id = E.parts_id_body
UNION
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN envelop as E ON p.id = E.parts_id_brain
UNION
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN envelop as E ON p.id = E.parts_id_hemlet
UNION
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN envelop as E ON p.id = E.parts_id_left_arm
UNION
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN envelop as E ON p.id = E.parts_id_left_leg
UNION
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN envelop as E ON p.id = E.parts_id_right_arm
UNION
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN envelop as E ON p.id = E.parts_id_right_leg
UNION
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN user as U ON p.id = U.parts_id_right_leg
UNION
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN user as U ON p.id = U.parts_id_right_arm
UNION
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN user as U ON p.id = U.parts_id_left_leg
UNION
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN user as U ON p.id = U.parts_id_left_arm
UNION
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN user as U ON p.id = U.parts_id_hemlet
UNION
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN user as U ON p.id = U.parts_id_brain
UNION
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN user as U ON p.id = U.parts_id_body
UNION
SELECT DISTINCT p.id, p.name
FROM parts as p
         JOIN user as U ON p.id = U.parts_id_battery
WHERE p.id IS NOT NULL
ORDER BY id;
