
create sequence s97_hottoon_no;

drop table t97_hottoon;
create table t97_hottoon(
	no number primary key,
	userid varchar2(10) foreign key,
	genre varchar2(25) not null,
	completion varchar2(10) not null,
	title varchar2(100) not null,
	content varchar2(4000),
	imagepath varchar2(1500),
	url varchar2(1500),
	reg_date date default sysdate
);