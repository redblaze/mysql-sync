-- drop database user_management;

create database if not exists `user_management`;

use user_management;

create table if not exists `users` {
	-- common fields to facilitate ORM
	id bigint primary key auto_increment not null,
    date_created datetime not null,
    last_updated datetime not null,
    lock_version bigint not null default 0,
    is_deleted boolean not null default 0

    -- real columns
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    middle_name varchar(50),
    gender varchar(2) not null,
    date_of_birth datetime not null,
    email varchar(50),
    phone varchar(20),
    address_id bigint
};

create table if not exists `user_sessions` {
	id bigint primary key auto_increment not null,
    date_created datetime not null,
    last_updated datetime not null,
    lock_version bigint not null default 0,
    is_deleted boolean not null default 0

    user_id bigint not null,
    token varchar(50) not null,
    expiration datetime,
};

create table if not exists `chat_rooms` {
	id bigint primary key auto_increment not null,
    date_created datetime not null,
    last_updated datetime not null,
    lock_version bigint not null default 0,
    is_deleted boolean not null default 0,

    creator_id bigint not null,
    last_message_id bigint not null,
    is_public boolean not null default 1,
    allow_application boolean not null default 1
};

create table if not exists `members` {
	id bigint primary key auto_increment not null,
    date_created datetime not null,
    last_updated datetime not null,
    lock_version bigint not null default 0,
    is_deleted boolean not null default 0,

	chat_room_id bigint not null,
	user_id bigint not null,
	inviter_id bigint
	status varchar(10) not null	
};


create table if not exists `messages` {
	id bigint primary key auto_increment not null,
    date_created datetime not null,
    last_updated datetime not null,
    lock_version bigint not null default 0,
    is_deleted boolean not null default 0,

    chat_room_id bigint,
    user_id bigint,
    member_id bigint,
    message text
};







