# 🔍 Data Validation, Data Cleaning & Exploratory Data Analysis (EDA)

This document describes the SQL queries used to validate, clean, and analyze the banking dataset after importing it into the Oracle database.

---

# 1. Data Validation

## Check the number of records

Verify that all tables were imported successfully.

```sql
SELECT COUNT(*) FROM Customers;
SELECT COUNT(*) FROM Loans;
SELECT COUNT(*) FROM Transactions;
```

---

## Check for missing values

Find records with missing loan amounts.

```sql
SELECT COUNT(*)
FROM Loans
WHERE Loan_Amount IS NULL;
```

---

## Check for duplicate customers

Verify that every customer has a unique Customer_ID.

```sql
SELECT Customer_ID,
       COUNT(*)
FROM Customers
GROUP BY Customer_ID
HAVING COUNT(*) > 1;
```

---

## Check for negative loan amounts

Loan amounts should never be negative.

```sql
SELECT *
FROM Loans
WHERE Loan_Amount < 0;
```

---

# 2. Data Cleaning

The following cleaning steps were performed before analysis:

* Removed records with missing Loan_ID values.
* Checked and removed duplicate records.
* Verified that loan amounts and transaction amounts are not negative.
* Ensured data consistency across all tables.

### Remove records with missing Loan_ID

```sql
DELETE FROM Loans
WHERE Loan_ID IS NULL;
```

---

# 3. Exploratory Data Analysis (EDA)

## Average loan amount

```sql
SELECT AVG(Loan_Amount) AS Average_Loan
FROM Loans;
```

---

## Maximum loan amount

```sql
SELECT MAX(Loan_Amount) AS Maximum_Loan
FROM Loans;
```

---

## Total amount of loans issued

```sql
SELECT SUM(Loan_Amount) AS Total_Loan_Amount
FROM Loans;
```

---

## Top 10 customers by total loan amount

```sql
SELECT Customer_ID,
       SUM(Loan_Amount) AS Total_Loan
FROM Loans
GROUP BY Customer_ID
ORDER BY Total_Loan DESC
FETCH FIRST 10 ROWS ONLY;
```

---

## Total transaction amount by customer

```sql
SELECT Customer_ID,
       SUM(Transaction_Amount) AS Total_Transactions
FROM Transactions
GROUP BY Customer_ID;
```

---

## Average credit score of customers

```sql
SELECT Customer_ID,
       AVG(Credit_Score) AS Average_Credit_Score
FROM Customers
GROUP BY Customer_ID;
```

---

## Loan applications by status

```sql
SELECT Loan_Status,
       COUNT(*) AS Loan_Count
FROM Loans
GROUP BY Loan_Status
ORDER BY Loan_Count DESC;
```

---

## Total loan amount by status

```sql
SELECT Loan_Status,
       SUM(Loan_Amount) AS Total_Loan_Amount
FROM Loans
GROUP BY Loan_Status;
```

---

## Average loan amount by status

```sql
SELECT Loan_Status,
       ROUND(AVG(Loan_Amount), 2) AS Average_Loan
FROM Loans
GROUP BY Loan_Status;
```

---

## Loan approval rate

```sql
SELECT ROUND(
       COUNT(CASE WHEN Loan_Status = 'Approved' THEN 1 END) * 100.0
       / COUNT(*),
       2
) AS Approval_Rate
FROM Loans;
```

---

# 📌 Summary

The dataset was successfully validated and cleaned before analysis. Data quality checks included:

* ✅ Row count verification
* ✅ Missing value detection
* ✅ Duplicate detection
* ✅ Negative value validation
* ✅ Data cleaning

The Exploratory Data Analysis (EDA) provided insights into loan distribution, customer activity, transaction volumes, credit scores, and loan approval performance.

#
