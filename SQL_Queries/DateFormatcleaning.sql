--Cleaned Dim_date table
--Selected only necessary columns and as stated in email, 
--we need only the data of sales 2 years prior to 2021, that is 2019.

SELECT 
  [DateKey], 
  [FullDateAlternateKey] AS Date,
  
  --,[DayNumberOfWeek]
   
  [EnglishDayNameOfWeek] AS Day,
  --,[SpanishDayNameOfWeek]
  --,[FrenchDayNameOfWeek]
  --,[DayNumberOfMonth]
  --,[DayNumberOfYear]

  [WeekNumberOfYear] AS Week_num, 
  [EnglishMonthName] AS Month, 
  LEFT(EnglishMonthName, 3) AS Monthshort, 
  --,[SpanishMonthName]
  --,[FrenchMonthName] 
  [MonthNumberOfYear] AS Month_num, 
  [CalendarQuarter] AS Quarter, 
  [CalendarYear] AS Year

  --,[CalendarSemester]
  --,[FiscalQuarter]
  --,[FiscalYear]
  --,[FiscalSemester]
FROM 
  [AdventureWorksDW2022].[dbo].[DimDate] 
WHERE 
  CalendarYear >= YEAR(GETDATE())-2   --Always gives data of 2 years prior to the date of Query Execution
