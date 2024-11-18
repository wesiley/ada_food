-- 1. Quais são os filmes (film.title), suas respectivas categorias (category.name)e idioma (language.name)?
select 
	film.title, 
	category.name as category_name, 
	language.name as language_name
from 
	film
join
	film_category on film.film_id = film_category.film_id 
join
	category on film_category.category_id = category.category_id
join 
	language on film.language_id = language.language_id;



-- 2. Quais foram os filmes alugados entre os dias 1 de fevereiro e 15 de março de 2006 na loja 1 (store.id = 1)?
select 
	film.title,
	rental.rental_date
from 
	rental
join
	inventory on rental.inventory_id = inventory.inventory_id 
join
	film on inventory.film_id = film.film_id 
where 
	rental_date between '2006-02-01' and '2006-03-15'
	and
	inventory.store_id = 1;



-- 3. Qual a quantidade de vezes que cada filme foi alugado?
select 
	film.title, 
	count(rental.rental_id) as rental_count 
from 
	film
left join
	inventory on film.film_id = inventory.film_id 
left join 
	rental on inventory.inventory_id = rental.inventory_id
group by
	film.title
order by 
	rental_count desc;



-- 4.Para cada funcionário (staff.staff_id), qual é o valor total retornado em locações (payment.amount) e qual é a quantidade total de locações (rental.rental_id)?
select 
	staff.staff_id,
	staff.first_name,
	sum(payment.amount) as total_payment,
	count(rental.rental_id) as total_rentals
from
	staff
join 
	rental on staff.staff_id = rental.staff_id
join
	payment on rental.rental_id = payment.rental_id
group by 
	staff.staff_id, staff.first_name;



-- 5. Qual é o nome de categoria de filme (category.name) que nos retorna mais dinheiro no total (payment.total)?
--Ordene sua consulta para mostrar o resultado em ordem de lucratividade, do nome de categoria mais lucrativo para o nome
--de categoria menos lucrativo e garanta que todos os nomes de categorias apareçam no resultado final, inclusive aquelas que
--não tiverem nenhuma locação associada a elas.

select 
	category.name,
	sum(payment.amount) as total_payment
from
	category
left join	 
	film_category on category.category_id = film_category.category_id
left join
	film on film_category.film_id = film.film_id 
left join
	inventory on film.film_id = inventory.film_id
left join 
	rental on inventory.inventory_id = rental.inventory_id
left join
	payment on rental.rental_id = payment.rental_id
group by 
	category.name
order by
	total_payment desc;
