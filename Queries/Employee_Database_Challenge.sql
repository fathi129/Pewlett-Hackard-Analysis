--Deliverable 1: The Number of Retiring Employees by Title
--A query is written and executed to create a Retirement Titles table for employees who are born
--between January 1, 1952 and December 31, 1955.
select e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date		
into retirement_titles
from employees e 
inner join titles t on e.emp_no = t.emp_no
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by e.emp_no;

--Display all the records in retirement_titles
select * from retirement_titles

-- Use Distinct with Orderby to remove duplicate rows
select distinct on (r.emp_no) r.emp_no,
		r.first_name,
		r.last_name,
		r.title
into unique_titles
from retirement_titles r
where r.to_date = '9999-01-01'
order by r.emp_no asc,r.to_date desc;

-- To retrieve the number of employees by their most recent job title who are about to retire.
select count(u.emp_no) as titlecount,
		u.title
into retiring_titles		
from unique_titles u
group by u.title
order by titlecount desc;

-- Deliverable 2: The Employees Eligible for the Mentorship Program
-- a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
select distinct on (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
into mentorship_eligibility 	
from employees e 
inner join dept_emp de on e.emp_no = de.emp_no
inner join titles t on e.emp_no = t.emp_no
where (de.to_date = '9999-01-01') and
(e.birth_date between '1965-01-01' and '1965-12-31') 
order by e.emp_no,t.from_date desc;





