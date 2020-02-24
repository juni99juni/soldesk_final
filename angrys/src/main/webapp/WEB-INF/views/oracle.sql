/*로그인 시 필요한 유저 테이블*/
create table user_table(
	ID varchar2(15) not null primary key ,
	password varchar2(15) not null,
	nickname varchar2(18)
)

select * from user_table
drop table user_table
INSERT INTO user_table VALUES ('d','d','병날개')
DELETE FROM user_table WHERE ID='d'
SELECT * FROM user_table WHERE ID='asd' AND password='asd'


/*전투에 필요한 유저 정보 테이블*/
create table user_info(
	user_name varchar2(6) primary key,
	nick_name varchar2(18) ,
	
	user_att number ,
	user_def number ,
	user_spe number ,
	
	user_nowHP number ,   user_maxHP number ,
	user_nowMP number ,   user_maxMP number ,
	
	equip_weapon number ,
	equip_armor number ,
	equip_accessory number ,
	
	weapon_pk_no number ,
	armor_pk_no number ,
	accessory_pk_no number ,
	
	CONSTRAINT info_fk_code FOREIGN KEY(user_name)
	REFERENCES user_table(ID) ON DELETE CASCADE
);

select * from user_info
drop table user_info
UPDATE user_info SET user_nowHP=1000,  user_nowMP=100  WHERE user_name = 'd'
alter table user_info add accessory_pk_no number
update user_info set armor_pk_no=3 where user_name='d'
select equip_weapon, weapon_pk_no from user_info where user_name='d'



/*유저의 금액 현황*/
CREATE TABLE user_money(
	user_name varchar2(6),
	
	now_money number ,
	bank_money number ,
	
	CONSTRAINT money_fk_code FOREIGN KEY(user_name)
	REFERENCES user_table(ID) ON DELETE CASCADE
);

select * from user_money
drop table user_money
select now_money from user_money where user_name='d'
insert into USER_MONEY values ('d', '123', '456')
delete from USER_MONEY where user_name = 'd'
UPDATE user_money SET now_money = now_money - 23  WHERE user_name = 'd'
update user_money set now_money = now_money + bank_money ,
bank_money = 0 where user_name='d'




/*유저 레벨과 직업*/
CREATE TABLE user_exp(
	user_name varchar2(6),
	
	user_job varchar2(10) ,
	user_jobexp number,
	
	user_level number ,
	user_exp number ,
	
	CONSTRAINT exp_fk_code FOREIGN KEY(user_name)
	REFERENCES user_table(ID) ON DELETE CASCADE
);

select * from user_exp
drop table user_exp
INSERT INTO user_exp VALUES ('d', '백수', 100, 1, 120)
UPDATE user_exp set user_exp = 100, user_jobexp = 100 WHERE user_name = 'd'



/*몬스터 테이블*/
create table monster_table(
	monster_name varchar2(10) primary key ,
	
	monster_att number ,
	monster_def number ,
	monster_spe number ,
	
	monster_nowHP number ,   monster_maxHP number ,
	monster_nowMP number ,   monster_maxMP number ,
	
	monster_gold number ,
	monster_exp number,
	monster_jobexp number
)

select * from monster_table
drop table monster_table



/* 아이템 정보 테이블 */
CREATE TABLE item_info(
	item_no number primary key not null ,
	item_name varchar2(30) ,
	item_att number ,
	item_wei number ,
	category varchar2(20)
)

select * from item_info
drop table item_info
insert into item_info values (0,'none', 0, 0, 0, 'none');
insert into item_info values (1,'knife', 150, 0, 100, 'weapon');
insert into item_info values (2,'shirt', 100, 0, 1000, 'armor');
insert into item_info values (3,'iron ring', 100, 0, 10000, 'accessory');
insert into item_info values (4,'potion(small)', 0, 0, 100000, 'potion');
delete from item_info
alter table item_info add category varchar2(20)
ALTER TABLE item_info DROP COLUMN pk_no
update item_info SET price=100000 WHERE item_no /*user_item과 item_info에서 pkno 관계 설정*/

update item_info set category='weapon' where item_no=1
update item_info set category='armor' where item_no=2
update item_info set category='accessory' where item_no=3
update item_info set category='potion' where item_no=4
SELECT * FROM item_info WHERE item_no = 1
select * from item_info where item_name = 'none'






create sequence item_primary_key
	increment by 1
	start with 1;
	






CREATE TABLE user_item(
	pk_no number primary key ,	
	user_name varchar2(15) ,
	item_no number ,
	category varchar2(20) ,
	
	
	CONSTRAINT item_user_fk_code FOREIGN KEY(user_name)
	REFERENCES user_table(ID) ON DELETE CASCADE ,
	
	CONSTRAINT item_info_fk_code FOREIGN KEY(item_no)
	REFERENCES item_info(item_no) ON DELETE CASCADE
)
select * from user_item
drop table user_item
insert into user_item values (item_primary_key.nextval, 'd', 4,'potion')
delete from user_item where user_name='asd'
alter table user_item add category varchar2(20)
update user_item set pk_no=2 where pk_no=0






