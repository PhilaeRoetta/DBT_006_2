{{
   config(
       materialized = 'table'
   )
}}
with days as (
   {{
       dbt_utils.date_spine(
           'day',
           "to_date('01/01/1900','mm/dd/yyyy')",
           "to_date('12/31/2999','mm/dd/yyyy')"
       )
   }}
),
final as (
   select cast(date_day as date) as date_day
   from days
)
select * from final
