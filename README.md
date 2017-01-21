# Automated Loan Approval System

## DESCRIPTION
Loan approval in certain banks and organization are very strict, the process involves collection of data from the customer and running credit analysis metrics to know whether the customer is eligible for a loan. Banks or organizations which loans money usually take a few days or weeks to approve a loan. To automate this process and make things easier and faster for the customer and the banker we can write a Jess Rule Based Program to decide whether a customer is eligible for a loan or not. To write this program we need to first know what exactly we need to decide whether a customer is eligible for the loan he/she asks for. Basic information from the customer has to be collected to make this decision. So in this program, the different metrics that are collected from the user are Age, Gender, Job, Education, Credit Score and Marital Status. After all this information is collected from the user, the user is asked the amount the user desires to borrow and then the Jess Program checks whether the customer is eligible for a loan. The various categories for which a loan can be accepted or rejected are given in comments in the Jess Program (LoanApproval_pat.clp). A flowchart for the Jess Rule Based Automated Loan Approval System is given below:-


## KNOWLEDGE BASE
### KNOWLEDGE BASE DESCRIPTION
The Knowledge Based here is given by the user to the Program to make decisions based the on the
facts that the user enters. The facts in the program are: -
* customer-age :- The age of the customer
* customer-gender :- The gender of the customer
* customer-edu :- The education level of the customer
* customer-cred :- The approximate credit score of the customer
* customer-mar :- The marital status of the customer
* customer-job :- whether the customer has a job or not
* customer-sal :- Salary of the customer if the customer has a job
* customer-oin :- Other sources of income of the customer is the customer has no job
* customer-loan :- The loan amount chosen by the customer
### KNOWLEDGE BASE IN JESS
NOTE: - The Knowledge base is given below in Jess. The knowledge base is determined by the user,
as the user enters information, the choices are asserted, hence facts are defined and this is used as
KB to make decisions.
```
(deffunction print-age-gender()
(printout t "----------|WELCOME TO AUTOMATED LOAN APPROVAL SYSTEM|-------
---" crlf)
(printout t "The software is meant to automate the loan approval
process," crlf)
(printout t "usually loan approvals takes several days or weeks of credit
analysis" crlf)
(printout t "to approve. This application automates a process which takes
a long time." crlf crlf)
(printout t "Kindly answer the following questions to start:-" crlf)
(printout t "How old are you?" crlf)
(printout t "1.below 25" crlf)
(printout t "2.26-50" crlf)
(printout t "3.50-75" crlf)
(printout t "4.above 75"crlf)
(printout t "Enter your choice(1/2/3/4):-" crlf crlf)
(bind ?age (read))
(printout t "Are you a male/female?" crlf)(printout t "1.Male" crlf)
(printout t "2.Female" crlf)
(printout t "Enter your choice(1/2):-" crlf crlf)
(bind ?gender (read))
(assert (customer-age (age ?age)))
(assert (customer-gender (gender ?gender)))
)
; Ask user the Level of Education and Credit Score
(deffunction ask-edu-credit()
(printout t "What is your highest level of education?" crlf)
(printout t "1. High School" crlf)
(printout t "2. Bachelors" crlf)
(printout t "3. Masters" crlf)
(printout t "Enter your choice(1/2/3):-" crlf crlf)
(bind ?edu (read))
(printout t "What does your credit score looking like?" crlf)
(printout t "1. Below 650" crlf)
(printout t "2. 650-700" crlf)
(printout t "3. 700-750" crlf)
(printout t "4. 750-800" crlf)
(printout t "5. Above 800" crlf)
(printout t "Enter your choice(1/2/3/4/5):-" crlf)
(bind ?cred (read))
(assert (customer-edu (edu ?edu)))
(assert (customer-cred (cred ?cred)))
)
; Ask user the Marital Status
(deffunction ask-marital()
(printout t "What is your marital status?" crlf)
(printout t "1. Single" crlf)
(printout t "2. Married" crlf)
(printout t "3. Divorced" crlf)
(printout t "4. Seperated" crlf)
(printout t "Enter your choice(1/2/3/4):-" crlf crlf)
(bind ?mar (read))
(assert (customer-mar (mar ?mar)))
)
; Ask user whether the user has a job or not
(deffunction ask-job()
(printout t "Do you have a Job?" crlf)
(printout t "1.Yes" crlf)
(printout t "2.No" crlf)
(printout t "Enter your choice(1/2):-" crlf crlf)
(bind ?job (read))
(assert (customer-job (job ?job))))
; Ask the user the range of Salary he/she recieves
(deffunction ask-sal()
(printout t "What is your Salary?" crlf)
(printout t "1. Below $50,000 per annum" crlf)
(printout t "2. $50,000 - $100,000 per annum" crlf)
(printout t "3. Above $100,000 per annum" crlf)
(printout t "Enter your choice(1/2/3):-" crlf crlf)
(bind ?sal (read))
(assert (customer-sal (sal ?sal)))
)
; Ask user what amount of loan is user looking to borrow
(deffunction ask-loan()
(printout t "What amount of loan do you want to borrow?" crlf)
(printout t "1. Upto $10,000" crlf)
(printout t "2. Upto $25,000" crlf)
(printout t "3. Upto $50,000" crlf)
(printout t "4. Upto $75,000" crlf)
(printout t "5. Upto $100,000" crlf)
(printout t "Enter your choice(1/2/3/4/5):-" crlf crlf)
(bind ?loan (read))
(if (eq ?loan 1) then
(assert(customer-loan(loan
(if (eq ?loan 2) then
(assert(customer-loan(loan
(if (eq ?loan 3) then
(assert(customer-loan(loan
(if (eq ?loan 4) then
(assert(customer-loan(loan
(if (eq ?loan 5) then
(assert(customer-loan(loan
)
10000))))
25000))))
50000))))
75000))))
100000))))
```
## TEST CASES
### TEST CASE 1
```
----------|WELCOME TO AUTOMATED LOAN APPROVAL SYSTEM|----------
The software is meant to automate the loan approval process,
usually loan approvals takes several days or weeks of credit analysis
to approve. This application automates a process which takes a long time.
Kindly answer the following questions to start:-
How old are you?
1.below 25
2.26-50
3.50-75
4.above 75
Enter your choice(1/2/3/4):-
2
Are you a male/female?
1.Male
2.Female
Enter your choice(1/2):-
1
What is your highest level of education?
1. High School
2. Bachelors
3. Masters
Enter your choice(1/2/3):-
3
What does your credit score looking like?
1. Below 650
2. 650-700
3. 700-750
4. 750-800
5. Above 800
Enter your choice(1/2/3/4/5):-
3
What is your marital status?
1. Single
2. Married
3. Divorced
4. Seperated
Enter your choice(1/2/3/4):-
2
Do you have a Job?
1.Yes
2.No
Enter your choice(1/2):-
1
What is your Salary?
1. Below $50,000 per annum
2. $50,000 - $100,000 per annum3. Above $100,000 per annum
Enter your choice(1/2/3):-
2
What amount of loan do you want to borrow?
1. Upto $10,000
2. Upto $25,000
3. Upto $50,000
4. Upto $75,000
5. Upto $100,000
Enter your choice(1/2/3/4/5):-
2
CONGRATS!! YOUR APPROVAL FOR A LOAN HAS BEEN ACCEPTED UNDER CATEGORY 4
You are eligible for a Loan upto $50,000
```
### TEST CASE 2
```
----------|WELCOME TO AUTOMATED LOAN APPROVAL SYSTEM|----------
The software is meant to automate the loan approval process,
usually loan approvals takes several days or weeks of credit analysis
to approve. This application automates a process which takes a long time.
Kindly answer the following questions to start:-
How old are you?
1.below 25
2.26-50
3.50-75
4.above 75
Enter your choice(1/2/3/4):-
3
Are you a male/female?
1.Male
2.Female
Enter your choice(1/2):-
2
What is your highest level of education?
1. High School
2. Bachelors
3. Masters
Enter your choice(1/2/3):-
3
What does your credit score looking like?
1. Below 650
2. 650-700
3. 700-750
4. 750-800
5. Above 800
Enter your choice(1/2/3/4/5):-
5
What is your marital status?
1. Single
2. Married3. Divorced
4. Seperated
Enter your choice(1/2/3/4):-
3
Do you have a Job?
1.Yes
2.No
Enter your choice(1/2):-
1
What is your Salary?
1. Below $50,000 per annum
2. $50,000 - $100,000 per annum
3. Above $100,000 per annum
Enter your choice(1/2/3):-
3
What amount of loan do you want to borrow?
1. Upto $10,000
2. Upto $25,000
3. Upto $50,000
4. Upto $75,000
5. Upto $100,000
Enter your choice(1/2/3/4/5):-
3
CONGRATS!! YOUR APPROVAL FOR A LOAN HAS BEEN ACCEPTED UNDER CATEGORY 4
You are eligible for a Loan upto $50,000
```
### TEST CASE 3
```
----------|WELCOME TO AUTOMATED LOAN APPROVAL SYSTEM|----------
The software is meant to automate the loan approval process,
usually loan approvals takes several days or weeks of credit analysis
to approve. This application automates a process which takes a long time.
Kindly answer the following questions to start:-
How old are you?
1.below 25
2.26-50
3.50-75
4.above 75
Enter your choice(1/2/3/4):-
1
Are you a male/female?
1.Male
2.Female
Enter your choice(1/2):-
1
What is your highest level of education?
1. High School
2. Bachelors
3. MastersEnter your choice(1/2/3):-
1
What does your credit score looking like?
1. Below 650
2. 650-700
3. 700-750
4. 750-800
5. Above 800
Enter your choice(1/2/3/4/5):-
1
What is your marital status?
1. Single
2. Married
3. Divorced
4. Seperated
Enter your choice(1/2/3/4):-
2
Do you have a Job?
1.Yes
2.No
Enter your choice(1/2):-
2
Do you have any other sources of income?
1.Yes
2.No
Enter your choice(1/2):-
2
What amount of loan do you want to borrow?
1. Upto $10,000
2. Upto $25,000
3. Upto $50,000
4. Upto $75,000
5. Upto $100,000
Enter your choice(1/2/3/4/5):-
1
We are Sorry to inform you that your approval for a Loan
has been REJECTED under CATEGORY 9
```
### ABOUT PROJECT

This Project was done as a part of CS:514 Applied Artificial Intelligence at UIC