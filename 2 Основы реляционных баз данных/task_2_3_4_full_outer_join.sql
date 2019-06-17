/*
Выведите список товаров с названиями категорий, в том числе товаров, не принадлежащих ни к одной из категорий, в том числе категорий не содержащих ни одного товара.
Ожидаемый формат результата:

+-------------+----------------+
| good_name   | category_name  |
+-------------+----------------+
| good 1      | category 1     |
| good 1      | category 2     |
| good 2      | category 3     |
| good 2      | category 4     |
| good 3      | category 7     |
...

 
NB! 

Полное внешнее соединение в MySQL может быть реализовано в результате операции объединения левого и правого соединений. Например, для полного внешнего соединения таблиц А и B можно использовать запрос вида:

SELECT *
  FROM A
  LEFT OUTER JOIN B
  ON A.b_id = B.id
UNION
SELECT *
  FROM A
  RIGHT OUTER JOIN B
  ON A.b_id = B.id
;

В запросе для соединения нескольких источников данных операцию соединения можно использовать многократно. Например, для соединения таблиц A, B и C можно использовать запрос вида:


SELECT * FROM A

  LEFT OUTER JOIN B

    ON A.b_id = B.id

  LEFT OUTER JOIN C

    ON a.c_id = C.id


;

*/

select gn.name as "good_name", c.name as "category_name"
from good as gn
	left outer join category_has_good chg
		on gn.id = chg.good_id
	left outer join category c
		on c.id = chg.category_id
union
select gn.name as "good_name", c.name as "category_name"
from good as gn
	right outer join category_has_good chg
		on gn.id = chg.good_id
	right outer join category c
		on c.id = chg.category_id;