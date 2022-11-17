
https://drive.google.com/drive/folders/1IE5rY4qgZbrn85KLJ8PuyPg2HVl0DXzl?usp=sharing

https://drive.google.com/drive/folders/1IE5rY4qgZbrn85KLJ8PuyPg2HVl0DXzl?usp=sharing
https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms


select * from production.product;

select ProductId, Name from production.product;

select Name Product_Name, * from production.product order by Name;

-- Distinct
select count(*) from Person.Person  
select distinct  FirstName from Person.Person
select count(*) from Person.Person WHERE FirstName = 'Henry'

--Union ve Union all
SELECT BusinessEntityID, ModifiedDate, SalesQuota
FROM Sales.SalesPerson
WHERE SalesQuota > 0
UNION  ALL
SELECT BusinessEntityID, ModifiedDate, SalesQuota
FROM Sales.SalesPersonQuotaHistory
WHERE SalesQuota > 0

select ProductId, Name
from Production.Product
WHERE ProductID = 2 AND Name='Bearing Ball'

--AND
select ProductId, Name
from Production.Product
WHERE ProductID = 2 AND Name='Bearing Ball' AND ProductNumber = 'BA-8327'

--OR
select ProductId, Name
from Production.Product
WHERE Name='Bearing Ball' OR Name = 'Blade' 

-- Buyuk harf OK.
select ProductId, Name
from Production.Product
WHERE Name='Bearing Ball' OR Name = 'Blade' OR Name = 'CHAIN'

-- 1=1
select ProductId, Name
from Production.Product
WHERE ProductID < 5 OR 1=1

--Karþýlaþtýrma Operatörleri 
--< > =  <= >= != <> LIKE 

select * from Production.Product WHERE ProductID < 5;
select * from Production.Product WHERE ProductID > 5;
select * from Production.Product WHERE ProductID = 4;
select * from Production.Product WHERE ProductID <= 316;
select * from Production.Product WHERE ProductID != 316;  -- 503 rows
select * from Production.Product                          -- 504 rows

-- LIKE ile sorgu pluþturabilmek için joker karakter kullanýlmalýdýr:
-- % Birden fazla harf ve rakam
-- _ Bir tek harf ya da rakam
-- [Harf]  Herhangi bir harf
-- [^Harf] Herhangi bir harf yerine gelemeyecek harfler
-- [A-Z] A ile Z arasýndakli harfleri belirtir.



select * from Production.Product WHERE Name LIKE '%ad%'   -- içinde ad geçen, büyük küçük harf farketmez.
select * from Production.Product WHERE Name LIKE 'C%'   -- baþ harfi C
select * from Production.Product WHERE Name LIKE 'BE%'   -- baþ harfi Be
select * from Production.Product WHERE Name LIKE '%karm'   -- baþ harfi Be
select * from Production.Product WHERE Name LIKE '%ha%'   -- içinde ha
select * from Production.Product WHERE Name LIKE '_eflector'   -- 9 harfli sonu eflector.
select * from Production.Product WHERE Name LIKE '[AC]%'   -- baþ harfi A yada C 
select * from Production.Product WHERE Name LIKE '[A-C]%'   -- baþ harfi A yada B ya da C
select * from Production.Product WHERE Name LIKE '[A-C][^l]%'   -- baþ harfi ABC olan, sonraki harfi h olmayan. 
select * from Production.Product WHERE Name LIKE '%[%]%'   -- içinde % geçen
select * from Production.Product WHERE Name LIKE '%/%'   -- içinde / geçen
select * from Production.Product WHERE Name NOT LIKE 'BE%'   -- baþ harfi Be olmayan

-- Between AND
select * from Production.Product WHERE ProductId Between 1 and 4 -- 1 ve 4 dahil. 

-- IN NOT IN 
select * from Production.Product WHERE ProductId IN (1,2,3,316) --
select * from Production.Product WHERE Name IN ('Adjustable % Race','Bearing Ball','BB Ball Bearing','Blade')
select * from Production.Product WHERE ProductId NOT IN (1,2,3,316) --Not in 

Set CONCAT_NULL_YIELDS_NULL ON;
SELECT Name + COLOR + ProductNumber, *  FROM Production.Product WHERE(Name + COLOR + ProductNumber IS NOT NULL);
Set CONCAT_NULL_YIELDS_NULL OFF;
SELECT Name + COLOR + ProductNumber, *  FROM Production.Product WHERE(Name + COLOR + ProductNumber IS NOT NULL);

-- IS NULL IS NOT NULL
select * from Production.Product WHERE Size IS NOT NULL


