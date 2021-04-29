SELECT
		Store.StreetName,
		OpeningHour.Day,
		OpeningHour.Opens,
		OpeningHour.Closes

FROM Store
JOIN OpeningHour ON StoreID = Store.ID
ORDER BY StreetName,
CASE
	WHEN Day = 'Monday' THEN 0
	WHEN Day = 'Tuesday' THEN 1
	WHEN Day = 'Wednesday' THEN 2
	WHEN Day = 'Thursday' THEN 3
	WHEN Day = 'Friday' THEN 4
	WHEN Day = 'Saturday' THEN 5
	WHEN Day = 'Sunday' THEN 6
	ELSE 7
END