CREATE TABLE INSTRUCTOR
(
INUM NUMBER(10) PRIMARY KEY,-- �����ȣ
ID VARCHAR2(30) REFERENCES USERS(id),-- ����ID
IJOIN DATE,-- �Ի���
WORK NUMBER(10),--��������
SAL NUMBER(10)--�޿�
);
create sequence instructor_seq;
insert into instructor values(instructor_seq.nextval,'hwang',sysdate,0,0,'�Է��ϼ���');
alter table instructor add (info clob);
commit;