select * from public.orders
limit 5;

select * from public.products
limit 5;

select * from public.users
limit 5;

/*Order Numbers and Total Sales by Years*/

select Date_part('Year', created_at) years,
	sum(round(total)) sales,
	count(id) number_of_orders
from public.orders
group by 1;

/*Total Growth Sales by Category*/

select *,
	Round((sales2017-sales2016)*100/sales2017) "2017_growth_sales_(%)",
	Round((sales2018-sales2017)*100/sales2018) "2018_growth_sales_(%)",
	Round((sales2019-sales2018)*100/sales2019) "2019_growth_sales_(%)",
	Round((sales2020-sales2019)*100/sales2020) "2020_growth_sales_(%)"
from(
	select 
		sum(case when(Date_part('Year', public.orders.created_at)) = 2016 then total end) as sales2016,
		sum(case when(Date_part('Year', public.orders.created_at)) = 2017 then total end) as sales2017,
		sum(case when(Date_part('Year', public.orders.created_at)) = 2018 then total end) as sales2018,
		sum(case when(Date_part('Year', public.orders.created_at)) = 2019 then total end) as sales2019,
		sum(case when(Date_part('Year', public.orders.created_at)) = 2020 then total end) as sales2020,
		category
	from public.orders
	left join public.products on public.orders.product_id = public.products.id
	group by category
	) growth;

/*Total Growth Sales by Title*/

select *,
	Round((sales2017-sales2016)*100/sales2017) "2017_growth_sales_(%)",
	Round((sales2018-sales2017)*100/sales2018) "2018_growth_sales_(%)",
	Round((sales2019-sales2018)*100/sales2019) "2019_growth_sales_(%)",
	Round((sales2020-sales2019)*100/sales2020) "2020_growth_sales_(%)"
from(
	select 
		sum(case when(Date_part('Year', public.orders.created_at)) = 2016 then total end) as sales2016,
		sum(case when(Date_part('Year', public.orders.created_at)) = 2017 then total end) as sales2017,
		sum(case when(Date_part('Year', public.orders.created_at)) = 2018 then total end) as sales2018,
		sum(case when(Date_part('Year', public.orders.created_at)) = 2019 then total end) as sales2019,
		sum(case when(Date_part('Year', public.orders.created_at)) = 2020 then total end) as sales2020,
		title
	from public.orders
	left join public.products on public.orders.product_id = public.products.id
	group by title
	) growth;

/*Total Growth Sales by Vendor*/

select *,
	Round((sales2017-sales2016)*100/sales2017) "2017_growth_sales_(%)",
	Round((sales2018-sales2017)*100/sales2018) "2018_growth_sales_(%)",
	Round((sales2019-sales2018)*100/sales2019) "2019_growth_sales_(%)",
	Round((sales2020-sales2019)*100/sales2020) "2020_growth_sales_(%)"
from(
	select 
		sum(case when(Date_part('Year', public.orders.created_at)) = 2016 then total end) as sales2016,
		sum(case when(Date_part('Year', public.orders.created_at)) = 2017 then total end) as sales2017,
		sum(case when(Date_part('Year', public.orders.created_at)) = 2018 then total end) as sales2018,
		sum(case when(Date_part('Year', public.orders.created_at)) = 2019 then total end) as sales2019,
		sum(case when(Date_part('Year', public.orders.created_at)) = 2020 then total end) as sales2020,
		vendor
	from public.orders
	left join public.products on public.orders.product_id = public.products.id
	group by vendor
	) growth;

/*Promotion Effectiveness and Efficiency by Years*/

select Date_part('Year', created_at) years,
	sum(round(total)) sales,
	sum(discount) promotion_value,
	round(cast(float8(sum(discount)*100/sum(total)) as numeric),2) "burn_rate_(%)"
from public.orders
group by years;

/*Promotion Effectiveness and Efficiency by Product*/

select Date_part('Year', public.orders.created_at) years,
	category,
	sum(round(total)) sales,
	sum(discount) promotion_value,
	round(cast(float8(sum(discount)*100/sum(total)) as numeric),2) "burn_rate_(%)"
from public.orders
	left join public.products on public.orders.product_id = public.products.id
group by years,
	category
order by years desc;

/*Customers Transactions per Year*/

select Date_part('Year', created_at) years,
	count(distinct user_id) number_of_customers
from public.orders
group by 1
order by years desc;



