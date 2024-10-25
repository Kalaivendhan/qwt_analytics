{{ config(materialized = 'table', schema = env_var('DBT_SOURCESCHEMA', 'STAGING')) }}

select

 * 
 
from 

{{source('qwt_src', 'suppliers_xml')}} 