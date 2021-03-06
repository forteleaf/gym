CREATE TABLE users(
		uNUM                          		NUMBER(5),  
		uNAME                         		VARCHAR2(20),
		ID                            		VARCHAR2(20)		primary key,	
		PASSWORD                      		VARCHAR2(20)		 NOT NULL,
		EMAIL                         		VARCHAR2(30),
		ADDR                          		VARCHAR2(50),
		SEX                           		NUMBER(2),
		BIRTH                         		DATE,
		REGDATE                       		DATE,
		orgfilename                   		VARCHAR2(100),
		savefilename                  		VARCHAR2(100),
		filesize                      		LONG,
		grade                         		number(2),
		phone								varchar2(20)
);

CREATE SEQUENCE users_uNUM_seq;

insert into users values(users_unum_seq.nextval,'황정환','hwang','1234','hwang@daum.net','일산','3','2000-10-10',sysdate,null,null,0,1,'010-222-2222');
insert into users values(users_unum_seq.nextval,'형진','test','1234','hwang@daum.net','일산','3','2000-04-27',sysdate,null,null,0,1,'010-222-2222');
insert into users values(users_unum_seq.nextval,'train3','train3','1234','hwang@daum.net','일산','3','2001-04-27',sysdate,null,null,0,1,'010-222-2222');
insert into users values(users_unum_seq.nextval,'train4','train4','1234','hwang@daum.net','일산','3','2002-04-27',sysdate,null,null,0,1,'010-222-2222');
insert into users values(users_unum_seq.nextval,'train5','train5','1234','hwang@daum.net','일산','3','2003-04-27',sysdate,null,null,0,1,'010-222-2222');


ALTER TABLE USERS RENAME COLUMN ORGFILENAME TO ORGFILE;

 ALTER TABLE USERS RENAME COLUMN SAVEFILENAME TO SAVEFILE;
 
 alter table users add(phone varchar(20));
 
 ALTER TABLE USERS RENAME COLUMN password TO pwd;
