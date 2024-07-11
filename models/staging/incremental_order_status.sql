{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}
Select * from {{ source('stripe', 'order_status') }}

{% if is_incremental() %}
    
    where status_changed_at > (select max(status_changed_at) from {{ this }}) 
{% endif %}