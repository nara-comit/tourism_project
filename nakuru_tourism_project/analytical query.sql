SELECT h.name AS hotel_name,
h.description,
ROUND(ST_Distance(a.geom::geography, h.geom::geography)/1000)
FROM attraction_site a
CROSS JOIN nearby_hotel h
WHERE a.name ='Lake Nakuru National Park'
AND ST_DWithin(a.geom::geography, h.geom::geography, 5000);

/* Calculate the exact visitor growth from 2022 to 2023 for every single attraction to see which sites are booming post-pandemic.*/
SELECT a.name AS attraction_name,
MAX(CASE WHEN v.year =2022 THEN v.visitor_count END) AS visitor_2022,
MAX(CASE WHEN v.year= 2023 THEN v.visitor_count END) AS visitors_2023,
(MAX(CASE WHEN v.year =2023 THEN v.visitor_count END)-
MAX(CASE WHEN v.year = 2022 THEN v.visitor_count END)) AS net_growth
FROM attraction_site a
JOIN visitor_stat v ON a.id= v.attraction_id
WHERE v.year IN (2022,2023)
GROUP BY a.name
order by net_growth DESC;

/*Figure out which category of tourism (Lakes, National Parks, Viewpoints) brings in the most visitors, and see what they charge citizens.*/
SELECT 
c.name AS category_name,
SUM(v.visitor_count)AS total_visitors_all_years,
AVG(p.price) AS avg_citizen_fee
FROM categories c
JOIN attraction_site a ON c.id = a.category_id
JOIN visitor_stat v ON a.id = v.attraction_id
LEFT JOIN pricing p ON a.id=p.attraction_id AND p.visitor_type ='citizens'
GROUP BY c.name
ORDER BY total_visitors_all_yEars DESC;
