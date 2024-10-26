-- 1.Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
Create Table Employees (
Id int ,
Name varchar(30),
Salary Decimal 
)
--2.	Add a new column named "Department" to the "Employees" table with data type varchar(50).
Alter Table Employees 
Add Department varchar(50)
--3.	Remove the "Salary" column from the "Employees" table. 
Alter Table Employees
Drop Column Salary;
--Rename the "Department" column in the "Employees" table to "DeptName".
EXEC sp_rename 'Department' , 'DepName'

--5.Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
Create Table Projects (
Id int ,
ProjectName varchar ,
)

--6-Add a primary key constraint to the "Employees" table for the "ID" column.
Alter Table Employees 
alter column Id int Not Null

Alter Table Employees 
ADD PRIMARY KEY  (Id);

--7-Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").
Alter Table Employees 
Add Foreign Key (Id) References Projects(Id)

--8.Remove the foreign key relationship between "Employees" and "Projects."

--9Add a unique constraint to the "Name" column in the "Employees" table
Alter Table Employees 
Add unique (Name)

--10.	Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
Create Table Customers (
CustomerId int ,
FirstName varchar,
LastName varchar,
Email varchar,
Status varchar
)
--11.Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
Alter Table Customers
Add Constraint FullName  unique(FirstName,LastName)

--12.Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted.

Create Table Orders (
OrderId int ,
CustomerId int ,
OrderDate Datetime ,
TotalAmount Decimal
)
--13.Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).



--14.Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
Alter Table Orders 
Add Check (TotalAmount>0)

--15.Create a schema named "Sales" and move the "Orders" table into this schema.
Create Schema Sales

Alter Schema Sales Transfer dbo.Orders
--16.Rename the "Orders" table to "SalesOrders."
EXEC sp_rename   'Orders' ,'SalesOrders'



