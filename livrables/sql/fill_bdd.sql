INSERT INTO Supplier (iD, name)
					VALUES (1, "INGREDIENTS EUROPE"), 
							(2, "CED PARIS"), 
					      	(3, "COMPAGNIE AGRICOLE");

INSERT INTO Address (iD, road_category, street_number, complement, zipcode, city, email, supplier_id)
					VALUES (1, "Boulevard des Pizzas", "4 bis", NULL, "13001", "MARSEILLE", "marseille@oc_pizza.com", NULL), 
							(2, "Place des Pizzaiolos", "89", NULL, "69001" , "LYON", "lyon@oc_pizza.com", NULL),
							(3, "rue de l'Epeule", "13", NULL, "06150" , "CANNES", "lyon@oc_pizza.com", NULL),
							(4, "Place des fournisseurs", "9", NULL, "69001" , "LYON", "ingredeurope@yahoo.com", 1), 
					      	(5, "Rue des Pizzas", "3 ter", "au rez de chaussee du grand bâtiment du festival", "06150", "CANNES", "cannes@fournisseurs.com", 3),
					      	(6, "rue La Boétie", "12", NULL, "75016", "PARIS", "paris@fournisseurs.com",2),
					      	(7, "Avenue du donjon Rouge", "1", "la livraison doit se faire a l'interieur du donjon rouge, merci.", "12345", "PORT-REAL", "cersei@cersei.got", NULL),
					      	(8, "Rue de Lancehelion", "2", NULL,  "12345", "LES JARDINS AQUATIQUES", "ellaria@ellaria.got", NULL),
					      	(9, "Place des dragons", "20", "deposez vite la livraison, sinon vous risquez de vous faire bruler.",  "12345", "DRAGONSTONE", "daenerys@daenerys.got", NULL),
					      	(10, "Ruelle du Nord", "1", NULL, "12345", "WINTERFELL", "jeressuscitesurcommande@hotmail.fr", NULL),
					      	(11, "Place du Jeu de Paume", "29", NULL, "18100", "VIERZON", "sdffds@teleworm.us", NULL),
					      	(12, "cours Jean Jaures", "25", NULL, "33300", "BORDEAUX", "dsf@dayrep.com", NULL),
					      	(13, "rue de la Mare aux Carats", "9", NULL, "34070", "MONTPELLIER", "PatriciaLHeureux@jourrapide.com", NULL),
					      	(14, "Chemin Du Lavarin Sud", "17", NULL, "06800", "CAGNES-SUR-MER", "r74@teleworm.us", NULL),
					      	(15, "rue Jean Vilar", "1 bis", NULL, "33130", "BÈGLES", "ouioui@teleworm.us", NULL),
					      	(16, "rue du Fossé des Tanneurs", "3", NULL, "83100", "TOULON", "po@teleworm.us", NULL),
					      	(17, "Chemin des Bateliers", "4", NULL, "20090", "AJACCIO", "MalagigiLangelier@teleworm.us", NULL),
					      	(18, "rue des six frères Ruellan", "12", NULL, "95110", "SANNOIS", "daafdsfds@teleworm.us", NULL),
					      	(19, "avenue de Provence", "190", NULL, "06220", "VALLAURIS", "blabla@teleworm.us", NULL);

INSERT INTO PizzaStore (iD, name, revenue, team_size, opening_hour, closing_hour, address_id)
					VALUES (1, "0C PIZZA LYON EST", 13504.34 , 26 , "08:00:00" , "22:00:00", 2), 
						(2, "0C PIZZA MARSEILLE ESTAQUES", 18885.04, 31 , "07:00:00", "22:00:00", 1), 
					    (3, "0C PIZZA CANNES BOCCA", 21909.90 , 25 , "09:00:00" , "23:00:00", 3);


INSERT INTO Client (num_client, first_name, last_name, phone_number, gender, password)
					VALUES (1, "Cersei", "Lannister", "0123456789", "F", "gameofthrones"), 
							(2, "Jon", "Snow", "0123456789", "H", "gameofthrones"), 
					      	(3, "Daenerys", "Targaryen", "0123456789", "F", "gameofthrones"),
					      	(4, "Ellaria", "Sand", "0123456789", "F", "gameofthrones");

INSERT INTO Team (iD, position, first_name, last_name, phone_number, gender, password, pizza_store_id)
					VALUES (1, "employee", "Paul", "Pierre", "0123456789", "H", "password", 3), 
							(2, "manager", "Pierre", "Jacques", "0123456789", "H", "password", 1),
							(3, "employee", "Eve", "Dupont", "0123456789", "F", "password", 1),
							(4, "delivery guy", "Claire", "Martin", "0123456789", "F", "password", 2),
							(5, "manager", "Agnès", "Téziste", "0123456789", "F", "password", 3),
							(6, "pizza chef", "Harry", "Potter", "0123456789", "H", "password", 2);

