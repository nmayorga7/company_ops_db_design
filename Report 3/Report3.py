import datetime
import mysql.connector

# Connect to the MySQL database
cnx = mysql.connector.connect(
    host='localhost',
    user='root',
    password='@THfnlpw17!',
    database='billing')

# Establish cursor
cursor = cnx.cursor()

# Query 1: FROM (more than one table)
# Find the start dates of each client's project
# Host variable: client_id
query1 = """
SELECT c.name, p.start_date
FROM clients c, projects p
WHERE c.client_id = p.client_id AND c.client_id = %s;
"""
client_id = 1  # example client ID
cursor.execute(query1, (client_id,))

print("Query 1 Results:")
for (name, start_date) in cursor:
    print("Client Name: {}, Project Start Date: {}".format(name, start_date))

# Query 2: SET Operation
# List employees with an hourly rate above a certain value in a specific state
# Host variable: hourly_rate, state
query2 = """
SELECT employee_id, name
FROM employee
WHERE hourly_rate > %s AND state = %s;
"""
hourly_rate = 50  # example hourly rate
state = "CA"      # example state
cursor.execute(query2, (hourly_rate, state))

print("\nQuery 2 Results:")
for (employee_id, name) in cursor:
    print("Employee ID: {}, Name: {}".format(employee_id, name))

# Query 3: AGGREGATE and/or GROUP BY
# Find the total hours each employee has worked on every project they are assigned to
# Host variable: employee_id
query3 = """
SELECT e.name, h.project_id, SUM(h.total_hours) AS total_hours
FROM employee e
JOIN hours_worked h ON e.employee_id = h.employee_id
WHERE e.employee_id = %s
GROUP BY e.employee_id, h.project_id;
"""
employee_id = 3  # example employee ID
cursor.execute(query3, (employee_id,))

print("\nQuery 3 Results:")
for (name, project_id, total_hours) in cursor:
    print("Employee Name: {}, Project ID: {}, Total Hours: {}".format(name, project_id, total_hours))

# Query 4: SUBQUERY
# Retrieve employees who have worked on a project with a minimum labor cost
# Host variable: min_labor_cost
query4 = """
SELECT name FROM employee
WHERE employee_id IN (
  SELECT employee_id FROM hours_worked
  WHERE project_id IN (SELECT project_id FROM projects WHERE labor_cost > %s));
"""
min_labor_cost = 1000  # example minimum labor cost
cursor.execute(query4, (min_labor_cost,))

print("\nQuery 4 Results:")
for (name,) in cursor:
    print("Employee Name: {}".format(name))

# Query 5: EXISTS or UNIQUE
# Find employees who have worked on projects based out of a specific location
# Host variable: project_location
query5 = """
SELECT e.employee_id, e.name
FROM employee e
WHERE EXISTS (
    SELECT *
    FROM hours_worked h
    JOIN projects p ON h.project_id = p.project_id
    JOIN clients c ON p.client_id = c.client_id
    WHERE h.employee_id = e.employee_id AND c.location = %s);
"""
project_location = "chicago"  # example project location
cursor.execute(query5, (project_location,))

print("\nQuery 5 Results:")
for (employee_id, name) in cursor:
    print("Employee ID: {}, Name: {}".format(employee_id, name))

# Define function to get total hours devoted to a specific project
def get_total_hours_for_project(project_id):
    cursor = cnx.cursor()
    query = "SELECT SUM(total_hours) FROM hours_worked WHERE project_id = %s;"
    cursor.execute(query, (project_id,))
    
    # Fetch result and handle NULL case
    total_hours = cursor.fetchone()[0]
    if total_hours is None:
        total_hours = 0
    print("\nTotal hours for project ID {}: {}".format(project_id, total_hours))

# Example usage
project_id = 7

get_total_hours_for_project(project_id)

# Define function to get hours worked by an employee on a specific project
def get_employee_project_hours(employee_id, project_id):
    cursor = cnx.cursor()
    query = "SELECT get_employee_project_hours(%s, %s);"
    cursor.execute(query, (employee_id, project_id))
    
    # Fetch result and handle NULL case
    hours_worked = cursor.fetchone()[0]
    if hours_worked is None:
        hours_worked = 0
    print("\nTotal hours worked by employee ID {} on project ID {}: {}".format(employee_id,
                                                                               project_id,
                                                                               hours_worked))

# Example usage
project_id = 3 
employee_id = 6

get_employee_project_hours(employee_id, project_id)

# Close the cursor and connection
cursor.close()
cnx.close()
