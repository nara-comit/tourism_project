TRUNCATE categories, attraction_site, nearby_hotel, attraction_hotel, pricing, visitor_stat CASCADE;
INSERT INTO categories(name)  
VALUES
('National Park'),
('Lake'),
('Museum'),
('Historical Site'),
('Viewpoint'),
('Waterfall'),
('Geothermal Site'),
('Wildlife Conservancy'),
('Nature Reserve'),
('Prehistoric Site');


INSERT INTO attraction_site (name, description, category_id, geom)
VALUES 
('Lake Nakuru National Park', 'Famed for its flamingos, rhinos, and diverse wildlife.',
(SELECT id FROM categories WHERE name='National Park'), 'POINT(36.09613496 -0.40325924)'),
('Menengai Crater', 'One of the largest volcanic craters globally, offering panoramic views.',
(SELECT id FROM categories WHERE name='Viewpoint'), ST_SetSRID(ST_MakePoint(36.09549526,-0.223433814), 4326)),
('Hyrax Hill Prehistoric Site', 'An archaeological site showcasing early human settlements.',
(SELECT id FROM categories WHERE name='Museum'), ST_SetSRID(ST_MakePoint(36.10473476,-0.28123318), 4326)),

('Lord Egerton Castle', 'A historic castle with unique architecture and history.',
(SELECT id FROM categories WHERE name='Museum'), ST_SetSRID(ST_MakePoint(35.97213372,-0.274638726), 4326)),

('Lake Naivasha', 'A freshwater lake popular for boat rides and bird watching.',
(SELECT id FROM categories WHERE name='Lake'), ST_SetSRID(ST_MakePoint(36.3223929,-0.745886825), 4326)),

('Hell’s Gate National Park', 'Hell’s Gate National Park',
(SELECT id FROM categories WHERE name='National Park'), ST_SetSRID(ST_MakePoint(36.43105192,-0.716941784), 4326)),

('Crescent Island Game Sanctuary', 'A private sanctuary offering walking safaris.',
(SELECT id FROM categories WHERE name='Wildlife Conservancy'), ST_SetSRID(ST_MakePoint(36.40395939,-0.773989859), 4326)),

('Mount Longonot National Park', 'A dormant volcano offering hiking opportunities.',
(SELECT id FROM categories WHERE name='National Park'), ST_SetSRID(ST_MakePoint(36.44628702,-0.9158), 4326)),

('Lake Elementaita', 'A UNESCO World Heritage Site, ideal for bird watching.',
(SELECT id FROM categories WHERE name='Lake'), ST_SetSRID(ST_MakePoint(36.24176334,-0.441103369), 4326)),

('Olkaria Geothermal Spa', 'Hot spa pools amidst geothermal activity.',
(SELECT id FROM categories WHERE name='Geothermal Site'), ST_SetSRID(ST_MakePoint(36.29482167,-0.860900903), 4326)),

('Kariandusi Prehistoric Site', 'An important archaeological site with ancient tools.',
(SELECT id FROM categories WHERE name='Prehistoric Site'), ST_SetSRID(ST_MakePoint(36.2845125,-0.451510002), 4326)),

('Crater Lake Game Sanctuary', 'A scenic sanctuary with a volcanic crater lake.',
(SELECT id FROM categories WHERE name='Wildlife Conservancy'), ST_SetSRID(ST_MakePoint(36.25820055,-0.773146847), 4326)),

('Makalia Waterfalls', 'A picturesque waterfall within Lake Nakuru National Park.',
(SELECT id FROM categories WHERE name='Nature Reserve'), ST_SetSRID(ST_MakePoint(36.08090849,-0.491895737), 4326)),

('Ol Doinyo Eburru', 'A volcanic mountain offering hiking trails and geothermal features.',
(SELECT id FROM categories WHERE name='Viewpoint'), ST_SetSRID(ST_MakePoint(36.18995087,-0.647429872), 4326)),

