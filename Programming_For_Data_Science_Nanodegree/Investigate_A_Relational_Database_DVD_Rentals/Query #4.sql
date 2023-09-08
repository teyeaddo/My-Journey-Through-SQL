/*This query compares the two stores in their count of rental orders every month */
SELECT  DATE_PART('month', r.rental_date) AS rental_month, DATE_PART('year', r.rental_date) AS rental_year, i.store_id, COUNT(*) AS count_rentals
FROM inventory i
JOIN rental r
ON i.inventory_id = r.inventory_id
GROUP BY 1,2,3
ORDER BY 4 DESC;
