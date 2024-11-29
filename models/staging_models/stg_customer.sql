with customers as (
    SELECT
        CustomerID,
        FirstName,
        LastName
    FROM
        {{to_unittest(classic_input = source('DBT_PRJT','TODOCUSTOMER'), seed_input=ref('TODOCUSTOMER'))}}
)

SELECT * FROM customers