# Pewlett-Hackard-Analysis
Pewlett Hackard is a large company with several thousand employees, and it's been around for a long time. As baby boomers retire, the company wants to offer a retirement package for those who meet the criteria. It also wants to see which positions need to be filled soon as upcoming retirement leads to thousands of openings. Bobby, the HR analyst, wants us to help him in this analysis.

## Purpose of the Analysis
This analysis aims to prepare for the upcoming "Silver Tsunami" as many current employees are reaching retirement age. The type of information we need to collect are
- Identify the retiring employees by their title.
- Determine the count of retiring employees by their title.
- Determine the employees eligible for Mentorship Program.
- Determine the number of qualified, retirement-ready employees to mentor the next generation.

## Resources Used
*DataSources*: [departments.csv](https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Data/departments.csv), 
[dept_emp.csv](https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Data/dept_emp.csv), [dept_managers.csv](https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Data/dept_managers.csv), [employees.csv](https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Data/employees.csv), [titles.csv](https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Data/titles.csv), [salaries.csv](https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Data/salaries.csv).<br>
*Software used*: PostgreSQL 11, Pgadmin 4<br> 
*Language*: SQL <br>

## Overview of the Analysis
In this Project, We have created the Entity-Relationship Diagram (ERD), which shows the structure and relationship between the tables. SQL (Structured Query Language) explores and manipulates the data. It asks questions about the data.SQL can be used with different database resources; here, we have used Postgres, a relational database system for holding data, reliable and easy to use.PgAdmin is an interface that talks with Postgres. The employee database is created by importing the given six CSV files. The tables are designed with the primary key, a unique identifier that identifies the rows uniquely in the table. The foreign key of a table is the reference key which refers to the primary key of another table. It shows the relationship between the two tables. When the table is created, we need to specify the table names, columns, and data types. The most commonly used data types are INT and VARCHAR. We can set the constraints to the column by using NOT NULL, UNIQUE, and DISTINCT keywords. Once the table is created, we can import the CSV file. Here is the ERD diagram.

<img src = "https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Data/ERD/EmployeeDB.png" width = 500><br>

## Deliverable 1: 
### 1.The Number of Retiring Employees by Title:

Using the ERD as a reference, A SQL query is written to create a Retirement Titles table that holds all the titles of employees born between January 1, 1952, and December 31, 1955. Because some employees may have multiple titles in the database, for example, we get duplicates due to promotions.<br>
<img src = "https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Screenshots_SQL/retirement_titles.png" width = 400><br>
The query's output was the list of retiring employees filtered with the criteria. We can see that there are **1,33,776** retiring employees but with duplicates.<br>
<img src = "https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Deliverable%201%20%26%202/Deliverable1_retirement_titles.png" width = 600><br>

### 2.Creating the Unique number of retiring employees by using Distinct function:<br>
To remove the duplicates, we have to use the DISTINCT ON statement to create a table containing each employee's most recent title.<br>
<img src = "https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Screenshots_SQL/unique_titles.png" width = 400><br>
Here, the unique_titles table is created with a unique list of retiring employees.<br>
<img src = "https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Deliverable%201%20%26%202/Deliverable1_Unique_Titles.png" width = 600><br>

### 3. The number of retirement-age employees by most recent job title:

Then, by using the COUNT() function, we have created a table with the number of retirement-age employees by the most recent job title. Finally, because we want to include only current employees in our analysis, We have to set the filter date to the existing employees. To exclude those employees who have already left the company.<br>
<img src = "https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Screenshots_SQL/retiring_titles.png" width = 700><br>
The output shows the count of the retiring employees per title.<br>

<img src = "https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Deliverable%201%20%26%202/Deliverable1_retiring_titles.png" width = 300><br>
By seeing the count of employees in each title, we can see that 35.7% were Senior Engineer and Senior staff is also higher with 34%. The total number of retiring employees is **72,458**.After creating all the tables like retirement_titles,unique_titles,retiring_titles,the tables are exported as CSV files as  [retirement_titles.csv](https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Data/Challenge/retirement_titles.csv), [unique_titles.csv](https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Data/Challenge/unique_titles.csv), [retiring_titles.csv](https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Data/Challenge/retiring_titles.csv).<br>
## Deliverable 2:
### 4.The Employees Eligible for the Mentorship Program:

A SQL query is written to create a mentorship-eligibility table that holds the current employees born between January 1, 1965, and December 31, 1965. The current employees are filtered by using to date as '9999-01-01'. To generate the table with recent titles of the employee, a nested inner join is used on the Employees, Department employee table and titles tables. Here, the ORDER BY() function is used to sort the table based on the employee number we can ascend or descend.<br>
<img src = "https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Screenshots_SQL/mentorship.png" width = 400><br>
The generated list of employees for the mentorship program looks as follows.<br>
<img src = "https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Deliverable%201%20%26%202/Deliverable2_mentorship_eligibility.png" width = 700><br>
The findings based on the analysis show that
- The number of retiring employees is **72,458**.
- The retiring employee with title shows that Senior Engineer(**25,916**) and Senior Staff(**24,926**) have the highest number.
- We can say that **1549** employees are eligible for the mentorship program by seeing the results.
## Summary
Planning is essential as the company is preparing for the upcoming "silver tsunami," especially when many employees are involved. The reports above gave us insight into the number of employees about to retire with specific titles. We can further find out the departments where each employee belongs so that we can see how many employees are retired from the particular department, and it would provide the idea to fill the openings. I used inner join on the retirement_titles with departments table to retrieve department name information. After removing the duplicates, with the DISTINCT ON function, the table provides the department information of employees. The table is saved as unique_titles_department.<br>
<img src = "https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Screenshots_SQL/uniq_titl_dep_query.png" width = 400><br>
<img src = "https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Screenshots_SQL/unique_titles_dept.png" width = 500><br>

1.<b><i> How many roles will need to be filled as the "silver tsunami" begins to make an impact?</i></b><br>

To find the number of roles to be filled, we need or display the number of retiring employees in each department and their titles. By seeing the table, we can see how many number of employees are required.<br>
<img src = "https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Screenshots_SQL/roles_query.png" width = 500><br>
<img src = "https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Screenshots_SQL/roles_filled.png" width = 400><br>

2.<b><i> Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?</i></b><br>

Based on selecting the higher positions like Senior Engineer, Senior Staff, Manager, Technique leader and counting based on the titles, we can find the number of qualified retirement ready employees who would mentor the next generation. By seeing the output, we can see enough employees to mentor the new employees.<br>
<img src = "https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Screenshots_SQL/Qualified_mentor.png" width = 500><br>
<img src = "https://github.com/fathi129/Pewlett-Hackard-Analysis/blob/master/Screenshots_SQL/Qualified_mentor_img.png" width = 400><br>


















