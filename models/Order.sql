{{ config(materialized='table') }}

SELECT 
    Date.Date AS [Order Date]
    
FROM {{ ref('Date') }}