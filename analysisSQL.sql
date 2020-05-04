--List the following details of each employee: employee number, last name, first name, sex, and salary.
select
	emp.emp_no as Employee_Num,
	emp.last_name as Last_Name,
	emp.first_name as First_name,
	emp.sex,
	sal.salary
from employees emp inner join salaries sal
on emp.emp_no = sal.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
select first_name,last_name, (to_date(hire_date,'mm/dd/yy'))start_date from employees;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select
	dm.dept_no,dm.emp_no,
	dept.dept_name,
	employees.last_name,employees.first_name
from dept_manager as dm 
inner join departments as dept
	on dm.dept_no = dept.dept_no
left join employees 
	on dm.emp_no = employees.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select
	first_name,last_name,sex
from employees
where first_name ='Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select
	de.emp_no,de.dept_no,employees.last_name,employees.first_name,depts.dept_name
from dept_emp as de
left join employees on de.emp_no = employees.emp_no
left join departments as depts on de.dept_no = depts.dept_no
where depts.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select
	de.emp_no,de.dept_no,employees.last_name,employees.first_name,depts.dept_name
from dept_emp as de
left join employees on de.emp_no = employees.emp_no
left join departments as depts on de.dept_no = depts.dept_no
where depts.dept_name = 'Sales' or depts.dept_name ='Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select
	last_name,count(emp_no)
from employees group by last_name order by last_name desc;

