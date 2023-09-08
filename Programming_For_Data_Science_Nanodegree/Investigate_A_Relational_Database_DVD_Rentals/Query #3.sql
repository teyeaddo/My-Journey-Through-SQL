/*This query lists the count of movies with each family-friendly category together with the rental duration quartile category */
SELECT name, standard_quartile, COUNT(standard_quartile)
FROM
(SELECT f.title, c.name, f.rental_duration, NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
FROM film_category fc
JOIN category c
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')) t1
GROUP BY 1,2
ORDER BY 1,2;
