-- REPORT THREE --
-- PART TWO --
-- Create procedure to find total hours worked on a project --
delimeter //
create procedure CalculateTotalHours(in project_id int)
begin
    select SUM(total_hours) as total_hours
    from hours_worked
    where project_id = project_id;
end //
delimeter ;

-- Create function to find total hours worked by a specific employee on a specific project--
delimiter //
create function get_employee_project_hours(emp_id int, proj_id int)
returns int
deterministic
begin
    -- directly return the sum of total_hours - return NULL if no records found --
    return (select sum(total_hours)
            from hours_worked
            where employee_id = emp_id and project_id = proj_id);
end //
delimiter ;

-- PART THREE: IMPLEMENT COMPANY TASKS --
-- TASK ONE: EMPLOYEE SEARCH BY CAPABILITY/DEPARTMENT --
create view employee_view as
select 
    employee_id,
    name,
    department,
    title,
    concat(street, ', ', city, ', ', state, ', ', country, ' ', zip_code) AS address,
    phone_number,
    hourly_rate
from employee;

-- TASK TWO: BROWSE CLIENT PROJECTS --
-- View for displaying client names
create view client_list as
select client_id, name
from clients;

-- View for project and employee information
DROP VIEW IF EXISTS client_project_view;
create view client_project_view as
select distinct p.project_id, p.client_id, c.name as client_name, 
				p.start_date, p.end_date, 
                group_concat(e.name order by e.name separator ', ') as employee_names
from projects p
join clients c on p.client_id = c.client_id
join hours_worked hw on p.project_id = hw.project_id
join employee e on hw.employee_id = e.employee_id
group by p.project_id;

-- TASK THREE: GENERATE CLIENT INVOICE --
-- View to gather all necessary information --
create view client_invoice_view as
select 
    e.name as employee_name, 
    e.employee_id, 
    p.project_id, 
    p.client_id, 
    hw.total_hours, 
    e.hourly_rate, 
    (hw.total_hours * cast(e.hourly_rate as decimal)) as labor_cost, 
    ex.expense_amount, 
    ex.purchase_date
from clients c
join projects p on c.client_id = p.client_id
left join hours_worked hw on p.project_id = hw.project_id
left join employee e on hw.employee_id = e.employee_id
left join expenses ex on p.project_id = ex.project_id and ex.employee_id = e.employee_id;


