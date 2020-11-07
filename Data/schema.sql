create table card_holder (id int, name varchar (50));
create table credit_card (card varchar(50), id_card_holder int);
create table merchant_category (id int, name varchar (50));
create table merchant (id int, name varchar (50), id_merchant_category int);
create table transaction (id int, date timestamp, amount float, card varchar(50), id_merchant int);




