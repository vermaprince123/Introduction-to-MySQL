# MySQL Command Cheatsheet: -
--	-----------------------------------------------
# To check the version of MySQL:-
SELECT VERSION();
--	------------------------------------------------
#To get a list of commands in MySQL:-
help;
--	-------------------------------------------------
# DATABASE RELATED QUERIES
--	-------------------------------------------------
#To display a list of Databases: -
SHOW DATABASES;
--	-------------------------------------------------
#To create a Database: -
CREATE DATABASE edignitengo;
--	-------------------------------------------------
#To use a database
USE edignitengo;
--	-------------------------------------------------
#To delete a database
DROP DATABASE edignitengo;
--	-------------------------------------------------
# TABLE RELATED QUERIES
--	-------------------------------------------------
#To create a table
CREATE TABLE student(
srno int,
fullname varchar(55),
marks int);
--	-------------------------------------------------
#To show list of tables in database
SHOW TABLES;
--	-------------------------------------------------
#To describe columns/ fields of a table
DESC student; #or
DESCRIBE student;
--	-------------------------------------------------
#To delete a table
DROP TABLE student;
--	-------------------------------------------------
#To insert data into your table (Inserting into table named student)
INSERT INTO student (srno, fullname, marks) VALUES(1, "Manisha Damor", 89),
(2, "Amit Kumar", 91),
(3, "Sajan Chaudhary", 78);
#or
INSERT INTO student VALUES(1, "Manisha Damor", 89),
(2, "Amit Kumar", 91),
(3, "Sajan Chaudhary", 78);
--	-------------------------------------------------
#To show/print entire table in output
SELECT * FROM student;
--	-------------------------------------------------
#Constraints
--	-------------------------------------------------
#(For constraints, let us create a new table of employees of a company in delhi. The columns will include sr no, name, department, city)
CREATE TABLE employees(
sr_no int,
name varchar(55),
department varchar(55),
city varchar(55));
--	-------------------------------------------------
/*
Concept of Not Null: -
If we declare a column as not null, we can't keep it empty when entering the records. Keeping it empty will either give the default value to it, or will give us an error.
These type of required field names include 'NOT NULL' in their description.
*/

CREATE TABLE employeesnotnull(
sr_no int NOT NULL,
name varchar(55) NOT NULL,
department varchar(55) NOT NULL,
city varchar(55) NOT NULL);

/*
Now if we try to enter a record which has city feild empty, we will get an error: - 
iNSERT INTO employeesnotnull (sr_no, name, department) values (1, "random", "any");
*/
--	-------------------------------------------------
/*
Concept of Default: -
Sometimes there are many records where value of a particular feild (city, in this case), is similar in most of the cases. In such a case we can keep a default value. So even if the feild is NOT NULL and is not entered, MySQL will give default value to it.
*/

CREATE TABLE employeesnotnulldefault(
sr_no int NOT NULL,
name varchar(55) NOT NULL,
department varchar(55) NOT NULL,
city varchar(55) NOT NULL DEFAULT "Delhi");

/*
Now if we try to enter a record which has city feild empty, we will not get an error. Instead Delhi will be added to city by default: - 
iNSERT INTO employeesnotnulldefault (sr_no, name, department) values (1, "random", "any");
*/
--	-------------------------------------------------
/*
Concept of Auto-Increment
There are many fields, where we want values to increase automatically, even when we don't give them (sr_no in this case). For that we use AUTO_INNCREMENT
*/

CREATE TABLE employeesincrement(
sr_no int NOT NULL AUTO_INCREMENT,
name varchar(55) NOT NULL,
department varchar(55) NOT NULL,
city varchar(55) NOT NULL DEFAULT "Delhi");

#Now if we don't enter sr_no, it will automatically be increased in each record: - 
INSERT INTO employeesincrement (name, department, city) values ("Prince Verma", "Technical", "Faridabad"),
("Vishal Sachan", "Teaching", "Kanpur"), 
("Heer Mehta", "Technical", "Rajkot"),
("Alankrita Verma", "Marketing", "Surat"),
("Lekha Periwal", "HR", "Kolkata"),
("Sarita Yadav", "Advisory", "Palwal"),
("Brijesh Saini", "Marketing", "Jaipur");

