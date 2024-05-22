-- The goal for this code is to creat a file that show all history payments from all customers.

--if its your firstime working with this database I would really recomending you to chech the schema first. By this way you can understand what kind of table you have and which table you need to star to working on

SELECT * FROM INFORMATION_SCHEMA.COLUMNS

--First lets us take all the customers id, name, age, income, city_housing to see the profile of our customers

--select cust_id, name, age, income, city_housing from Customers

select top 1 cust_id, name, age, income, city_housing from Customers

--now lets add some more detail related to the loan application itself from Application table

select top 1 c.cust_id, c.name, c.age, c.income, c.city_housing, a.app_id, a.loan_amount, a.loan_period from Customers C 
left join Applications A on A.cust_id = C.cust_id

--for the payment history we need to extract it from payments table. since theres potentian for one cust_id having multiple app_id. we going to use app_id as a KEY

select c.cust_id, c.name, age, c.income, c.city_housing, 
a.app_id, a. loan_amount, a.loan_period,
pa.pay_id, pa.pay_date, pa.total_payment
from Customers C 
left join Applications A on A.cust_id = C.cust_id
left join Payments PA on PA.app_id = A.app_id
--might as well sroting our data so its more eassay to see
where C.cust_id is not null
order by A.app_id, PA.pay_date asc

--we could just stop here, but lets keep moving and try to transpose this table

select c.cust_id, c.name, age, c.income, c.city_housing, 
a.app_id, a. loan_amount, a.loan_period,
MAX(CASE WHEN pa.pay_id = 1 THEN pa.total_payment ELSE 0 END) AS 'Installment_1', 
MAX(CASE WHEN pa.pay_id = 2 THEN pa.total_payment ELSE 0 END) AS 'Installment_2',
MAX(CASE WHEN pa.pay_id = 3 THEN pa.total_payment ELSE 0 END) AS 'Installment_3',
MAX(CASE WHEN pa.pay_id = 4 THEN pa.total_payment ELSE 0 END) AS 'Installment_4',
MAX(CASE WHEN pa.pay_id = 5 THEN pa.total_payment ELSE 0 END) AS 'Installment_5',
MAX(CASE WHEN pa.pay_id = 6 THEN pa.total_payment ELSE 0 END) AS 'Installment_6',
MAX(CASE WHEN pa.pay_id = 7 THEN pa.total_payment ELSE 0 END) AS 'Installment_7',
MAX(CASE WHEN pa.pay_id = 8 THEN pa.total_payment ELSE 0 END) AS 'Installment_8',
MAX(CASE WHEN pa.pay_id = 9 THEN pa.total_payment ELSE 0 END) AS 'Installment_9',
MAX(CASE WHEN pa.pay_id = 10 THEN pa.total_payment ELSE 0 END) AS 'Installment_10',
MAX(CASE WHEN pa.pay_id = 11 THEN pa.total_payment ELSE 0 END) AS 'Installment_11',
MAX(CASE WHEN pa.pay_id = 12 THEN pa.total_payment ELSE 0 END) AS 'Installment_12',
sum(pa.total_payment) as Total_installment,
sum(i.fees) as Total_fees
from Customers C 
left join Applications A on A.cust_id = C.cust_id
left join Payments PA on PA.app_id = A.app_id
left join Installments I on i.app_id = A.app_id
--might as well sroting our data so its more eassay to see
where C.cust_id is not null
group by
c.cust_id, 
c.name, 
c.age, 
c.income, 
c.city_housing, 
a.app_id, 
a.loan_amount, 
a.loan_period;
