{{
    config(
        materialized='table',
        transient = false
    )
}}

SELECT * FROM {{ source('stripe', 'payment') }}