--	-------------------------------------------------
/*
Concept of Primary Key -
In many tables, there's a feild which is unique for every record and cannot be kept null, a feild which can give all the information of that record (eg: - sr no., roll no., employee id, etc). This is known as Primary Key. We can set any feild as primary key by following command:- 
*/

CREATE TABLE employeesnotnull(
sr_no int NOT NULL,
name varchar(55) NOT NULL,
department varchar(55) NOT NULL,
city varchar(55) NOT NULL,
PRIMARY KEY(sr_no)); #Here we have set sr_no as the primary key
--	-------------------------------------------------
#Modifying Table
--	-------------------------------------------------
#To rename a table (let us rename student to studata)
RENAME TABLE student TO studata;

--	-------------------------------------------------
/*
Truncating a table: - Truncating a table means to clear all the records/ data from the table keeping the structure as it is
*/

#To Truncate a table
TRUNCATE TABLE studata;
--	-------------------------------------------------
#To update Record of a table (let us have an example of updating city of Lekha Periwal from Kolkata to Puruliya)
UPDATE employeesincrement SET city = "Puruliya" WHERE name = "Lekha Periwal";
--	-------------------------------------------------
#To delete a Record from the table (let us delete the record of Heer Mehta from employeesincrement table)
DELETE FROM employeesincrement WHERE name = "Heer Mehta";
--	-------------------------------------------------
#To undo all the updates made so far
ROLLBACK;
--	-------------------------------------------------
/*
Commit:- When we execute the rollback command all the commands before it get undone. But if we want to prevent a series of previous commands from getting undone, we use commit.
When we execute the commit command, all the commands before it get committed and cannot be undone on rollback.
*/

#To commit a set of commands
COMMIT;
--	-------------------------------------------------
#To delete a column from table (let us delete city from table employees)
ALTER TABLE employees DROP COLUMN city;
--	-------------------------------------------------
#To add a column to the table (let us again add city to table employees after the department column)
ALTER TABLE employees ADD COLUMN city varchar(55) AFTER department;

ALTER TABLE employees ADD COLUMN city varchar(55) FIRST; #Incase if we want to add it first
--	-------------------------------------------------
#To rename a column using rename statement (Let us rename name to fullname)
ALTER TABLE employees RENAME COLUMN name to fullname; #Here you can only change name of the column

#To rename a column using change statement(Let us rename sr_no to emp_id this time)
ALTER TABLE employees CHANGE COLUMN sr_no emp_id varchar(10);
--	-------------------------------------------------
#Extracting data from table
--	-------------------------------------------------
#Aggregate Functions

--	------
/*
Let us create a new table where we will costumer purchase in a supermarket
*/

CREATE TABLE costumers(
sr_no int NOT NULL auto_increment,
costname varchar(55) NOT NULL DEFAULT "Not known",
amount int NOT NULL,
PRIMARY KEY(sr_no));

INSERT INTO costumers (costname, amount) VALUES ("Prince Verma", 4500),
("Heer Mehta", 2020),
("Alankrita Verma", 3000),
("Lekha Periwal", 5000),
("Heer Mehta", 1000),
("Prince Verma", 1500),
("Vishal Sachan", 1800),
("Brijesh Saini", 1100),
("Tejal Shingadia", 1200),
("Prince Verma", 1000),
("Neela Vasava", 1200),
("Lekha Periwal", 1300);
--	------
#To add all the values(say amount in costumers table)
SELECT SUM(amount) FROM costumers;

#To get average of all the values(say amount in costumers table)
SELECT AVG(amount) FROM costumers;

#To get minimum of all the values(say amount in costumers table)
SELECT MIN(amount) FROM costumers;

#To get maximum of all the values(say amount in costumers table)
SELECT MAX(amount) FROM costumers;

#To get count all the values(say amount in costumers table)
SELECT COUNT(amount) FROM costumers;
-- --------------------------------------------------
#From Clause - Whenever we want to select data from a particular table we use from clause. Eg: - SELECT * 'FROM' student;
--	-------------------------------------------------
#Where Clause - To filter the data in output we use where clause

#let us only print name of employees whose city is Surat
SELECT name FROM employeesincrement WHERE city=Surat;
--	-------------------------------------------------
#Distict Clause - To remove duplicate records from table.
#Now if we want to know the names of costumers, some of them will get repeated. To avoid this, we use DISTINCT clause
SELECT DISTINCT costname FROM costumers;
--	-------------------------------------------------
#To set all the values in acsending or descending order (let us show costumer name and amount they paid in ascending order)
SELECT costname, amount FROM costumers ORDER BY amount ASC; #To set in descending order, we use DESC instead of ASC
--	-------------------------------------------------
#To limit the number of costumers in output (let us filter top 3 purchases from costumers table)
SELECT costname, amount FROM costumers ORDER BY amount DESC LIMIT 3;

