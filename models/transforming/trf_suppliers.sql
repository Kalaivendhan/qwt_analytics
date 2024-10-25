{{ config(materialized = 'table', schema = 'transforming') }}

select 
        get(xmlget(supplierinfo, 'SupplierID'), '$') as supplierid,
        get(xmlget(supplierinfo, 'CompanyName'), '$')::varchar as companyname,
        get(xmlget(supplierinfo, 'ContactName'), '$')::varchar as contactname,
        get(xmlget(supplierinfo, 'Address'), '$')::varchar as address,
        get(xmlget(supplierinfo, 'City'), '$')::varchar as City,
        get(xmlget(supplierinfo, 'PostalCode'), '$')::varchar as PostalCode,
        get(xmlget(supplierinfo, 'Country'), '$')::varchar as Country,
        get(xmlget(supplierinfo, 'Phone'), '$')::varchar as Phone

from {{ ref('stg_suppliers') }}