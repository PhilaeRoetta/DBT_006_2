with customers as (
    SELECT
        CustomerID,
        FirstName,
        LastName
    FROM
        {{source('DBT_PRJT','TODOCUSTOMER')}}
)

SELECT * FROM customers