BEGIN TRANSACTION;
DROP TABLE IF EXISTS product CASCADE;
DROP TABLE IF EXISTS brand;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS certification CASCADE;
DROP TABLE IF EXISTS certification_product;
DROP TABLE IF EXISTS category_product;
DROP SEQUENCE IF EXISTS seq_certification_id;
DROP SEQUENCE IF EXISTS seq_category_id;
DROP SEQUENCE IF EXISTS seq_brand_id;

CREATE SEQUENCE seq_certification_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_category_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_brand_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE TABLE brand (
        brand_id int DEFAULT nextval('seq_brand_id'::regclass) NOT NULL,
        brand_name varchar(255) NOT NULL,
        CONSTRAINT pk_brand_id primary key (brand_id)
);

CREATE TABLE category (
        category_id int DEFAULT nextval('seq_category_id'::regclass) NOT NULL,
        category_name varchar(255) NOT NULL,
        CONSTRAINT pk_category_id primary key (category_id)
);

CREATE TABLE certification (
        certification_id int DEFAULT nextval('seq_certification_id'::regclass) NOT NULL,
        certification_name varchar(255) NOT NULL,
        CONSTRAINT pk_certification_id primary key (certification_id)
);

CREATE TABLE category_product (
        category_id int NOT NULL,
        product_id int NOT NULL,
        CONSTRAINT pk_category_product_category_id_product_id primary key (category_id, product_id),
        CONSTRAINT fk_category_id foreign key (category_id) references category (category_id)
);

CREATE TABLE certification_product (
        product_id int NOT NULL,
        certification_id int NOT NULL, 
        CONSTRAINT pk_certification_product_certification_id_product_id primary key (certification_id, product_id),
        CONSTRAINT fk_certification_id foreign key (certification_id) references certification (certification_id)
);

CREATE TABLE product (
        product_id int NOT NULL,
        title varchar(255) NOT NULL,
        category_id int NOT NULL,
        brand_id int NOT NULL,
        details varchar(255),
        image varchar(255),
        price decimal NOT NULL,
        weight decimal NOT NULL,
        sale boolean,
        CONSTRAINT pk_product primary key (product_id),
        CONSTRAINT fk_brand_id foreign key (brand_id) references brand (brand_id),
        CONSTRAINT fk_category_id foreign key (category_id) references category (category_id)
);

ALTER TABLE certification_product add foreign key (product_id) references product (product_id);
ALTER TABLE category_product add foreign key (product_id) references product (product_id);

INSERT INTO certification VALUES
    (1,'Vegan'),
    (2,'Kosher'),
    (3,'Halal'),
    (4,'Fair Trade');
    
INSERT INTO brand VALUES
    (1,'Yummy Co.'),
    (2,'Flavor Inc.'),
    (3,'Delicious LLC'),
    (4,'Scrumptious Group'),
    (5,'Tasty Cooperative');    
    
INSERT INTO category VALUES
    (1,'frozen'),
    (2,'other'),
    (3,'bakery'),
    (4,'produce'),
    (5,'alcohol'),
    (6,'international'),
    (7,'beverages'),
    (8,'pets'),
    (9,'dry goods pasta'),
    (10,'bulk'),
    (11,'personal care'),
    (12,'meat seafood'),
    (13,'pantry'),
    (14,'breakfast'),
    (15,'canned goods'),
    (16,'dairy eggs'),
    (17,'household'),
    (18,'babies'),
    (19,'snacks'),
    (20,'deli'),
    (21,'missing');    
    
