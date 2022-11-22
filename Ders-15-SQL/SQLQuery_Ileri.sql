
https://drive.google.com/drive/folders/1IE5rY4qgZbrn85KLJ8PuyPg2HVl0DXzl?usp=sharing


https://drive.google.com/drive/folders/1IE5rY4qgZbrn85KLJ8PuyPg2HVl0DXzl?usp=sharing
https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms


select * from SalesLT.product;

select ProductId, Name from SalesLT.product;

select Name Product_Name, * from SalesLT.product order by Name;

-- Distinct
select count(*) from SalesLT.product  
select Color from SalesLT.product  
select distinct  Color from SalesLT.product  
select count(*) from SalesLT.product  WHERE Color='Red'
select * from SalesLT.product  WHERE Color='Red'


--Union ve Union all
select [ProductID] from [SalesLT].[SalesOrderDetail]
UNION ALL
select [ProductID] FROM [SalesLT].[Product]

select *
from SalesLT.product
WHERE ProductID = 712 OR Name='LL Fork'

--ANDlll
select ProductId, Name
from SalesLT.product
WHERE Name='LL Fork' AND ProductID=802




-- 1=1
select ProductId, Name
from SalesLT.product
WHERE ProductID < 5 OR 1=1

--Kar��la�t�rma Operat�rleri 
--< > =  <= >= != <> LIKE 

select * from SalesLT.product WHERE ProductID < 5;
select * from SalesLT.product WHERE ProductID > 5;
select * from SalesLT.product WHERE ProductID = 4;
select * from SalesLT.product WHERE ProductID <= 316;
select * from SalesLT.product WHERE ProductID != 316;  -- 503 rows
select * from SalesLT.product                          -- 504 rows

-- LIKE ile sorgu plu�turabilmek i�in joker karakter kullan�lmal�d�r:
-- % Birden fazla harf ve rakam
-- _ Bir tek harf ya da rakam
-- [Harf]  Herhangi bir harf
-- [^Harf] Herhangi bir harf yerine gelemeyecek harfler
-- [A-Z] A ile Z aras�ndakli harfleri belirtir.



select * from SalesLT.product WHERE Name LIKE '%ad%'   -- i�inde ad ge�en, b�y�k k���k harf farketmez.
select * from SalesLT.product WHERE Name LIKE 'C%'   -- ba� harfi C
select * from SalesLT.product WHERE Name LIKE 'BE%'   -- ba� harfi Be
select * from SalesLT.product WHERE Name LIKE '%karm'   -- ba� harfi Be
select * from SalesLT.product WHERE Name LIKE '%ha%'   -- i�inde ha
select * from SalesLT.product WHERE Name LIKE '_eflector'   -- 9 harfli sonu eflector.
select * from SalesLT.product WHERE Name LIKE '[AC]%'   -- ba� harfi A yada C 
select * from SalesLT.product WHERE Name LIKE '[A-C]%'   -- ba� harfi A yada B ya da C
select * from SalesLT.product WHERE Name LIKE '[A-C][^l]%'   -- ba� harfi ABC olan, sonraki harfi h olmayan. 
select * from SalesLT.product WHERE Name LIKE '%[%]%'   -- i�inde % ge�en
select * from SalesLT.product WHERE Name LIKE '%/%'   -- i�inde / ge�en
select * from SalesLT.product WHERE Name NOT LIKE 'BE%'   -- ba� harfi Be olmayan

-- Between AND
select * from SalesLT.product WHERE ProductId Between 800 and 810 -- 800 ve 810 dahil. 

-- IN NOT IN 
select * from SalesLT.product WHERE ProductId IN (800,801,805) --
select * from SalesLT.product WHERE ProductId NOT IN (800,801,805) --292 adet

Set CONCAT_NULL_YIELDS_NULL ON;
SELECT Name + COLOR + ProductNumber, *  FROM SalesLT.product 
WHERE(Name + COLOR + ProductNumber IS NOT NULL);
Set CONCAT_NULL_YIELDS_NULL OFF;
SELECT Name + COLOR + ProductNumber, *  FROM SalesLT.product 
WHERE(Name + COLOR + ProductNumber IS NOT NULL);

-- IS NULL IS NOT NULL
select * from SalesLT.product WHERE Size IS  NULL


-- IsNull Fonksiyonu 
select ISNULL(Size, 5) Size, ProductID 
from SalesLT.Product WHERE Size IS  NULL

