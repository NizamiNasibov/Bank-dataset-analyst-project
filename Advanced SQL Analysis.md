### 1. Top 10 Customers by Total Transaction Amount:
```sql
SELECT
    Customer_ID,
    SUM(Transaction_Amount) AS Total_Transactions
FROM Transactions
GROUP BY Customer_ID
ORDER BY Total_Transactions DESC
FETCH FIRST 10 ROWS ONLY;
```
### 2. Rank Customers by Total Transaction Amount
```sql
SELECT
    Customer_ID,
    SUM(Transaction_Amount) AS Total_Transactions,
    RANK() OVER(ORDER BY SUM(Transaction_Amount) DESC) AS Customer_Rank
FROM Transactions
GROUP BY Customer_ID;
```
### 3. Running Total of Transactions
```sql
SELECT
    Customer_ID,
    Transaction_Date,
    Transaction_Amount,
    SUM(Transaction_Amount) OVER(
        PARTITION BY Customer_ID
        ORDER BY Transaction_Date
    ) AS Running_Total
FROM Transactions;
```
### 4. Average Transaction Amount per Customer
``` sql
SELECT
    Customer_ID,
    Transaction_Date,
    Transaction_Amount,
    AVG(Transaction_Amount) OVER(
        PARTITION BY Customer_ID
    ) AS Average_Transaction
FROM Transactions;
```
### 5. Largest Transaction of Each Customer
```sql
SELECT *
FROM (
    SELECT
        Transaction_ID,
        Customer_ID,
        Transaction_Amount,
        ROW_NUMBER() OVER(
            PARTITION BY Customer_ID
            ORDER BY Transaction_Amount DESC
        ) AS rn
    FROM Transactions
)
WHERE rn = 1;
```
### 6. Customer Credit Risk Classification
```sql
SELECT
    Customer_ID,
    Credit_Score,
    CASE
        WHEN Credit_Score >= 750 THEN 'Low Risk'
        WHEN Credit_Score >= 650 THEN 'Medium Risk'
        ELSE 'High Risk'
    END AS Risk_Level
FROM Customers;
```
### 7. Loan Approval Statistics
```sql
SELECT
    Loan_Status,
    COUNT(*) AS Total_Loans,
    ROUND(
        COUNT(*) * 100 /
        SUM(COUNT(*)) OVER(),
        2
    ) AS Percentage
FROM Loans
GROUP BY Loan_Status;
````
### 8. Customers Without Loans
```sql
SELECT
    c.Customer_ID,
    c.Customer_Name
FROM Customers c
LEFT JOIN Loans l
ON c.Customer_ID = l.Customer_ID
WHERE l.Customer_ID IS NULL;
```
### 9. Customers Without Transactions
```SELECT
    c.Customer_ID,
    c.Customer_Name
FROM Customers c
LEFT JOIN Transactions t
ON c.Customer_ID = t.Customer_ID
WHERE t.Customer_ID IS NULL;
```
### 10. Total Loan Amount per Customer
``` sql
SELECT
    Customer_ID,
    SUM(Loan_Amount) AS Total_Loan
FROM Loans
GROUP BY Customer_ID;
```
### 11. Average Loan Amount by Status
```sql
SELECT
    Loan_Status,
    ROUND(AVG(Loan_Amount),2) AS Average_Loan
FROM Loans
GROUP BY Loan_Status;
```
### 12. Customer Share of Total Transaction Volume
``` sql
SELECT
    Customer_ID,
    SUM(Transaction_Amount) AS Total_Amount,
    ROUND(
        SUM(Transaction_Amount) * 100 /
        SUM(SUM(Transaction_Amount)) OVER(),
        2
    ) AS Share_Percentage
FROM Transactions
GROUP BY Customer_ID;
```
### 13. Branch Performance
```sql 
SELECT
    c.Branch,
    COUNT(DISTINCT c.Customer_ID) AS Customers,
    COUNT(t.Transaction_ID) AS Transactions,
    SUM(t.Transaction_Amount) AS Total_Amount
FROM Customers c
JOIN Transactions t
ON c.Customer_ID = t.Customer_ID
GROUP BY c.Branch;
```
### 14. Detect Large Transactions
```sql
SELECT
    Transaction_ID,
    Customer_ID,
    Transaction_Amount
FROM Transactions
WHERE Transaction_Amount >
(
    SELECT AVG(Transaction_Amount) * 2
    FROM Transactions
);
```
### 15. Monthly Transaction Volume
```sql
SELECT
    TO_CHAR(Transaction_Date,'YYYY-MM') AS Month,
    SUM(Transaction_Amount) AS Total_Transactions
FROM Transactions
GROUP BY TO_CHAR(Transaction_Date,'YYYY-MM')
ORDER BY Month;
```
### 16. Customer Income Segmentation
```sql 
SELECT
    Customer_ID,
    Customer_Name,
    Customer_Income,
    CASE
        WHEN Customer_Income < 3000 THEN 'Low Income'
        WHEN Customer_Income < 7000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS Income_Group
FROM Customers;
```
### 17. Customer Activity Summary
```sql
SELECT
    Customer_ID,
    COUNT(*) AS Transactions_Count,
    SUM(Transaction_Amount) AS Total_Amount,
    AVG(Transaction_Amount) AS Average_Amount,
    MAX(Transaction_Amount) AS Largest_Transaction
FROM Transactions
GROUP BY Customer_ID;
```
### 18. Customers Spending Above Average (CTE)
```sql
WITH CustomerTotals AS (
    SELECT
        Customer_ID,
        SUM(Transaction_Amount) AS TotalSpent
    FROM Transactions
    GROUP BY Customer_ID
)
SELECT *
FROM CustomerTotals
WHERE TotalSpent >
(
    SELECT AVG(TotalSpent)
    FROM CustomerTotals
);
```
### 19. Loans Above Average Amount
```sql
SELECT
    Loan_ID,
    Customer_ID,
    Loan_Amount
FROM Loans
WHERE Loan_Amount >
(
    SELECT AVG(Loan_Amount)
    FROM Loans
);
````
### 20. Account Type Analysis
```sql
SELECT
    Account_Type,
    COUNT(*) AS Customers,
    ROUND(AVG(Customer_Income),2) AS Avg_Income,
    ROUND(AVG(Credit_Score),2) AS Avg_Credit_Score
FROM Customers
GROUP BY Account_Type;
```



