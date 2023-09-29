Задача 1. Найти мин/стоимость товаров для каждой категории.

	SELECT
			Products.CategoryID,
			MIN(Products.Price) AS min_price
	FROM Products
	GROUP BY Products.CategoryID
	ORDER BY Products.CategoryID

Задача 2. Вывести ТОП-3 стран по количеству доставленных заказов.

	SELECT 
		Customers.Country,
		COUNT(*) AS Total_orders
	
	FROM [Orders]
	JOIN Customers ON Orders.CustomerID = Customers.CustomerID
	GROUP BY Customers.Country
	ORDER BY total_orders

Задача 3. Вывести названия категорий, в которых более 10 товаров.

	SELECT 
		Categories.CategoryName,
		COUNT(*) AS Total_orders
	FROM OrderDetails
	JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
	JOIN Products ON OrderDetails.ProductID = Products.ProductID
	JOIN Categories ON Products.CategoryID = Categories.CategoryID
	GROUP BY Categories.CategoryName
	HAVING
		total_orders > 10
	ORDER BY total_orders
	
Задача 4. Очистить тел/номер поставщикам из USA.

	UPDATE Suppliers
	SET
		Phone = ''
	WHERE
		Country='USA'

Задача 5. Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15.

	SELECT 
		Employees.LastName,
		Employees.FirstName,
		COUNT(*) AS Total_orders
	
	FROM Orders
	JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
	GROUP BY Employees.EmployeeID
	HAVING
		total_orders < 15
	ORDER BY total_orders


Задача 6. Вывести товар, который находится на втором месте по ко-ву заказов.

	SELECT 
		Products.ProductName,
		COUNT(*) AS Total_orders
	FROM OrderDetails
	JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
	JOIN Products ON OrderDetails.ProductID = Products.ProductID
	GROUP BY Products.ProductID
	ORDER BY total_orders DESC
	LIMIT 1 OFFSET 1













