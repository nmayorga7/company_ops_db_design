import mysql.connector
import tkinter as tk
from tkinter import ttk
from decimal import Decimal

# set up mysql connection
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="@THfnlpw17!",
    database="billing"
)

cursor = conn.cursor()

# function to fetch and display the invoice details for the selected client
def fetch_invoice_data(client_name):
    # query to get data from the client_invoice_view
    query = """
    select 
        employee_name, 
        employee_id, 
        project_id, 
        total_hours, 
        hourly_rate, 
        labor_cost, 
        expense_amount, 
        purchase_date
    from client_invoice_view
    where client_id = (select client_id from clients where name = %s)
    order by project_id, employee_name;
    """
    
    # execute the query with the client name
    cursor.execute(query, (client_name,))
    results = cursor.fetchall()

    # variables to store the totals
    total_labor_cost = Decimal('0.00')
    total_expenses = Decimal('0.00')

    # output the results in a simple text format
    print(f"\nInvoicing for Client: {client_name}")
    for row in results:
        project_id = row[2]
        employee_name = row[0]
        employee_id = row[1]
        total_hours = row[3]
        hourly_rate = row[4]
        labor_cost = Decimal(row[5]) if row[5] is not None else Decimal('0.00')  # handle None values
        expense_amount = Decimal(row[6]) if row[6] is not None else Decimal('0.00')  # handle None values
        purchase_date = row[7]

        # print the details for this entry
        print(f"project id: {project_id}")
        print(f"employee: {employee_name}")
        print(f"employee id: {employee_id}")
        print(f"total hours: {total_hours}")
        print(f"hourly rate: {hourly_rate}")
        print(f"labor cost: {labor_cost}")
        print(f"expense amount: {expense_amount}")
        print(f"purchase date: {purchase_date}")
        print("-" * 30)

        # update the totals
        total_labor_cost += labor_cost
        total_expenses += expense_amount

    # Calculate the total cost (including profit margin)
    profit_margin = Decimal('0.20')  # Example profit margin (20%)
    total_cost = total_labor_cost + total_expenses
    total_with_margin = total_cost * (1 + profit_margin)  # Multiply with Decimal profit margin

    # Output the final total
    print(f"Total Labor Cost: {total_labor_cost}")
    print(f"Total Expenses: {total_expenses}")
    print(f"Total Cost (without margin): {total_cost}")
    print(f"Total Cost (with margin): {total_with_margin}")

# set up the gui
root = tk.Tk()
root.title("client invoice generator")
root.geometry("500x400")

# dropdown for client selection
client_label = tk.Label(root, text="select client")
client_label.pack(pady=5)

client_var = tk.StringVar()
client_dropdown = ttk.Combobox(root, textvariable=client_var, state="readonly")
client_dropdown.pack(pady=5)

# populate client dropdown
cursor.execute("select name from clients")
clients = cursor.fetchall()
client_dropdown["values"] = [client[0] for client in clients]

# button to fetch and display invoice data
def show_invoice_data():
    client_name = client_var.get()
    fetch_invoice_data(client_name)

invoice_button = tk.Button(root, text="generate invoice", command=show_invoice_data)
invoice_button.pack(pady=10)

# run the gui
root.mainloop()

# close the database connection on exit
cursor.close()
conn.close()
