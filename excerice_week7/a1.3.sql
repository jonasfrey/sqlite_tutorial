-- SQLite
-- 1.3 
SELECT titles.title, titles.price, titles.total_sales,((titles.total_sales / 100) * roysched.royalty) as 'total_sales_ryality' from titles
join salesdetail on titles.title_id = salesdetail.title_id
join roysched on titles.title_id = roysched.title_id;