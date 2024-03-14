use portfolio;
select * from loan;

#FIND OUT THE IMPORTANT KPI'S FOR CHART REQUIREMENT

#TOTAL APPLICATION APPLYING FOR TAKING LOAN
select count(ID)  as Total_Application from loan;

#TOTAL AMOUNT TO BE FUNDED
select sum(loan_amount) as total_amount_funded from loan;

use portfolio;
#total payment received
select sum(total_payment) as total_amount_received from loan;

#average interest rate
select round(avg(int_rate),2)*100 as average_interest_rate from loan;

#average dti Rate
select round(avg(dti),2)*100 as average_dti_rate from loan;    #debit to income ration

#GOOD LOAN --- GOOD LOAN APPLICATION PERCENTAGE

select loan_status from loan;
select (count(case when loan_status = 'Fully Paid' or  loan_status ='Current' then ID end)*100/count(id))  as GOOD_LOAN_PERCENT from loan;

select (count(case when loan_status = 'Fully Paid' or  loan_status ='Current' then ID end) ) as GOOD_LOAN_APPLICATION from loan;

#good loan funded amount

select * from loan;
select sum(loan_amount) as good_laon_amount from loan where loan_status='Current' or loan_status='Fully Paid';

select sum(total_payment) as good_laon_amount from loan where loan_status='Current' or loan_status='Fully Paid';

#BAD LOAN FUNDED AMOUNT
select (count(case when loan_status = 'Charged off' then ID end)*100/count(id))  as BAD_LAON_FUNDED from loan;

#BAD LOAN PERCENTAGE 
select (count(case when loan_status = 'charged off' then ID end)) as BAD_LOAN_AMOUNT from loan;
select sum(loan_amount) as bad_loan from loan where loan_status= 'Charged off' ;

#bad LOAN RECEIVED AMOUNT
select * from loan;
select sum(total_payment)  as bad_loan_received from loan where loan_status= ' Charged Off';

-- THANK YOU --