Задача 1. Вывести ко-во поставщиков не из `UK` и не из `China`.

SELECT
	COUNT(*)
FROM Suppliers
WHERE
	Country != 'UK'
	AND
	Country != 'China'
	
Задача 2. Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5.

SELECT 
		AVG(Products.Price) AS Avg_price,
		MAX(Products.Price) AS max_price,
		MIN(Products.Price) AS min_price,
		SUM(OrderDetails.Quantity) as products_quantity
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID
WHERE
	Products.CategoryID IN (3,5)
	
Задача 3. Вывести общую сумму проданных товаров.
	
SELECT 	
	SUM(Products.Price * OrderDetails.Quantity) as products_sum
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID

Задача 4. Вывести ко-во стран, которые поставляют напитки.

SELECT DISTINCT 
	COUNT(*) AS Supply_drinks
FROM Products
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
JOIN Categories ON Products.CategoryID=Categories.CategoryID
WHERE
	Categories.CategoryName = 'Beverages'
	
Задача 5. Вывести сумму, на которую было отправлено товаров клиентам в `Germany`.

SELECT
	SUM(Products.Price * OrderDetails.Quantity) AS total_sold_to_germany

FROM OrderDetails

JOIN Orders ON OrderDetails.OrderID=Orders.OrderID
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
JOIN Products ON OrderDetails.ProductID=Products.ProductID

WHERE
	Customers.Country='Germany'
	