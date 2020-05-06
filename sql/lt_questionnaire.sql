update question set contenu = "Choose the most attractive robot for you  " where id = 1;
update question set contenu = "what ability attract you?" where id = 2;
update question set contenu ="which weapons would you choose to survive ?" where id = 3;
update question set contenu = "at what period could you live ?" where id = 4;
update question set contenu = "which creature fascinate you ?" where id = 5; 
insert into question (contenu) values ("Choose a travel destination");


update answer set contenu = "Wall-e" where id = 1;

insert into answer (contenu, question_id, next_question_id, value_score, user_id) values ("Chappie", 1, 2, 25, NULL),
 ("Johnny five", 1, 2, 35, NULL), ("Ultron", 6, NULL, 30, NULL);

update answer set contenu = "martial arts" where id = 5;
update answer set contenu = "time travel" where id = 6;
update answer set contenu ="metamorphosis" where id = 7;
update answer set contenu ="invisibility" where id = 8;
update answer set contenu = "saber" where id = 9;
update answer set contenu = "wooden stick" where id = 10;
update answer set contenu ="no need for weapons" where id = 11;
update answer set contenu ="bow" where id = 12;
update answer set contenu = "prehistory" where id = 13;
update answer set contenu = "antiquity" where id = 14;
update answer set contenu = "future world" where id = 15;
update answer set contenu = "at this moment" where id = 16;
update answer set contenu = "fairies" where id = 17;
update answer set contenu = "zombies" where id = 18;
update answer set contenu = "reptilian" where id = 19;
update answer set contenu = "goblins" where id = 20;

update answer set next_question_id = 2 where question_id = 1;
update answer set next_question_id = 3 where question_id = 2;
update answer set next_question_id = 3 where id = 5;
update answer set next_question_id = 4 where id = 6;
update answer set next_question_id = 5 where id = 7;
update answer set next_question_id = 6 where id = 8;
update answer set next_question_id = 4 where id = 13;


insert into answer (contenu, question_id, next_question_id, value_score, user_id)
 values ("isle", 6, NULL, 30, NULL);
insert into answer (contenu, question_id, next_question_id, value_score, user_id)
 values ("beach", 6, NULL, 25, NULL), ("Mars planet", 6, NULL, 35, NULL), ("i don't like to travel", 6, NULL, 30, NULL);

