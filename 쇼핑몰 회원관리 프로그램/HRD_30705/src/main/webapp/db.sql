create table member_tbl_02 (
	custno number(6) primary key,
	custname varchar2(20),
	phone varchar2(13),
	address varchar2(4),
	joindate date,
	grade char(1),
	city char(2)
);

insert into MEMBER_TBL_02 values(100001, '김행복', '01011112222', 'SK', '20151202', 'A', '01');
insert into MEMBER_TBL_02 values(100002, '이축복', '01011113333', 'SK', '20151206', 'B', '01');
insert into MEMBER_TBL_02 values(100003, '장믿음', '01011114444', 'LG', '20151001', 'B', '20');
insert into MEMBER_TBL_02 values(100004, '최사랑', '01011115555', 'KT', '20151113', 'A', '20');
insert into MEMBER_TBL_02 values(100005, '진평화', '01011116666', 'SK', '20151225', 'B', '60');
insert into MEMBER_TBL_02 values(100006, '차공단', '01011117777', 'LG', '20151211', 'C', '60');

drop table MEMBER_TBL_02;

select * from MEMBER_TBL_02;

select custno, custname, concat(concat(concat(substr(phone, 0, 3), '-'), concat(substr(phone, 4, 4), '-')), substr(phone, 8, 4)) as phone, address, to_char(joindate, 'YYYY-MM-DD') as joindate, grade, city
from MEMBER_TBL_02
where custno = 100001;

create table money_tbl_02 (
	custno number(6),
	salenol number(8),
	pcost number(8),
	amount number(4),
	price number(8),
	pcode varchar2(4),
	sdate date,
	constraint tb_custno_salenol_group_pk primary key(custno, salenol)
);

select a.custno, a.custname, a.grade, to_char(sum(b.price), '999,999,999,999') as sum
from MEMBER_TBL_02 a, MONEY_TBL_02 b
where a.custno = b.custno
group by a.custno, a.custname, a.grade
order by sum(b.price) desc;

insert into MONEY_TBL_02 values(100001, 20160001, 500, 5, 2500, 'A001', '20160101');
insert into MONEY_TBL_02 values(100001, 20160002, 1000, 4, 4000, 'A002', '20160101');
insert into MONEY_TBL_02 values(100001, 20160003, 500, 3, 1500, 'A008', '20160101');
insert into MONEY_TBL_02 values(100002, 20160004, 2000, 1, 2000, 'A004', '20160102');
insert into MONEY_TBL_02 values(100002, 20160005, 500, 1, 500, 'A001', '20160103');
insert into MONEY_TBL_02 values(100003, 20160006, 1500, 2, 3000, 'A003', '20160103');
insert into MONEY_TBL_02 values(100004, 20160007, 500, 2, 1000, 'A001', '20160104');
insert into MONEY_TBL_02 values(100004, 20160008, 300, 1, 300, 'A005', '20160104');
insert into MONEY_TBL_02 values(100004, 20160009, 600, 1, 600, 'A006', '20160104');
insert into MONEY_TBL_02 values(100004, 20160010, 3000, 1, 3000, 'A007', '20160106');\

select max(custno) + 1 as max from MEMBER_TBL_02;


