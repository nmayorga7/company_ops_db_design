create database billing;

create table employee (
	employee_id int not null,
	name varchar(100) not null,
	department varchar(80) not null,
	title varchar(80) not null,
	street varchar(80) not null,
	city varchar(120) not null,
	state varchar(45) not null,
	country varchar(90) not null,
	zip_code varchar(9) not null,
	phone_number varchar(10) null,
	hourly_rate varchar(45) not null,
	corporate_card_number varchar(40) not null,
	primary key (employee_id)
);

create table clients (
	client_id int not null,
	name varchar(120) not null,
	location varchar(80) not null,
	department varchar(80) null,
	billing_contact varchar(120) not null,
	billing_info varchar(80) null,
	primary key (client_id)
);

create table projects (
	project_id int not null,
	client_id int not null,
	start_date date not null,
	end_date date null,
	labor_cost decimal not null,
	primary key (project_id),
    foreign key (client_id) references clients (client_id)
);

create table hours_worked (
	employee_id int not null,
	project_id int not null,
	date date not null,
	total_hours decimal not null,
	primary key (employee_id, project_id, date),
	foreign key (project_id) references projects (project_id),
	foreign key (employee_id) references employee (employee_id)
);

create table expenses (
	expense_id int not null,
    employee_id int not null,
    project_id int not null,
    expense_amount decimal not null,
    purchase_date date not null,
	primary key (expense_id),
	foreign key (employee_id) references employee (employee_id),
    foreign key (project_id) references projects (project_id)
);

insert into employee values (1, 'Maria Hernandez', 'Software Engineering', 'Senior Developer', '52 Broadway', 'New York', 'NY', 'USA', '10004', '2125553829', '85', '9382746102938476');
insert into employee values (2, 'David Leary', 'Marketing', 'Marketing Director', '75 Mission St', 'San Francisco', 'CA', 'USA', '94105', '4155556753', '120', '7645123489237584');
insert into employee values (3, 'Aditi Kapoor', 'Finance', 'Financial Analyst', '135 South LaSalle St', 'Chicago', 'IL', 'USA', '60603', '3125552398', '70', '1827364590283746');
insert into employee values (4, 'Jake Thompson', 'IT', 'Systems Engineer', '6100 Center Dr', 'Los Angeles', 'CA', 'USA', '90045', '2135557829', '75', '3482913748273648');
insert into employee values (5, 'Emily Patel', 'HR', 'HR Specialist', '123 Elm St', 'Dallas', 'TX', 'USA', '75201', '2145558392', '60', '5872610938475123');
insert into employee values (6, 'Liam Davis', 'Operations', 'Operations Manager', '600 East Las Colinas Blvd', 'Irving', 'TX', 'USA', '75039', '9725552839', '100', '7281938476283746');
insert into employee values (7, 'Sophia Chavis', 'Finance', 'Finance Director', '333 South Hope St', 'Los Angeles', 'CA', 'USA', '90071', '2135552938', '130', '9283747561938476');
insert into employee values (8, 'Hannah Li', 'Design', 'Lead Designer', '125 King St', 'Seattle', 'WA', 'USA', '98104', '2065558732', '110', '9834729102837645');
insert into employee values (9, 'Ethan Garcia', 'Research', 'Data Scientist', '950 Boylston St', 'Boston', 'MA', 'USA', '02115', '6175559247', '90', '8473629183475102');
insert into employee values (10, 'Chloe Johnson', 'Marketing', 'SEO Specialist', '456 Main St', 'Phoenix', 'AZ', 'USA', '85004', '6025553948', '65', '3847261938472561');
insert into employee values (11, 'Liam Brown', 'Sales', 'Sales Manager', '567 First Ave', 'Miami', 'FL', 'USA', '33101', '3055553849', '75', '3748291048572635');
insert into employee values (12, 'Emma Lopez', 'IT', 'Network Engineer', '135 Park Ave', 'Newark', 'NJ', 'USA', '07102', '9735552849', '78', '9483720192837465');
insert into employee values (13, 'Olivia Nguyen', 'Operations', 'Logistics Coordinator', '478 Maple St', 'Denver', 'CO', 'USA', '80202', '3035553847', '60', '1273482974738192');
insert into employee values (14, 'Mason Martinez', 'Finance', 'Junior Accountant', '155 Main St', 'Orlando', 'FL', 'USA', '32801', '4075559382', '55', '8237482619345764');
insert into employee values (15, 'Zoe Turner', 'Marketing', 'Content Manager', '322 North Ave', 'Chicago', 'IL', 'USA', '60601', '3125558392', '68', '7483925618372914');
insert into employee values (16, 'Lucas Rivera', 'HR', 'Talent Acquisition Specialist', '221 South St', 'Los Angeles', 'CA', 'USA', '90012', '2135556729', '60', '2837465928371463');
insert into employee values (17, 'Ava Thompson', 'Finance', 'Investment Analyst', '998 Park Ave', 'New York', 'NY', 'USA', '10010', '2125552937', '82', '0928473610283947');

