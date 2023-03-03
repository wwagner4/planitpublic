create table user_accounts
(
    id            bigserial                              not null
        constraint usr_pk primary key not null,
    user_code     varchar(300)                           not null
        constraint usr_uk unique,
    first_name    varchar(32)                            not null,
    last_name     varchar(32)                            not null,
    email         varchar(300)                           not null,
    internal_user bool                                   not null,
    created_at    timestamp(6) default current_timestamp not null,
    --create_user_id              number(19) constraint usr_usr_crea_fk references user_account on delete set null,
    changed_at    timestamp(6) default current_timestamp not null
    --change_user_id              number(19) constraint usr_usr_chng_fk references user_account on delete set null,
);
