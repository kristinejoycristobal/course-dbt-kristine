{{
  config(
    materialized='table'
  )
}}

SELECT 
    id AS superhero_id,
    name,
    gender,
    eye_color,
    race,
    hair_color,
    COALESCE(height, -99) AS height,
    publisher,
    skin_color,
    alignment,
    COALESCE(weight, -99) AS weight
FROM {{ source('tutorial', 'superheroes') }}