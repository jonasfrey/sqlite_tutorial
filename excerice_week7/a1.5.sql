-- 1.5
select * from (select stores.stor_name, count(titles.type) as 'titles_types' from sales
join salesdetail on sales.ord_num = salesdetail.ord_num
join titles on salesdetail.title_id = titles.title_id
join stores on sales.stor_id = stores.stor_id
group by stores.stor_id) where(titles_types) > (select count(type) from titles group by titles.type);
