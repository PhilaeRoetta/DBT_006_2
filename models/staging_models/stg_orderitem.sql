with orderitem as (
    SELECT
        OrderItemID, 
        OrderID, 
        ProductID, 
        Quantity, 
        UnitPrice
    FROM
        DBT.DBT_006.ORDERITEMS
)

SELECT * FROM orderitem