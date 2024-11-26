with orders as (
    SELECT
        OrderID,
        CustomerID
    FROM
        DBT.DBT_006_2.ORDERS
)

SELECT * FROM orders