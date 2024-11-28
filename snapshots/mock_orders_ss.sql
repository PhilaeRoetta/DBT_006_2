{% snapshot mock_orders_ss %}

{{config(
    strategy = 'timestamp',
    updated_at = 'updated_at',
    unique_key = 'ORDER_ID'
)}}

SELECT * FROM {{source('DBT_PRJT','MOCKS')}}

{% endsnapshot %}