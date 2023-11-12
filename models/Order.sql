{{ config(materialized='table') }}

SELECT 
    Date.Date AS [Order Date],
    Cities.CityID AS City
    
FROM {{ ref('Date') }}, {{ ref("City") }}