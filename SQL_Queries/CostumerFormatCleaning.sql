--Cleaned Dim_Costumer table
--Selected only necessary columns used left join to get relevant column from geography table

SELECT 
  c.[CustomerKey] AS [Costumer Key], 
  --,[GeographyKey]
  --,[CustomerAlternateKey]
  --,[Title]
  c.[FirstName] AS FirstName, 
  --,[MiddleName]
  c.[LastName] AS LastName, 
  FirstName + ' ' + LastName AS [Full Name], 
  --Added a full Name Column for better name readability
  --,[NameStyle]
  --,[BirthDate]
  --,[MaritalStatus]
  --,[Suffix]
  CASE WHEN c.[Gender] = 'M' THEN 'Male' WHEN c.[Gender] = 'F' THEN 'Female' END AS Gender,  
  --Used CASE WHEN statement for making the column more readable

  --,[EmailAddress]
  --,[YearlyIncome]
  --,[TotalChildren]
  --,[NumberChildrenAtHome]
  --,[EnglishEducation]
  --,[SpanishEducation]
  --,[FrenchEducation]
  --,[EnglishOccupation]
  --,[SpanishOccupation]
  --,[FrenchOccupation]
  --,[HouseOwnerFlag]
  --,[NumberCarsOwned]
  --,[AddressLine1]
  --,[AddressLine2]
  --,[Phone]
  g.[City] AS [Costumer City], 
  --With left join Added column city to the costumer table 
  c.[DateFirstPurchase] AS DateFirstPurchase --,[CommuteDistance]
FROM 
  [AdventureWorksDW2022].[dbo].[DimCustomer] AS c 
  Left Join DimGeography as g 
  ON c.GeographyKey = g.GeographyKey 
ORDER BY 
  [Costumer Key] ASC --ordered Costumers by costumer key
