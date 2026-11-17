create database test_env
use test_env

select * from [dbo].[Products]

select * from [dbo].[Test+Environment+Inventory+Dataset]

select distinct product_id from [Test+Environment+Inventory+Dataset]
select distinct [Order_Date_DD_MM_YYYY] from [Test+Environment+Inventory+Dataset]
select distinct [Availability] from [Test+Environment+Inventory+Dataset]
select distinct [Demand] from [Test+Environment+Inventory+Dataset]

--left join
select a.[Order_Date_DD_MM_YYYY] , a.[Product_ID] , a.[Availability] , a.[Demand],
b.[Product_Name] , b.[Unit_Price]

from [dbo].[Test+Environment+Inventory+Dataset] as a 
left join [dbo].[Products] as b 
on a.Product_ID = b.Product_ID 

----------------------------------------------------------------------------
--insert into new table
select * into new_table from
(select a.[Order_Date_DD_MM_YYYY] , a.[Product_ID] , a.[Availability] , a.[Demand],
b.[Product_Name] , b.[Unit_Price]

from [dbo].[Test+Environment+Inventory+Dataset] as a 
left join [dbo].[Products] as b 
on a.Product_ID = b.Product_ID ) x
 
 ------------------------------------------------------------------------------

 select * from new_table

 ---------------------------------------------------------------------------
 --create production database

 create database PROD
 use PROD

 select * from [dbo].[Prod+Env+Inventory+Dataset]

  select distinct Order_Date_DD_MM_YYYY
  from [dbo].[Prod+Env+Inventory+Dataset]
  where Order_Date_DD_MM_YYYY is null or Order_Date_DD_MM_YYYY = ''


  select distinct Product_ID
  from [dbo].[Prod+Env+Inventory+Dataset] order by Product_ID

  --if they say 21-->7
  --and         22-->11 we have to chnage

  update [dbo].[Prod+Env+Inventory+Dataset]
  set Product_ID=7 where Product_ID=21

  update [dbo].[Prod+Env+Inventory+Dataset]
  set Product_ID=11 where Product_ID=22

  select distinct [Availability] from[dbo].[Prod+Env+Inventory+Dataset]
  select distinct [Demand] from[dbo].[Prod+Env+Inventory+Dataset]


select * into new_table from
(select a.[Order_Date_DD_MM_YYYY] , a.[Product_ID] , a.[Availability] , a.[Demand],
b.[Product_Name] , b.[Unit_Price]

from [dbo].[Prod+Env+Inventory+Dataset] as a 
left join [dbo].[Products] as b 
on a.Product_ID = b.Product_ID ) x