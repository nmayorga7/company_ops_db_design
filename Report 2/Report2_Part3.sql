-- FROM (more than one table) --
-- Find the start dates of each client's project --
select c.name, p.start_date
from clients c, projects p
where c.client_id = p.client_id;

-- Find the names of each employee and the project(s) they work on --
select e.name as employee_name, c.name as client_name
from employee e, projects p, clients c
where e.employee_id in (select employee_id from hours_worked where project_id = p.project_id) 
and p.client_id = c.client_id;

-- SET operation --
-- List the names of clients based in New York and Chicago --
select name
from clients
where location = 'New York'
union (select name
		from clients
		where location = 'Chicago');
        
-- List employees with an hourly rate above $50 who are located in California --
select employee_id, name
from employee
where hourly_rate > 50
intersect (select employee_id, name
			from employee
			where state = 'CA');

-- AGGREGATE and/or GROUP BY --
--  Find the total hours each employee has worked on every project they are assigned to --
select e.name, h.project_id, sum(h.total_hours) as total_hours
from employee e
join hours_worked h on e.employee_id = h.employee_id
group by e.employee_id, h.project_id;

--  Find how many employees have worked on each project --
select h.project_id, count(distinct h.employee_id) as num_employees
from hours_worked h
group by h.project_id;


-- SUBQUERY --
-- Retrieve the employees who have worked on a project with a labor cost greater than $50,000 --
select name from employee
where employee_id in (
  select employee_id from hours_worked
  where project_id in (select project_id from projects where labor_cost > 50000));

  -- Find project IDs that have more than 1 employee working on them --
select project_id from hours_worked
group by project_id
having count(employee_id) > 1;

-- EXISTS or UNIQUE
-- Find employees who have worked on projects based out of Chicago --
select e.employee_id, e.name
from employee e
where exists (
    select h.employee_id
    from hours_worked h
    join projects p on h.project_id = p.project_id
    join clients c on p.client_id = c.client_id
    where h.employee_id = e.employee_id and c.location = 'chicago');
    
-- Find employees who have made purchases over $300 --
SELECT e.employee_id, e.name
FROM employee e
WHERE EXISTS (
    SELECT *
    FROM expenses ex
    WHERE ex.employee_id = e.employee_id
    AND ex.expense_amount > 300.00);
    
-- Update Attributes --
-- Update labor cost of project by adding in expenses since March 2024 --
update projects p
set labor_cost = labor_cost + (
    select SUM(expense_amount)
    from expenses e
    where e.project_id = p.project_id
    and e.purchase_date > '2024-03-01')
where exists (
    select *
    from expenses e
    where e.project_id = p.project_id
    and e.purchase_date > '2024-03-01');

-- Update hourly rate of senior developer employees --
UPDATE employee
SET hourly_rate = 80 
where title = 'Senior Developer';

-- QUERY #1 --
-- Return the total hours worked by each employee on each assigned project --
select e.name, p.project_id, sum(w.total_hours) as total_hours_worked
from employee e
natural join hours_worked w
natural join projects p
group by e.name, p.project_id;

-- QUERY 2 --
-- Retrieve the total expenses incurred by employees for a specific project --
select p.project_id, e.name, SUM(exp.expense_amount) as total_expenses
from employee e
natural join expenses exp
natural join projects p
where p.project_id = 5
group by e.name, p.project_id;

-- QUERY 3 --
-- Find info necessary to create an invoice for client billing --
select p.project_id, e.name, 
       sum(hw.total_hours) as total_hours_worked, 
       sum(exp.expense_amount) as total_expenses, 
       (e.hourly_rate * sum(hw.total_hours)) + sum(exp.expense_amount) as total_amount_billed
from employee e
join hours_worked hw on e.employee_id = hw.employee_id
join expenses exp on e.employee_id = exp.employee_id
join projects p on hw.project_id = p.project_id
group by p.project_id, e.name, e.hourly_rate
order by p.project_id;

-- QUERY 4 --
-- Update the hourly rates for all employees who worked over 20 hours --
update employee e
set e.hourly_rate = e.hourly_rate * 1.1
where exists (
    select *
    from (
        select hw.employee_id, sum(hw.total_hours) as total_hours_for_year
        from hours_worked hw
        where year(hw.date) = 2024  -- Use the year directly
        group by hw.employee_id
    ) as employee_hours
    where e.employee_id = employee_hours.employee_id
    and employee_hours.total_hours_for_year > 20);
    
    
-- QUERY 5 --
-- Calculate the total cost for a client 
-- (associated expenses + employee rate * hours) * profit margin) --
update projects p
set p.labor_cost = (
    ((select sum(exp.expense_amount)
         from expenses exp
         where exp.project_id = p.project_id)
        + (select sum(e.hourly_rate * hw.total_hours)
			from employee e
			join hours_worked hw on e.employee_id = hw.employee_id
			where hw.project_id = p.project_id)
    ) * 1.2 );

select client_id, labor_cost
from projects;