('Lake Oloiden', 'A serene lake known for its hot springs and birdlife.',
(SELECT id FROM categories WHERE name='Lake'), ST_SetSRID(ST_MakePoint(36.2791271,-0.812671847), 4326)),

('Hippo Point Wildlife Conservancy', 'A conservation area ideal for wildlife viewing.',
(SELECT id FROM categories WHERE name='Wildlife Conservancy'), ST_SetSRID(ST_MakePoint(36.30676597,-0.799490121), 4326)),

('Elsamere Nature Reserve', 'Former home of Joy Adamson, now a conservation center.',
(SELECT id FROM categories WHERE name='Nature Reserve'), ST_SetSRID(ST_MakePoint(36.31049039,-0.820899494), 4326)),

('Kigio Wildlife Conservancy', 'A community-owned conservancy supporting eco-tourism.',
(SELECT id FROM categories WHERE name='Wildlife Conservancy'), ST_SetSRID(ST_MakePoint(36.39407167,-0.567112179), 4326)),

('Oserengoni Wildlife Sanctuary', 'A private sanctuary focusing on conservation and tourism.',
(SELECT id FROM categories WHERE name='Wildlife Conservancy'), ST_SetSRID(ST_MakePoint(36.24700324,-0.830670307), 4326)),

('Dodo’s Tower', 'A unique structure offering panoramic views of the surrounding area.',
(SELECT id FROM categories WHERE name='Wildlife Conservancy'), ST_SetSRID(ST_MakePoint(36.29048252,-0.804920261), 4326));
INSERT INTO nearby_hotel (name,  description, geom)
VALUES 
('Sarova Lion Hill Game Lodge', 'Luxury lodge inside Lake Nakuru NP.', 'POINT(36.1044 -0.3664)'),
('L.Nakuru Lodge', 'Eco-friendly lodge ','POINT(36.0966 -0.3907)'), 
('The Cliff', 'Boutique camp on the edge of Lake Nakuru.', 'POINT(36.0692 -0.3551)'),
('Mbweha Camp', 'Rustic cottages in Congreve Conservancy.', 'POINT(36.1950 -0.4725)'),
('Hotel Waterbuck', 'Business hotel in Nakuru City.', 'POINT(36.0684 -0.2858)'),
('The Royal City Hotel', 'Budget-friendly hotel in Nakuru CBD.', 'POINT(36.0725 -0.2922)'),
('The Panari Resort', 'Luxury resort near Thompson Falls, Nyahururu.', 'POINT(36.3712 0.0401)'),
('Lake Nakuru Sopa Lodge', 'Elevated lodge with views of Lake Nakuru.', 'POINT(36.1264 -0.4497)'),
('Lake Naivasha Serena Resort', 'Upscale resort on Lake Naivasha shores.', 'POINT(36.3534 -0.8354)'),
('Sopa Resort Naivasha', 'Lodge where wildlife roams the lawns.', 'POINT(36.4022 -0.8197)'),
('Lake Naivasha Resort', 'Popular resort on Moi South Lake Road.', 'POINT(36.4258 -0.7966)'),
('Crater Lake Camp', 'Tented camp near a volcanic crater lake.', 'POINT(36.2736 -0.7854)'),
('Pelican Lodge', 'Quiet lodge on Lake Elementaita.', 'POINT(36.2483 -0.4468)'),
('Lake Elementaita Serena Camp', 'Luxury tents in Soysambu Conservancy.', 'POINT(36.2415 -0.4355)'),
('Kigio Wildlife Camp', 'Eco-lodge in Gilgil/Naivasha area.', 'POINT(36.3933 -0.5675)'),
('Oserengoni Lodge', 'Exclusive lodge in Oserengoni Sanctuary.', 'POINT(36.2995 -0.8315)'),
('Lake Oloiden Resort', 'Serene campsite and lodge near Naivasha.', 'POINT(36.2791 -0.8127)');

INSERT INTO attraction_hotel (attraction_id, hotel_id, distance_km)
SELECT a.id,
h.id, ST_Distance(a.geom::geography, h.geom::geography)/1000
FROM attraction_site a, nearby_hotel h
WHERE ST_DWithin (a.geom::geography, h.geom::geography, 10000);

