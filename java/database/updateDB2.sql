BEGIN TRANSACTION;

ALTER TABLE product ALTER COLUMN weight TYPE varchar(255);

UPDATE product SET sale = false WHERE product_id = 2;
UPDATE product SET sale = false WHERE product_id = 3;
UPDATE product SET sale = false WHERE product_id = 4;
UPDATE product SET sale = false WHERE product_id = 5;
UPDATE product SET sale = false WHERE product_id = 6;
UPDATE product SET sale = true WHERE product_id = 7;
UPDATE product SET sale = false WHERE product_id = 8;
UPDATE product SET sale = false WHERE product_id = 9;
UPDATE product SET sale = false WHERE product_id = 10;
UPDATE product SET sale = false WHERE product_id = 11;
UPDATE product SET sale = false WHERE product_id = 12;
UPDATE product SET sale = false WHERE product_id = 13;
UPDATE product SET sale = false WHERE product_id = 14;
UPDATE product SET sale = false WHERE product_id = 15;
UPDATE product SET sale = false WHERE product_id = 16;
UPDATE product SET sale = true WHERE product_id = 17;
UPDATE product SET sale = false WHERE product_id = 18;
UPDATE product SET sale = false WHERE product_id = 19;
UPDATE product SET sale = false WHERE product_id = 20;
UPDATE product SET sale = false WHERE product_id = 21;
UPDATE product SET sale = false WHERE product_id = 22;
UPDATE product SET sale = false WHERE product_id = 23;
UPDATE product SET sale = false WHERE product_id = 24;
UPDATE product SET sale = false WHERE product_id = 25;
UPDATE product SET sale = false WHERE product_id = 26;
UPDATE product SET sale = true WHERE product_id = 27;
UPDATE product SET sale = false WHERE product_id = 28;
UPDATE product SET sale = false WHERE product_id = 29;
UPDATE product SET sale = false WHERE product_id = 30;
UPDATE product SET sale = false WHERE product_id = 31;
UPDATE product SET sale = false WHERE product_id = 32;
UPDATE product SET sale = false WHERE product_id = 33;
UPDATE product SET sale = false WHERE product_id = 34;
UPDATE product SET sale = false WHERE product_id = 35;
UPDATE product SET sale = false WHERE product_id = 36;
UPDATE product SET sale = true WHERE product_id = 37;
UPDATE product SET sale = false WHERE product_id = 38;
UPDATE product SET sale = false WHERE product_id = 39;
UPDATE product SET sale = false WHERE product_id = 40;
UPDATE product SET sale = false WHERE product_id = 41;
UPDATE product SET sale = false WHERE product_id = 42;
UPDATE product SET sale = false WHERE product_id = 43;
UPDATE product SET sale = false WHERE product_id = 44;
UPDATE product SET sale = false WHERE product_id = 45;
UPDATE product SET sale = false WHERE product_id = 46;
UPDATE product SET sale = true WHERE product_id = 47;
UPDATE product SET sale = false WHERE product_id = 48;
UPDATE product SET sale = false WHERE product_id = 49;
UPDATE product SET sale = false WHERE product_id = 50;
UPDATE product SET weight = '21 oz' WHERE product_id = 1;
UPDATE product SET weight = '28 oz' WHERE product_id = 2;
UPDATE product SET weight = '17 oz' WHERE product_id = 3;
UPDATE product SET weight = '15 oz' WHERE product_id = 4;
UPDATE product SET weight = '9 oz' WHERE product_id = 5;
UPDATE product SET weight = '30 ml' WHERE product_id = 6;
UPDATE product SET weight = '6 oz' WHERE product_id = 7;
UPDATE product SET weight = '25 oz' WHERE product_id = 8;
UPDATE product SET weight = '11 oz' WHERE product_id = 9;
UPDATE product SET weight = '20 oz' WHERE product_id = 10;
UPDATE product SET weight = '20 oz' WHERE product_id = 11;
UPDATE product SET weight = '19.6 oz' WHERE product_id = 12;
UPDATE product SET weight = '27 ml' WHERE product_id = 13;
UPDATE product SET weight = '15 oz' WHERE product_id = 14;
UPDATE product SET weight = '136 ct' WHERE product_id = 15;
UPDATE product SET weight = '22 oz' WHERE product_id = 16;
UPDATE product SET weight = '28 oz' WHERE product_id = 17;
UPDATE product SET weight = '28 oz' WHERE product_id = 18;
UPDATE product SET weight = '12 oz' WHERE product_id = 19;
UPDATE product SET weight = '16 oz' WHERE product_id = 20;
UPDATE product SET weight = '12 ct' WHERE product_id = 21;
UPDATE product SET weight = '16 oz' WHERE product_id = 22;
UPDATE product SET weight = '4 ct' WHERE product_id = 23;
UPDATE product SET weight = '23 oz' WHERE product_id = 24;
UPDATE product SET weight = '1.9 oz' WHERE product_id = 25;
UPDATE product SET weight = '3 oz' WHERE product_id = 26;
UPDATE product SET weight = '25 oz' WHERE product_id = 27;
UPDATE product SET weight = '18 oz' WHERE product_id = 28;
UPDATE product SET weight = '15 oz' WHERE product_id = 29;
UPDATE product SET weight = '26 oz' WHERE product_id = 30;
UPDATE product SET weight = '22 oz' WHERE product_id = 31;
UPDATE product SET weight = '18 oz' WHERE product_id = 32;
UPDATE product SET weight = '22 oz' WHERE product_id = 33;
UPDATE product SET weight = '18 oz' WHERE product_id = 34;
UPDATE product SET weight = '19 oz' WHERE product_id = 35;
UPDATE product SET image = 'https://i5.wal.co/asr/5517c5d3-85fc-4286-925c-16c7d49bf72a_4.1170f115fd78f6c120297c766090d125.png?odnWidth=undefined&odnHeight=undefined&odnBg=ffffff' WHERE product_id = 35;
UPDATE product SET weight = '64 oz' WHERE product_id = 36;
UPDATE product SET weight = '12 oz' WHERE product_id = 37;
UPDATE product SET weight = '25 oz' WHERE product_id = 38;
UPDATE product SET weight = '28 oz' WHERE product_id = 39;
UPDATE product SET weight = '18 oz' WHERE product_id = 40;
UPDATE product SET weight = '17.8 oz'WHERE product_id = 41;
UPDATE product SET weight = '60 ct' WHERE product_id = 42;
UPDATE product SET weight = '14 oz' WHERE product_id = 43;
UPDATE product SET weight = '33.8 oz' WHERE product_id = 44;
UPDATE product SET weight = '2 ct' WHERE product_id = 45;
UPDATE product SET weight = '5 ct' WHERE product_id = 46;
UPDATE product SET weight = '17 oz' WHERE product_id = 47;
UPDATE product SET weight = '8 oz' WHERE product_id = 48;
UPDATE product SET weight = '4 ct' WHERE product_id = 49;
UPDATE product SET weight = '14.2 oz' WHERE product_id = 50;
UPDATE product SET weight = '17 oz' WHERE product_id = 51;
UPDATE product SET image = 'https://i5.wal.co/asr/0f617c3a-7949-4903-b172-5bd0f6c2fca7.ffca4e122c479fddf62375ee0a161fee.jpeg?odnWidth=612&odnHeight=612&odnBg=ffffff' WHERE product_id = 51;
UPDATE product SET weight = '24 oz' WHERE product_id = 52;
UPDATE product SET weight = '19 oz' WHERE product_id = 53;
UPDATE product SET weight = '6 ct' WHERE product_id = 54;
UPDATE product SET weight = '16 oz' WHERE product_id = 55;
UPDATE product SET weight = '12 ct' WHERE product_id = 56;
UPDATE product SET weight = '1.75 L' WHERE product_id = 57;
UPDATE product SET weight = '750 mL' WHERE product_id = 58;
UPDATE product SET weight = '750 mL' WHERE product_id = 59;
UPDATE product SET weight = '2.64 oz' WHERE product_id = 60;
UPDATE product SET weight = '29.5' WHERE product_id = 61;
UPDATE product SET weight = '20 oz' WHERE product_id = 62;
UPDATE product SET weight = '3.5 oz' WHERE product_id = 63;
UPDATE product SET weight = '24 oz' WHERE product_id = 64;
UPDATE product SET weight = '12 oz' WHERE product_id = 65;
UPDATE product SET weight = '15 oz' WHERE product_id = 66;
UPDATE product SET weight = '1 Gal' WHERE product_id = 67;
UPDATE product SET weight = '8 oz' WHERE product_id = 68;
UPDATE product SET weight = '1/2 Gal' WHERE product_id = 69;
UPDATE product SET weight = '43 oz' WHERE product_id = 70;

COMMIT TRANSACTION;