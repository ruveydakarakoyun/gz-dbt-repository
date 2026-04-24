
with orders as (
    
    select *
    from {{ ref('int_orders_operational') }}

),

final as (

    select
        date_date,

        count(orders_id) as nb_transactions,

        round(sum(revenue),2) as revenue,

        round(avg(revenue),2) as average_basket,

        round(sum(operational_margin),2) as operational_margin,

        round(sum(purchase_cost),2) as purchase_cost,

        round(sum(shipping_fee),2) as shipping_fee,

        round(sum(logcost + ship_cost),2) as logistics_cost,

        sum(quantity) as quantity

    from orders
    group by date_date

)

select *
from final
order by date_date desc