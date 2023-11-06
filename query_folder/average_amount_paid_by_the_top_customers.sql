SELECT AVG(total_amount_paid)AS "Average"
FROM (SELECT 
A.customer_id, A.first_name AS customer_firt_name, A.last_name AS customer_last_name, 
C.city,
D.country,
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
LIMIT 5) AS total_amount_paid
