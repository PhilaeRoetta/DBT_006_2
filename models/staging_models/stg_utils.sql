{%set a=source('DBT_PRJT','TODOORDER')%}

select
  {{ dbt_utils.star(a) }}
from {{ a }}
