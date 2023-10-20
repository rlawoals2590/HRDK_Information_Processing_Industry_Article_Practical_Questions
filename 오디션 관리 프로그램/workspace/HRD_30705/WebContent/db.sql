create table TBL_ARTIST_201905(
	artist_id char(4) primary key,
	artist_name varchar2(20),
	artist_birth char(8),
	artist_gender char(1),
	talent char(1),
	agency varchar(30)
)

select artist_id, artist_name, TO_CHAR(to_date(artist_birth), 'YYYYMMDD') as birth, artist_gender, talent, agency
from TBL_ARTIST_201905;

insert into tbl_artist_201905 values('A001', '김스타', '19970101', 'F', '1', 'A엔터테이먼트');
insert into tbl_artist_201905 values('A002', '조스타', '19980201', 'M', '2', 'B엔터테이먼트');
insert into tbl_artist_201905 values('A003', '왕스타', '19900301', 'M', '3', 'C엔터테이먼트');
insert into tbl_artist_201905 values('A004', '정스타', '20000401', 'M', '1', 'D엔터테이먼트');
insert into tbl_artist_201905 values('A005', '홍스타', '20010501', 'F', '2', 'E엔터테이먼트');

create table tbl_mento_201905(
	mento_id char(4) primary key,
	mento_name varchar2(20)
)

insert into TBL_MENTO_201905 values('J001', '함멘토');
insert into TBL_MENTO_201905 values('J002', '박멘토');
insert into TBL_MENTO_201905 values('J003', '장멘토');

select c.serial_no, c.artist_id, a.artist_name, TO_CHAR(to_date(artist_birth), 'YYYY\"년\"MM\"월\"DD\"일\"') as birth, c.point, b.mento_name
from TBL_ARTIST_201905 a, TBL_MENTO_201905 b, TBL_POINT_201905 c
where a.artist_id = c. artist_id and b.mento_id = c.mento_id
order by c.serial_no

create table tbl_point_201905(
	serial_no number(8) primary key,
	artist_id char(4),
	mento_id char(4),
	point number(3)
)

select a.artist_id, a.artist_name, sum(c.point) as sum , to_char(sum(c.point) / count(a.artist_id), '99.99') as avg, 
rank() over (order by sum(c.point) desc) as rank
from TBL_ARTIST_201905 a, tbl_point_201905 c
where a.artist_id = c.artist_id
group by a.artist_id, a.artist_name

insert into TBL_POINT_201905 values('2019001', 'A001', 'J001', 78);
insert into TBL_POINT_201905 values('2019002', 'A001', 'J002', 76);
insert into TBL_POINT_201905 values('2019003', 'A001', 'J003', 70);
insert into TBL_POINT_201905 values('2019004', 'A002', 'J001', 80);
insert into TBL_POINT_201905 values('2019005', 'A002', 'J002', 72);
insert into TBL_POINT_201905 values('2019006', 'A002', 'J003', 78);
insert into TBL_POINT_201905 values('2019007', 'A003', 'J001', 90);
insert into TBL_POINT_201905 values('2019008', 'A003', 'J002', 92);
insert into TBL_POINT_201905 values('2019009', 'A003', 'J003', 88);
insert into TBL_POINT_201905 values('2019010', 'A004', 'J001', 96);
insert into TBL_POINT_201905 values('2019011', 'A004', 'J002', 90);
insert into TBL_POINT_201905 values('2019012', 'A004', 'J003', 98);
insert into TBL_POINT_201905 values('2019013', 'A005', 'J001', 88);
insert into TBL_POINT_201905 values('2019014', 'A005', 'J002', 86);
insert into TBL_POINT_201905 values('2019015', 'A005', 'J003', 86);
