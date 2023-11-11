{{ config(materialized='table', schema = 'Order') }}

SELECT
    Cities.CityID,
    Cities.CityName AS City,
	StateProvinces.StateProvinceName AS [State Province],
	Countries.CountryName AS Country,
	Countries.Continent,
    -- Sales Territory
	Countries.Region,
    Countries.Subregion,
   -- GEOMETRY::STGeomFromWKB(CONVERT(VARBINARY(MAX), Countries.Location), 0) AS Location
	StateProvinces.[LatestRecordedPopulation],
    LEFT(Cities.ValidFrom, 10) AS [Valid From],
    LEFT(Cities.ValidTo, 10) AS [Valid To]
    -- Lineage Key
FROM
    [WideWorldImporters].[Application].[Cities] AS Cities
LEFT JOIN
    [WideWorldImporters].[Application].[StateProvinces] AS StateProvinces
    ON Cities.StateProvinceID = StateProvinces.StateProvinceID
LEFT JOIN
    [WideWorldImporters].[Application].[Countries] AS Countries
    ON StateProvinces.CountryID = Countries.CountryID;