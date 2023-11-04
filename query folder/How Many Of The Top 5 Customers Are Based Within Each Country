WITH count_customers_cte (customer_id, first_name, last_name, city, country, amount)AS
(SELECT 
          A.customer_id, A.first_name AS customer_firt_name, 
          A.last_name AS customer_last_name, C.city, D.country,
          SUM(E.amount) AS total_amount_paid
          FROM public.customer A
          JOIN public.address B ON A.address_id=B.address_id
          JOIN public.city C ON B.city_id=C.city_id
          JOIN public.country D ON C.country_id=D.country_id
          JOIN public.payment E ON A.customer_id=E.customer_id
          WHERE C.city IN('Aurora', 'Acua', 'Citru_Heights', 'Iwaki', 'Ambattur',
	        		 'Shanwei', 'So_Leopoldo', 'Teboksary', 'Tianjin', 'Cianjur')
          GROUP BY A.customer_id, A.first_name, A.last_name, 
          C.city,
          D.country
          ORDER BY total_amount_paid DESC
          LIMIT 5)
SELECT D.country, COUNT(DISTINCT A.customer_id) AS all_customer_count, COUNT(DISTINCT E.customer_id) AS top_customer_count
FROM public.customer A
JOIN public.address B ON A.address_id=B.address_id
JOIN public.city C ON B.city_id=C.city_id
JOIN public.country D ON C.country_id=D.country_id
RIGHT JOIN count_customers_cte E ON D.country=E.country
GROUP BY D.country
            ORDER BY (all_customer_count) DESC

