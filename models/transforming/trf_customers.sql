{{config(materialized = 'table', schema='transforming') }}

with customerCTE as 
(
select 

customerid,
companyname,
contactname, 
city, 
country,
divisionid,
address,
fax,
phone,
postalcode,
IFF(stateprovince = '', 'NA', stateprovince) as statename


from {{ ref ('stg_customers') }}
)

select * from customerCTE