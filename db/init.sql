CREATE USER robs WITH password 'robs';
ALTER USER robs WITH SUPERUSER;

CREATE SCHEMA services_schema;

SET SCHEMA 'services_schema';
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
GRANT EXECUTE ON FUNCTION uuid_generate_v4() TO urbano;

CREATE TABLE tb_role
(
    role_id UUID PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    role_name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CHECK ( role_name IN ('ROLE_USER', 'ROLE_ADMIN'))
);

CREATE TABLE tb_user
(
    user_id UUID PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE tb_users_roles
(
    user_role_id UUID PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    role_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT FK_user_id FOREIGN KEY (role_id) REFERENCES tb_role(role_id),
    CONSTRAINT FK_role_id FOREIGN KEY (user_id) REFERENCES tb_user(user_id)
);

CREATE TABLE tb_candy
(
    candy_id UUID PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    candy_name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

insert into tb_role (role_name) values ('ROLE_ADMIN');
insert into tb_role (role_name) values ('ROLE_USER');
insert into tb_user (username, password) values ('robs', 'robs');
insert into tb_users_roles (user_id, role_id) VALUES ((select user_id from tb_user where username = 'robs'), (select role_id from tb_role where role_name = 'ROLE_ADMIN'));

ALTER SCHEMA interview_service OWNER TO urbano;
