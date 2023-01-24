USE sakila;

-- 1. Drop column picture from staff. 
ALTER TABLE staff
DROP COLUMN picture;
SELECT * FROM staff;

-- 2. A new person is hired to help Jon.  Her name is Tammy Saunders, and she is a customer. Update the database accordingly.
SELECT * FROM customer
WHERE first_name = 'Tammy';

INSERT INTO staff(staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update) 
VALUES
('3','Tammy', 'Saunders', '79', 'TAMMY.SANDERS@sakilacustomer.org', '2','1','Tammy', NULL,'2006-02-15 04:57:20' );

SELECT * FROM staff;

-- 3.  Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
-- You can use current date for the rental_date column in the rental table.

-- Customer Details
SELECT * FROM customer
WHERE first_name = 'Charlotte' AND last_name = 'Hunter';

-- Find film id
SELECT film_id FROM film
WHERE title = 'Academy Dinosaur';
-- Film id is 1

-- Find inventory_id for the film
SELECT i.film_id, r.rental_id, i.inventory_id, i.store_id, r.staff_id
FROM inventory AS i
JOIN rental AS r
ON i.inventory_id = r.inventory_id
WHERE film_id = '1' AND staff_id ='1' AND store_id = '1';
-- Use 1
 
-- Find rental id
SELECT * FROM rental 
ORDER BY rental_id DESC;
-- Use 16050

INSERT INTO rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES
('16050', '2022-01-23 09:00:00', '1', '130', NULL, '1', '2006-02-15 04:57:20');

SELECT * FROM rental
ORDER BY rental_id DESC;