/*
Now what if we want to see the costumers at 4th, 5th, 6th, 7th position. For that we use the concept of offset. The syntax of limit will be: - LIMIT offset, count
Here, all the records just after the offset number will get printed till the count reaches 0.
*/

#To print data at 4,5,6,7, positions:-
SELECT costname, amount FROM costumers ORDER BY amount DESC LIMIT 3, 4;
--	-------------------------------------------------
/*
Group By Clause: - We use this clause to collect the result and show data in groups of one or two columns
*/

#Let us see the frquency of costumers in the store
SELECT costname, count(*) FROM costumers GROUP BY costname;

#For applying a condition, we use having keyword (Let us print the frequency of costumers who have come more than one time
SELECT costname, count(*) FROM costumers GROUP BY costname HAVING COUNT(*)>1;
--	-------------------------------------------------
#Like Clause
--	------------------------------------------------
#Like Clause is used to find and display record of a string, given only a par of it as input.

#To search records of costumer(s) having surname Verma
SELECT * FROM costumers WHERE costname LIKE "%Verma";

#To search record(s) of costumers(s) whose name has 'lan' string in costname
SELECT * FROM cotumers WHERE costname LIKE "%lan%";

#To search a record where a single character of the string is not known
SELECT * FROM costumers WHERE costname LIKE "%P_riwal";

--	------------------------------------------------
#Regular Expression
--	------------------------------------------------
#Regular expression is used to find reocrds corresponding strings that follow a particular pattern

#To print record(s) corresponding to all string(s) ending with a
SELECT * FROM costumers WHERE costname REGEXP'a$';

#To print all records for string(s) starting with a or n
SELECT * FROM costumers WHERE costname REGEXP'^[an]';

#To print all the records containing 'ela' or 'ita'
SELECT * FROM costumers WHERE costname REGEXP'ela|ita';

#Thus in regular expression we give a pattern. The patterns use meta characters, whose use is as given below: -
/*
^ - It is used to start matches at the beginning of the string
$ - It is used to start matches at the end of the string
. - To match a single character, exceot for a nw line
[abc] - Match any of the characters mentioned in the bracket
[a-h] - To match a character between a particular range
[0-9] - To match a digit between 0 to 9
{n} - To match n instances of preceeding element
*/
--	-------------------------------------------------
#Conditions
--	-------------------------------------------------
#AND
SELECT * FROM costumers WHERE amount>1000 AND name = "Heer Mehta";

#OR
SELECT * FROM costumers WHERE amount>3000 OR name = "Heer Mehta";

#IN
SELECT * FROM costumers WHERE costname IN ("Prince Verma", "Vishal Sachan", "Brijesh Saini");

#BETWEEN
SELECT * FROM costumers WHERE amount BETWEEN 1000 AND 2000;

#IS NULL
SELECT * FROM costumers WHERE amount IS NULL;

#IS NOT NULL
SELECT * FROM costumers WHERE amount IS NULL;

#NOT
SELECT * FROM costumers WHERE amount NOT BETWEEN 1000 AND 2000;
--	-------------------------------------------------
#Date and Time Functions (The format of date is YYYY-MM-DD and time is HH:MM:SS)
--	-------------------------------------------------
--	---#Date Functions--------------------
#To display current date
SELECT CURRENT_DATE(); #or 
SELECT CURDATE(); #or
SELECT SYSDATE();

#To print a particular date (say 16 June 2019)
SELECT DATE("2019-06-16"); 

#To print month of a particular date
SELECT MONTH("2019-06-16"); #Month number, that is 6 will be shown in the output

#To print name of month
SELECT MONTHNAME("2019-06-16"); #Month name, that is June will be printed over here

#To print which quarter of the year, date belongs
/*
Quarter 1 - Januaury-March
Quarter 2 - April-June
Quarter 3 - July-September
Quarter 4 - October to December
*/
SELECT QUARTER("2019-06-16"); #This command will return 2 

#To return day number of in the year
SELECT DAYOFYEAR("2019-06-16"); #This will return 2019

