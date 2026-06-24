
Create table Customer(
customer_id varchar2(20) primary key,
customer_name varchar2 (100),
customer_age number(3),
customer_income number(12,2),
Account_type varchar2(50),
Credit_score number (3),
Branch_ID NUMBER REFERENCES Branches(Branch_ID)
);

CREATE TABLE Branches (
    Branch_ID    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Branch_Name  VARCHAR2(50) UNIQUE NOT NULL,
    Region       VARCHAR2(20) NOT NULL
);

CREATE TABLE Loans (
    Loan_ID      VARCHAR2(20) PRIMARY KEY,
    Customer_ID  VARCHAR2(20) REFERENCES Customer(Customer_ID),
    Loan_Amount  NUMBER(12,2),
    Loan_Status  VARCHAR2(20)
);

CREATE TABLE Transactions (
    Transaction_ID      VARCHAR2(20) PRIMARY KEY,
    Customer_ID         VARCHAR2(20) REFERENCES Customer(Customer_ID),
    Loan_ID              VARCHAR2(20) REFERENCES Loans(Loan_ID),
    Transaction_Date     DATE,
    Transaction_Type     VARCHAR2(20),
    Transaction_Amount   NUMBER(12,2),
    Fraud_Flag           VARCHAR2(5)
    
);
