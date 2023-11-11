{{ config(materialized='table', schema = 'Order') }}

SELECT DISTINCT 
	[OrderDate] AS Date,
	DATEDIFF(DAY, DATEFROMPARTS(DATEPART(YEAR, CAST([OrderDate] AS DATE)), 1, 1), CAST([OrderDate] AS DATE)) + 1 AS DayNumber,
    DATEPART(DAY, CAST([OrderDate] AS DATE)) AS Day,
    DATEPART(MONTH, CAST([OrderDate] AS DATE)) AS Month,
    FORMAT(CAST([OrderDate] AS DATE), 'MMM') AS [Short Month]
FROM [WideWorldImporters].[Purchasing].[PurchaseOrders]