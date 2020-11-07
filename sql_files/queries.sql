select * 
from card_holder

select *
from credit_card

select *
from merchant

select *
from merchant_category

select *
from transaction

create view top_transactions as
select * 
from transaction
where DATE_PART ('hour', transaction.date) >= 7 and DATE_PART ('hour', transaction.date) <= 9
order by amount desc
limit 100;

create view potential_fraud_transactions as 
select *
from transaction 
where amount <2;

create view count_fraud_transactions as 
select count (amount)
from transaction
where amount <2;

create view five_merchants as
select merchant.name, count (amount) as fraud_flag
from transaction
join merchant on merchant.id = transaction.id_merchant
where amount <2
group by merchant.name
order by fraud_flag desc
limit (5)
;

create view customer_two_small_transactions as
select credit_card.id_card_holder, count (amount) as important_customer_fraud_count_cutsomter_two
from transaction
join credit_card on credit_card.card = transaction.card
where amount < 2
and id_card_holder = 2
group by id_card_holder
;

create view customer_eighteen_small_transactions as
select credit_card.id_card_holder, count (amount) as important_customer_fraud_count_customer_18
from transaction
join credit_card on credit_card.card = transaction.card
where amount < 2
and id_card_holder = 18
group by id_card_holder
;

create view customer_25_transactions as
select credit_card.id_card_holder, cast(date as char(3)), amount as customer_25
from transaction
join credit_card on credit_card.card = transaction.card
where id_card_holder = 25
group by date, id_card_holder, amount
order by date
;




