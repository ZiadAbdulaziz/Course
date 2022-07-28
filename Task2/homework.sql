1
SELECT CustomerID ,CustomerName, Round(Sum([OrderDetails].Quantity * [Products].Price),2) as Total_purchase
FROM [Customers]
NATURAL Join [Orders] 		--Inner Join [Orders] on [Orders].CustomerID == [Customers].CustomerId
NATURAL Join [OrderDetails] --Inner Join [OrderDetails] on [OrderDetails].OrderId == [Orders].OrderId
NATURAL Join [Products] 	--Inner Join [Products] on [OrderDetails].ProductId == [Products].ProductID
GROUP BY CustomerName
ORDER BY Total_purchase DESC
LIMIT 10

2
SELECT FirstName||" "||LastName as Employee_Full_Name, count([Orders].OrderID) as Number_Of_Orders 
FROM [Orders]
NATURAL join Employees
GROUP BY Employee_Full_Name
ORDER BY Number_Of_Orders DESC
LIMIT 10


3
SELECT FirstName||" "||LastName as Employee_Full_Name, count([Orders].OrderID) as Total_quantity 
FROM [Orders]
INNER JOIN [Employees] ON [Orders].EmployeeID= [employees].EmployeeID
INNER JOIN [orderdetails] ON [Orders].orderID= [orderdetails].orderID
INNER JOIN [products] ON [products].productID= [orderdetails].ProductID
INNER JOIN [categories] ON [categories].categoryID= [products].categoryID
WHERE [categories].CategoryName= 'Beverages'
GROUP BY Employee_Full_Name
ORDER BY Total_quantity desc
LIMIT 10

