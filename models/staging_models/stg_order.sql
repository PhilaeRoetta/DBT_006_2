with orders as (
    SELECT
        OrderID,
        CustomerID
    FROM
        DBT.DBT_006.ORDERS
)

SELECT * FROM orders