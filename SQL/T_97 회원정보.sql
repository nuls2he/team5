create table tb_users (
	id varchar2(10) not null primary key,
	nick VARCHAR2(21) not null,
	pwd VARCHAR2(30) not null,
	email VARCHAR2(40) not null,
	hintQ VARCHAR2(90) not null,
	hintA VARCHAR2(30) not null,
	name VARCHAR2(50) null,
	call VARCHAR2(30) null,
	addHead VARCHAR2(255) null,
  addTail VARCHAR2(255) null,
	check_ad VARCHAR2(3) null,
	admin_yn VARCHAR2(3) null
);
drop table tb_users purge;
select * from tb_users; 