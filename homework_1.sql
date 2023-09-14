Задача 2. Вывести название и стоимость товаров от `20` EUR.

SELECT 
	ProductName,
    Price
FROM Products

WHERE
	Price >= 20
	
	
Задача 3. Вывести страны поставщиков.

SELECT DISTINCT
	Country

FROM Suppliers

Задача 4. В упорядоченном по стоимости виде вывести название и стоимость товаров от всех поставщиков, кроме поставщика `1`.

SELECT 
	ProductName,
    Price    
FROM Products
WHERE
	CategoryID != 1
ORDER BY Price ASC

Задача 5. Вывести контактные имена клиентов, кроме тех, что из `France` и `USA`.

SELECT 
	CustomerName
FROM Customers   
WHERE
	NOT Country='France'
	AND
	NOT Country='USA'
