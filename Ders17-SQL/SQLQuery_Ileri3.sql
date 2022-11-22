-- CustomerID'si CustomerID = 29720 olan kaydýn CompanyName'ini 'Alfred Schmidt' 
--ve [EmailAddress]= 'alf@alf.com' yapýnýz. 

begin transaction
UPDATE SalesLT.Customer
SET CompanyName = 'Alfred Schmidt', [EmailAddress]= 'alf@alf.com'
WHERE CustomerID = 29720
Rollback

SELECT * FROM SalesLT.Customer
WHERE CustomerID = 29720

-- Phone = '429-555-0145' olan kayýtlarýn ContactName'ini 'Juan Company' Yap!
begin transaction
UPDATE SalesLT.Customer
SET CompanyName='Juan Company'
WHERE Phone = '429-555-0145' -- 2 adet çýktý, niye?
Rollback

select * from SalesLT.Customer 
WHERE Phone = '429-555-0145'

--Be careful when updating records. If you omit the WHERE clause, ALL records will be updated!

--DELETE FROM table_name WHERE condition;

--Note: Be careful when deleting records in a table! Notice the WHERE clause in the DELETE statement. 
--The WHERE clause specifies which record(s) should be deleted. 
--If you omit the WHERE clause, all records in the table will be deleted!

begin transaction
ROLLBACK

select * FROM SalesLT.Customer WHERE CompanyName='Juan Company';

begin transaction
DELETE FROM SalesLT.Customer WHERE CompanyName='Juan Company';
rollback


-- DROP CONSTRAINT ler:
ALTER TABLE [SalesLT].[CustomerAddress]
DROP CONSTRAINT [FK_CustomerAddress_Customer_CustomerID];
ALTER TABLE SalesLT.SalesOrderHeader
DROP CONSTRAINT FK_SalesOrderHeader_Customer_CustomerID;




SELECT * FROM [SalesLT].[SalesOrderHeader] WHERE CustomerID IN(
SELECT CustomerID FROM SalesLT.Customer  WHERE CompanyName='Juan Company')

--Delete FROM [SalesLT].[SalesOrderHeader] WHERE CustomerID IN(
--SELECT CustomerID FROM SalesLT.Customer  WHERE CompanyName='Juan Company')

SELECT * FROM [SalesLT].[SalesOrderDetail] WHERE SalesOrderID IN 
(SELECT SalesOrderID FROM [SalesLT].[SalesOrderHeader] WHERE CustomerID IN(
SELECT CustomerID FROM SalesLT.Customer WHERE CompanyName='Juan Company'))

begin transaction
DELETE FROM [SalesLT].[SalesOrderDetail] WHERE SalesOrderID IN 
(SELECT SalesOrderID FROM [SalesLT].[SalesOrderHeader] WHERE CustomerID IN(
SELECT CustomerID FROM SalesLT.Customer WHERE CompanyName='Juan Company'))
Rollback


begin transaction
DELETE FROM [SalesLT].[SalesOrderHeader] WHERE CustomerID IN(
SELECT CustomerID FROM SalesLT.Customer  WHERE CompanyName='Juan Company')
Rollback
--The following SQL statement selects all the orders from the customer with CustomerID=4 ('Giovanni Rovelli'). 
--We use the "Customers" and "Orders" tables, and give them the table aliases of "c" and "o" respectively 
--(Here we use aliases to make the SQL shorter):
SELECT o.SalesOrderID, o.OrderDate, c.CompanyName
FROM [SalesLT].[Customer] AS c, [SalesLT].[SalesOrderHeader] AS o
WHERE c.CompanyName='Nearby Cycle Shop' AND c.CustomerID=o.CustomerID;

--The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
--The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.

/*
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING grup_kriter
ORDER BY column_name(s);
*/

--Satýcýnýn müþteri sayýlarý
select SalesPerson, count(*) from [SalesLT].[Customer]
GROUP by SalesPerson

--title bazýnda müþteri sayýlarý
select Title, count(*) from [SalesLT].[Customer]
GROUP by Title

--Satýcý ünvan bazýnda müþteri sayýlarý
select SalesPerson, Title, count(*) from [SalesLT].[Customer]
GROUP by SalesPerson, Title 
---------------------------------------------------------------------------------
--Sýnýflarýna öðrenci sayýlarý:
select s.ad, count(*) 
from tb_ogrenci o INNER JOIN tb_sinif s
ON o.sinifID = s.ID
GROUP BY s.ad 
ORDER BY 1 

-- 3 ten az sayýda öðrencisi olan öðretmenler.
select r.ad + ' ' + r.soyad Öðretmen, count(*) [Öðrenci Sayýsý]
from tb_ogrenci o INNER JOIN tb_ogretmen r
ON o.ogretmenID = r.ID
GROUP BY r.ad + ' ' + r.soyad
HAVING count(*) <= 3
ORDER BY 1 
---------------------------------------------------------------------------------

--number of customers of FirstNames:
SELECT FirstName, COUNT(CustomerID)
FROM SalesLT.Customer
GROUP BY FirstName;

SELECT *
FROM SalesLT.Customer
WHERE FirstName = 'Alan'



--The following SQL statement lists the number of customers in each country, sorted high to low:

SELECT FirstName, COUNT(CustomerID)
FROM SalesLT.Customer
GROUP BY FirstName
ORDER BY COUNT(CustomerID) DESC;

--lists the number of orders sent by each shippe
SELECT CustomerID, COUNT(*) AS NumberOfOrderDetail
FROM [SalesLT].[SalesOrderDetail] SOD INNER JOIN [SalesLT].SalesOrderHeader SOH
ON SOD.SalesOrderID = SOH.SalesOrderID
GROUP BY  CustomerID
ORDER BY 2 desc ;

/*
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);
*/




/*
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;
*/

SELECT SalesOrderID, OrderQty,
CASE
    WHEN OrderQty > 10 THEN 'The quantity is greater than 10'
    WHEN OrderQty = 10 THEN 'The quantity is 10'
    ELSE 'The quantity is under 10'
END AS OrderQty
FROM [SalesLT].[SalesOrderDetail];




