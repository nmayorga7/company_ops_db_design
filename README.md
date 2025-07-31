# 🏢 Company Operations Database Project

This project was a three-part, semester-long exploration of **data modeling, database design, and end-to-end system implementation**. Over the course of three parts, internal company operations were simulated by designing a relational database and implementing SQL- and Python-driven procedures.

---

## Project Overview  

The core objective was to design a database and supporting application for a global management consulting firm's **internal client billing process**, focusing on:  
- Capturing project data (projects, employees assigned, time worked, expenses)  
- Aggregating and associating these data points to generate accurate client invoices  
- Ensuring the system could scale across multiple clients, projects, and consultants simultaneously  

**Keywords:** 
Database Design · Entity-Relationship (E-R) Modeling · Relational Schema · SQL ·  MySQL · Python Database Integration · Stored Procedures & Functions ·  Business Process Modeling · Back-End Development · Data-Driven Applications ·  Client Billing System · Systems Analysis

---

## Part 1: Business Analysis & E-R Diagram  

**Deliverables:**  
- A clear **company overview** and breakdown of the firm’s internal processes (ex. McKinsey & Co.)
- **Mockups of internal web portals**, including:  
  - Home portal 
  - Projects/Clients dashboard
  - Employee records interface
- Definition of **business rules** to guide database design (e.g., projects cannot exist without a client, expenses must be linked to employees and projects)  
- Initial **E-R diagram** defining entities (clients, projects, employees, hours, expenses) and relationships  

**Key takeaway:** Map real-world workflows into discrete data entities and relationships, ensuring a logical system foundation.  

*(See `Part1/` for the full write-up, portal mockups, and the finalized E-R diagram.)*

---

## Part 2: Relational Schema & SQL Development  

**Deliverables:**  
- **Database schema creation:** Converted the E-R diagram into fully defined relational tables using MySQL, including primary keys, foreign keys, and constraints  
- **Schema diagram:** Visualized table structures, relationships, and constraints  
- **Data population:** Inserted realistic sample data across multiple tables to simulate internal operations  
- **SQL query implementation:**  
  - Ran queries across five categories (multi-table joins, set operations, aggregate functions/grouping, subqueries, EXISTS/UNIQUE)  
  - Wrote additional custom SQL commands tailored to the company’s billing system  
  - Implemented data modification commands (INSERT, UPDATE, DELETE) for scenario testing  

**Key takeaway:** Design normalized schemas, enforce data integrity, and write queries for business insights.  

*(See `Part2/` for schema diagrams, database creation scripts, sample data, and SQL queries.)*

---

## Part 3: Python Integration & Task Implementation  

**Deliverables:**  
1. **Python-MySQL integration:**  
   - Connected a Python application to the database  
   - Re-implemented five Report 2 queries using **host variables** and dynamic user input  

2. **Stored procedures and functions:**  
   - Developed a MySQL procedure with aggregate logic (e.g., invoice calculation)  
   - Built a custom function returning derived values used within queries   

3. **Core task implementation (client billing):**  
   - Automated the generation of client invoices based on project hours, employee rates, and logged expenses  
   - Implemented workflows for both **per-project billing** (long-term clients) and **per-company billing** (short-term clients)  

4. **GUI development:** Built a simple interface to make the invoicing process user-friendly for internal finance staff  

**Key takeaway:** Tie together database design and programming to **deliver functional, end-to-end applications**.  

*(See `Part3/` for Python scripts, procedures/functions, and application demos.)*
