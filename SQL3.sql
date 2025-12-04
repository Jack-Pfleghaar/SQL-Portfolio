--1) SQL to create a Customer table using appropriate data types 
--that has the following columns: 
--CustomerID, First Name, Last Name, Date of Birth, Address, City, State, Zip Code.  
--CustomerID  must be defined as an identity field that starts with 100. 

Create table Customer (
	CustomerID Int Identity(100, 1) Not Null,
	FirstName Varchar(50) Not Null,
	LastName Varchar(50) Not Null,
	DateOfBirth Date,
	Address Varchar(100),
	City Varchar (50),
	State Varchar (2),
	ZipCode Varchar(10),

--2) SQL to define the primary key in the CustomerID column. (SQL must not be generated)

	Constraint PK_Customer Primary Key (CustomerID));

--3) SQL to define an index using the primary key and a second index using Last Name and First Name. (SQL must not be generated)

Create Nonclustered Index IX_Customer_LastName_FirstName
on Customer (LastName, FirstName)

--4) SQL to insert fifty rows of unique data into the Customer table.

INSERT INTO Customer (FirstName, LastName, DateOfBirth, Address, City, State, ZipCode)
VALUES 
('John', 'Smith', '1980-01-15', '100 Main St', 'Springfield', 'IL', '62701'),
('Jane', 'Doe', '1981-02-10', '101 Oak Ave', 'Springfield', 'IL', '62702'),
('Michael', 'Johnson', '1982-03-12', '102 Pine Rd', 'Springfield', 'IL', '62703'),
('Emily', 'Davis', '1983-04-05', '103 Maple Dr', 'Springfield', 'IL', '62704'),
('William', 'Brown', '1984-05-25', '104 Cedar St', 'Springfield', 'IL', '62705'),
('Olivia', 'Wilson', '1985-06-13', '105 Birch Blvd', 'Springfield', 'IL', '62706'),
('James', 'Taylor', '1986-07-09', '106 Walnut Ln', 'Springfield', 'IL', '62707'),
('Sophia', 'Anderson', '1987-08-22', '107 Cherry Ct', 'Springfield', 'IL', '62708'),
('Benjamin', 'Thomas', '1988-09-14', '108 Poplar Way', 'Springfield', 'IL', '62709'),
('Ava', 'Jackson', '1989-10-30', '109 Aspen St', 'Springfield', 'IL', '62710'),
('Lucas', 'White', '1990-01-01', '110 Magnolia Ave', 'Springfield', 'IL', '62711'),
('Mia', 'Harris', '1991-02-14', '111 Elm St', 'Springfield', 'IL', '62712'),
('Henry', 'Martin', '1992-03-20', '112 Pinecrest Dr', 'Springfield', 'IL', '62713'),
('Amelia', 'Thompson', '1993-04-25', '113 Brookside Ln', 'Springfield', 'IL', '62714'),
('Alexander', 'Garcia', '1994-05-30', '114 Parkview Ct', 'Springfield', 'IL', '62715'),
('Charlotte', 'Martinez', '1995-06-12', '115 Hillcrest Rd', 'Springfield', 'IL', '62716'),
('Daniel', 'Robinson', '1996-07-08', '116 Riverbend St', 'Springfield', 'IL', '62717'),
('Harper', 'Clark', '1997-08-03', '117 Fairview Ave', 'Springfield', 'IL', '62718'),
('Matthew', 'Rodriguez', '1998-09-09', '118 Willow Way', 'Springfield', 'IL', '62719'),
('Evelyn', 'Lewis', '1999-10-10', '119 Sycamore Ct', 'Springfield', 'IL', '62720'),
('Joseph', 'Lee', '1980-11-15', '120 Ridge Rd', 'Springfield', 'IL', '62721'),
('Ella', 'Walker', '1981-12-01', '121 Highland Dr', 'Springfield', 'IL', '62722'),
('David', 'Hall', '1982-01-19', '122 Valley St', 'Springfield', 'IL', '62723'),
('Abigail', 'Allen', '1983-02-07', '123 Sunset Blvd', 'Springfield', 'IL', '62724'),
('Samuel', 'Young', '1984-03-26', '124 Lakeview Dr', 'Springfield', 'IL', '62725'),
('Isabella', 'Hernandez', '1985-04-11', '125 Forest Ct', 'Springfield', 'IL', '62726'),
('Andrew', 'King', '1986-05-04', '126 Meadow Ln', 'Springfield', 'IL', '62727'),
('Grace', 'Wright', '1987-06-15', '127 Orchard Rd', 'Springfield', 'IL', '62728'),
('Christopher', 'Lopez', '1988-07-20', '128 Grove St', 'Springfield', 'IL', '62729'),
('Chloe', 'Hill', '1989-08-29', '129 Birchwood Ave', 'Springfield', 'IL', '62730'),
('Joshua', 'Scott', '1990-09-10', '130 Spruce Ct', 'Springfield', 'IL', '62731'),
('Lily', 'Green', '1991-10-19', '131 Garden Rd', 'Springfield', 'IL', '62732'),
('Ryan', 'Adams', '1992-11-05', '132 Lake St', 'Springfield', 'IL', '62733'),
('Scarlett', 'Baker', '1993-12-09', '133 Ridgeview Dr', 'Springfield', 'IL', '62734'),
('Nathan', 'Nelson', '1994-01-22', '134 Maplewood Ct', 'Springfield', 'IL', '62735'),
('Victoria', 'Carter', '1995-02-18', '135 Pleasant St', 'Springfield', 'IL', '62736'),
('Anthony', 'Mitchell', '1996-03-10', '136 Cherrywood Ln', 'Springfield', 'IL', '62737'),
('Zoe', 'Perez', '1997-04-28', '137 Whispering Pines Dr', 'Springfield', 'IL', '62738'),
('Dylan', 'Roberts', '1998-05-16', '138 Woodland Ave', 'Springfield', 'IL', '62739'),
('Hannah', 'Turner', '1999-06-09', '139 Highland Ct', 'Springfield', 'IL', '62740'),
('Liam', 'Phillips', '1980-07-22', '140 North St', 'Springfield', 'IL', '62741'),
('Avery', 'Campbell', '1981-08-03', '141 South Ave', 'Springfield', 'IL', '62742'),
('Ethan', 'Parker', '1982-09-11', '142 East Blvd', 'Springfield', 'IL', '62743'),
('Sofia', 'Evans', '1983-10-05', '143 West Dr', 'Springfield', 'IL', '62744'),
('Logan', 'Edwards', '1984-11-19', '144 Meadowbrook Rd', 'Springfield', 'IL', '62745'),
('Aria', 'Collins', '1985-12-23', '145 Greenway Ct', 'Springfield', 'IL', '62746'),
('Jacob', 'Stewart', '1986-01-14', '146 Forestview Ln', 'Springfield', 'IL', '62747'),
('Layla', 'Sanchez', '1987-02-27', '147 River Rd', 'Springfield', 'IL', '62748'),
('Noah', 'Morris', '1988-03-15', '148 Valley View Dr', 'Springfield', 'IL', '62749'),
('Mila', 'Rogers', '1989-04-10', '149 Woodlawn Ave', 'Springfield', 'IL', '62750');

