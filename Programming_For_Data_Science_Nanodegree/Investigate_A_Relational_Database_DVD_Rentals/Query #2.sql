/*This query lists the movie titles and divides them into quartiles of the average rental duration*/
SELECT f.title, c.name, f.rental_duration, NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON fc.film_id = f.film_id
WHERE c.name IN ('Animation', 'Children','Classics','Comedy','Family', 'Music')
ORDER BY 4 ;
