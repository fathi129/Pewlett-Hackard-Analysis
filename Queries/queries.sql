select count(*) from departments;
select count(*) from employees;
select count(*) as dept_emp from dept_emp;

select count(*) as dept_manager from dept_manager;

select count(*) as salaries from salaries;

select count(*) as titles from titles;
select * from retirement_info;

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
into retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Retirement eligibility
SELECT count(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

select * from retirement_info limit 5;
SELECT emp_no,first_name, last_name
into retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

Joins:

select d.dept_name,
		dm.emp_no,
		dm.from_date,
		dm.to_date
from departments as d
inner join dept_manager as dm
on d.dept_no = dm.dept_no;

select r.emp_no,
		r.first_name,
		r.last_name,
		de.to_date

from retirement_info as r
left join dept_emp as de
on r.emp_no = de.emp_no;

select r.emp_no,
		r.first_name,
		r.last_name,
		de.to_date
into current_emp
from retirement_info as r
left join dept_emp as de
on r.emp_no = de.emp_no
where de.to_date = '9999-01-01'

select * from current_emp;


select count(ce.emp_no),
		de.dept_no
into employee_retirement_count
from current_emp as ce
left join dept_emp as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no asc;

select * from employee_retirement_count;

select * from salaries 
order by to_date desc;




select e.emp_no,
		e.first_name,
		e.last_name,
		e.gender,
		de.to_date,
		s.salary
into emp_info
from employees as e
inner join salaries as s 
on (e.emp_no = s.emp_no)
inner join dept_emp as de
on (e.emp_no = de.emp_no)
where (e.birth_date between '1952-01-01' and '1955-12-31')
and (e.hire_date between '1985-01-01' and '1988-12-31') and (de.to_date = '9999-01-01');

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

select ce.emp_no,
		ce.first_name,
		ce.last_name,
		d.dept_name
into dept_info
from current_emp as ce 
	inner join dept_emp as de
	on (ce.emp_no = de.emp_no)
	inner join departments as d
	on (de.dept_no = d.dept_no);
		
select ri.emp_no,
		ri.first_name,
		ri.last_name,
		d.dept_name
-- into sales_info		
from retirement_info as ri
	inner join dept_emp as de
	on (ri.emp_no = de.emp_no)
	inner join departments as d
	on (de.dept_no = d.dept_no)
	where (d.dept_name in ('Sales','Development'));

		