select 
AVG(Isnull(Weight, 10))
from SalesLT.product

-- ORDER BY 
SElect ProductId, Name
from SalesLT.product
ORDER BY Name

-- DESC ASC 1, 2
SElect ProductId, Name
from SalesLT.product
ORDER BY 2 DESC 

--
SELECT *
from SalesLT.product
ORDER BY 4,2 -- Order by Color, Name

--TOP OPERAT�R�
SELECT TOP 5 * FROM SalesLT.product
ORDER BY 4,2

SELECT TOP 2 PERCENT * FROM SalesLT.Product
ORDER BY 4,2  --  295'te 6 

--Klasik Join -- INNER JOIN'le ayn�.
SElect SOD.ProductId, P.Name, SOD.*
from SalesLT.SalesOrderDetail SOD, SalesLT.Product P
Where SOD.ProductID	= P.ProductID

--INNER JOIN
SElect SOD.ProductId, P.Name, SOD.*
from SalesLT.SalesOrderDetail SOD INNER JOIN SalesLT.Product P
ON SOD.ProductID	= P.ProductID

--LEFT JOIN : --Left Join: Soldaki t�m kay�tlar, sa�daki e�le�en kay�tlar.
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

-- Tablo yarat�rken Primary Key olu�turma
CREATE TABLE Urunler2(
UrunID INT NOT NULL,
UrunAd Varchar(200),
UrunFiyat Money,
CONSTRAINT PKC_UrunId2  PRIMARY KEY (UrunID)
);

--Tabloyu olu�tur, PK'y� tan�mla.
CREATE Table Kullanicilar2(
KullaniciID INT NOT NULL,
Ad varchar(50),
Soyad varchar(50),
KullaniciAd varchar(20)
);
ALTER TABLE Kullanicilar2
ADD Constraint PKC_KullaniciID2 Primary Key(KullaniciID);

--Tabloyu olu�tur, Unique index tan�mla.
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

 --use OKUL_VT
 ALTER TABLE [tb_Ogrenci]
 ADD CONSTRAINT [IX_tb_Ogrenci2] UNIQUE (ad);

/*
CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...);
*/

--DROP INDEX table_name.index_name;


-- CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_Ogrenci3] ON [dbo].[tb_Ogrenci]
--(
--	[ad] ASC
--)

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
 -- [Personeller]'e Edit ile kay�t ekle, KayitTarihi dolu gelecek. 

  ALTER TABLE [dbo].[Personeller] ADD  DEFAULT ('Istanbul') FOR Sehir


 -- IN, ANY, ALL, EXISTS

 /*
 SELECT sutun_ismi1 [, sutun_ismi2,...] 
 FROM tablo_ismi
 WHERE sutun_ismi1 = (SELECT sutun_ismi
                      FROM tablo_ismi
					  WHERE tek_satir_donduren_ko�ul)

 SELECT sutun_ismi1 [, sutun_ismi2,...] 
 FROM tablo_ismi
 WHERE sutun_ismi1 IN (SELECT sutun_ismi
                      FROM tablo_ismi
					  WHERE ko�ul)
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

-- �r�nleri listeleyelim ve herbir kay�t i�in birer birer artan s�ra numaras� olu�tural�m. 
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

SELECT ProductID, Name --Sadece 2 kolonu att�k.
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



 CREATE DATABASE OKUL_VT; -- OKUL_VT isminde bir veritaban� olu�turduk.

-- DROP DATABASE OKUL_VT; -- OKUL_VT veritaban�n� siler.

USE OKUL_VT; -- OKUL_VT veritaban�n� kullan.

-- Tablo olu�turuyoruz.

CREATE TABLE tb_Ogrenci 
(
	numara int,
	ad nvarchar(50),
	soyad nvarchar(50),
	dogumYili smallint,
	sinif varchar(5)
);

-- Tabloyu d�zenliyoruz.

ALTER TABLE tb_Ogrenci ALTER COLUMN numara nvarchar(50) NOT NULL;
ALTER TABLE tb_Ogrenci ALTER COLUMN ad nvarchar(50) NOT NULL;
ALTER TABLE tb_Ogrenci  ALTER COLUMN soyad nvarchar(50) NOT NULL;
ALTER TABLE tb_Ogrenci  ALTER COLUMN dogumYili smallint NOT NULL;
ALTER TABLE tb_Ogrenci  ALTER COLUMN sinif varchar(5) NOT NULL;

-- nuamra y� primary key yapt�k.
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












