1. Ранжирование клиентов по сумме кредитов (RANK)

Задача: найти самых крупных заемщиков.

SELECT Customer_ID,
       SUM(Loan_Amount) AS Total_Loan,
       RANK() OVER (
           ORDER BY SUM(Loan_Amount) DESC
       ) AS Loan_Rank
FROM Loans
GROUP BY Customer_ID;

Используется:

RANK()
OVER()

2. ТОП-3 клиента в каждом филиале
Select*from(
Select a.branch_id,a.customer_id,sum (b.loan_amount)as total ,
row_number() over (partition by a.branch_id order by sum (b.loan_amount) desc) as loan
from customer a join loans b on   a.customer_id=b.customer_id
group by a.branch_id,a.customer_id)
where loan<=3;