#To return day of month of a date
SELECT DAY("2019-06-16"); #This command will return 16
SELECT DAYOFMONTH("2019-06-16");

#To print name of the day
SELECT DAYNAME("2019-06-16"); #This command will return Sunday

#To print Day of week
SELECT DAYOFWEEK("2019-06-16"); #This command will return 1

#To return weekday number for a date
/*
Weekday Numbers:-
0 = Monday
1 = Tuesday
2 = Wednesday
3 = Thursday
4 = Friday
5 = Saturday
6 = Sunday
*/
SELECT WEEKDAY("2019-06-16"); #This will return 6

#To return week number for a date
SELECT WEEKOFYEAR("2019-06-16"); #This will return 24

#To print year as well as week of a particular date
SELECT YEARWEEK("2019-06-16"); #This will return 201924

#To print day of the year
SELECT DAYOFYEAR("2019-06-16"); #This command will return 167

#To print last day of the month to which a particular date belongs
SELECT LAST_DAY("2019-06-16"); #This will return 2019-06-30

#To print number of days between date and year 0
SELECT TO_DAYS("2019-06-16"); #This will return 737591

#To convert numeric representation into date
SELECT FROM_DAYS(737591); #This will return 2019-06-16

#To print date in a particular format
SELECT DATE_FORMAT("2019-06-16", "%D %M %Y"); #This would return 16th June 2019

#To print difference between two dates
SELECT DATEDIFF("2019-06-30","2019-06-16"); #This will return 14

#To add 10 days to a date and again return the date
SELECT ADDDATE("2019-06-16", INTERVAL 14 DAY);

#To subtract 10 days from the date and return the date
SELECT DATE_SUB("2019-06-16", INTERVAL 14 DAY);

--	----#Time Functions--------------
#To display current time
SELECT CURTIME(); #or
SELECT CURRENT_TIME();

#To display current date and time
SELECT CURRENT_TIMESTAMP(); # This will return your systems date and time in YYYY-MM-DD HH:MM:SS format
SELECT NOW();
SELECT LOCALTIME();
SELECT LOCALTIMESTAMP();

#To print microsecond part of the datetime
SELECT MICROSECOND("12:34:00.000045"); #This will return 45

#To print minute of datetime value
SELECT MINUTE("12:34:00"); #This will return 34

#To print time in specific format
SELECT TIME_FORMAT("16:34:00", '%r'); #This will return 04:34:00 PM

#To print time value in seconds
SELECT TIME_TO_SEC("12:34:00"); #This will return 45240

#To print difference between two time values
SELECT TIMEDIFF("12:34:00", "12:37:34");

#To convert seconds into time values
SELECT SEC_TO_TIME("45240"); #This wil return 12:34:00.000000

#To make time value based on hour minute and second value
SELECT MAKETIME(12, 34, 00); #This would return 12:34:00

--	-------------------------------------------------
#String Functions
--	-------------------------------------------------
#To convert a string into upper case (Say name from costumers table)
SELECT UPPER(name) FROM costumers; #or
SELECT UCASE(name) FROM costumers;

#To convert a string into lower case
SELECT LOWER(name) FROM costumers;
SELECT LCASE(name) FROM costumers;

#To see number of characters in a string
SELECT name, CHARACTER_LENGTH(name) FROM costumers;

#To concat two strings
SELECT CONCAT("String1", "String2"); #This will return String1String2

#To concat multiple strings with a seperator in between
SELECT CONCAT_WS("str1","str2","str3","str4"); #Here the first string acts as a seperator between all these strings, so the output will be str2str1str3str1str4

#To trim the space on left side of the string
SELECT LTRIM("    Edignite NGO     "); #Here space on the left side will be trimmed. So the output will be "Edignite NGO    "

#To trim the space on right side of the string
SELECT RTRIM("    Edignite NGO     "); #Here space on the right side will be trimmed. So the output will be "    Edignite NGO"

#To trim the space on both the sides side of the string
SELECT LTRIM("    Edignite NGO     "); #Here space on both the sides will be trimmed. So the output will be "Edignite NGO"

#To print the position of first character of a word that is in the string
SELECT POSITION("String" IN "This is a String"); #Here it will give position of S in the first "String" word. So the output will be 11
SELECT INSTR("This is a String", "String"); #This is same as POSITION, but here we don't need IN keyword
#To start searching in a String from Specific position
SELECT LOCATE("Str1", "Str1 will not be considered but Str1 will be", 5); #Here it will start searching from 5th position, that is from w of first 'will'

