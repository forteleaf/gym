create table qnafile
(
	qfilenum number(10) primary key,
	qnanum number(6) references qna(qnanum),
	orgfilename varchar2(100),
	savefilename varchar2(100),
	filesize long,
	regdate date
);
CREATE SEQUENCE qfile_seq;