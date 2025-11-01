# Retail-Sale-Analysis-Sql
### Objective:
To analyze retail sales performance using SQL and extract key business insights such as total sales, customer count, product categories, and date-specific transactions.

### Tools Used:
SQL (PostgreSQL)

### Project Overview:
This project focuses on exploring a fictional retail sales dataset named Retail_sales. The goal was to perform data-driven analysis using SQL to answer key business questions such as:
- How many total sales were made?
- How many unique customers made purchases?
- How many distinct product categories exist?
- What were the sales made on a specific date (e.g., 2022-11-05)?

```sql
sales made
SELECT COUNT (*) total_sale 
from Retail_sales

--no of customers
select count(distinct customer_id)
from Retail_sales

--no of category
select count(distinct category)
from Retail_sales

---sales on 2022-11-05
SELECT sale_date,total_sale
from Retail_sales
where sale_date = '2022-11-05'
```

### Key Insights:
- clothing sales wheree quantity is greater than 4 for the month of november
- TOTALSALES FOR CATRGORY
- Average Age Of Customer That Purchase From The 'Beauty' Category
- average sales for each month,best selling in each month
- time of the day numbers of order




