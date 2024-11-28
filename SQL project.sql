-- Create a database named library
create database Library;
use library;

-- Create tables  1. Branch 2. Employee 3. Books 4. Customer 5. IssueStatus 6. ReturnStatus

-- 1. Branch with attributes: Branch Branch_no - Set as PRIMARY KEY, Manager_Id, Branch_address, Contact_no

create table Branch (
Branch_No int primary key,
Manager_ID int,
Branch_Address varchar(30),
Contact_No varchar(15));

INSERT INTO branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, '123 Main St, New York', '1234567890'),
(2, 102, '456 Elm St, Chicago', '9876543210'),
(3, 103, '789 Oak St, Los Angeles', '5551234567'),
(4, 104, '321 Pine St, Houston', '9012345678'),
(5, 105, '901 Maple St, Phoenix', '1112223333');

select * from Branch;

-- 2. Employee with attributes: Employee Emp_Id – Set as PRIMARY KEY, Emp_name, Position, Salary,
-- Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch table.

create table Employee (
Emp_ID int primary key,
Emp_name varchar(20),
Position_ varchar(20),
Salary int,
Branch_No int,
foreign key (Branch_No) references Branch(Branch_No));

INSERT INTO Employee (Emp_ID, Emp_name, Position_, Salary, Branch_No)
VALUES
(101,'John Smith','Manager',50000,1),
(102,'Jane Doe','Assistant',30000,1),
(103,'Bob Johnson','Librarian',40000,2),
(104,'Maria Rodriguez','Assistant',30000,2),
(105,'David Lee','Manager',50000,3),
(106,'Emily Chen','Librarian',40000,3),
(107,'Kevin White','Assistant',30000,4),
(108,'Sarah Taylor','Manager',50000,4),
(109,'Michael Davis','Librarian',40000,5);

select * from employee;

-- 3. Books with attributes: ISBN - Set as PRIMARY KEY, Book_title, Category,
-- Rental_Price Status [Give yes if book available and no if book not available],Author, Publisher

create table Books (
ISBN int primary key,
Book_title varchar(20),
Category varchar(20),
Rental_Price int,
Status_ varchar(5),
Author varchar(20),
Publisher varchar(20));

INSERT INTO Books (ISBN,Book_title,Category,Rental_Price,Status_,Author,Publisher)
VALUES
(1,'To Kill Mockingbird','Classics',200,'Yes','Harper Lee','J.B. Lippincott'),
(2,'The Great Gatsby','Fiction',250,'No','F. Scott Fitzgerald','Charles Scribner'),
(3,'Pride and Prejudice','Romance',300,'Yes','Jane Austen','T. Egerton'),
(4,'Catcher in the Rye','Young Adult',100,'Yes','J.D. Salinger','Brown and Company'),
(5,'The Hobbit','Fantasy',150,'No','J.R.R. Tolkien','George Allen & Unwin'),
(6,'Picture of Dorian','Horror',400,'Yes','Oscar Wilde','Rey Monthly Magazine'),
(7,'War and Peace','Historical Fiction',160,'No','Leo Tolstoy','Russian Messenger'),
(8,'Moby-Dick','Adventure',270,'Yes','Herman Melville','Harper & Brothers'),
(9,'Huckleberry','Classic',210,'No','Mark Twain','Charles L. Webster'),
(10, 'The Scarlet Letter','Romance',140,'Yes','Nathaniel Hawthorne','Ticknor and Fields');

select * from books;

-- 4. Customer with attributes: Customer_Id - Set as PRIMARY KEY Customer_name Customer_address Reg_date

create table customer (
Customer_ID int primary key,
Customer_name varchar(20),
Customer_address varchar(30),
Reg_Date date);

INSERT INTO customer (Customer_ID,Customer_name,Customer_address,Reg_date)
VALUES
(11,'Olivia Martin','901 5th Ave,New York, NY','2022-11-01'),
(12,'Ava Thompson','456 Oak St,Chicago, IL','2022-12-01'),
(13,'Ethan Hall','789 Main St,Los Angeles, CA','2023-01-01'),
(14,'Sophia Patel','321 Elm St,Houston, TX','2023-02-01'),
(15,'Jackson Lee','901 Maple St,Phoenix, AZ','2023-03-01'),
(16,'Mia Kim','234 Broadway,New York, NY','2023-04-01'),
(17,'Logan Brown','567 State St,Boston, MA','2023-05-01'),
(18,'Isabella Davis','890 Church St,Atlanta, GA','2023-06-01'),
(19,'Alexander White','345 Market St,Philadelphia, PA','2023-07-01'),
(20,'Charlotte Taylor','678 Park Ave,San Francisco, CA','2023-08-01');

