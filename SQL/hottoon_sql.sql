drop sequence s97_hottoon_no;
create sequence s97_hottoon_no;

drop table t97_hottoon purge;
create table t97_hottoon(
	no number primary key,
	userid varchar2(10),
	genre varchar2(25) not null,
	completion varchar2(10) not null,
	title varchar2(100) not null,
	content varchar2(4000),
	imagepath varchar2(1500),
	reg_date date default sysdate
);

select * from t97_hottoon;

select X.rnum, X.*
  from (select rownum as rnum, A.*
		  from (select *
		  		  from t97_hottoon
		  		order by reg_date) A
		 where rownum <= 5) X
 where X.rnum >= 1;

select u.id 
  from tb_users u
inner join t97_hottoon h
   on u.id = h.userid;
 
drop sequence s97_test;
create sequence s97_test;

drop table tb97_test purge;
create table tb97_test(
	no number primary key,
	reg_date date default sysdate
);

insert into tb97_test(no)
values(s97_test.nextval);

select * from tb97_test;