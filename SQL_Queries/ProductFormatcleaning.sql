--Cleaned Dim_product table
--Selected only necessary columns and used left join to get relevant columns from other tables
SELECT p. [ProductKey]
      ,p.[ProductAlternateKey] AS ProductItemCode
      --,[ProductSubcategoryKey]
      --,[WeightUnitMeasureCode]
      --,[SizeUnitMeasureCode]
      ,[EnglishProductName] AS [Product Name],
      ps.EnglishProductSubcategoryName AS [Sub Category],    -- From subcategory table
      pc.EnglishProductCategoryName AS [Product Category]    -- From category table
      --,[SpanishProductName]
      --,[FrenchProductName]
      --,[StandardCost]
      --,[FinishedGoodsFlag]
      ,p.[Color] as [Color]
      --,[SafetyStockLevel]
      --,[ReorderPoint]
      --,[ListPrice]
      ,p.[Size] AS [Product Size]
      --,[SizeRange]
      --,[Weight]
      --,[DaysToManufacture]
      ,[ProductLine]
      --,[DealerPrice]
      --,[Class]
      --,[Style]
      ,p.[ModelName] AS [Product Model Name]
      --,[LargePhoto]
      ,p.[EnglishDescription] AS [Product Description]
      --,[FrenchDescription]
      --,[ChineseDescription]
      --,[ArabicDescription]
      --,[HebrewDescription]
      --,[ThaiDescription]
      --,[GermanDescription]
      --,[JapaneseDescription]
      --,[TurkishDescription]
      --,[StartDate]
      --,[EndDate]
      ,ISNULL(p.[Status],'Outdated') AS [Status]
  FROM [AdventureWorksDW2022].[dbo].[DimProduct] AS p
  LEFT JOIN DimProductSubcategory AS ps                           --Left join product table with product subcategory table
        ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
  LEFT JOIN DimProductCategory AS pc                              --Left join the left join of product and subcategory table with productcategory table
        ON ps.ProductCategoryKey = pc.ProductCategoryKey
ORDER BY ProductKey ASC                                   --ordered Costumers by costumer key (Ascending order)