--5) SQL to truncate and drop the Customer table. 

Truncate Table Customer

Drop Table Customer

--6) SQL to create a view of the Customer table using all of the columns in the table except Date of Birth.

Create View vw_Customer1 as 
Select CustomerID, FirstName, LastName, Address, City, State ZipCode
From Customer

Select * from vw_Customer1

--7) SQL that uses the view to display all Customers in the Customer table sorted by First Name in descending order.

Select * from vw_Customer1
Order by FirstName desc

--8) One sql routine with at least 3 If statements and confirmation that they work.

Declare @Age int = 3

If @Age > 3
	Print 'Age GT 3. Age = ' + Cast(@Age as Varchar(10))
If @Age = 3
	Print 'Age = 3. Age = ' + Cast(@Age as Varchar(10))
If @Age < 3
	Print 'Age LT 3. Age = ' + Cast(@Age as Varchar(10))

--9) One sql routine with If, Else-If and confirmation that they work.

Declare @Age int = 3

If @Age > 3
	Print 'Age GT 3. Age = ' + Cast(@Age as Varchar(10))
Else If @Age = 3
	Print 'Age = 3. Age = ' + Cast(@Age as Varchar(10))
Else
	Print 'Age LT 3. Age = ' + Cast(@Age as Varchar(10))

