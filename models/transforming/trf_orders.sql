{{ config(materialized = 'table', schema = 'transforming') }}

select
orderid,
customerid,
employeeid,
shipperid,
freight,
orderdate,
month(orderdate) as ordermonth,
year(orderdate) as orderyear

from

{{ ref('stg_orders') }}

