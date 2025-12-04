--SQL 2 Notes

--Question 1: Display the count of the number of rows in a table.

Select count(StaffID) from Staff as StaffCount

--Question 2: Delete a specified record in a table and prove that it is deleted.

--first use select to identify the record
Select * from Staff where StaffID = 4

--use delete to remove the staffid 4 record
delete from Staff where StaffID = 4

--use select again to ensure that the record was deleted
Select * from Staff where StaffID = 4

--Question 3: Two table join that creates a view.

/*Use to Recreate the Table

Drop view vw_GetStaffOrders

*/

Create view vw_GetStaffOrders as
	Select Staff.StaffID, FName, LName, OrderID, Location
		from Staff, Orders
		Where Staff.StaffID = Orders.StaffID

Select * from vw_GetStaffOrders

--Question 4: Three table join qualified with a key value from one view and one other table.

Select Name, GSO.OrderID, Location, FName
	from Menu M, MenuOrder MO, vw_GetStaffOrders GSO
	Where M.MenuID = MO.MenuID
	and MO.OrderID = GSO.OrderID

--Question 5: Use five SQL functions (such as SUM). This should be five queries with at least one function for each query and not the same functions as you used in previous assignments.

SELECT ASCII(FName) AS NumCodeOfFirstChar
FROM Staff; 

SELECT SPACE(10); 

SELECT UPPER('the output will be in uppercase'); 

SELECT LOWER('THE OUTPUT WILL BE IN LOWERCASE');

SELECT POWER(4, 2); 

--Question 6: Create a SQLstored procecdure to insert values into a row using variables passed in on execution.

/* Simple Example of Basic Procedure Creation

Create proc spu_GetStaff as
	Select * from Staff

exec spu_GetStaff
*/
Create proc spu_InsertStaff
	@FName nvarchar(50),
	@LName nvarchar(50)
as
	Insert into Staff
		(FName, LName)
	Values
		(@FName, @LName)

exec spu_InsertStaff 'Jack', 'Pfleghaar'

--Question 7: Write the SQL to create a table, key, and index. This must not be generated SQL.  Example after #12.

CREATE TABLE [TableName]
([TableID] int NOT NULL,
[Field1] nvarchar(20) NOT NULL,
[Field2] nvarchar(30) NOT NULL,
[Field3] nvarchar(20) NULL,
CONSTRAINT [PK_TableName] PRIMARY KEY CLUSTERED
([TableID] ASC)
ON [PRIMARY]) -- key
ON [PRIMARY] -- index

--Question 8: Create a query that uses Group By

Select FName, Count(OrderID) as OrderCount
from Staff, Orders
Where Staff.StaffID = Orders.StaffID
Group by FName
Order by OrderCount Desc

--Question 9: Demonstrate the use of distinct, ascending, descending in a query. The result set must have at least 7 rows.

--Ascending
Select FName
From Staff
Order By FName Asc

--Descending
Select FName
From Staff
Order By FName Desc

--Distinct
Select Distinct FName
From Staff
Order By FName Asc

--Question 10: Create a query that demonstrates an inner join (includes join in statement)

select FName, OrderID, Location
From Staff
	join Orders
on Staff.StaffID = Orders.StaffID
Order by FName

--Question 11: Create a query that demonstrates a left outer join  (includes join in statement)

select FName, OrderID, Location
From Staff
	left join Orders
on Staff.StaffID = Orders.StaffID
Order by FName

--Question 12: Create a query that demonstrates a right outer join  (includes join in statement)

select FName, OrderID, Location
From Staff
	right join Orders
on Staff.StaffID = Orders.StaffID
Order by FName

