SELECT  
    ProductName 
    ,Price 
    ,FixedDiscount 
    ,IIF((Price-FixedDiscount)>1, 
        Price-FixedDiscount, 1) AS PriceAfterDiscount 
FROM Product
WHERE FixedDiscount > 0

 

 

SELECT 
    Store.StreetName
    ,OpeningHour.Day
    ,OpeningHour.Opens
    ,OpeningHour.Closes
FROM Store
    JOIN OpeningHour ON StoreID = Store.ID
ORDER BY StreetName DESC
    ,CASE
        WHEN Day = 'Monday' THEN 0
        WHEN Day = 'Tuesday' THEN 1
        WHEN Day = 'Wednesday' THEN 2
        WHEN Day = 'Thursday' THEN 3
        WHEN Day = 'Friday' THEN 4
        WHEN Day = 'Saturday' THEN 5
        WHEN Day = 'Sunday' THEN 6
    ELSE 7
END

 

 

SELECT 
    [Order].Date AS 'Date',
    Customer.FirstName AS 'First name',
    Customer.LastName AS 'Last name',
    SUM(OrderRow.Quantity) AS 'Product count',
    SUM(Product.Price * OrderRow.Quantity) AS 'Sum before discount'
FROM [Order]
    JOIN Customer ON [Order].CustomerID = Customer.ID
    JOIN OrderRow ON OrderRow.OrderID = [Order].ID
    JOIN Product ON OrderRow.ProductID = Product.ID
GROUP BY [Order].ID, [Order].Date, Customer.FirstName, Customer.LastName
ORDER BY [Order].Date DESC