#To slice a part of String from a particular position
SELECT SUBSTRING("Edignite NGO", 3); #It will start slicing from i, so the output will be ignite NGO
SELECT SUBSTR("Edignite NGO", 3);

#To slice left side of a character in a string
SELECT SUBSTRING_INDEX("This is an example of a String", "is", 1); #It will break from the first 'is' part and return Th. If it was 2 instead of 1, the result would be This

#To slice a string from left side of an index
SELECT LEFT("Edignite NGO", 4); #This will return Edig

#To slice a part of string from right side till a particular index value
SELECT RIGHT("Edignite NGO", 3); #This will return NGO

#To pad a string from right side with a particular character
SELECT RPAD("Edignite", 15, "-"); #First it will count number of characters in edignite, then it will fill the remaining characters with a hyphen on right side. So the output will be Edignite-------

#To pad a string from left side with a particular character
SELECT RPAD("Edignite", 15, "*"); #the output will be *******Edignite

#To add spaces
SELECT SPACE(15); #Here it will add 15 spaces

#To reverse a string
SELECT REVERSE("abcdef"); #Here the putput will be fedcba

#To replace a part of string with other string
SELECT REPLACE("Edignite NGO", "NGO", "Educational and Charitable Trust"); #Here, the output will be Edignite Educational and Charitable Trust

#To compare length of two strings
SELECT STRCMP("abcd", "abcdef"); #Here, if length of two strings are equal, we will get 0. If length of left string is greater than that of right on, we will get 1. Otherwise we will get -1. So, the output will be -1

#To find index of a character in a list of characters
SELECT FIELD("c", "f","h,c,x,S,f"); #Here the output will be 3

#To round off value till particular number of digits
SELECT FORMAT(3434.6675, 3); #Here the output will be 3434.668

--	-------------------------------------------------
#Index - To retreive data quickly
--	-------------------------------------------------
#To give index when creating a table
CREATE TABLE cost2(
sr_no int NOT NULL AUTO_INCREMENT,
costname varchar(55) NOT NULL,
amount int NOT NULL,
PRIMARY KEY(sr_no),
INDEX(costname));

#To give index to an already created table
CREATE INDEX ind1 ON costumers(costname);
--	-------------------------------------------------
#Foriegn Key constraint
--	-------------------------------------------------
#A foriegn key of one table (child) is primary key of other (parent)

#Let us create a child table orders cosisting of order id, order date and sr_no (sr_no acting as a foreign key to costumers table)
CREATE TABLE orders(
sr_no int,
oid int,
ord_date date,
PRIMARY KEY(oid),
CONSTRAINT fk_ord_cost FOREIGN KEY(sr_no)
REFERENCES costumers(sr_no));

#This way we can create a foreign key. We can also decide upon what will happen if we update or delete a record in Parent Table. For that we have 'ON UPDATE' and 'ON DELETE' clauses
#After ON UPDATE/ DELETE, we define the action which will be done on the child table from the following list.alter
/*
ON UPDATE/ DELETE ACTIONS (By default NO ACTION is applied to the constraint)

1. CASCADE - This action updates the record in child table, whenever a record in parent table get updated. If the record in the parent table gets deleted, the record in child table corresponding to it also gets deleted.
2. SET NULL - The foriegn key column in the child table is updated to null value, whenever a corresponding record in parent table is updated or deleted.
3. SET DEFAULT - The foreign key column is set to the default value of that column, whenever a corresponding record in the parent table is updated or deleted.
4. NO ACTION - It does not allow to update or delete a record of parent table and raises an error
5. RESTRICT - It will not allow updating/ deleting parent records without updating/ deleting child records
*/

CREATE TABLE orders(
sr_no int,
oid int,
ord_date date,
PRIMARY KEY(oid),
CONSTRAINT fk_ord_cost FOREIGN KEY(sr_no)
REFERENCES costumers(sr_no)
ON UPDATE SET NULL
ON DELETE SET NULL
);
--	-------------------------------------------------
#Joining Two Tables - We can join one table having primary key 
--	-------------------------------------------------
#Inner Join -  Displaying what is common between two tables. 

--	-------------------------------------------------
--	-------------------------------------------------
--	-------------------------------------------------
--	-------------------------------------------------
