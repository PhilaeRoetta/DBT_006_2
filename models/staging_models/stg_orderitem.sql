with orderitem as (
    SELECT
        OrderItemID, 
        OrderID, 
        ProductID, 
        Quantity, 
        UnitPrice
    FROM
        DBT.DBT_006_2.ORDERITEMS
)

SELECT * FROM orderitem