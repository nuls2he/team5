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
drop table tb_users;
select * from tb_users;
delete tb_users;
commit;
select * from t_member;



create table tb_toonart (
	art_no number(10) not null primary key,
	title varchar2(30) not null,
  content varchar2(400) null,
	image varchar2(50) not null,
	id varchar2(30) not null,
	hits number(10 )null,
	reg_date date default sysdate,
	toon_type varchar2(10) null
);
commit;
drop table tb_toonart purge;

select * from tb_toonart;
insert into tb_toonart(art_no, title, image, id, toon_type)
values (art_board_no.nextval, '은행나무', '/testing/html/toonart/css/b.jpg', 'admin1', 't');

delete TB_TOONART;

create sequence art_board_no;


