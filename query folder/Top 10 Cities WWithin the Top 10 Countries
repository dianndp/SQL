SELECT city, COUNT(customer_id) AS number_of_customers
FROM public.customer A
JOIN public.address B ON A.address_id=B.address_id
JOIN public.city C ON B.city_id=C.city_id
JOIN public.country D ON C.country_id=D.country_id
GROUP BY country,city
HAVING country IN ('India','China','United States','Japan','Mexico',
                                    'Brazil','Russian Federation','Philippines','Turkey','Indonesia')
ORDER BY number_of_customers DESC
LIMIT 10
