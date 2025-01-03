{% snapshot mock_orders_ss_2 %}

{{config(
    unique_key = 'ORDER_ID',
    updated_at = 'UPDATED_AT',
    strategy = 'check',
    check_cols = ['STATUS'],
    invalidates_hard_deletes = true
)}}

SELECT * FROM {{source("DBT_PRJT","MOCKS")}}

{% endsnapshot %}