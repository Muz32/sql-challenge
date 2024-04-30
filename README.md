# sql-challenge

## Project Overview

This assignment challenge involves creating a SQL database to manage employee records. The database creation process was completed in two main steps:

## Step 1: Data Modelling

I sketched the physical Entity Relationship Diagram (ERD) for the database using Quick Database Diagrams (https://www.quickdatabasediagrams.com/). This tool assisted in creating and visualising the database schemas, including data types, primary and foreign key constraints, and relationships between table fields. The ERD image is located at `EmployeeSQL/ERD sketch.png`.

## Step 2: Data Engineering

Using the ERD sketch, I coded and created table schemas in PostgreSQL. Six tables were created:

- `Titles` (data from `titles.csv`)
- `Employees` (data from `employees.csv`). Note: For date format issues, use `employees (dates formatted).csv`
- `Salaries` (data from `salaries.csv`)
- `Departments` (data from `departments.csv`)
- `Department_Employees_Junction` (data from `dept_emp.csv`)
- `Department_Manager_Junction` (data from `dept_manager.csv`)

The CSV data is located in the `EmployeeSQL/data` subfolder.

## Important Notes

- **Date Format**: Depending on settings, PostgreSQL may require date data in this format `YYYY/MM/DD`. If facing issues with date imports from `employees.csv`, use `employees (dates formatted).csv`.
- **Import Order**: To avoid foreign key constraint errors, import data in the order tables were created.

## SQL Queries

The `SQL Queries.sql` file in the `EmployeeSQL` folder contains several queries for extracting and viewing information from the database.

## Folders and Files

- `EmployeeSQL`
  - `ERD sketch.png`
  - `SQL Queries.sql`
  - `Table Schemata.sql`
  - `data`
    - `departments.csv`
    - `dept_emp.csv`
    - `dept_manager.csv`
    - `employees.csv`
    - `employees (dates formatted).csv`
    - `salaries.csv`
    - `titles.csv`
