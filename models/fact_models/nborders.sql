with nborders as (
    SELECT
        C.CustomerID,
        C.FirstName,
        C.LastName,
        COUNT(DISTINCT O.ORDERID)
    FROM
        {{ref("stg_customer")}} C
    LEFT JOIN
        {{ref("stg_order")}} O
    ON C.CustomerID = O.CustomerID
    GROUP BY
        C.CustomerID,
        C.FirstName,
        C.LastName
)
SELECT * FROM nborders