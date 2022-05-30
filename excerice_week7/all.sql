-- SQLite
-- 1.3 
SELECT titles.title, titles.price, titles.total_sales,((titles.total_sales / 100) * roysched.royalty) as 'total_sales_ryality' from titles
join salesdetail on titles.title_id = salesdetail.title_id
join roysched on titles.title_id = roysched.title_id;


-- a1.4.sql

select * , total_sales * price as 'totsal_times_price' from titles ;

-- 1.5
select * from (select stores.stor_name, count(titles.type) as 'titles_types' from sales
join salesdetail on sales.ord_num = salesdetail.ord_num
join titles on salesdetail.title_id = titles.title_id
join stores on sales.stor_id = stores.stor_id
group by stores.stor_id) where(titles_types) > (select count(type) from titles group by titles.type);