INSERT INTO pricing (attraction_id, visitor_type, price, year)
SELECT a.id, v.visitor_type::visitor_type_enum,
v.price, 2026
FROM (
VALUES 
('Lake Nakuru National Park', 'children', 1000),
    ('Hell’s Gate National Park', 'children', 800),
    ('Lake Naivasha', 'children', 500),
	('Menengai Crater', 'children', 100),
	('Lord Egerton Castle', 'children',0.00),
	('Lake Naivasha', 'children', 0.00),
	('Mount Longonot National Park', 'children',0.00),
	('Olkaria Geothermal Spa', 'children', 0.00),
	('Kariandusi Prehistoric Site', 'children', 0.00),
	('Lake Elementaita', 'children', 0.00),
	('Crescent Island Game Sanctuary', 'children', 0.00),('Crater Lake Game Sanctuary', 'children', 0.00),
('Makalia Waterfalls', 'children', 0.00),
('Ol Doinyo Eburru', 'children', 0.00),
('Lake Oloiden', 'children', 0.00),
('Hippo Point Wildlife Conservancy', 'children', 0.00),
('Elsamere Nature Reserve', 'children', 0.00),
('Kigio Wildlife Conservancy', 'children', 0.00),
('Oserengoni Wildlife Sanctuary', 'children', 0.00),
('Dodo’s Tower', 'children', 0.00),

('Lake Nakuru National Park', 'citizens', 1000),
    ('Hell’s Gate National Park', 'citizens', 800),
    ('Lake Naivasha', 'citizens', 500),
	('Menengai Crater', 'citizens', 100),
	('Lord Egerton Castle', 'citizens',0.00),
	('Lake Naivasha', 'citizens', 0.00),
	('Mount Longonot National Park', 'citizens',0.00),
	('Olkaria Geothermal Spa', 'citizens', 0.00),
	('Kariandusi Prehistoric Site', 'citizens', 0.00),
	('Lake Elementaita', 'citizens', 0.00),
	('Crescent Island Game Sanctuary', 'citizens', 0.00),('Crater Lake Game Sanctuary', 'citizens', 0.00),
('Makalia Waterfalls', 'citizens', 0.00),
('Ol Doinyo Eburru', 'citizens', 0.00),
('Lake Oloiden', 'citizens', 0.00),
('Hippo Point Wildlife Conservancy', 'citizens', 0.00),
('Elsamere Nature Reserve', 'citizens', 0.00),
('Kigio Wildlife Conservancy', 'citizens', 0.00),
('Oserengoni Wildlife Sanctuary', 'citizens', 0.00),
('Dodo’s Tower', 'citizens', 0.00)

	
)AS v(name, visitor_type, price)
	JOIN attraction_site a
	ON a.name=v.name;
	