-- IsNull Fonksiyonu 
select ISNULL(Size, 0) Size, ProductID 
from Production.Product --WHERE Size IS NOT NULL

select 
AVG(Isnull(Weight, 10))
from Production.Product

-- ORDER BY 
SElect ProductId, Name
from Production.Product
ORDER BY Name

-- DESC ASC 1, 2
SElect ProductId, Name
from Production.Product
ORDER BY 2 DESC 

--
SELECT ReorderPoint,Name 
from Production.Product
ORDER BY 1,2

--TOP OPERATÖRÜ
SELECT TOP 5 * FROM Production.Product
ORDER BY 1,2

SELECT TOP 2 PERCENT * FROM SalesLT.Product
ORDER BY 1,2

--Klasik Join -- INNER JOIN'le ayný.
SElect SOD.ProductId, P.Name, SOD.*
from SalesLT.SalesOrderDetail SOD, SalesLT.Product P
Where SOD.ProductID	= P.ProductID

--INNER JOIN
SElect SOD.ProductId, P.Name, SOD.*
from SalesLT.SalesOrderDetail SOD INNER JOIN SalesLT.Product P
ON SOD.ProductID	= P.ProductID

--LEFT JOIN : --Left Join: Soldaki tüm kayýtlar, saðdaki eþleþen kayýtlar.
SElect SOD.ProductId, P.Name, SOD.*
from SalesLT.SalesOrderDetail SOD LEFT JOIN SalesLT.Product P
ON SOD.ProductID	= P.ProductID

--RIGHT JOIN
SElect SOD.ProductId, P.Name, SOD.*
from SalesLT.SalesOrderDetail SOD RIGHT JOIN SalesLT.Product P
ON SOD.ProductID	= P.ProductID

-- FULL OUTER JOIN: Hem right join, hem left join. 
SElect SOD.ProductId, P.Name, SOD.*
from SalesLT.SalesOrderDetail SOD FULL JOIN SalesLT.Product P
ON SOD.ProductID	= P.ProductID
WHERE SOD.ProductID IS NULL
ORDER BY 1

-- Tablo yaratýrken Primary Key oluþturma
CREATE TABLE Urunler(
UrunID INT,
UrunAd Varchar(200),
UrunFiyat Money,
CONSTRAINT PKC_UrunId PRIMARY KEY(UrunID)
);

--Tabloyu oluþtur, PK'yý tanýmla.
CREATE Table Kullanicilar(
KullaniciID INT NOT NULL,
Ad varchar(50),
Soyad varchar(50),
KullaniciAd varchar(20)
);
ALTER TABLE Kullanicilar
ADD Constraint PKC_KullaniciID Primary Key(KullaniciID);

--Tabloyu oluþtur, Unique index tanýmla.
CREATE TABLE Personeller
(
 PersonelId INT PRIMARY KEY NOT NULL,
 Ad Varchar(255) NOT NULL,
 Soyad Varchar(255) NOT NULL,
 KullaniciAd Varchar(10) NOT NULL UNIQUE,
 Email Varchar(50),
 Adres Varchar(255),
 Sehir Varchar(255)
 );

 --Mevcut tabloya Unique constraint ekle.
 ALTER TABLE PERSONELLER
 ADD CONSTRAINT UQ_PersonelEmail UNIQUE (Email);

 -- DEFAULT Constraint.
 CREATE TABLE Personeller
(
 PersonelId INT PRIMARY KEY NOT NULL,
 Ad Varchar(255) NOT NULL,
 Soyad Varchar(255) NOT NULL,
 KullaniciAd Varchar(10) NOT NULL UNIQUE,
 Email Varchar(50),
 Adres Varchar(255),
 Sehir Varchar(255),
 KayitTarihi SMALLDATETIME NOT NULL DEFAULT GETDATE()
 );
 
 ALTER TABLE [dbo].[Personeller] ADD  DEFAULT (getdate()) FOR [KayitTarihi]
 -- [Personeller]'e Edit ile kayýt ekle, KayitTarihi dolu gelecek. 

  ALTER TABLE [dbo].[Personeller] ADD  DEFAULT ('Istanbul') FOR Sehir


 -- IN, ANY, ALL, EXISTS

 /*
 SELECT sutun_ismi1 [, sutun_ismi2,...] 
 FROM tablo_ismi
 WHERE sutun_ismi1 = (SELECT sutun_ismi
                      FROM tablo_ismi
					  WHERE tek_satir_donduren_koþul)

 SELECT sutun_ismi1 [, sutun_ismi2,...] 
 FROM tablo_ismi
 WHERE sutun_ismi1 IN (SELECT sutun_ismi
                      FROM tablo_ismi
					  WHERE koþul)
					  */

