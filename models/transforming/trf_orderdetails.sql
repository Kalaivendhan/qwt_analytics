{{ config(materialized = 'table', schema = 'transforming') }}

select

od.*,

(od.UnitPrice * od.Quantity) * (1-od.Discount)  as linesalesamount,

p.UnitCost * od.Quantity as costofgoodssold,

((od.UnitPrice * od.Quantity) * (1-od.Discount)) - (p.UnitCost * od.Quantity) as margin

from

{{ ref('stg_orderdetails')}} as od 

inner join {{ref('trf_products')}} as p

on od.productid = p.productid