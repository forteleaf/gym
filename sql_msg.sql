/**********************************/
/**********************************/
/* Table Name: 메시지 */
/**********************************/
CREATE TABLE MSG(
		MSGNUM                        		NUMBER(5)		 NULL ,
		ID                            		VARCHAR2(20)		 not NULL ,
		RECV_ID                       		VARCHAR2(20)		 not NULL ,
		CONTENT                       		clob		 NULL ,
		SEND_DATE                     		DATE		 NULL ,
		STATUS                        		char(1)		 NULL 
);

ALTER TABLE msg ADD CONSTRAINT IDX_msg_PK PRIMARY KEY (MSGNUM);
ALTER TABLE msg ADD CONSTRAINT IDX_msg_FK0 FOREIGN KEY (ID) REFERENCES users (ID);

create sequence msg_seq;

insert into msg values(msg_seq.nextval,'hwang','hwang','안녕하세요',sysdate,'n')
