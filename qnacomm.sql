create table qnacomm
(
	qcnum number(6) , --댓글번호
	qnanum number(6),--댓글이 달린 글번호
	id varchar2(30) , --아이디
	comments varchar2(150),--내용
	qcref number(5), 
	qclev number(5),
	qcstep number(5),
	regdate date,
	PRIMARY KEY(qcnum),
FOREIGN KEY(qnanum) REFERENCES qna ON DELETE CASCADE
);
