--1) Display the count of the number of rows in the Orders table.
Select OrderCount=Count(*) from Orders

--2) Delete a specified record in the Staff table and prove that it is deleted. (before and after)

--first use select to identify the record
Select * from Staff where StaffID = 26

--use delete to remove the staffid 26 record
delete from Staff where StaffID = 26

--use select again to ensure that the record was deleted
Select * from Staff where StaffID = 26

--3) Two table implied join qualified with a key value.

--this shows a two table join of the orders a staff member worked on, the orderID and the time the order was taken
Select FName, OrderID, DateTime from Staff S, Orders O
Where S.StaffID = O.StaffID

--4) Three table implied join qualified with a key value.

--this shows a three table join between the ingredient name, the menu item name, and a description of the menu item
Select I.Name, M.Name, I.Description from Ingredient I, MenuIngredient MI, Menu M
where I.IngredientID = MI.IngredientID
and M.MenuID = MI.MenuID

--5) Use twelve SQL functions (such as SUM). This should be twelve queries with at least one function for
--each query.

select reverse('sdrawkcab') as Reverse;
select CURRENT_TIMESTAMP as CurrentTime;
select Name, datalength(Name) as NameLength from Ingredient;
select Avg(Price) as AvgPrice from Menu;
select datediff(year, '2020/10/15', '2010/10/15') as DateDiff; 
select year('2020/10/15') as Year; 
select month('2020/10/15') as Month; 
select day('2020/10/15') as Day; 
select left('SQL Tutorial', 3) as LeftString;
select right('SQL Tutorial', 8) as RightString;
select trim('     SQL Tutorial!     ') as TrimmedString;
select translate('Monday', 'Monday', 'Sunday') as Translate

--6) Write an SQL statement that utilizes 'like' in the where clause.

select Name from Menu
where Name like '%oz'

--7) Demonstrate the use of the rowcount feature to return 4 rows from a table that has more than 4 rows.
--Then demonstrate the use of the rowcount feature to reset the number of rows returned to all of the rows in
--a table. Demonstrate an alternative to rowcount that has similar functionality.

set Rowcount 4
Select * from Staff;

/* Use to reset Rowcount

set Rowcount 0

*/

Select top(4) * from Staff;

--8) Create a SQL routine to insert values into the Ingredient table.

Insert into Ingredient
	(Name, Description, Unit)
Values
	('Peach', 'Red Haven select top grade', 'single')

Select * from Ingredient where Name like '%Peach%'

/* script to remove duplicate entries

set rowcount 1
delete from Ingredient where name like 'CannedPeaches'
set rowcount 0

*/

--9) Create a SQL routine to update one middle name in the Staff table.

select * from Staff where StaffID = 1
Update Staff
Set MName = 'Jack' where StaffID = 1
Select * from Staff where StaffID = 1

--10) Create SQL to truncate and populate a new table with at least 10 rows
--using data you supply in the insert statement. Table must have at least 3 columns
--and is not a table in the Restaurant database.

create table Rating(
	RatingID int identity(1,1) NOT NULL,
	StarRating int NOT NULL,
	RatingDescription nvarchar(max) NULL,
	Reccomendation nvarchar(200) NULL)
--truncate table Rating
insert into Rating (StarRating, RatingDescription, Reccomendation)
    values 
        ('5', 'Amazing', 'None'),
        ('4', 'Good', 'None'),
        ('5', 'Really Good', 'No Reccomendation'),
        ('3', 'So-So', 'Bad Food'),
        ('1', 'Bad', 'Bad Everything'),
        ('4', 'Good', 'Long Wait'),
        ('5', 'Amazing', 'None'),
        ('2', 'Not Great', 'Undercooked'),
        ('5', 'Amazing', 'None'),
        ('4', 'Great', 'None')
Select * from Rating;

--11) Create a SQL statement that inserts 2 Orders for a Staff of your choice and 3 Orders for another Staff of your choice.

insert into Orders(OrderID, Location, StaffID, DateTime)
    values 
        (201, 'Austin',165, CURRENT_TIMESTAMP),
        (202, 'Dallas',165, CURRENT_TIMESTAMP),
        (203, 'Houston',63, CURRENT_TIMESTAMP),
        (204, 'San Jose',63, CURRENT_TIMESTAMP),
        (205, 'San Diego',63, CURRENT_TIMESTAMP);
Select * from Orders;

--12) Create a query that uses Group By with the  Order and Staff table.

Select FName, LName, OrderCount = Count(OrderID) from Staff, Orders
Where Staff.StaffID = Orders.StaffID
Group by FName, LName

--13) Create a SQL statement that utilizes the substring command.

Select substring(FName, 1,3) from Staff

--14) Demonstrate the use of distinct, ascending, descending in a query.

--Decending
Select FName From Staff
Order by FName desc

--Ascending
Select FName From Staff
Order by FName asc

--Distinct Ascending
Select distinct FName From Staff
Order by FName asc

--15) Demonstrate @@version

Select @@version as VersionNumber;

--16) How many Ingredients are in Ingredient table (number, not the list of records).

Select count(*) as NumberIngredient from Ingredient

--17) Which Menu Item had the most Ingredients.

Select MenuID, count(IngredientID) as IngredientCount from MenuIngredient
group by MenuID

--18) Which Staff member had the longest Last Name.

Select LName, Len(LName) as NameLength from Staff
Order by NameLength desc

--19) Write a script that creates the data to have a Menu item with more than one Ingredient 
--as well as a script to display that Menu item and it's Ingredients.

Insert into Menu(Name, Price) 
    Values('Cheeseburger', 10.99);
Insert into Ingredient(Name, Description, Unit)
    Values
        ('Cheese', 'Swiss', '10 Pound'),
        ('Ketchup', 'Heinz', '114 oz');

Insert into MenuIngredient(MenuID, IngredientID)
    Values
        (17,1),
        (17,2),
        (17,3),
        (17,14),
        (17,15);

/*To ensure the data was properly added I included these optional scripts

Select * from Menu;
Select * from Ingredient;
Select * from MenuIngredient;
*/


