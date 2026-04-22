with sales_margin as (

    select *
    from {{ ref('int_sales_margin') }}

),

final as (

    select
        orders_id,
        max(date_date) as date_date,
        sum(revenue) as revenue,
        sum(quantity) as quantity,
        sum(purchase_cost) as purchase_cost,
        sum(margin) as margin

    from sales_margin
    group by orders_id

)

select *
from final
order by orders_id desc