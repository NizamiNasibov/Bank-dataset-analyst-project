--1. Branches

INSERT INTO Branches (Branch_Name, Region)
SELECT DISTINCT
       Branch,
       Region
FROM bank
WHERE Branch IS NOT NULL;

--2. Customer

INSERT INTO Customer (
    Customer_ID,
    Customer_Name,
    Customer_Age,
    Customer_Income,
    Account_Type,
    Credit_Score,
    Branch_ID
)
SELECT
    b.Customer_ID,
    MAX(b.Customer_Name),
    MAX(b.Customer_Age),
    MAX(b.Customer_Income),
    MAX(b.Account_Type),
    MAX(b.Credit_Score),
    MAX(br.Branch_ID)
FROM bank b
JOIN Branches br
    ON b.Branch = br.Branch_Name
GROUP BY b.Customer_ID;

3. Loans
  
INSERT INTO Loans (
    Loan_ID,
    Customer_ID,
    Loan_Amount,
    Loan_Status
)
SELECT DISTINCT
       Loan_ID,
       Customer_ID,
       Loan_Amount,
       Loan_Status
FROM bank
WHERE Loan_ID IS NOT NULL;

4. Transactions
  
INSERT INTO Transactions (
    Transaction_ID,
    Customer_ID,
    Loan_ID,
    Transaction_Date,
    Transaction_Type,
    Transaction_Amount,
    Fraud_Flag
)
SELECT DISTINCT
       Transaction_ID,
       Customer_ID,
       Loan_ID,
       TO_DATE(Transaction_Date,'YYYY-MM-DD'),
       Transaction_Type,
       Transaction_Amount,
       Fraud_Flag
FROM bank;
