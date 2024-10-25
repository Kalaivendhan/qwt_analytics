{{ config(materialized = 'table', schema = env_var('DBT_SOURCESCHEMA', 'STAGING')) }}

select 
orderid,
lineno,
shipperid,
customerid,
productid,
employeeid,
split_part(shipmentdate,' ',1)::date as shipmentdate,
status 
from
{{source('qwt_src', 'shipments')}}