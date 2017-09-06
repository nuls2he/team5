create table tb_users (
	id varchar2(10) not null primary key,
	nick VARCHAR2(21) not null,
	pwd VARCHAR2(30) not null,
	email VARCHAR2(40) not null,
	hintQ VARCHAR2(90) not null,
	hintA VARCHAR2(30) not null,
	name VARCHAR2(50) null,
	call VARCHAR2(30) null,
	addr VARCHAR2(255) null,
	check_ad VARCHAR2(3) null,
	admin_yn VARCHAR2(3) null
);

select * from tb_users where id = 'abc123';

delete TB_USERS;

drop table tb_users;

select *
  from tb_users
 where id = 'abc123' and pwd = '123';
 