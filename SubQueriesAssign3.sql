-- 1.	Find the record of all customer whose order is cancelled.
SELECT * FROM classicmodels.customers WHERE customerNumber in(
SELECT customerNumber FROM classicmodels.orders WHERE status = 'Cancelled');

-- 2.	Find the first customer details who paid for order.
select * from classicmodels.customers where customerNumber = (
select customerNumber from  classicmodels.payments order by paymentDate limit 1 );

-- 3.	Find the last customer detail who paid for order.
SELECT * from classicmodels.customers where customerNumber=(
SELECT customerNumber from classicmodels.payments ORDER BY paymentDate DESC LIMIT 1); 

-- 4.	List all the product which has been sold more than 1000 pieces.

-- 5.	Find all Employees who works in UK.
SELECT * FROM classicmodels.employees WHERE officeCode in (
SELECT officeCode from classicmodels.offices where country = 'UK');

-- 6.	In which country does George Vanauf works in.
SELECT country from classicmodels.offices where officeCode in(
SELECT officeCode from classicmodels.employees where firstName ='George');

-- 7.	Find Email address of all employee who works in USA.
SELECT email from classicmodels.employees where officeCode in (
SELECT officeCode from classicmodels.offices WHERE country = 'USA');

-- 8.	Find customer name, phone and address of all the customer who never ordered
SELECT customerName, phone , addressLine1 from classicmodels.customers where customerNumber = (
SELECT customerNumber from classicmodels.orders where status = 'In Proc');
-- 9.	Find total No of orders which is product of Ducati.
SELECT COUNT(*) FROM classicmodels.orderdetails where productCode in(
SELECT productCode FROM classicmodels.products where productname like "%Ducati%");

-- 10.	List all order of Ford parts.
SELECT * FROM classicmodels.orderdetails where productCode in (
SELECT productcode from classicmodels.products where productName like "%ford%");

-- Find first customer who placed order.
select * from classicmodels.customers where customerNumber = (
SELECT customerNumber from classicmodels.orders order  by orderDate  LIMIT 1);

-- 12.	Find last customer who placed order.
SELECT * FROM classicmodels.customers where customerNumber = (
SELECT customerNumber from classicmodels.orders order by orderDate desc LIMIT 1);

-- 13.	Find top three sold product.
SELECT productName , sum(priceEach) from classicmodels.products where productCode = (
SELECT productCode from orderdetails order by priceEach desc limit 3);

-- 14.	Find top three customers who spend most.
SELECT * from classicmodels.customers  where customerNumber = (
SELECT customerNumber FROM classicmodels.payments order by amount desc limit 1);

-- 15.	Find least sold Products.(i dont know)

-- 16.	Find least spending customers.
SELECT * from classicmodels.customers  where customerNumber = (
SELECT customerNumber FROM classicmodels.payments order by amount asc limit 1);

