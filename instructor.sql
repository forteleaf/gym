CREATE TABLE INSTRUCTOR
(
INUM NUMBER(10) PRIMARY KEY,-- 강사번호
ID VARCHAR2(30) REFERENCES USERS(id),-- 강사ID
IJOIN DATE,-- 입사일
WORK NUMBER(10),--재직여부
SAL NUMBER(10)--급여
);
create sequence instructor_seq;
insert into instructor values(instructor_seq.nextval,'hwang',sysdate,0,0,'입력하세요');
alter table instructor add (info clob);
commit;