select * from customer;

-- 5. IssueStatus with attributes:  Issue_Id - Set as PRIMARY KEY, Issued_cust – Set as FOREIGN KEY and it refer customer_id in CUSTOMER
-- table, Issued_book_name, Issue_date, Isbn_book – Set as FOREIGN KEY and it should refer isbn in BOOKS table.

create table IssueStatus (
Issue_ID int primary key,
Issued_cust int,
Issued_book_name varchar(40),
Issue_date date,
Isbn_book int,
foreign key (Issued_cust) references customer(customer_ID),
foreign key (Isbn_book) references Books(ISBN))
;

INSERT INTO IssueStatus  (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1,11,'To Kill Mockingbird','2022-01-05',1),
(2,12,'The Great Gatsby','2022-01-10',2),
(3,13,'Pride and Prejudice','2022-01-15',3),
(4,14,'Catcher in the Rye','2022-01-20',4),
(5,15,'The Hobbit','2022-01-25',5),
(6,16,'Picture of Dorian','2022-02-01',6),
(7,17,'War and Peace','2022-02-05',7),
(8,18,'Moby-Dick','2022-02-10',8),
(9,19,'Huckleberry','2022-02-15',9),
(10,20,'The Scarlet Letter','2022-02-20',10),
(11,11,'To Kill Mockingbird','2022-03-01',1),
(12,14,'The Great Gatsby','2022-03-05',2);

select * from IssueStatus;

-- 6. ReturnStatus with attributes:  Return_Id - Set as PRIMARY KEY, Return_cust, Return_book_name, Return_date,
-- Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS table.

create table ReturnStatus (
Return_ID int primary key,
Return_cust varchar(20),
Return_Book_Name varchar(20),
Return_date date,
Isbn_book2 int,
foreign key (Isbn_book2) references Books(ISBN));

INSERT INTO ReturnStatus (Return_Id,Return_cust,Return_book_name,Return_date,Isbn_book2)
VALUES
(11,'Olivia Martin','To Kill Mockingbird','2022-02-01',1),
(12,'Ava Thompson','The Great Gatsby','2022-02-05',2),
(13,'Ethan Hall','Pride and Prejudice','2022-02-10', 3),
(14,'Sophia Patel','Catcher in the Rye','2022-02-15', 4),
(15,'Jackson Lee','The Hobbit','2022-02-20',5),
(16,'Mia Kim','Picture of Dorian','2022-02-25',6),
(17,'Logan Brown','War and Peace','2022-03-01',7),
(18,'Isabella Davis','Moby-Dick','2022-03-05',8),
(19,'Alexander White','Huckleberry','2022-03-10', 9),
(20,'Charlotte Taylor','The Scarlet Letter','2022-03-15',10);

select * from ReturnStatus;

-- Q1.  Retrieve the book title, category, and rental price of all available books.

select book_title,category,rental_price from books where status_='yes';

-- Q2.  List the employee names and their respective salaries in descending order of salary.

select emp_name,salary from employee order by salary desc;

-- Q3. Retrieve the book titles and the corresponding customers who have issued those books.

select issued_cust,customer_name,issued_book_name from issuestatus inner join customer on issuestatus.issued_cust=customer.customer_id;

-- Q4. Display the total count of books in each category.

select count(category) as book_count,category from books group by category;

-- Q5.  Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

select emp_name,position_ from employee where salary>50000;

-- Q6.  List the customer names who registered before 2022-01-01 and have not issued any books yet.

select customer_name from customer where reg_date<'2022-01-01' and customer_id not in (select issued_cust from issuestatus);

-- Q7.  Display the branch numbers and the total count of employees in each branch.

select branch_no,count(emp_id) as total_count from employee group by branch_no; 

-- Q8. Display the names of customers who have issued books in the month of June 2023.  

select customer_name from customer join issuestatus on issuestatus.issued_cust=customer.customer_id
where month(issue_date)=6 and year(issue_date)=2023;

-- Q9.  Retrieve book_title from book table containing history.

select Book_title from books where category='history';

-- Q10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees

select branch_no,count(emp_id) as emp_count from employee group by branch_no having emp_count>5;

-- Q11. Retrieve the names of employees who manage branches and their respective branch addresses.

select emp_name,Branch_Address from branch join employee on branch.branch_no=employee.branch_no where employee.position_='manager';

-- Q12.  Display the names of customers who have issued books with a rental price higher than Rs. 25

select customer_name from customer join issuestatus on customer.customer_id=issuestatus.issued_cust 
join books on books.isbn=issuestatus.isbn_book where rental_price>25;