INSERT INTO visitor_stat(attraction_id, year, visitor_count)
 SELECT a.id, s.year, s.visitor_count
 FROM (
 VALUES
 ('Lake Nakuru National Park', 2020, 50000),
 ('Lake Nakuru National Park', 2021, 75000),
 ('Lake Nakuru National Park', 2022, 150000),
 ('Lake Nakuru National Park', 2023, 200000),

 ('Menengai Crater', 2020, 12000),
 ('Menengai Crater', 2021, 18000),
 ('Menengai Crater', 2022, 35000),
 ('Menengai Crater', 2023, 50000),

 ('Hyrax Hill Prehistoric Site', 2020, 2500),
 ('Hyrax Hill Prehistoric Site', 2021, 5000),
 ('Hyrax Hill Prehistoric Site', 2022, 8000),
 ('Hyrax Hill Prehistoric Site', 2023, 10000),

 ('Lord Egerton Castle', 2020, 3500),
 ('Lord Egerton Castle', 2021, 6000),
 ('Lord Egerton Castle', 2022, 12000),
 ('Lord Egerton Castle', 2023, 15000),

('Lake Naivasha', 2020, 60000),
 ('Lake Naivasha', 2021, 100000),
 ('Lake Naivasha', 2022, 200000),
 ('Lake Naivasha', 2023, 300000),

 ('Hell’s Gate National Park', 2020, 20000),
 ('Hell’s Gate National Park', 2021, 35000),
 ('Hell’s Gate National Park', 2022, 60000),
 ('Hell’s Gate National Park', 2023, 80000),

 ('Mount Longonot National Park', 2020, 10000),
 ('Mount Longonot National Park', 2021, 20000),
 ('Mount Longonot National Park', 2022, 35000),
 ('Mount Longonot National Park', 2023, 40000),


('Olkaria Geothermal Spa', 2020, 5000),
 ('Olkaria Geothermal Spa', 2021, 8000),
 ('Olkaria Geothermal Spa', 2022, 15000),
 ('Olkaria Geothermal Spa', 2023, 25000),

 ('Kariandusi Prehistoric Site', 2020, 1000),
 ('Kariandusi Prehistoric Site', 2021, 2500),
 ('Kariandusi Prehistoric Site', 2022, 4000),
 ('Kariandusi Prehistoric Site', 2023, 5000),

 ('Lake Elementaita', 2020, 6000),
 ('Lake Elementaita', 2021, 10000),
 ('Lake Elementaita', 2022, 20000),
 ('Lake Elementaita', 2023, 30000),

 ('Crescent Island Game Sanctuary', 2020, 4000),
 ('Crescent Island Game Sanctuary', 2021, 8000),
 ('Crescent Island Game Sanctuary', 2022, 15000),
 ('Crescent Island Game Sanctuary', 2023, 20000),

('Crater Lake Game Sanctuary', 2020, 3500),
 ('Crater Lake Game Sanctuary', 2021, 7000),
 ('Crater Lake Game Sanctuary', 2022, 12000),
 ('Crater Lake Game Sanctuary', 2023, 15000),

('Makalia Waterfalls', 2020, 2000),
 ('Makalia Waterfalls', 2021, 4000),
 ('Makalia Waterfalls', 2022, 8000),
 ('Makalia Waterfalls', 2023, 10000),

('Ol Doinyo Eburru', 2020, 2500),
 ('Ol Doinyo Eburru', 2021, 5000),
 ('Ol Doinyo Eburru', 2022, 10000),
 ('Ol Doinyo Eburru', 2023, 12000),

('Lake Oloiden', 2020, 3000),
 ('Lake Oloiden', 2021, 6000),
 ('Lake Oloiden', 2022, 12000),
 ('Lake Oloiden', 2023, 15000),

('Hippo Point Wildlife Conservancy', 2020, 4000),
 ('Hippo Point Wildlife Conservancy', 2021, 7000),
 ('Hippo Point Wildlife Conservancy', 2022, 13000),
 ('Hippo Point Wildlife Conservancy', 2023, 15000),

('Elsamere Nature Reserve', 2020, 4000),
 ('Elsamere Nature Reserve', 2021, 3000),
 ('Elsamere Nature Reserve', 2022, 5000),
 ('Elsamere Nature Reserve', 2023, 6000),

('Kigio Wildlife Conservancy', 2020, 2000),
 ('Kigio Wildlife Conservancy', 2021, 4000),
 ('Kigio Wildlife Conservancy', 2022, 8000),
 ('Kigio Wildlife Conservancy', 2023, 10000),

 ('Oserengoni Wildlife Sanctuary', 2020, 1500),
 ('Oserengoni Wildlife Sanctuary', 2021, 3000),
 ('Oserengoni Wildlife Sanctuary', 2022, 6000),
 ('Oserengoni Wildlife Sanctuary', 2023, 7000),

 ('Dodo’s Tower', 2020, 1000),
 ('Dodo’s Tower', 2021, 2000),
 ('Dodo’s Tower', 2022, 3000),
 ('Dodo’s Tower', 2023, 3500)
 )AS S(name, year, visitor_count)
 JOIN attraction_site a ON a.name=s.name


