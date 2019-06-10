/*
Выведите все позиций списка товаров принадлежащие какой-либо категории с названиями товаров и названиями категорий. Список должен быть отсортирован по названию товара, названию категории. Для соединения таблиц необходимо использовать оператор INNER JOIN.
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

    Выборки, полученные с помощью оператора SELECT могут быть отсортированы по нескольким атрибутам. Для этого необходимо в операторе ORDER BY указать набор атрибутов через запятую в необходимом порядке.
    В запросе для соединения нескольких источников данных операцию соединения можно использовать многократно. Например, для соединения таблиц A, B и C можно использовать запрос вида:

SELECT * FROM A
  INNER JOIN B
    ON A.b_id = B.id
  INNER JOIN C
    ON a.c_id = C.id
;
*/

select gn.name as "good_name", c.name as "category_name"
from good as gn
	inner join category_has_good chg
		on gn.id = chg.good_id
	inner join category c
		on c.id = chg.category_id
order by gn.name, c.name;
