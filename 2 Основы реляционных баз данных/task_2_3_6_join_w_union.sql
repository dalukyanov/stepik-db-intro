/*
Выведите названия товаров, которые относятся к категории 'Cakes' или фигурируют в заказах текущий статус которых 'delivering'. Результат не должен содержать одинаковых записей. В запросе необходимо использовать оператор UNION для объединения выборок по разным условиям.
Ожидаемый формат результата:

+-------------+
| good_name   |
+-------------+
| good 1      |
| good 2      |
| good 3      |
...

NB! В запросе для соединения нескольких источников данных операцию соединения можно использовать многократно. Например, для соединения таблиц A, B и C можно использовать запрос вида:

SELECT * FROM A
  INNER JOIN B
    ON A.b_id = B.id
  INNER JOIN C
    ON a.c_id = C.id
;
*/

select g.name as good_name
from good g
	inner join category_has_good as chg
		on g.id = chg.good_id
	inner join category as c
		on chg.category_id = c.id
where c.name = 'Cakes'
union
select g.name as good_name
from good g
	inner join sale_has_good as shg
		on g.id = shg.good_id
	inner join sale sl
		on sl.id = shg.sale_id
	inner join status as st
		on st.id = sl.status_id
where st.name = 'delivering'
order by 1;