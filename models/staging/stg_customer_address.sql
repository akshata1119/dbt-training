{{
    config(
        materialized='table'
    )
}}
select * from {{ ref('snap_customer_address') }}
where dbt_valid_to IS NULL