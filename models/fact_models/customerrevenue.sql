with customerrevenue as (
    SELECT
        C.CustomerID,
        C.FirstName,
        C.LastName,
        COUNT(DISTINCT O.ORDERID) AS NB_ORDER,
        SUM(OI.Quantity*OI.UnitPrice) AS PC_ORDER,
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