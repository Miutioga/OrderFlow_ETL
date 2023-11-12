{{ config(materialized='table', schema = 'Order') }}

SELECT	
		Customers.CustomerID,
		CASE 
			WHEN CHARINDEX(',', Customers.CustomerName) > 0 
			THEN SUBSTRING(Customers.CustomerName, CHARINDEX('(', Customers.CustomerName) +1 , CHARINDEX(',', Customers.CustomerName) - CHARINDEX('(', Customers.CustomerName) -1)
			WHEN CHARINDEX(')', Customers.CustomerName) > 0 
			THEN SUBSTRING(Customers.CustomerName, CHARINDEX('(', Customers.CustomerName) +1 , CHARINDEX(')', Customers.CustomerName) - CHARINDEX('(', Customers.CustomerName) -1)
			ELSE Customers.CustomerName
		END AS Customer,
		Customers.BillToCustomerID AS [Bill To Customer],
		C_Categories.CustomerCategoryName AS Category,
		BuyingGroups.BuyingGroupName AS [Buying Groups],
		Customers.PhoneNumber AS [Primary Contact],
		Customers.PostalPostalCode AS [Postal Code],
		LEFT(Customers.ValidFrom, 10) AS [Valid From],
		LEFT(Customers.ValidTo, 10) AS [Valid To]

FROM [WideWorldImporters].[Sales].[Customers] AS Customers
LEFT JOIN
	[WideWorldImporters].[Sales].[CustomerCategories] AS C_Categories
ON Customers.CustomerCategoryID = C_Categories.CustomerCategoryID 
LEFT JOIN
	[WideWorldImporters].[Sales].[BuyingGroups] AS BuyingGroups
ON Customers.BuyingGroupID = BuyingGroups.BuyingGroupID;

