with customerrevenue as (
    SELECT
        C.CustomerID,
        C.FirstName,
        C.LastName,
        {{ multiply_n('COUNT(DISTINCT O.ORDERID)') }} AS NB_ORDER_2,
        {{ multiply_n('SUM(OI.Quantity*OI.UnitPrice)',3) }} AS PC_ORDER_3,
        CE.CUSTOMER_EXPECTED
    FROM
        {{ref("stg_customer")}} C
    LEFT JOIN
        {{ref("stg_order")}} O
    ON C.CustomerID = O.CustomerID
    LEFT JOIN
        {{ref("stg_orderitem")}} OI
    ON O.OrderID = OI.OrderID
    FULL JOIN
        {{ref("customer_expectation")}} CE
        ON CE.CustomerID = C.CustomerID
    GROUP BY
        C.CustomerID,
        C.FirstName,
        C.LastName,
        CE.CUSTOMER_EXPECTED
)
SELECT * FROM customerrevenue