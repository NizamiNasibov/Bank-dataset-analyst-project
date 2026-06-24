Banking Database Project (Oracle SQL)
Overview

This project demonstrates the design and implementation of a banking database using Oracle SQL.

The database was created from a banking dataset and normalized into multiple related tables:

Branches
Customer
Loans
Transactions

The project includes table creation scripts, data loading scripts, and analytical SQL queries.

Database Schema
Tables
Branches

Stores information about bank branches and regions.

Customer

Stores customer information, including income, age, account type, and credit score.

Loans

Stores loan details linked to customers.

Transactions

Stores transaction history linked to customers and loans.

Entity Relationship Diagram

(Add ERD image here)




Technologies Used
Oracle SQL
SQL Developer
GitHub
Data Source

Dataset: Banking Data

Main fields:

Customer_ID
Customer_Name
Customer_Age
Customer_Income
Account_Type
Branch
Region
Credit_Score
Loan_ID
Loan_Amount
Loan_Status
Transaction_ID
Transaction_Date
Transaction_Type
Transaction_Amount
Fraud_Flag
Project Structure
banking-project/
│
├── data/
│   └── banking_data.csv
│
├── sql/
│   ├── create_tables.sql
│   ├── insert_data.sql
│   └── analytical_queries.sql
│
├── screenshots/
│   └── query_results.png
│
└── README.md
Example SQL Queries
Top 10 Customers by Income
SELECT customer_name,
       customer_income
FROM customer
ORDER BY customer_income DESC;
Approved Loans
SELECT *
FROM loans
WHERE loan_status = 'Approved';
Total Transaction Amount by Customer
SELECT customer_id,
       SUM(transaction_amount) AS total_amount
FROM transactions
GROUP BY customer_id;
Key Skills Demonstrated
Database normalization
Primary and foreign keys
Data loading using INSERT INTO ... SELECT
JOIN operations
Aggregate functions
Window functions
Data analysis with SQL
Author

Nizami Nasibov
Oracle SQL / Data Analytics Portfolio Project
