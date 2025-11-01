-- Database: Retail sales Analysis

create table Retail_sales(
transactions_id int primary key ,
sale_date date,
sale_time time,
customer_id int ,
gender varchar(15),
age int,
category  varchar(15),
quantiy int,
price_per_unit float,
cogs float,
total_sale float
);

select * 
from Retail_sales

-- data cleaning
select *
from Retail_sales
where transactions_id is null
or  sale_date is null
or  sale_time is null
or  gender is null
or  category is null
or  quantiy is null
or cogs is null 
or  total_sale is null

delete from Retail_sales
where transactions_id is null
or  sale_date is null
or  sale_time is null
or  gender is null
or  category is null
or  quantiy is null
or cogs is null 
or  total_sale is null


--data exploration

--numbers of sales made
SELECT COUNT (*) total_sale 
from Retail_sales

--no of customers
select count(distinct customer_id)
from Retail_sales


--no of category
select count(distinct category)
from Retail_sales


select distinct category
from Retail_sales



---key business quetion & anwser
sales made on 2022-11-05

select * 
from Retail_sales;

---sales on 2022-11-05
SELECT sale_date,total_sale
from Retail_sales
where sale_date = '2022-11-05';



--- clothing sales and quantity >= 4 for the month of november
select *
from Retail_sales
where category ='Clothing' 
and
TO_CHAR(sale_date,'yyyy-mm')='2022-11'
AND
QUANTIY >=4

--TOTALSALES FOR CATRGORY

SELECT category,sum (total_sale)
FROM Retail_sales
group by category;

--average age of customer that purchase from the 'beauty' category
select round(avg(age),2)
from Retail_sales
where category = 'Beauty'

--transaction where total_sales is greater than 1000

select *
from Retail_sales
where total_sale > 1000
order by 1


--transaction made by each gender on category
select gender,category,sum(total_sale)
from Retail_sales
group by gender,category
order by 1


--average sales for each month,best selling in each month
select year,month,avg_sale from 
(select 
	extract(year from sale_date)as year,
	extract(month from sale_date)as month,
	avg(total_sale) as avg_sale,
	rank() over(partition by extract(year from sale_date) order by avg(total_sale) desc)as rank 
	from Retail_sales
	group by 1,2
	order by 1,3 desc) as t1
	where rank =1;


select * 
from Retail_sales;
--top 5 cutomers
select customer_id,sum(total_sale) as sales
from Retail_sales
group by  customer_id
order by sales desc
limit 5


-- number of each customer who purchased item from each category
select category,count(distinct(customer_id)) as distinct_customers
from Retail_sales
group by category.

--time of the day numbers of order
with hourly_sale as
(select *, 
	case
	when extract (hour from sale_time) <12 then 'morning'
	when extract (hour from sale_time) between 12 and 17 then 'afternoon'
	else 'evening'
	end as shift
	from Retail_sales)
	select shift,count(shift)from hourly_sale
	group by shift
	
















