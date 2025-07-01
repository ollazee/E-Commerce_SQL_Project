
--E-commerce project

--task1 (what device do my customer use to reach me)

select *
from [E-commerce Dataset]

select Device_Type,count(*) as customerusage
from [E-commerce Dataset]
group by Device_Type
order by customerusage desc;

--(who is the customer base)

select Gender,count(distinct Customer_Id) as customercount
from [E-commerce Dataset]
group by Gender
order by customercount;

---(what product category am i selling)

select product_category,sum(sales) as totalsales
from [E-commerce Dataset]
group by Product_Category
order by totalsales

--which product category do i sell to whom

select Product_Category,gender,count(*) as purchasecount
from [E-commerce Dataset]
group by Product_Category,Gender
order by purchasecount desc;

--what login type do mycustomer prefer when shopping

select Customer_Login_type,count(customer_id) as countofcustomer
from [E-commerce Dataset]
group by Customer_Login_type
order by countofcustomer

---how does the date and time affectbmy sales(total sales by month, the days of week or time arrival)

select format(Order_Date,'MMMM')as monthlysales,sum(sales)as totalsales
from [E-commerce Dataset]
group by format(Order_Date,'MMMM')
order by totalsales

--DAYS/WEEK

select DATENAME(weekday,Order_Date)as dayofweeks,sum(sales) as totalsales
from [E-commerce Dataset]
group by DATENAME(weekday,Order_Date)
order by totalsales

--from which product do i earn the most profit per unit

select top 1 PRODUCT,sum(profit/quantity)as profitperunit
from [E-commerce Dataset]
group by Product
order by profitperunit desc

--how is my delivery speed and order priority

select Order_Priority,avg(aging) as avgdeliverytime
from [E-commerce Dataset]
group by Order_Priority
order by avgdeliverytime

--task 2(calculate totalsales for each month over the time period covered by the data set

select format(Order_Date,'MMMM')as monthlysales,SUM(sales) as totalsales
from [E-commerce Dataset]
group by Order_Date
order by totalsales

--b(identify the month with the highest sales

select top 1 format(Order_Date,'MMMM')as monthlysales,SUM(sales) as totalsales
from [E-commerce Dataset]
group by Order_Date
order by totalsales

--task 3(determine the top 5 best selling product based on total quantity sold

select top 5 Product,sum(quantity)as totalquantity
from [E-commerce Dataset]
group by product
order by totalquantity desc

--provide insight into the characteristics of these products,such as price range,category and sub-catagory

select Product,Product_Category,min(sales/quantity)as minprice,max(sales/quantity)as maxprice
from [E-commerce Dataset]
group by product,Product_Category
order by minprice,maxprice


--task 4(analyse total sales by product category to determine which categories contribute the most to revenue

select Product_Category,sum(sales) as totalsales
from [E-commerce Dataset]
group by Product_Category
order by totalsales desc

--b(calculate the percentage contribution of each category to the overall sales
select Product_Category,ROUND(sum(sales)*100/(select sum(sales)from[E-commerce Dataset]),2)as salespercentage
from [E-commerce Dataset]
group by Product_Category
order by salespercentage

--task 5(calculate the average sales per order

select avg(sales)as avgsalesperorder
from [E-commerce Dataset]

--b(top 5 order by total sales amount and utilize which products contributed the most to these order
select top 5 Customer_Id,sum(sales)as totalsales
from[E-commerce Dataset]
group by Customer_Id
order by totalsales

--task 6(analyse the impact of discount on sales performance

select avg(discount)as avgdiscount
from [E-commerce Dataset]

--relationship between discount and sales

select discount,avg(sales)as avgsales,count(*)as transactioncount
from [E-commerce Dataset]
group by discount
order by transactioncount

--relationship between discount and profit
select discount,avg(profit)as avgprofit,count(*)as transactioncount
from [E-commerce Dataset]
group by discount
order by transactioncount

--total profit by discount range

select
case
when Discount between 0 and 0.1 then '0-10%'
when Discount>0.1 and Discount<=0.2 then '11-20%'
when Discount>0.2 and Discount<=0.3 then '21-30%'
when Discount>0.3 and Discount<=0.4 then '31-40%'
when Discount>0.4 then '41%+'
End as discountrange,sum(profit)as totalprofit
from [E-commerce Dataset]
group by case
when Discount between 0 and 0.1 then '0-10%'
when Discount>0.1 and Discount<=0.2 then '11-20%'
when Discount>0.2 and Discount<=0.3 then '21-30%'
when Discount>0.3 and Discount<=0.4 then '31-40%'
when Discount>0.4 then '41%+'
End
order by discountrange
