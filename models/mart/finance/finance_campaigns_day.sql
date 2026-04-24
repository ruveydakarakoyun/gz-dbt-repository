select
    f.date_date as date,
    f.operational_margin - c.ads_cost as ads_margin,
    f.average_basket,
    f.operational_margin,
    c.ads_cost,
    c.ads_impression,
    c.ads_clicks,
    f.quantity,
    f.revenue,
    f.purchase_cost,
    f.revenue - f.purchase_cost as margin,
    f.shipping_fee,
    f.logistics_cost

from {{ ref('finance_day') }} f
left join {{ ref('int_campaigns_day') }} c
    on f.date_date = c.date_date

order by date desc