/*
Выведите список всех категорий продуктов и количество продаж товаров, относящихся к данной категории. Под количеством продаж товаров подразумевается суммарное количество единиц товара данной категории, фигурирующих в заказах с любым статусом.
Ожидаемый формат результата:

+---------------------+----------+
| name                | sale_num |
+---------------------+----------+
| category 1          |       11 |
| category 2          |       25 |
| category 3          |       13 |
...
 
NB! В запросе для соединения нескольких источников данных операцию соединения можно использовать многократно. Например, для соединения таблиц A, B и C можно использовать запрос вида:
SELECT * FROM A
  LEFT OUTER JOIN B
    ON A.b_id = B.id
  LEFT OUTER JOIN C
    ON a.c_id = C.id
;
*/

select c.name as name, count(sl.id) as sale_num
from category c
	left outer join category_has_good as chg
		on c.id = chg.category_id
	left outer join good as g
		on chg.good_id = g.id
	left outer join sale_has_good as shg
		on g.id = shg.good_id
	left outer join sale as sl
		on shg.sale_id = sl.id
group by c.name;