CREATE TABLE item_shop(
	item_no number primary key ,
	item_name varchar2(30) ,
	item_att number ,
	item_wei number ,
	
	
	shop_division varchar2(20),
	
	CONSTRAINT item_kinds_fk_code FOREIGN KEY(item_no)
	REFERENCES item_info(item_no) ON DELETE CASCADE
)
select * from item_shop
drop table item_shop
insert into item_shop values(1, 'knife', 150, 0, 'weapon', 100);
insert into item_shop values(2, 'shirt', 100, 0, 'armor', 1000);
insert into item_shop values(3, 'iron ring', 100, 0, 'accessory', 10000);
insert into item_shop values(4, 'potion(small)', 100000, 0, 'expen', 100000);
alter table item_shop add price number
update item_shop SET price=100 WHERE item_no = 1





CREATE TABLE castle_info (
	castle_name varchar2(20) ,
	castle_att number(5) ,
	castle_def number(5) ,
	
	castle_nowHP number ,
	castle_maxHP number ,
	
	castle_text varchar2(200)
)
select * FROM castle_info
drop table castle_info
insert into castle_info values ('으힝', 100, 100, 1000, 1000, '짜라빠빠 그대는 아름다워')
SELECT * FROM castle_info WHERE castle_name='으힝'
update castle_info set castle_text='안녕하세요 성주입니다.<br/>다들 사냥 열심히 하세요 ㅎㅎ'



CREATE TABLE log_table (
	log_text varchar2(200),
	log_time varchar2(50)
)
select * from log_table
drop table log_table
select * from (select * from log_table order by log_time desc) where rownum <= 5

INSERT INTO log_table
VALUES('dd', to_char(sysdate,'yyyy.mm.dd hh24:mi'));

update user_money set now_money = 100000 where user_name='dd'
































CREATE TABLE d_item(
	user_name varchar2(15) ,
	item_no number ,
	
	CONSTRAINT item_user_fk_code FOREIGN KEY(user_name)
	REFERENCES user_table(ID) ON DELETE CASCADE ,
	
	CONSTRAINT item_info_fk_code FOREIGN KEY(item_no)
	REFERENCES item_info(item_no) ON DELETE CASCADE
)




INSERT INTO user_info VALUES ('d','병날개','123','123','100','500','1000','100','100', 1, 2, 3)
INSERT INTO monster_table VALUES ('늑대','100','123','100','500','500','100','100',300, 100, 100)
delete from monster_table where monster_name = '늑대'


select * FROM USER_INFO
UPDATE user_info SET user_nowHP = user_maxHP WHERE user_name = 'd'

select * FROM USER_MONEY
UPDATE user_money SET now_money = now_money - (now_money/10)


select * from ddddd
drop table ddddd


select * from(
    select item_no from item_info
    order by DBMS_RANDOM.RANDOM
) where rownum>0 AND rownum < 10;




SELECT count(*) FROM user_item WHERE user_name = 'd'



SELECT * FROM item_info WHERE exists(
	SELECT item_no FROM user_item WHERE user_name = 'd'
)





DECLARE
	CURSOR item_list IS 
	SELECT item_no FROM user_item WHERE user_name = 'd';
BEGIN
	OPEN item_list;
	
	FOR i IN item_list
	(
		select * from item_info WHERE item_no = i;
	)
END 


BEGIN
	FOR i IN (SELECT item_no FROM user_item WHERE user_name = 'd')
	(
		select * from item_info WHERE item_no = i;
	)
END 


SELECT * FROM item_shop WHERE shop_division = 'weapon'
SELECT * FROM item_info WHERE item_no = 3
SELECT * FROM item_info WHERE item_no = (SELECT item_no FROM user_item WHERE pk_no=2)
select * FROM user_item
SELECT category FROM user_item WHERE pk_no = 45

SELECT * FROM item_info WHERE item_no = (SELECT item_no FROM user_item WHERE pk_no=48)
select * from user_item
select * from user_info where user_name='d'



insert into user_table VALUES ('aaa','aaa','으아ㅏ')
INSERT INTO user_info 
VALUES (
	'aaa' ,
	'으아ㅏ' ,
	
	50 ,
	50 ,
	50 ,
	
	500 ,   500 ,
	100 ,   100 ,
	
	0, 0, 0,	0, 0, 0 
)



INSERT INTO user_money
VALUES ('aaa',0,0)

INSERT INTO user_exp
VALUES ('aaa', '백수', 0, 1, 0)

UPDATE user_money SET now_money = now_money+100000 where user_name='aaa'
UPDATE user_money set now_money = 100000 where user_name='d'

INSERT INTO log_table VALUES (date)
select * from log_table
drop table log_table
SELECT * FROM (select * from log_table order by ) where rownum<=5


INSERT INTO log_test
VALUES('dd', to_char(sysdate,'yyyy.mm.dd hh24:mi'));

select to_char(sysdate, 'yyyy.mm.dd hh24:mi') from dual
select * from log_test
SELECT * FROM (select * from log_test order by log_time desc) where rownum<=5