--10) One Case statement with at least 3 When options and confirmation that they work.

Declare @Age int = 3

Print
	Case
		When @Age > 3 Then 'Age GT 3. Age = ' + Cast(@Age as Varchar(10))
		When @Age = 3 Then 'Age = 3. Age = ' + Cast(@Age as Varchar(10))
		Else 'Age LT 3. Age = ' + Cast(@Age as Varchar(10))
	End;

--11) Alter table sql to add an integer column to an existing table that allows nulls.

Alter Table Customer
	Add Age Int Null;

--12) SQL update routine with error checking and error logging.  Confirmation statement that generates logged error.

Declare @ErrorHold int

Insert into Diet
	(DietID, DName, DDesc)
Values
	(1, 'Carnivore Diet', 'Meat Diet')
Set @ErrorHold = @@Error
Print '@@Error: ' + Cast(@ErrorHold as varchar(10))

If @ErrorHold != 0
	Insert into ErrorAudit
		(ErrorNo, UserID)
	Values
		(@ErrorHold, System_User)

--13) SQL statement that defines and uses variables.

Declare @ExampleVariable varchar(15) = 'ExampleString'
Print 'This is an Example Variable: ' + @ExampleVariable

--14) Store procedure that accepts a variable and has error checking and logging as part of the execute stored procedure statement.

Create Proc spu_InsertErrorAudit @ErrorHold int as
	Insert into ErrorAudit
		(ErrorNo)
	Values
		(@ErrorHold)

Declare @Errorhold int = 0
Insert into Location
	(LocationID, LName, LDesc)
Values
	(1, 'Desert Land', 'Sand Lovers')
Set @Errorhold = @@Error
if @Errorhold != 0
	Exec spu_InsertErrorAudit @ErrorHold

--15) SQL insert statement that inserts ten rows of data into a new table named Cars 
--that includes--at least 5 columns and the data varies for each record by using variables 
--that are incremented and/or changed within the routine for each record.

-- Create the Cars table
create table Cars (
    carId int primary key,
    make nvarchar(50),
    model nvarchar(50),
    year int,
    price decimal(10,2),
    mileage int
);

declare @carId int = 1;
declare @make nvarchar(50);
declare @model nvarchar(50);
declare @year int = 2015;
declare @price decimal(10,2) = 15000.00;
declare @mileage int = 50000;

-- Insert 10 records using a loop with incrementing/changing variables
while @carId <= 10
begin
    if @carId % 3 = 1
    begin
        set @make = 'Toyota';
        set @model = 'Camry';
    end
    else if @carId % 3 = 2
    begin
        set @make = 'Honda';
        set @model = 'Accord';
    end
    else
    begin
        set @make = 'Ford';
        set @model = 'F-150';
    end
    
    insert into Cars (carId, make, model, year, price, mileage)
    values (@carId, @make, @model, @year, @price, @mileage);
    
    set @carId = @carId + 1;
    set @year = @year + 1;
    set @price = @price + 2500.00;
    set @mileage = @mileage - 5000;
end

-- Display the results
select * from Cars;

--16) Create a table named HikingLocations that has the appropriate structure to remove duplicates when loading the table.  
--Demonstrate that it works. Include sql that defines the structure to remove duplicates in your submission. 
--(this is the same as any other table create except you set the ignore_dup_key option to on).

