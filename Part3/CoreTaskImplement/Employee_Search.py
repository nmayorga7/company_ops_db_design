import tkinter as tk
from tkinter import ttk
import mysql.connector

# Connect to the MySQL database
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="@THfnlpw17!",
    database="billing"
)

# Fetch data function based on department or all employees
def fetch_employees(department=None):
    cursor = db.cursor(dictionary=True)
    
    if department:
        query = """
        SELECT employee_id, name, department, title, 
               address, phone_number, hourly_rate
        FROM employee_view
        WHERE department = %s
        ORDER BY name;
        """
        cursor.execute(query, (department,))
    else:
        query = """
        SELECT employee_id, name, department, title, 
               address, phone_number, hourly_rate
        FROM employee_view
        ORDER BY name;
        """
        cursor.execute(query)

    records = cursor.fetchall()
    cursor.close()
    display_records(records)

# Function to display records in the text box
def display_records(records):
    results_text.delete(1.0, tk.END)
    for record in records:
        results_text.insert(tk.END, f"ID: {record['employee_id']}, Name: {record['name']}, Department: {record['department']}, "
                                    f"Title: {record['title']}, Address: {record['address']}, "
                                    f"Phone: {record['phone_number']}, Rate: {record['hourly_rate']}\n\n")

# GUI setup
root = tk.Tk()
root.title("Employee Search")
root.geometry("600x400")

# Buttons for departments
departments = {
    "Growth, Marketing, and Sales": "Growth, Marketing, and Sales",
    "Risk and Resilience": "Risk and Resilience",
    "Corporate Strategy and Finance": "Corporate Strategy and Finance",
    "Sustainability": "Sustainability",
    "Operations": "Operations",
    "Digital": "Digital"
}

# Create buttons for each department
for dept_name, dept_display in departments.items():
    btn = tk.Button(root, text=dept_display, command=lambda d=dept_name: fetch_employees(d))
    btn.pack(fill='x')

# Create the See All button
btn_all = tk.Button(root, text="See All", command=lambda: fetch_employees())
btn_all.pack(fill='x')

# Text box to display results
results_text = tk.Text(root, wrap="word", height=15)
results_text.pack(expand=True, fill='both')

# Run the GUI
root.mainloop()

# Close the database connection when the program ends
db.close()
