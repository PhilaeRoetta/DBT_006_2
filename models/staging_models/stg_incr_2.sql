SELECT
    *
FROM
    {{source('DBT_PRJT','INCR')}}
{% if is_incremental() %}
WHERE
    DAT1 > (SELECT MAX(DAT1) FROM {{this}})
{% endif %}