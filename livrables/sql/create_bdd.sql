DROP DATABASE IF EXISTS PIZZERIA;

CREATE DATABASE PIZZERIA CHARACTER SET 'utf8';

USE PIZZERIA;

CREATE TABLE PizzaStore (
                iD tinyint AUTO_INCREMENT NOT NULL,
                name VARCHAR(150) NOT NULL,
                revenue DECIMAL(15,2),
                team_size tinyint,
                opening_hour TIME NOT NULL,
                closing_hour TIME NOT NULL,
                address_id mediumint NOT NULL,
                PRIMARY KEY (iD)
);

CREATE TABLE Address (
                iD mediumint AUTO_INCREMENT NOT NULL,
                road_category VARCHAR(50) NOT NULL,
                street_number VARCHAR(50) NOT NULL,
                complement VARCHAR(150),
                zipcode CHAR(5) NOT NULL,
                city VARCHAR(50) NOT NULL,
                email VARCHAR(150) NOT NULL,
                supplier_id tinyint,
                PRIMARY KEY (iD)
);

CREATE TABLE OrderPizzeria (
                order_number mediumint AUTO_INCREMENT NOT NULL,
                status enum('pending','being prepared','cancelled','being delivered','picked up','delivered') NOT NULL,
                `date` DATETIME NOT NULL,
                payment_made BOOLEAN NOT NULL,
                payment_method enum('debit card online','debit card on delivery','debit card on site','cash on delivery','cash on site','other') NOT NULL,
                client_id mediumint NOT NULL,
                team_id mediumint NOT NULL,
                PRIMARY KEY (order_number)
);


CREATE TABLE Team (
                iD mediumint AUTO_INCREMENT NOT NULL,
                position enum('employee','delivery guy','pizza chef','manager','boss') NOT NULL,
                first_name VARCHAR(100) NOT NULL,
                last_name VARCHAR(100) NOT NULL,
                phone_number CHAR(11) NOT NULL,
                gender CHAR(1) NOT NULL,
                password VARCHAR(32) NOT NULL,
                pizza_store_id tinyint NOT NULL,
                PRIMARY KEY (iD)
);

CREATE TABLE Client (
                num_client mediumint AUTO_INCREMENT NOT NULL,
                first_name VARCHAR(100) NOT NULL,
                last_name VARCHAR(100) NOT NULL,
                phone_number CHAR(11) NOT NULL,
                gender CHAR(1) NOT NULL,
                password VARCHAR(32) NOT NULL,
                PRIMARY KEY (num_client)
);

CREATE TABLE ClientDetails (
               client_id mediumint NOT NULL,
               address_id mediumint NOT NULL,
               membership_start_date DATETIME NOT NULL,
               PRIMARY KEY (client_id, address_id)
);

CREATE TABLE TeamDetails (
               team_id mediumint NOT NULL,
               address_id mediumint NOT NULL,
               membership_start_date DATETIME NOT NULL,
               PRIMARY KEY (team_id, address_id)
);

CREATE TABLE Stock (
               ingredient_id tinyint NOT NULL,
               pizza_store_id tinyint NOT NULL,
               quantity DECIMAL(10,2),
               PRIMARY KEY (ingredient_id, pizza_store_id)
);

CREATE TABLE Ingredient (
               iD tinyint AUTO_INCREMENT NOT NULL,
               name VARCHAR(150) NOT NULL,
               PRIMARY KEY (iD)
);

CREATE TABLE Composition(
               ingredient_id tinyint NOT NULL,
               recipe_id tinyint NOT NULL,
               quantity DECIMAL(10,2),
               PRIMARY KEY (ingredient_id, recipe_id)
);

CREATE TABLE Recipe (
               iD tinyint AUTO_INCREMENT NOT NULL,
               comment mediumtext,
               PRIMARY KEY (iD)
);


CREATE TABLE Pizza (
               iD tinyint AUTO_INCREMENT NOT NULL,
               name VARCHAR(150) NOT NULL,
               cost DECIMAL(4,2) NOT NULL,
               price DECIMAL(4,2) NOT NULL,
               recipe_id tinyint NOT NULL,
               PRIMARY KEY (iD)
);

CREATE TABLE CommandLine (
               order_id mediumint NOT NULL,
               pizza_id tinyint NOT NULL,
               quantity tinyint NOT NULL,
               pizza_size enum('1','1.5','2') NOT NULL,
               pizza_crust enum('thin','thick','crusty') NOT NULL,
               PRIMARY KEY (order_id, pizza_id)
);

CREATE TABLE OrderSupplier (
               ingredient_id tinyint NOT NULL,
               supplier_id tinyint NOT NULL,
               `date` DATETIME NOT NULL,
               quantity DECIMAL(10,2),
               PRIMARY KEY (ingredient_id, supplier_id)
);

CREATE TABLE Supplier (
               iD tinyint AUTO_INCREMENT NOT NULL,
               name VARCHAR(150) NOT NULL,
               PRIMARY KEY (iD)
);

ALTER TABLE PizzaStore ADD CONSTRAINT pizza_store_address_fk
FOREIGN KEY (address_id)
REFERENCES Address (iD)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Team ADD CONSTRAINT team_pizza_store_fk
FOREIGN KEY (pizza_store_id)
REFERENCES PizzaStore (iD)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Address ADD CONSTRAINT supplier_address_fk
FOREIGN KEY (supplier_id)
REFERENCES Supplier (iD)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TeamDetails ADD CONSTRAINT team_details_team_fk
FOREIGN KEY (team_id)
REFERENCES Team (iD)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TeamDetails ADD CONSTRAINT team_details_address_fk
FOREIGN KEY (address_id)
REFERENCES Address (iD)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ClientDetails ADD CONSTRAINT client_details_client_fk
FOREIGN KEY (client_id)
REFERENCES Client (num_client)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ClientDetails ADD CONSTRAINT client_details_address_fk
FOREIGN KEY (address_id)
REFERENCES Address (iD)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE OrderPizzeria ADD CONSTRAINT order_pizzeria_client_fk
FOREIGN KEY (client_id)
REFERENCES Client (num_client)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE OrderPizzeria ADD CONSTRAINT order_pizzeria_team_fk
FOREIGN KEY (team_id)
REFERENCES Team (iD)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Stock ADD CONSTRAINT stock_ingredient_fk
FOREIGN KEY (ingredient_id)
REFERENCES Ingredient (iD)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Stock ADD CONSTRAINT stock_pizza_store_fk
FOREIGN KEY (pizza_store_id)
REFERENCES PizzaStore (iD)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE CommandLine ADD CONSTRAINT command_line_order_fk
FOREIGN KEY (order_id)
REFERENCES OrderPizzeria (order_number)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE CommandLine ADD CONSTRAINT command_line_pizza_fk
FOREIGN KEY (pizza_id)
REFERENCES Pizza (iD)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Pizza ADD CONSTRAINT pizza_recipe_fk
FOREIGN KEY (recipe_id)
REFERENCES Recipe (iD)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Composition ADD CONSTRAINT composition_recipe_fk
FOREIGN KEY (recipe_id)
REFERENCES Recipe (iD)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Composition ADD CONSTRAINT composition_ingredient_fk
FOREIGN KEY (ingredient_id)
REFERENCES Ingredient (iD)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE OrderSupplier ADD CONSTRAINT order_supplier_ingredient_fk
FOREIGN KEY (ingredient_id)
REFERENCES Ingredient (iD)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE OrderSupplier ADD CONSTRAINT order_supplier_supplier_fk
FOREIGN KEY (supplier_id)
REFERENCES Supplier (iD)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
