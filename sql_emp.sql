/* Table Name: 직원정보 */
/**********************************/
CREATE TABLE EMP(
		MNUM                          		NUMBER(5) , -- 고유번호
		ENUM                          		NUMBER(5)		 NOT NULL, -- 직원번호
		uNUM                          		NUMBER(5), -- 회원번호
		EREGDATE                      		DATE, -- 고용일자
		em                            		INTEGER(3), -- 고용상태
		sal                           		INTEGER(10) -- 고용비용
);