USE [ExampleDatabase]
GO
CREATE TABLE [dbo].[HikingLocations](
	[HLocationsID] [int] NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[LDesc] [nvarchar](500) NULL,
	[Length] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,

 CONSTRAINT [PK_HikingLocations] PRIMARY KEY CLUSTERED 
(
	[HLocationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--17) Define a table named HikingLocations2 that has 10 records and 3 of the records are duplicates.  
--Create an SQL routine that identifies the duplicate records by key value.  
--Create a second SQL routine that displays only the duplicate records.

USE [ExampleDatabase]
GO
CREATE TABLE [dbo].[HikingLocations2](
	[HLocationsID] [int] NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[LDesc] [nvarchar](500) NULL,
	[Length] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,

 CONSTRAINT [PK_HikingLocations2] PRIMARY KEY CLUSTERED 
(
	[HLocationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--Insert 10 records with 3 duplicates
INSERT INTO HikingLocations2 (HLocationsID, LName, LDesc, Length, Location)
VALUES
(1, 'Eagle Peak Trail', 'Steep mountain trail with scenic views', '5.2 miles', 'Rocky Mountains'),
(2, 'Lakeview Loop', 'Easy loop around crystal clear lake', '3.1 miles', 'Lake Superior'),
(3, 'Forest Ridge Path', 'Moderate trail through dense forest', '4.5 miles', 'Appalachian Mountains'),
(4, 'Eagle Peak Trail', 'Steep mountain trail with scenic views', '5.2 miles', 'Rocky Mountains'),
(5, 'Canyon Rim Walk', 'Breathtaking canyon edge trail', '6.8 miles', 'Grand Canyon'),
(6, 'Meadow Springs Trail', 'Gentle trail through wildflower meadows', '2.9 miles', 'Sierra Nevada'),
(7, 'Lakeview Loop', 'Easy loop around crystal clear lake', '3.1 miles', 'Lake Superior'),
(8, 'Desert Vista Trail', 'Hot desert trail with unique rock formations', '7.3 miles', 'Mojave Desert'),
(9, 'Forest Ridge Path', 'Moderate trail through dense forest', '4.5 miles', 'Appalachian Mountains'),
(10, 'Waterfall Creek Trail', 'Beautiful trail following a cascading creek', '4.2 miles', 'Pacific Northwest');

--Identify duplicate records by key value (HLocationsID of duplicates)
SELECT H1.HLocationsID, H1.LName, H1.LDesc, H1.Length, H1.Location
FROM HikingLocations2 H1
WHERE EXISTS (
    SELECT 1
    FROM HikingLocations2 H2
    WHERE H1.LName = H2.LName
      AND H1.LDesc = H2.LDesc
      AND H1.Length = H2.Length
      AND H1.Location = H2.Location
      AND H1.HLocationsID <> H2.HLocationsID
);

--Display only the duplicate records (showing all instances)
SELECT LName, LDesc, Length, Location, COUNT(*) AS DuplicateCount
FROM HikingLocations2
GROUP BY LName, LDesc, Length, Location
HAVING COUNT(*) > 1;

--18) Create an insert routine for HikingLocations2 that uses variables 
--and performs error checking and error logging.

declare @HLocationsId int = 11;
declare @LName nvarchar(50) = 'Mountain Vista Trail';
declare @LDesc nvarchar(500) = 'Beautiful mountain views';
declare @Length nvarchar(50) = '6.5 miles';
declare @Location nvarchar(50) = 'Sierra Nevada';
declare @errorHold int;

insert into HikingLocations2 (HLocationsID, LName, LDesc, Length, Location)
values (@hLocationsId, @lName, @lDesc, @length, @location);

set @errorHold = @@Error;
print '@@Error: ' + cast(@errorHold as varchar(10));

if @Errorhold != 0
	Exec spu_InsertErrorAudit @ErrorHold