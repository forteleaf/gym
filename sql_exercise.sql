


CREATE TABLE EXERCISE
(
	EXNUM NUMBER(5) PRIMARY KEY, --운동 고유번호
	EXNAME VARCHAR(30), -- 운동명
	EXCLASS NUMBER(2), -- 운동대분류
	CALORIE NUMBER(4), -- 소모칼로리
	AERO NUMBER(4), -- 기대 유산소운동 효과
	STRENGTH NUMBER(4), -- 기대 근력운동 효과
	STAMINA NUMBER(4) -- 기대 지구력운동 효과
);
CREATE SEQUENCE EXER_SEQ;

insert into exercise values(exer_seq.nextval,'testex1',1,20,40,10,90);
insert into exercise values(exer_seq.nextval,'testex2',2,30,20,20,40);
insert into exercise values(exer_seq.nextval,'testex3',3,40,10,30,20);
insert into exercise values(exer_seq.nextval,'testex4',4,50,30,65,60);
insert into exercise values(exer_seq.nextval,'testex5',5,60,50,70,20);
insert into exercise values(exer_seq.nextval,'testex6',6,70,70,80,10);

commit;
alter table exercise add (exerinfo clob);


COMMIT;

-- ECLASS == 1 : 가슴&어깨
-- ECLASS == 2 : 팔
-- ECLASS == 3 : 등
-- ECLASS == 4 : 복부
-- ECLASS == 5 : 하체
