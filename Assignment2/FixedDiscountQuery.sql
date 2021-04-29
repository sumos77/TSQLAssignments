SELECT
		ID,
		ProductName,
		Price,
		FixedDiscount,
		IIF ((Price-FixedDiscount)>1, Price-FixedDiscount, 1) AS PriceAfterDiscount
FROM Product
WHERE FixedDiscount > 0