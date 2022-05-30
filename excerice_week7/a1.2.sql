-- SQLite
SELECT * from titles, authors join 
titleauthor on titles.au_id = titleauthor.au_id
 where type = "psychology  ";