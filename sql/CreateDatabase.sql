/* before create dn set_mind */

SET FOREIGN_KEY_CHECKS=0;
CREATE TABLE `question` (
                            `id` int PRIMARY KEY AUTO_INCREMENT,
                            `contenu` text,
                            `numeros` int
);

CREATE TABLE `answer` (
                          `id` int PRIMARY KEY AUTO_INCREMENT,
                          `contenu` varchar(200),
                          `question_id` int,
                          `next_question_id` int,
                          `value_score` int,
                          `user_id` int
);

CREATE TABLE `user` (
                        `id` int PRIMARY KEY AUTO_INCREMENT,
                        `first_name` varchar(50),
                        `last_name` varchar(50),
                        `email` varchar(70),
                        `pseudo` varchar(20),
                        `password` varchar(50),
                        `final_score` int,
                        `answer_id` int,
                        `profil_id` int,
                        `date_creation` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        `parts_id_body` int,
                        `parts_id_battery` int,
                        `parts_id_brain` int,
                        `parts_id_hemlet` int,
                        `parts_id_left_arm` int,
                        `parts_id_right_arm` int,
                        `parts_id_left_leg` int,
                        `parts_id_right_leg` int
);

CREATE TABLE `profil` (
                          `id` int PRIMARY KEY AUTO_INCREMENT,
                          `name` varchar(50),
                          `image` varchar(300),
                          `score_max` int,
                          `score_min` int
);

CREATE TABLE `profil_enveloppes` (
                                     `profil_id` int,
                                     `enveloppe_id` int
);

CREATE TABLE `enveloppe` (
                             `id` int PRIMARY KEY AUTO_INCREMENT,
                             `name` varchar(255),
                             `date_creation` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             `parts_id_body` int,
                             `parts_id_battery` int,
                             `parts_id_brain` int,
                             `parts_id_hemlet` int,
                             `parts_id_left_arm` int,
                             `parts_id_right_arm` int,
                             `parts_id_left_leg` int,
                             `parts_id_right_leg` int
);

CREATE TABLE `parts` (
                         `id` int PRIMARY KEY AUTO_INCREMENT,
                         `name` varchar(50) DEFAULT 'default',
                         `type` varchar(50) DEFAULT 'corps',
                         `visual` varchar(300) DEFAULT '/img/default.png',
                         `color` varchar(50) DEFAULT 'black',
                         `special_ability` varchar(20) DEFAULT 'cool',
                         `strenght` int DEFAULT 0,
                         `speed` int DEFAULT 0,
                         `capacity` int DEFAULT 50,
                         `charge` int DEFAULT 50,
                         `left` boolean DEFAULT 0,
                         `right` boolean DEFAULT 0,
                         `bottom` boolean DEFAULT 0,
                         `top` boolean DEFAULT 0,
                         `center` boolean DEFAULT 0,
                         `grade` int DEFAULT 0,
                         `date_creation` timestamp DEFAULT now(),
                         `range_id` int
);

CREATE TABLE `range` (
                         `id` int PRIMARY KEY AUTO_INCREMENT,
                         `name` varchar(10)
);

ALTER TABLE `answer` ADD FOREIGN KEY (`question_id`) REFERENCES `question` (`id`);

ALTER TABLE `answer` ADD FOREIGN KEY (`next_question_id`) REFERENCES `question` (`id`);

ALTER TABLE `answer` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `user` ADD FOREIGN KEY (`profil_id`) REFERENCES `profil` (`id`);

ALTER TABLE `user` ADD FOREIGN KEY (`parts_id_body`) REFERENCES `parts` (`id`);

ALTER TABLE `user` ADD FOREIGN KEY (`parts_id_battery`) REFERENCES `parts` (`id`);

ALTER TABLE `user` ADD FOREIGN KEY (`parts_id_brain`) REFERENCES `parts` (`id`);

ALTER TABLE `user` ADD FOREIGN KEY (`parts_id_hemlet`) REFERENCES `parts` (`id`);

ALTER TABLE `user` ADD FOREIGN KEY (`parts_id_left_arm`) REFERENCES `parts` (`id`);

ALTER TABLE `user` ADD FOREIGN KEY (`parts_id_right_arm`) REFERENCES `parts` (`id`);

ALTER TABLE `user` ADD FOREIGN KEY (`parts_id_left_leg`) REFERENCES `parts` (`id`);

ALTER TABLE `user` ADD FOREIGN KEY (`parts_id_right_leg`) REFERENCES `parts` (`id`);

/*ALTER TABLE `profil` ADD FOREIGN KEY (`profil_id`) REFERENCES `profil_enveloppes` (`profil_id`);*/

/*ALTER TABLE `enveloppe` ADD FOREIGN KEY (`enveloppe_id`) REFERENCES `profil_enveloppes` (`enveloppe_id`);*/

ALTER TABLE `enveloppe` ADD FOREIGN KEY (`parts_id_body`) REFERENCES `parts` (`id`);

ALTER TABLE `enveloppe` ADD FOREIGN KEY (`parts_id_battery`) REFERENCES `parts` (`id`);

ALTER TABLE `enveloppe` ADD FOREIGN KEY (`parts_id_brain`) REFERENCES `parts` (`id`);

ALTER TABLE `enveloppe` ADD FOREIGN KEY (`parts_id_hemlet`) REFERENCES `parts` (`id`);

ALTER TABLE `enveloppe` ADD FOREIGN KEY (`parts_id_left_arm`) REFERENCES `parts` (`id`);

ALTER TABLE `enveloppe` ADD FOREIGN KEY (`parts_id_right_arm`) REFERENCES `parts` (`id`);

ALTER TABLE `enveloppe` ADD FOREIGN KEY (`parts_id_left_leg`) REFERENCES `parts` (`id`);

ALTER TABLE `enveloppe` ADD FOREIGN KEY (`parts_id_right_leg`) REFERENCES `parts` (`id`);

/*ALTER TABLE `range` ADD FOREIGN KEY (`id`) REFERENCES `parts` (`range_id`);*