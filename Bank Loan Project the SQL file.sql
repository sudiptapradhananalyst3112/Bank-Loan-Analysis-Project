select * from Bank_Loan_Data

select count(id) as Total_Loan_Applications from Bank_Loan_Data

select count(id) as MTD_Total_Loan_Applications from Bank_Loan_Data
where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

select count(id) as PMTD_Total_Loan_Applications from Bank_Loan_Data
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


select SUM(loan_amount) as MTD_Total_Funded_Amount from Bank_Loan_Data
where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

select SUM(loan_amount) as PMTD_Total_Funded_Amount from Bank_Loan_Data
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

select SUM(total_payment) as MTD_Total_Payment_Received from Bank_Loan_Data
where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

select SUM(total_payment) as PMTD_Total_Payment_Received from Bank_Loan_Data
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

select avg(int_rate)* 100 as MTD_Avg_Interest_Rate from Bank_Loan_Data
where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

select avg(int_rate)* 100 as MTD_Avg_Interest_Rate from Bank_Loan_Data
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

select avg(dti)* 100 as MTD_Avg_DTI_Rate from Bank_Loan_Data
where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

select avg(dti)* 100 as PMTD_Avg_DTI_Rate from Bank_Loan_Data
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

Select loan_status from Bank_Loan_Data

Select
(count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id END )*100)
/
count(id) as Good_loan_percentage 
from Bank_Loan_Data

Select count(id) as Good_Loan_Applications from Bank_Loan_Data
where loan_status = 'Fully Paid' or loan_status = 'Current'

Select sum(loan_amount) as Good_Loan_Funded_Amount from Bank_Loan_Data
where loan_status = 'Fully Paid' or loan_status = 'Current'

Select sum(total_payment) as Good_Loan_Received_Amount from Bank_Loan_Data
where loan_status = 'Fully Paid' or loan_status = 'Current'

SELECT 
    (SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) * 100.0) / 
    COUNT(id) AS Bad_Loan_Percentage
FROM Bank_Loan_Data;

Select count(id) as Bad_Loan_Applications from Bank_Loan_Data
where loan_status = 'Charged Off'

Select sum(loan_amount) as Bad_Loan_Funded_Amount from Bank_Loan_Data
where loan_status = 'Charged Off'


Select sum(total_payment) as Bad_Loan_Received_Amount from Bank_Loan_Data
where loan_status = 'Charged Off'

-- it is really bad for bank. Bank Can not make proper profits.

select
    loan_status,
    count(id) as Total_Loan_Applications,
    sum(total_payment) as Total_Amount_Received,
    sum(loan_amount) as Total_Funded_Amount,
    Avg(int_rate * 100) as Interest_Rate , 
    avg(dti*100) As DTI
    From 
    Bank_Loan_Data
    Group by 
    loan_status

    -- (Fully Paid And current r cutie cx for Banks But Bank should Worry About the Charged off They r like katappa for Banks)


    select
    loan_status,
    SUM(total_payment) as MTD_Total_Payment_Received,
    SUM(loan_amount) as MTD_Total_Funded_Amount
    From Bank_Loan_Data
    where MONTH(issue_date) = 12
     Group by loan_status

     Select
     MONTH(issue_date) as Month_Number,
     Datename(month, issue_date) as Month_Name,
     count(id) as Total_Loan_Applications,
     sum(loan_amount) as Total_Funded_Amount,
     sum(total_payment) as Total_Received_Amount
     From Bank_Loan_Data
     Group by MONTH(issue_date),Datename(month, issue_date)
     order by MONTH(issue_date)

     -- (This is why i love sql cutie pie. Easy coading full data loading.)

     Select
     address_state,
     count(id) as Total_Loan_Applications,
     sum(loan_amount) as Total_Funded_Amount,
     sum(total_payment) as Total_Received_Amount
     From Bank_Loan_Data
     Group by address_state
     order by address_state

     -- (Here we can see Loan details by state)

      Select
    term,
     count(id) as Total_Loan_Applications,
     sum(loan_amount) as Total_Funded_Amount,
     sum(total_payment) as Total_Received_Amount
     From Bank_Loan_Data
     Group by term
     order by term


     Select
      emp_length,
     count(id) as Total_Loan_Applications,
     sum(loan_amount) as Total_Funded_Amount,
     sum(total_payment) as Total_Received_Amount
     From Bank_Loan_Data
     Group by emp_length
     order by emp_length

      Select
      purpose,
     count(id) as Total_Loan_Applications,
     sum(loan_amount) as Total_Funded_Amount,
     sum(total_payment) as Total_Received_Amount
     From Bank_Loan_Data
     Group by purpose
     order by purpose

     Select
     home_ownership,
     count(id) as Total_Loan_Applications,
     sum(loan_amount) as Total_Funded_Amount,
     sum(total_payment) as Total_Received_Amount
     From Bank_Loan_Data
     Group by home_ownership
     order by home_ownership

    -- (SQl its done Bro)