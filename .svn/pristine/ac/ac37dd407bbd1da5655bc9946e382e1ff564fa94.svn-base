create table ifcomm
(
	icnum number(6) ,
	ifnum number(6) ,
	id varchar2(30) ,
	comments varchar2(150),
	icref number(5),
	iclev number(5),
	icstep number(5),
	regdate date,
PRIMARY KEY(icnum),
FOREIGN KEY(ifnum) REFERENCES ifboard ON DELETE CASCADE
);
