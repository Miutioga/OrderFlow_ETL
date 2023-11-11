{{ config(materialized='table', schema = 'Warehouse') }}

SELECT Date.Date
  FROM {{ ref('Date') }}
