Задача 1. Вывести название и стоимость в `USD` одного самого дорогого проданного товара.

SELECT 
	Products.ProductName,
    Products.Price AS Price_USD
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID
ORDER BY Price_USD DESC
LIMIT 1 

Задача 2. Вывести два самых дорогих товара из категории `Beverages` из `USA`.

SELECT 
	Products.ProductName,
	Products.Price,
	Suppliers.SupplierName,
	Suppliers.Country,
	Categories.CategoryName
FROM Products
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
JOIN Categories ON Products.CategoryID=Categories.CategoryID
WHERE
	Categories.CategoryName = 'Beverages'
    AND
    Suppliers.Country = 'USA'
ORDER BY Price DESC
LIMIT 2

Задача 3. Удалить товары с ценой менее `5` EUR.

DELETE FROM Products
WHERE
	Price < 5

Задача 4. Вывести список стран, которые поставляют морепродукты.

SELECT DISTINCT 
	Suppliers.Country 
FROM Products
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
JOIN Categories ON Products.CategoryID=Categories.CategoryID
WHERE
	Categories.CategoryName = 'Seafood'
	
Задача 5. Очистить поле `ContactName` у всех клиентов не из `China`.

UPDATE Customers
SET
	CustomerName=''
WHERE
	Country='China'
    	
