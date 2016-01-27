create table fbcomm
(
	fcnum number(6) ,
	fbnum number(6) ,
	id varchar2(30) ,
	comments varchar2(150),
	fcref number(5),
	fclev number(5),
	fcstep number(5),
	regdate date,
	PRIMARY KEY(fcnum),
FOREIGN KEY(fbnum) REFERENCES fboard ON DELETE CASCADE
);
