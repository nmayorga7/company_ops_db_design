import tkinter as tk
from tkinter import ttk
import mysql.connector

# Connect to the MySQL database
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="@THfnlpw17!",
    database="billing"
)
cursor = conn.cursor()

# Function to get clients
def fetch_clients():
    query = "SELECT client_id, name FROM clients"
    cursor.execute(query)
    return cursor.fetchall()

# Function to get projects for a specific client
def fetch_projects_for_client(client_name):
    query = """
        SELECT start_date, end_date, employee_names
        FROM client_project_view
        WHERE client_name = %s
    """
    cursor.execute(query, (client_name,))
    return cursor.fetchall()

# Function to display project info for the selected client
def display_project_info(client_name):
    project_info_text.delete("1.0", tk.END)  # Clear previous content

    projects = fetch_projects_for_client(client_name)
    
    if projects:
        for project in projects:
            start_date, end_date, employee_names = project
            project_info_text.insert(tk.END, f"Start Date: {start_date}\n")
            project_info_text.insert(tk.END, f"End Date: {end_date}\n")
            project_info_text.insert(tk.END, f"Employee(s): {employee_names}\n")

    else:
        project_info_text.insert(tk.END, "No projects found for this client.")

# Initialize the GUI
root = tk.Tk()
root.title("Client Project Browser")
root.geometry("400x300")

# Label and dropdown for client selection
client_label = tk.Label(root, text="Select Client")
client_label.pack(pady=5)

client_var = tk.StringVar()
client_dropdown = ttk.Combobox(root, textvariable=client_var, state="readonly")
client_dropdown.pack(pady=5)

# Populate client dropdown
clients = fetch_clients()
client_dropdown["values"] = [client[1] for client in clients]

# Text widget for displaying project info
project_info_text = tk.Text(root, wrap="word", height=15, width=50)
project_info_text.pack(pady=10)

# Update project info when a client is selected
client_dropdown.bind("<<ComboboxSelected>>", lambda e: display_project_info(client_var.get()))

# Run the GUI
root.mainloop()

# Close database connection on exit
conn.close()
