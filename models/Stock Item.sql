{{ config(materialized='table', schema = 'Order') }}

SELECT DISTINCT
		StockItems.StockItemID AS [Stock Item ID],
		Warehouse_StockItems.StockItemName AS [Stock Item],
		Warehouse_Colors.ColorName AS Color,
		PackageTypes_2.PackageTypeName AS [Selling Package],
		PackageTypes.PackageTypeName AS [Buying Package],
		Warehouse_StockItems.Brand,
		Warehouse_StockItems.Size,
		Warehouse_StockItems.LeadTimeDays AS [Lead Time Days],
		Warehouse_StockItems.QuantityPerOuter AS [Quantity Per Outer],
		Warehouse_StockItems.IsChillerStock AS [Is Chiller Stock],
		Warehouse_StockItems.Barcode,
		Warehouse_StockItems.TaxRate AS [Tax Rate],
		Warehouse_StockItems.UnitPrice AS [Unit Price],
		Warehouse_StockItems.RecommendedRetailPrice AS [Recommended Retail Price],
		Warehouse_StockItems.TypicalWeightPerUnit AS [Typical Weight Per Unit],
		Warehouse_StockItems.Photo,
		LEFT(Warehouse_StockItems.ValidFrom, 10) AS [Valid From],
		LEFT(Warehouse_StockItems.ValidTo, 10) AS [Valid To]

  FROM [WideWorldImporters].[Purchasing].[PurchaseOrderLines] AS StockItems
  LEFT JOIN [WideWorldImporters].[Warehouse].[StockItems] AS Warehouse_StockItems
  ON StockItems.StockItemID = Warehouse_StockItems.StockItemID
  LEFT JOIN [WideWorldImporters].[Warehouse].[Colors] AS Warehouse_Colors
  ON Warehouse_StockItems.ColorID = Warehouse_Colors.ColorID

  LEFT JOIN [WideWorldImporters].[Purchasing].[PurchaseOrderLines] AS PurchaseOrderLines
  ON StockItems.StockItemID = PurchaseOrderLines.StockItemID
  LEFT JOIN [WideWorldImporters].[Warehouse].[PackageTypes] AS PackageTypes
  ON PurchaseOrderLines.PackageTypeID = PackageTypes.PackageTypeID

  LEFT JOIN [WideWorldImporters].[Sales].[InvoiceLines] AS InvoiceLines
  ON StockItems.StockItemID = InvoiceLines.StockItemID
  LEFT JOIN [WideWorldImporters].[Warehouse].[PackageTypes] AS PackageTypes_2
  ON InvoiceLines.PackageTypeID = PackageTypes_2.PackageTypeID

  ORDER BY [Stock Item ID];