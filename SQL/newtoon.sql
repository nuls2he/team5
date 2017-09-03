drop table toon;

create sequence toon_seq

create table toon(
 no number(5),
 Title varchar2(100) not null,
 content varchar2(100) not null,
 image varchar2(100),
 hits number(5) default 0,
 regdate Date default sysdate,
 type varchar2(3) not null,
 id varchar2(100) 
);


select *
from toon;