INSERT INTO ClientDetails (client_id, address_id, membership_start_date)
					VALUES (1, 7, NOW() ),
							(4, 8, NOW() ), 
							(2, 10, NOW() ),
					      	(3, 9 , NOW() );	

INSERT INTO TeamDetails (team_id, address_id, membership_start_date)
					VALUES (1, 11, NOW() ), 
							(3, 19, NOW() ), 
					      	(5, 14, NOW() ),
					      	(2, 15, NOW() ),
					      	(4, 12, NOW() ),
					      	(6, 13, NOW() ),
					      	(6, 16, NOW() ),
					      	(4, 17, NOW() ),
					      	(3, 18, NOW() );

INSERT INTO Ingredient (iD, name)
					VALUES (1, "blé"), 
							(2, "chorizo"), 
					      	(3, "champignons"),
					      	(4, "fromage"),
					      	(5, "jambon"),
					      	(6, "poivrons"),
					      	(7, "lardons"),
					      	(8, "crème fraîche"),
					      	(9, "olives");

INSERT INTO Stock (ingredient_id, pizza_store_id, quantity)
					VALUES (1, 2, 50), 
							(2, 1, 940), 
					      	(4, 3, 900.6), 
					      	(3, 1, 2.9), 
					      	(9, 3, 2), 
					      	(8, 2, 4.89), 
					      	(7, 2, 5.39), 
					      	(6, 1, 90.1), 
					      	(5, 3, 200);

INSERT INTO Recipe (iD, comment)
					VALUES (1, "Mettre beaucoup de fromage"), 
							(2, "Melanger le fromage et la crème fraîche."), 
					      	(3, "Ajouter un peu de sauce piquante en plus des poivrons et du chorizo."),
					      	(4, "Ne pas cuire les champignons.");

INSERT INTO Composition (recipe_id, ingredient_id, quantity)
					VALUES (1, 1, 0.1),
							(1, 4, 0.2),
							(1, 9, 0.05), 
							(2, 1, 0.1),
							(2, 8, 0.05),
							(2, 7, 0.1), 
					      	(3, 1, 0.1),
					      	(3, 2, 0.2),
					      	(3, 5, 0.2),
					      	(3, 6, 0.09),
					      	(4, 1, 0.1),
					      	(4, 3, 0.5),
					      	(4, 5, 0.9),
					      	(4, 9, 0.1);

INSERT INTO OrderPizzeria (order_number, status, `date`, payment_made, payment_method, client_id, team_id)
					VALUES (1,"pending", "2019-02-11" , "0" , "other", 3, 1), 
							(2,"being delivered", "2019-02-13 12:43:07", "1", "cash on delivery", 4, 3), 
					      	(3,"delivered", "2018-12-11", "1", "debit card on site", 1, 1);

INSERT INTO Pizza (iD, name, cost, price, recipe_id)
					VALUES (1, "Quatre Fromages", 3.43, 8.50, 1), 
							(2, "Forestière", 2.98, 8, 4),
							(3, "Volcano", 3.58, 9, 3),
					      	(4, "Fermière", 3.76, 9.50, 2);

INSERT INTO CommandLine (order_id,  pizza_id, quantity, pizza_size, pizza_crust)
					VALUES (2, 2, 1, "1", "thick"), 
							(1, 4, 3, "1.5", "thin"),
							(1, 2, 4, "2", "crusty"),  
					      	(3, 1, 2, "1", "thin");

INSERT INTO OrderSupplier (ingredient_id,  supplier_id, `date`, quantity)
					VALUES (1, 3, "2019-01-01", 3.43), 
							(7, 1, "2019-01-01", 5.21), 
					      	(2, 2, "2019-03-01", 2.2),
					      	(2, 3, "2019-01-07", 0.5),
					      	(1, 1, "2019-02-03", 4.2),
					      	(6, 2, "2019-02-10", 1.05);

CREATE TABLE Billing AS SELECT order_id, (quantity*price) AS amount FROM CommandLine inner join Pizza ON CommandLine.pizza_id = Pizza.iD;


ALTER TABLE Billing ADD CONSTRAINT order_pizzeria_billing_fk
FOREIGN KEY (order_id)
REFERENCES OrderPizzeria (order_number)
ON DELETE NO ACTION
ON UPDATE NO ACTION;























