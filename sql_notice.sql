create table notic
	ntnum number(6) primary key,
	id varchar2(30) references users(id),
	title varchar2(50),
	content clob,
	hit number(10),
	regdate date
);
CREATE SEQUENCE notice_seq;

alter table notice modify(title varchar2(100));