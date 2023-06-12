create table users (
   user_id varchar(50) primary key,
    user_pw varchar(500) not null,
    user_name varchar(50) not null,
    user_phone1 varchar(50),
    user_phone2 varchar(50),
    user_email1 varchar(50),
    user_email2 varchar(50),
    user_addr varchar(300),
    addr_detail varchar(300),
   zip_cd varchar(50)
);
select * from users;
show databases;
delete from users where user_id = 'ws1340cc';
grant all privileges on fueldb.* to fuel@localhost;
create user 'fuel'@'localhost' identified by 'fuel';
grant all privileges on fueldb.* to 'fuel'@'localhost';

create table infoboard (
    bno INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(300) NOT NULL,
    writer VARCHAR(50) NOT NULL,
    content VARCHAR(2000) NOT NULL,
    w_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    u_date DATETIME DEFAULT NULL,
    hit INT default 0,
    rcd INT default 0
);
insert into infoboard (title, writer, content) values ('테스트', 'ws1340cc', '테스트');

CREATE TABLE inforeply(
    rno INT PRIMARY KEY AUTO_INCREMENT,
    bno INT,
    
    foreign key (bno) 
    references infoboard(bno)
    on delete cascade,
    
    reply VARCHAR(1000),
    reply_id VARCHAR(50),
    reply_pw VARCHAR(50),
    reply_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME DEFAULT NULL
);

create table gasolineInfo(
   gno INT PRIMARY KEY AUTO_INCREMENT,
   sitetel varchar(500),
    rdnwhladdr varchar(500),
    bplcnm varchar(500),
    trdstatenm varchar(500)
);
drop table gasolineInfo;
select * from gasolineInfo;
select distinct rdnwhladdr, gno  from gasolineInfo  order by rdnwhladdr asc;

select substring_index(rdnwhladdr,'구 ',-1) as rdnwhladdr
from gasolineInfo where rdnwhladdr like '%노원구%';

select * from gasolineInfo  where rdnwhladdr like '%노원구%' order by rdnwhladdr asc;

create table elecInfo(
   eno INT PRIMARY KEY AUTO_INCREMENT,
   charging_capacity varchar(500),
    utztn_psblty_tm varchar(500),
    addr varchar(500),
    charger_type varchar(500)
);
drop table elecInfo;
select * from elecInfo;

select distinct substring_index(substring_index(addr,'(',1),'구 ',-1)
from elecInfo where addr like '%강남구%';

select addr
from elecInfo where addr like '%강남구%';

select distinct *
from elecInfo where addr like '%강남구%';

create table lpgInfo(
    lno INT PRIMARY KEY AUTO_INCREMENT,
    lpg_bsin_sort_code varchar(500),
    site_addr varchar(500),
    off_telno varchar(500),
    trnm_nm varchar(500)
);
drop table lpgInfo;
select * from lpgInfo;

create table bookmark(
   bkno INT PRIMARY KEY AUTO_INCREMENT,
    bkuser_id varchar(50),
    bkaddr varchar(500),
    bktel varchar(500),
    bkname varchar(500)
);
drop table bookmark;
select * from bookmark;
insert into  bookmark (bkuser_id, bkaddr, bktel, bkname) values('ws1340cc', '강서구 양천로 22(서울특별시 강서구 양천로16-1 전기차충전소)', '24시간 이용가능', 'DC콤보');

select bkaddr, bktel, bkname from bookmark
       where bkaddr = '송파구 송파대로 397';

delete from bookmark where bkno >26;

create table caraccount(
    acno int primary key auto_increment,
    writer varchar(100),
    year int,
    month int,
    day int,
    type varchar(100),
    price int,
    note varchar(1000)
);
select * from caraccount;