SELECT MIN(OrderDate) 
  FROM SalesLT.SalesOrderHeader; 

SELECT
Distinct SOH.OrderDate AS SiparisTarihi,
SOD.ProductID AS UrunNo, orderdate
FROM SalesLT.SalesOrderHeader SOH
JOIN SalesLT.SalesOrderDetail SOD
ON SOH.SalesOrderId = SOD.SalesOrderId 
WHERE orderdate = '2004-06-01';

SELECT SOH.OrderDate AS SiparisTarihi,
SOD.ProductID AS UrunNo, orderdate, SOH.*
FROM SalesLT.SalesOrderHeader SOH
JOIN SalesLT.SalesOrderDetail SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
WHERE SOH.OrderDate = (SELECT MIN(OrderDate) 
                       FROM SalesLT.SalesOrderHeader )


SELECT *
FROM SalesLT.ProductCategory AS PC
WHERE PC.ProductCategoryID IN (1,2,3)

--EXISTS
SELECT * FROM SalesLT.Product P 
WHERE EXISTS(SELECT SOD.ProductID FROM SalesLT.SalesOrderDetail SOD WHERE SOD.ProductID =P.ProductID)

SELECT * FROM SalesLT.Product P 
WHERE NOT EXISTS(SELECT SOD.ProductID FROM SalesLT.SalesOrderDetail SOD WHERE SOD.ProductID =P.ProductID)

-- Ürünleri listeleyelim ve herbir kayýt için birer birer artan sýra numarasý oluþturalým. 
SELECT ROW_NUMBER() OVER (ORDER BY Name) AS SatirNo, ProductId, Name
FROM SalesLT.Product



--SELECT INTO
SELECT * 
INTO tb_Product
FROM SalesLT.Product -- 295 rows affected

SELECT * 
INTO #tb_Product
FROM SalesLT.Product -- 295 rows affected

SELECT * FROM #tb_Product

SELECT ProductID, Name --Sadece 2 kolonu attýk.
INTO tb_Product
FROM SalesLT.Product -- 295 rows affected

-- Stored procedure sonucunu tabloya eklemek.
-- Kullanici yi sil!
DROP PROC pr_GetCustomer
Create PROC pr_GetCustomer
AS
Begin
SELECT CustomerID, FirstName, LastName, EmailAddress 
FROM SalesLT.Customer;
END;

EXEC pr_GetCustomer

INSERT INTO Personeller(PersonelId, Ad, Soyad, Email)
EXEC pr_GetCustomer



 CREATE DATABASE OKUL_VT; -- OKUL_VT isminde bir veritabaný oluþturduk.

-- DROP DATABASE OKUL_VT; -- OKUL_VT veritabanýný siler.

USE OKUL_VT; -- OKUL_VT veritabanýný kullan.

-- Tablo oluþturuyoruz.

CREATE TABLE tb_Ogrenci 
(
	numara int,
	ad nvarchar(50),
	soyad nvarchar(50),
	dogumYili smallint,
	sinif varchar(5)
);

-- Tabloyu düzenliyoruz.

ALTER TABLE tb_Ogrenci ALTER COLUMN numara nvarchar(50) NOT NULL;
ALTER TABLE tb_Ogrenci ALTER COLUMN ad nvarchar(50) NOT NULL;
ALTER TABLE tb_Ogrenci  ALTER COLUMN soyad nvarchar(50) NOT NULL;
ALTER TABLE tb_Ogrenci  ALTER COLUMN dogumYili smallint NOT NULL;
ALTER TABLE tb_Ogrenci  ALTER COLUMN sinif varchar(5) NOT NULL;

-- nuamra yý primary key yaptýk.
ALTER TABLE [dbo].[tb_Ogrenci] ADD  CONSTRAINT [PK_tb_Ogrenci] PRIMARY KEY CLUSTERED (	[numara] ASC)

ALTER TABLE tb_Ogrenci DROP CONSTRAINT  PK_tb_Ogrenci;
ALTER TABLE tb_Ogrenci DROP numara;
ALTER TABLE tb_Ogrenci ADD numara int NOT NULL IDENTITY(1,1) PRIMARY KEY;

  select 1 AS Sira,* FROM tb_ogrenci (NOLOCK)
  WHERE ad NOT like '%[0-9]%'
  AND ad NOT like '%[!-/]%'
  AND ad NOT like '%[:-@]%'
  UNION
  select 2 AS Sira,* FROM tb_ogrenci (NOLOCK)
  WHERE ad  like '%[0-9]%'
  OR ad  like '%[!-/]%'
  OR ad  like '%[:-@]%'
  ORDER BY Sira,AD












