create table epcomm
(
	ecnum number(6) ,
	epnum number(6) ,
	id varchar2(30) ,
	comments varchar2(150),
	ecref number(5),
	eclev number(5),
	ecstep number(5),
	regdate date,
	PRIMARY KEY(ecnum),
FOREIGN KEY(epnum) REFERENCES epboard ON DELETE CASCADE
);
