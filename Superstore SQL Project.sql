use master;
//QUESTIONS:

//How many cities are there in city table?

select count(*) from city;

//How many unique cities are there?

select distinct(name) AS City_Names from city limit 10;

//Find duplicate cities name ?

select name as duplicate_city_name, count(name)
from city
group by name
having count(name) >1;

//Find the number of orders in each year?

select extract(year from order_date) as year,count(id) as orders
from orders
group by 1;

//Find the monthly sales of year 2017?

select extract(month from order_date) as month, sum(sales) as sales
from orders
where extract(year from order_date) = 2017
group by 1;

//Find top 2 months in which we have high sales in year 2016?

select extract(month from order_date) as month, sum(sales) as sales
from orders
where extract(year from order_date) = 2016
group by 1
order by 2 desc
limit 2;

//Find top 2 months in which we have low sales in year 2017?

select extract(month from order_date) as month, sum(sales) as sales
from orders
where extract(year from order_date) = 2017
group by 1
order by 2 asc
limit 2;

//Extract country code from id of orders table

select split_part(id, '-',1) 
from orders

-- Checking distinct
select distinct(split_part(id, '-',1) )
from orders;

//Extract catgeory from product_id

select distinct(split_part(product_id, '-',1) )
from orders;

//Count how many product we have sold in total for each category. *You only need to use orders table.

select split_part(product_id, '-',1) as category,
	count(id)
from orders
group by 1

-- Give full name to categories
select split_part(product_id, '-',1) as category,
		(case 
		when split_part(product_id, '-',1) = 'FUR' then 'FURNITURE'
		when split_part(product_id, '-',1) = 'OFF' then 'OFFICE'
		when split_part(product_id, '-',1) = 'TEC' then 'TECHNOLOGY'
		end) as Category_Full_Name, 
	count(id)
from orders
group by 1,2;
