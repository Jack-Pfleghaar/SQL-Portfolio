--This is an Insurance application. Complete the following:

--1) Define and populate Rate and Customer tables in two separate databases.  Suggested that the Rate table be in a Rate database and the Customer table be in a Customer database.
Truncate table Customer
Use Customer
INSERT INTO Customer (CustID, FName, LName, MName, DOB, Gender, Rider)
VALUES
    (4, 'James', 'Anderson', 'Michael', '01/15/1999', 'M', 'Y'),
    (5, 'Emily', 'Roberts', 'Anne', '03/22/1985', 'F', 'N'),
    (6, 'Michael', 'Thompson', 'James', '07/08/1992', 'M', 'Y'),
    (7, 'Sarah', 'Martinez', 'Lynn', '11/30/1978', 'F', 'Y'),
    (8, 'David', 'Garcia', 'Paul', '05/14/2001', 'M', 'N'),
    (9, 'Jessica', 'Wilson', 'Marie', '09/25/1988', 'F', 'Y'),
    (10, 'Christopher', 'Lee', 'Allen', '02/17/1995', 'M', 'N'),
    (11, 'Ashley', 'Harris', 'Nicole', '12/03/1983', 'F', 'Y'),
    (12, 'Matthew', 'Clark', 'Thomas', '06/11/2000', 'M', 'Y'),
    (13, 'Amanda', 'Lewis', 'Rose', '04/28/1990', 'F', 'N'),
    (14, 'Daniel', 'Walker', 'Joseph', '08/19/1987', 'M', 'Y'),
    (15, 'Jennifer', 'Hall', 'Elizabeth', '10/07/1996', 'F', 'N'),
    (16, 'Joshua', 'Allen', 'David', '01/23/1981', 'M', 'N'),
    (17, 'Melissa', 'Young', 'Kay', '03/15/1993', 'F', 'Y'),
    (18, 'Andrew', 'King', 'Scott', '07/29/1998', 'M', 'Y'),
    (19, 'Stephanie', 'Wright', 'Dawn', '11/12/1984', 'F', 'N'),
    (20, 'Ryan', 'Lopez', 'Matthew', '05/06/2002', 'M', 'Y'),
    (21, 'Nicole', 'Hill', 'Jean', '09/18/1991', 'F', 'Y'),
    (22, 'Brandon', 'Scott', 'Lee', '02/24/1979', 'M', 'N'),
    (23, 'Brittany', 'Green', 'Marie', '12/31/1997', 'F', 'N'),
    (24, 'Justin', 'Adams', 'Ray', '06/09/1986', 'M', 'Y'),
    (25, 'Amber', 'Baker', 'Lynn', '04/21/1994', 'F', 'Y'),
    (26, 'Tyler', 'Nelson', 'James', '08/03/2003', 'M', 'N'),
    (27, 'Samantha', 'Carter', 'Grace', '10/16/1989', 'F', 'Y'),
    (28, 'Kevin', 'Mitchell', 'Patrick', '01/08/1982', 'M', 'N');

--2) Include BeginAge and EndAge columns for the Rate table.  The age ranges go in 5 year increments up to age 99.
Truncate table Rate
Use Rate
INSERT INTO Rate (RateID, BeginAge, EndAge, RateAmount)
VALUES
(1, 0, 4, 8.2300),
(2, 5, 9, 2.2500),
(3, 10, 14, 3.1200),
(4, 15, 19, 4.2000),
(5, 20, 24, 5.5000),
(6, 25, 29, 7.2500),
(7, 30, 34, 9.5000),
(8, 35, 39, 12.5000),
(9, 40, 44, 17.0000),
(10, 45, 49, 23.5000),
(11, 50, 54, 32.0000),
(12, 55, 59, 43.5000),
(13, 60, 64, 58.0000),
(14, 65, 69, 95.5000),
(15, 70, 74, 155.0000),
(16, 75, 79, 245.0000),
(17, 80, 84, 375.0000),
(18, 85, 89, 525.0000),
(19, 90, 94, 650.0000),
(20, 95, 99, 789.0000);

--3) Create SQL routines that perform the following:

--assign people an insurance rate based on birthdate (age). 
    --example: Someone born May 5, 2000 would be 24 years old, so they would be using the rates from 20 to 24 in the rate table.
    --this is a SQL routine, not another column in a table.  You compute the assigned rate.

    --Alter Customer table to include Rider flag. Compute and display rider cost - rider will increase rate by 1.5.

    --Report of all customers sorted by age range, LName, FName.  Displays the Rate/Rate x Rider (whichever applies - join)

--Customer: CustomerID, FName, LName, DOB  (then alter to add Rider flag to any 10 of your customers) (50 people, spread across ranges)

--Rate: RateID, BeginAge, EndAge, Rate (Age in increments of 5 years, 0-4, 5-9, 10-14... to 99)  (Rate - dollar amount, different (increases) in each age increment)

--Make sure to comment all code.

--End of assignment for SQL 4
--This is a function I created to calculate the age of anyone in the database.


Create function dbo.func_GetAge1(@DOB DATE)
Returns tinyint
as
Begin
    Declare @Age tinyint
    
    --What is happening here is the year from the users DOB is calculated against the current year to find the age.
    Set @Age = DATEDIFF(YEAR, @DOB, GETDATE()) - 
               CASE 
               --To prevent a problem (such as users birthday on 12/31/2000 and the date being 
               --checked on 1/1/2026 resulting in the answer 26) we must also check the month and day.
               --
               --This function below checks the current month and current day against the users 
               --month and date in their birthday to ensure the most accurate date is calculated
                   WHEN MONTH(@DOB) > MONTH(GETDATE()) 
                        OR (MONTH(@DOB) = MONTH(GETDATE()) 
                        AND DAY(@DOB) > DAY(GETDATE())) 
                   THEN 1 
                   ELSE 0 
               END
    RETURN @Age
END;


--Here we are going to create a view to see the customer, DOB, age, and rate amount among other things.
--We will also be calculating if the rider is present, and if it is, the updated rate
Create view vw_GetCustomerRate3 
as
Select
    C.CustID, C.FName, C.LName, C.DOB, dbo.func_GetAge1(C.DOB) as Age, C.Rider,
    R.BeginAge, R.EndAge, R.RateAmount,

    --Here we will be checking of the rider is a "Y" (or yes) which would mean we need to increase the rate by 1.5
    Case
        When Rider = 'Y' then r.RateAmount + 1.5
        Else RateAmount
    End as RiderRate
from Customer C
join Rate.dbo.Rate R
    on dbo.func_GetAge1(C.DOB) between R.BeginAge and R.EndAge;
GO

Select * from vw_GetCustomerRate3;
