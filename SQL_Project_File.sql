use mahendra;

select * from calendar;
select * from customer;
select * from d_geojson_us_counties;
select * from d_store;
select * from f_inventory_adjusted;
select * from f_sales;

#Total Inventory

select  sum(`Quantity on Hand`) AS Total_Inventory
from  f_inventory_adjusted;

#Inventory Value

select round(sum(`quantity on hand` * `cost amount`),2) as Inventory_Value from f_inventory_adjusted;

#Inventory Health

select `quantity on hand` from f_inventory_adjusted;
select 
case
    when `quantity on hand` < 0 then "Out of Stock"
    when `quantity on hand` < 2 then "Under Stock"
    when `quantity on hand` >= 2 then "Instock"
end as Inventory_Health,
count(*) as Total_Value
 from f_inventory_adjusted
 group by inventory_health;
 
 #Region wise customer
 
 select `cust region` ,count(*) as total_customer from customer
 group by `cust region`;
 
 #Store wise total rent
 
 select * from D_store;
 
 select `store name`, `store address`,`store city`, `store state`, max(`monthly rent cost`) as Highest_Monthly_Rent from D_Store
 group by `store name`, `store address`,`store city`, `store state`
 order by highest_monthly_rent desc
 limit 5;
