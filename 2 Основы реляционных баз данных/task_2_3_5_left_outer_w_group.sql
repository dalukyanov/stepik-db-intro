/*
Выведите список всех источников клиентов и суммарный объем заказов по каждому источнику. Результат должен включать также записи для источников, по которым не было заказов.
Ожидаемый формат результата:

+-------------+----------------+
| source_name | sale_sum       |
+-------------+----------------+
| source 1    | 111.00         |
| source 2    | 222.00         |
| source 3    | 333.00         |
...
 
NB! В запросе для соединения нескольких источников данных операцию соединения можно использовать многократно. Например, для соединения таблиц A, B и C можно использовать запрос вида:

SELECT * FROM A
  LEFT OUTER JOIN B
    ON A.b_id = B.id
  LEFT OUTER JOIN C
    ON a.c_id = C.id
;
*/

select s.name, sum(sl.sale_sum) as sale_sum
from source s
	left outer join client c
		on s.id = c.source_id
	left outer join sale sl
		on c.id = sl.client_id
group by s.name;