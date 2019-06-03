/*
Выведите в качестве результата одного запроса общее количество заказов, сумму стоимостей (бюджетов) всех проектов, средний срок исполнения заказа в днях.

NB! Для вычисления длительности проекта удобно использовать встроенную функцию datediff().
*/

select count(1) as count, sum(budget) as sum, avg(datediff(project_finish, project_start)) as average from project;