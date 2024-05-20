Create database Pizza_DB;
use Pizza_db;
select * from pizza_sales;

#1.Total_Revenue
select sum(total_price) As Total_Revenue From pizza_sales;

#2.Average Order Value
select sum(total_price)/count(distinct order_id) As Average_ordervalue From pizza_sales;

#3.	Total Pizza Sold
select sum(quantity) as Total_pizza_sold from pizza_sales;

#4.	Total Orders
select count(distinct order_id) as Total_orders from pizza_sales;

#5.	Average Pizza Per Order
select cast(sum(quantity) as decimal(10,2)) /cast(count(distinct order_id) as decimal(10,2)) as Avg_Pizza_order from pizza_sales;

#6.	Daily Trend For Total Orders
select dayname(order_date) as Order_day,count(distinct order_id) as Total_orders from pizza_sales 
group by dayname(order_date);

#7.Monthly Trend For Total Orders
select monthname(order_date) as Order_month,count(distinct order_id) as Total_orders from pizza_sales
group by monthname(order_date);

#8.Percentage of sales By Pizza category
select pizza_category,sum(total_price) as Total_revenue,(total_price)*100 /(select sum(total_price) from pizza_sales)
 as Totalcategory_percentage from pizza_sales group by pizza_category;
 
 #9.Percentage of sales By Pizza Size
 select pizza_size,sum(total_price) as Total_revenue,sum(total_price)*100 /(select sum(total_price) from pizza_sales)
 as Totalcategory_percentage from pizza_sales group by pizza_size;
 
 #10.Total Pizza Sold By Pizza category
 select pizza_category,count(distinct order_id) as Totalpizza_sold from pizza_sales
 group by pizza_category;
 
 #11.Top 5 Best Seller’s By Revenue, Total Quantity and Total Order’s
 select pizza_name,sum(total_price) as Total_Revenue from pizza_sales group by pizza_name
 order by Total_Revenue desc limit 5;
 
 select pizza_name,sum(quantity) as Total_Quantity from pizza_sales group by pizza_name
 order by Total_Quantity desc limit 5;
 
 select pizza_name,count(distinct order_id) as Total_orders from pizza_sales group by pizza_name
 order by Total_orders desc limit 5;
 
 #12.Bottom 5 Worst  Seller’s By Revenue, Total Quantity and Total Order’s
 select pizza_name,sum(total_price) as Total_Revenue from pizza_sales group by pizza_name
 order by Total_Revenue asc limit 5;
 
 select pizza_name,sum(quantity) as Total_Quantity from pizza_sales group by pizza_name
 order by Total_Quantity asc limit 5;
 
 select pizza_name,count(distinct order_id) as Total_orders from pizza_sales group by pizza_name
 order by Total_orders asc limit 5;
 
 