insert into clients values (1, 'Bright Enterprises', 'New York', 'Operations', 'Charlotte Simmons', 'Net 60');
insert into clients values (2, 'Tech Solutions', 'San Francisco', 'Product Development', 'Samuel Lee', 'Net 30');
insert into clients values (3, 'Vision Capital', 'Chicago', 'Investment', 'Renee Jacobs', 'Net 45');
insert into clients values (4, 'Ops Logistics', 'Los Angeles', 'Logistics', 'Oliver Price', 'Net 60');
insert into clients values (5, 'Upward Innovations', 'New York', 'Design', 'Isabella Gonzalez', 'Net 30');
insert into clients values (6, 'Twintech Systems', 'Dallas', 'IT', 'Noah Williams', 'Net 90');
insert into clients values (7, 'Capital Ventures', 'Austin', 'Investment', 'James Anderson', 'Net 45');
insert into clients values (8, 'Metro Innovations', 'Seattle', 'Tech Consulting', 'Megan Wells', 'Net 60');
insert into clients values (9, 'Peak Ventures', 'Denver', 'Investment', 'Carlos Ruiz', 'Net 45');
insert into clients values (10, 'Creative Minds', 'Boston', 'Marketing', 'Evelyn Brooks', 'Net 30');
insert into clients values (11, 'Edge Analytics', 'Phoenix', 'Data Analytics', 'Victor Green', 'Net 90');
insert into clients values (12, 'Prime Logistics', 'Miami', 'Supply Chain', 'Eliana Torres', 'Net 60');
insert into clients values (13, 'FinServe Advisors', 'Newark', 'Financial Services', 'Grace Liu', 'Net 45');
insert into clients values (14, 'Blue Skies Solutions', 'Orlando', 'Real Estate', 'Jack Harris', 'Net 30');
insert into clients values (15, 'West Coast Media', 'San Diego', 'Advertising', 'Sarah King', 'Net 60');
insert into clients values (16, 'GreenTech Labs', 'Austin', 'Renewable Energy', 'Owen Scott', 'Net 45');
insert into clients values (17, 'North Star Ventures', 'Minneapolis', 'Venture Capital', 'Sophia Kim', 'Net 90');


insert into projects values (3, 3, '2015-03-10', '2015-06-25', 75000.00);
insert into projects values (7, 7, '2023-02-01', '2023-12-01', 60000.00);
insert into projects values (2, 2, '2012-07-20', '2013-06-15', 120000.00);
insert into projects values (6, 6, '2022-06-25', '2022-09-25', 100000.00);
insert into projects values (1, 1, '2010-05-15', '2011-04-30', 45000.00);
insert into projects values (5, 5, '2020-11-12', '2021-05-18', 50000.00);
insert into projects values (4, 4, '2018-09-05', '2019-03-10', 80000.00);
insert into projects values (4, 6, '2022-08-15', '2023-02-15', 85000.00);
insert into projects values (6, 2, '2020-01-10', '2020-10-10', 75000.00);
insert into projects values (7, 1, '2023-05-10', '2023-12-20', 90000.00);
insert into projects values (5, 3, '2019-07-01', '2020-04-15', 78000.00);
insert into projects values (2, 6, '2018-03-20', '2019-01-05', 56000.00);
insert into projects values (1, 7, '2021-04-12', '2022-03-01', 63000.00);
insert into projects values (4, 5, '2016-11-25', '2017-06-10', 67000.00);
insert into projects values (5, 2, '2022-09-30', '2023-10-20', 94000.00);
insert into projects values (7, 4, '2019-08-22', '2020-07-05', 81000.00);


