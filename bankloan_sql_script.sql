use bankloan;

-- KPI - DASHBOARD 1 - SUMMARY

-- total loan applications

select count(id) as Total_Loan_Applications
from financial_loan_data; -- 38576

select count(id) as MTD_Total_Loan_Applications
from financial_loan_data
where  month(issue_date) = 12 and year(issue_date)=2021; -- 4314

select count(id) as PMTD_Total_Loan_Applications
from financial_loan_data
where  month(issue_date) = 11 and year(issue_date)=2021; -- 4035

-- MOM=(MTD-PMTD)/PMTD

-- total funded amount

select sum(loan_amount)as Total_Funded_Amount 
from financial_loan_data; -- 435757075

select sum(loan_amount)as MTD_Total_Funded_Amount 
from financial_loan_data
where month(issue_date)=12 and year(issue_date)=2021; -- 53981425

select sum(loan_amount)as PMTD_Total_Funded_Amount 
from financial_loan_data
where month(issue_date)=11 and year(issue_date)=2021; -- 47754825

-- total recieved amount

select sum(total_payment)as Total_Amount_Received
from financial_loan_data; -- 473070933

select sum(total_payment)as MTD_Total_Amount_Received
from financial_loan_data
where month(issue_date)=12 and year(issue_date)=2021; -- 58074380

select sum(total_payment)as PMTD_Total_Amount_Received
from financial_loan_data
where month(issue_date)=11 and year(issue_date)=2021; -- 50132030

-- Average interest rate

select round(avg(int_rate)*100, 2) as Avg_Interest_Rate
from financial_loan_data; -- 12.05

select round(avg(int_rate)*100, 2)as MTD_Avg_Interest_Rate
from financial_loan_data
where month(issue_date)=12 and year(issue_date)=2021; -- 12.36

select round(avg(int_rate)*100, 2)as PMTD_Avg_Interest_Rate 
from financial_loan_data
where month(issue_date)=11 and year(issue_date)=2021; -- 11.94

-- Average Debt-to-income (DTI) Ratio

select round(avg(dti) * 100, 2) as Avg_DTI 
from financial_loan_data; -- 13.33

select round(avg(dti)*100, 2)as MTD_Avg_DTI 
from financial_loan_data
where month(issue_date)=12 and year(issue_date)=2021; -- 13.67

select round(avg(dti)*100, 2)as PMTD_Avg_DTI 
from financial_loan_data
where month(issue_date)=11 and year(issue_date)=2021; -- 13.3

-- Good Loan

-- Good loan percentage

select 
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
    /
    COUNT(id) AS Good_Loan_Percentage
from financial_loan_data; -- 86.1753

-- Good loan application

select count(id) as Good_loan_Applications
from financial_loan_data
where loan_status = 'Fully paid' or loan_status = 'Current'; -- 33243

-- Good loan funded amount

select sum(loan_amount) as Good_loan_Funded_amount
from financial_loan_data
where loan_status = 'Fully paid' or loan_status = 'Current'; -- 370224850

-- Good loan total reieived amount

select sum(total_payment) as Good_loan_Received_amount
from financial_loan_data
where loan_status = 'Fully paid' or loan_status = 'Current'; -- 435786170

-- Bad loan

-- Bad loan percentage

select 
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END)*100)
    /
    COUNT(id) AS Bad_Loan_Percentage
from financial_loan_data; -- 13.8247

-- Bad loan application

select count(id) as Bad_loan_Applications
from financial_loan_data
where loan_status = 'Charged Off'; -- 5333

-- Bad loan funded amount

select sum(loan_amount) as Bad_loan_Funded_amount
from financial_loan_data
where loan_status = 'Charged Off'; -- 65532225

-- Bad loan total reieived amount

select sum(total_payment) as Bad_loan_Received_amount
from financial_loan_data
where loan_status = 'Charged Off'; -- 37284763

-- loan status grid view

select 
	loan_status,
    count(id) as Total_loan_application,
    sum(total_payment) as Total_amount_received,
    sum(loan_amount) as Total_funded_amount,
    avg(int_rate * 100) as Interest_rate,
    avg(dti * 100) as DTI
from financial_loan_data
group by loan_status;
    
-- Fully Paid	32145	411586256	351358350	11.641070773060042	13.167350754394208
-- Charged Off	5333	37284763	65532225	13.878574910931833	14.004732795799702
-- Current	    1098	24199914	18866500    15.099326047358753	14.724344262295066

-- for MTD

select 
	loan_status,
    sum(total_payment) as MTD_Total_amount_received,
    sum(loan_amount) as MTD_Total_funded_amount
from financial_loan_data
where month(issue_date) = 12
group by loan_status;

-- Fully Paid	47815851	41302025
-- Charged Off	5324211	    8732775
-- Current   	4934318	    3946625


