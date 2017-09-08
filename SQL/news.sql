create table tb97_news (
    no   number(6) primary key, 
    title varchar2(400) not null,
    content varchar2(2000) not null,
    pic varchar2(150),
    url varchar2(200),
    regDate date default sysdate
);
drop table tb97_news purge;


create sequence tb97_news_no;
  drop sequence tb97_news_no;
  
select * from tb97_news;


insert into tb97_news(no, title, content, pic, url)
  values(tb97_news_no.nextval, '안녕하세요', '오늘은 날씨가 좋네요.', 'a.jpg', 'https://www.naver.com/');
insert into tb97_news(no, title, content, pic, url)
  values(tb97_news_no.nextval, '안녕', '오늘은 날씨가 별로야.', 'a.jpg', 'https://www.daum.com/');