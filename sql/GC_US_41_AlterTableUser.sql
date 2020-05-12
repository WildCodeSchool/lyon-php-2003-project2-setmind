alter table user
    add envelop_id int default 0 null;
set foreign_key_checks = 0;
alter table user
    add constraint user_ibfk_10
        foreign key (envelop_id) references envelop (id);
