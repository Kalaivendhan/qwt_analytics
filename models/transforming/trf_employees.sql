{{ config(materialized = 'table', schema = 'transforming') }}

select 

emp.empid,
emp.firstname as employeename,
emp.title as role,
emp.hiredate as doj,
emp.extension,
emp.yearsalary as salary,
IFF(mgr.firstname is null, emp.firstname, mgr.firstname) as managername,
iff(mgr.title is null , emp.title, mgr.title) as managerrole,
o.address ,
o.city,
o.postalcode,
o.phone,
o.country

from 

{{ref('stg_employees')}} as emp 

left join {{ref('stg_employees')}} as mgr

on emp.reportsto = mgr.empid

left join {{ref('stg_offices')}} as o 

on emp.office = o.officeid

order by 1