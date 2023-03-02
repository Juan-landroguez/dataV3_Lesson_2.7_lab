USE sakila;

-- How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query.

SELECT DISTINCT c.name, COUNT(f.film_id) AS tot_films
FROM sakila.film_category f
JOIN sakila.category c
ON f.category_id = c.category_id
GROUP BY c.name
ORDER BY tot_films;

-- Display the total amount rung up by each staff member in August of 2005.

SELECT s.staff_id, CONCAT(s.first_name, ' ', s.last_name) AS staff_name, SUM(p.amount) AS total_amount
FROM sakila.staff s
JOIN sakila.payment p ON s.staff_id = p.staff_id
JOIN sakila.rental r ON p.rental_id = r.rental_id
WHERE DATE_FORMAT(r.rental_date, '%Y-%m') = '2005-08'
GROUP BY s.staff_id
ORDER BY total_amount DESC;

-- Which actor has appeared in the most films?

SELECT DISTINCT actor.actor_id, actor.first_name, actor.last_name, COUNT(film_actor.film_id) AS appearances
FROM actor JOIN film_actor
ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY appearances
LIMIT 1;

-- Most active customer (the customer that has rented the most number of films)

SELECT DISTINCT customer.customer_id, customer.first_name, customer.last_name, COUNT(payment.rental_id) AS tot_rented_films
FROM customer JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY tot_rented_films DESC;

-- Display the first and last names, as well as the address, of each staff member.


SELECT staff.first_name, staff.last_name, address.address
FROM staff JOIN address
ON staff.address_id = address.address_id;

-- List each film and the number of actors who are listed for that film.

SELECT DISTINCT film.film_id, film.title, COUNT(film_actor.actor_id) AS num_actors
FROM film JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP by film.film_id
ORDER BY num_actors DESC;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT DISTINCT customer.customer_id, customer.first_name, customer.last_name, SUM(payment.amount) as total_paid
FROM customer JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY total_paid DESC;


-- List number of films per category.

SELECT f.title, c.name
FROM film f
JOIN film_category m ON f.film_id = m.film_id
JOIN category c ON m.category_id = c.category_id
ORDER BY c.name;