insert into hours_worked values (1, 1, '2024-01-08', 7.50);
insert into hours_worked values (2, 2, '2024-02-12', 8.00);
insert into hours_worked values (3, 3, '2024-03-20', 6.75);
insert into hours_worked values (4, 4, '2024-01-20', 9.00);
insert into hours_worked values (5, 5, '2024-04-05', 5.25);
insert into hours_worked values (6, 6, '2024-03-12', 7.00);
insert into hours_worked values (7, 7, '2024-05-10', 8.50);
insert into hours_worked values (5, 2, '2024-01-08', 7.50);
insert into hours_worked values (2, 2, '2024-03-12', 8.00);
insert into hours_worked values (4, 2, '2024-03-29', 6.00);
insert into hours_worked values (4, 3, '2024-06-20', 9.00);
insert into hours_worked values (5, 2, '2024-04-08', 7.25);
insert into hours_worked values (6, 6, '2024-03-15', 7.00);
insert into hours_worked values (7, 3, '2024-05-10', 8.50);
insert into hours_worked values (1, 3, '2024-06-10', 6.50);
insert into hours_worked values (2, 6, '2024-04-08', 8.25);
insert into hours_worked values (3, 2, '2024-05-12', 7.75);
insert into hours_worked values (4, 7, '2024-01-15', 8.00);
insert into hours_worked values (5, 1, '2024-02-20', 6.25);
insert into hours_worked values (6, 5, '2024-07-03', 9.25);
insert into hours_worked values (7, 4, '2024-03-18', 8.50);
insert into hours_worked values (1, 2, '2024-06-07', 7.75);
insert into hours_worked values (5, 3, '2024-04-15', 6.50);
insert into hours_worked values (2, 7, '2024-08-20', 9.00);
insert into hours_worked values (3, 5, '2024-07-08', 8.75);
insert into hours_worked values (4, 6, '2024-03-25', 7.50);
insert into hours_worked values (5, 2, '2024-05-22', 8.00);
insert into hours_worked values (6, 4, '2024-08-12', 9.00);
insert into hours_worked values (7, 1, '2024-09-18', 6.25);
insert into hours_worked values (3, 4, '2024-06-25', 7.25);
insert into hours_worked values (2, 1, '2024-07-14', 8.50);
insert into hours_worked values (1, 5, '2024-09-05', 6.75);
insert into hours_worked values (6, 3, '2024-02-28', 8.75);
insert into hours_worked values (7, 7, '2024-08-10', 7.50);


insert into expenses values (1, 1, 1, 200.85, '2024-01-10');
insert into expenses values (2, 2, 2, 325.50, '2024-02-15');
insert into expenses values (3, 3, 3, 180.20, '2024-03-22');
insert into expenses values (4, 4, 4, 400.90, '2024-01-25');
insert into expenses values (5, 5, 5, 250.75, '2024-04-10');
insert into expenses values (6, 6, 6, 300.65, '2024-03-18');
insert into expenses values (7, 7, 7, 150.35, '2024-05-15');
insert into expenses values (8, 1, 5, 275.00, '2024-06-12');
insert into expenses values (9, 7, 6, 430.50, '2024-04-25');
insert into expenses values (10, 2, 3, 190.75, '2024-08-05');
insert into expenses values (11, 3, 4, 380.00, '2024-01-30');
insert into expenses values (12, 6, 7, 210.45, '2024-02-28');
insert into expenses values (13, 5, 2, 450.90, '2024-03-05');
insert into expenses values (14, 1, 6, 350.80, '2024-05-17');
insert into expenses values (15, 7, 3, 215.35, '2024-07-12');
insert into expenses values (16, 4, 5, 290.60, '2024-09-22');
insert into expenses values (17, 3, 1, 375.90, '2024-06-18');
insert into expenses values (18, 5, 6, 220.80, '2024-07-15');
insert into expenses values (19, 2, 4, 400.40, '2024-08-30');
insert into expenses values (20, 4, 3, 330.25, '2024-04-10');
insert into expenses values (21, 6, 7, 175.70, '2024-06-05');
insert into expenses values (22, 1, 5, 200.90, '2024-03-22');
insert into expenses values (23, 2, 2, 290.15, '2024-09-18');
insert into expenses values (24, 7, 1, 270.40, '2024-06-15');
insert into expenses values (25, 5, 7, 325.55, '2024-08-12');
insert into expenses values (26, 6, 4, 350.00, '2024-02-26');
insert into expenses values (27, 3, 2, 450.25, '2024-01-20');

-- Update department names to match Report 2 --
UPDATE employee
SET department = CASE employee_id
    WHEN 1 THEN 'Digital'
    WHEN 2 THEN 'Marketing'
    WHEN 3 THEN 'Risk'
    WHEN 4 THEN 'Operations'
    WHEN 5 THEN 'Strategy'
    WHEN 6 THEN 'Operations'
    WHEN 7 THEN 'Risk'
    WHEN 8 THEN 'Digital'
    WHEN 9 THEN 'Sustainability'
    WHEN 10 THEN 'Marketing'
    WHEN 11 THEN 'Strategy'
    WHEN 12 THEN 'Operations'
    WHEN 13 THEN 'Operations'
    WHEN 14 THEN 'Risk'
    WHEN 15 THEN 'Marketing'
    WHEN 16 THEN 'Strategy'
    WHEN 17 THEN 'Risk'
    ELSE department -- Keeps the department unchanged for other employee_ids
END;