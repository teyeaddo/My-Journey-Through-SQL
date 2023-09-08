/*This query lists each movie, its film category and the number of times it has been rented out  */
SELECT DISTINCT film_title, categoryname, COUNT(rental_date) OVER (PARTITION BY film_title) AS rentalcount
FROM 
(SELECT f.title AS film_title, category.name AS categoryname, rental.rental_date
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
JOIN category
ON fc.category_id = category.category_id
JOIN inventory
ON f.film_id = inventory.film_id
JOIN rental
ON rental.inventory_id = inventory.inventory_id
WHERE category.name IN ('Animation','Children', 'Classics','Comedy','Family','Music')
ORDER BY 1) t1;