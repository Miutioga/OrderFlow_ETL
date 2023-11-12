{{ config(materialized='table', schema = 'Order') }}

SELECT 
		PersonID AS [Employee ID],
		FullName AS Employee,
		PreferredName AS [Preferred Name],
		IsSalesperson AS [Is Salesperson],
		Photo,
		LEFT(ValidFrom, 10) AS [Valid From],
		LEFT(ValidTo, 10) AS [Valid To]

FROM [WideWorldImporters].[Application].[People]
WHERE IsEmployee = 1;