INSERT INTO product VALUES
    (1,'Chocolate Sandwich Cookies',19,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,3.00,21,NULL),
    (2,'All-Seasons Salt',13,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,10.00,28,NULL),
    (3,'Robust Golden Unsweetened Oolong Tea',7,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,7.00,17,NULL),
    (4,'Smart Ones Classic Favorites Mini Rigatoni With Vodka Cream Sauce',1,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,9.00,15,NULL),
    (5,'Green Chile Anytime Sauce',13,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,1.00,9,NULL),
    (6,'Dry Nose Oil',11,4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,5.00,29,NULL),
    (7,'Pure Coconut Water With Orange',7,5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,1.00,6,NULL),
    (8,'Cut Russet Potatoes Steam N'' Mash',1,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,8.00,25,NULL),
    (9,'Light Strawberry Blueberry Yogurt',16,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,9.00,11,NULL),
    (10,'Sparkling Orange Juice & Prickly Pear Beverage',7,5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,2.00,20,NULL),
    (11,'Peach Mango Juice',7,4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,7.00,20,NULL),
    (12,'Chocolate Fudge Layer Cake',1,4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,4.00,8,NULL),
    (13,'Saline Nasal Mist',11,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,9.00,27,NULL),
    (14,'Fresh Scent Dishwasher Cleaner',17,5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,2.00,15,NULL),
    (15,'Overnight Diapers Size 6',18,5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,5.00,11,NULL),
    (16,'Mint Chocolate Flavored Syrup',19,5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,6.00,22,NULL),
    (17,'Rendered Duck Fat',12,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,3.00,29,NULL),
    (18,'Pizza for One Suprema  Frozen Pizza',1,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,9.00,22,NULL),
    (19,'Gluten Free Quinoa Three Cheese & Mushroom Blend',9,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,8.00,3,NULL),
    (20,'Pomegranate Cranberry & Aloe Vera Enrich Drink',7,4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,2.00,5,NULL),
    (21,'Small & Medium Dental Dog Treats',8,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,5.00,1,NULL),
    (22,'Fresh Breath Oral Rinse Mild Mint',11,4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,6.00,13,NULL),
    (23,'Organic Turkey Burgers',12,4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,9.00,4,NULL),
    (24,'Tri-Vi-Sol¬Æ Vitamins A-C-and D Supplement Drops for Infants',11,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,9.00,23,NULL),
    (25,'Salted Caramel Lean Protein & Fiber Bar',19,5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,9.00,18,NULL),
    (26,'Fancy Feast Trout Feast Flaked Wet Cat Food',8,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,8.00,3,NULL),
    (27,'Complete Spring Water Foaming Antibacterial Hand Wash',11,4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,2.00,7,NULL),
    (28,'Wheat Chex Cereal',14,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,5.00,3,NULL),
    (29,'Fresh Cut Golden Sweet No Salt Added Whole Kernel Corn',15,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,3.00,2,NULL),
    (30,'Three Cheese Ziti, Marinara with Meatballs',1,5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,5.00,26,NULL),
    (31,'White Pearl Onions',4,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,9.00,22,NULL),
    (32,'Nacho Cheese White Bean Chips',19,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,9.00,1,NULL),
    (33,'Organic Spaghetti Style Pasta',9,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,4.00,18,NULL),
    (34,'Peanut Butter Cereal',14,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,1.00,4,NULL),
    (35,'Italian Herb Porcini Mushrooms Chicken Sausage',12,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,5.00,19,NULL),
    (36,'Traditional Lasagna with Meat Sauce Savory Italian Recipes',1,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,8.00,18,NULL),
    (37,'Noodle Soup Mix With Chicken Broth',15,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,6.00,9,NULL),
    (38,'Ultra Antibacterial Dish Liquid',21,4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,10.00,2,NULL),
    (39,'Daily Tangerine Citrus Flavored Beverage',7,5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,1.00,28,NULL),
    (40,'Beef Hot Links Beef Smoked Sausage With Chile Peppers',12,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,3.00,21,NULL),
    (41,'Organic Sourdough Einkorn Crackers Rosemary',19,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,6.00,17,NULL),
    (42,'Biotin 1000 mcg',11,4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,6.00,4,NULL),
    (43,'Organic Clementines',4,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,9.00,23,NULL),
    (44,'Sparkling Raspberry Seltzer',7,4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,8.00,5,NULL),
    (45,'European Cucumber',4,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,2.00,23,NULL),
    (46,'Raisin Cinnamon Bagels 5 count',1,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,3.00,5,NULL),
    (47,'Onion Flavor Organic Roasted Seaweed Snack',6,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,9.00,17,NULL),
    (48,'School Glue, Washable, No Run',17,5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,9.00,8,NULL),
    (49,'Vegetarian Grain Meat Sausages Italian - 4 CT',20,5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,3.00,21,NULL),
    (50,'Pumpkin Muffin Mix',13,4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,8.00,15,NULL);      
    
INSERT INTO certification_product VALUES
    (1,4),
    (2,1),
    (3,4),
    (4,4),
    (5,3),
    (6,2),
    (7,1),
    (8,3),
    (9,3),
    (10,4),
    (11,2),
    (12,1),
    (13,1),
    (14,2),
    (15,2),
    (16,1),
    (17,1),
    (18,2),
    (19,4),
    (20,2),
    (21,1),
    (22,3),
    (23,2),
    (24,4),
    (25,1),
    (26,3),
    (27,2),
    (28,2),
    (29,3),
    (30,1),
    (31,4),
    (32,3),
    (33,4),
    (34,2),
    (35,3),
    (36,3),
    (37,3),
    (38,4),
    (39,4),
    (40,4),
    (41,2),
    (42,3),
    (43,2),
    (44,2),
    (45,3),
    (46,4),
    (47,4),
    (48,4),
    (49,2),
    (50,3);    



END TRANSACTION;