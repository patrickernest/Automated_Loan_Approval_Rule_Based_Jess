; Project 1

; CS 514 : Applied Artificial Intelligence

; Jess Classic Rule Based System

; Automated Loan Approval System

; Author : Teddy615

; This is an application which checks approves eligiblity for loans,
; Usually it take a few days for approval of loan amounts, where the
; banker or organization run several credit checks on the client, this
; automates the manual efforts of an individual to know whether the 
; customer is eligible for a loan or not.


; DEFTEMPLATES

; Every factor that is used to determine the eligiblity
; for a loan is given as a deftemplate so the user income
; can be assertted as a fact to make a decision

(deftemplate customer-age(slot age))
(deftemplate customer-gender(slot gender))

(deftemplate customer-edu(slot edu))
(deftemplate customer-cred(slot cred))

(deftemplate customer-mar(slot mar))

(deftemplate customer-job(slot job))

(deftemplate customer-sal(slot sal))

(deftemplate customer-oin(slot oin))

(deftemplate customer-loan(slot loan))


; DEFFUNCTIONS

; Ask the user Age and Gender

(deffunction print-age-gender()
    (printout t "----------|WELCOME TO AUTOMATED LOAN APPROVAL SYSTEM|----------" crlf)
    (printout t "The software is meant to automate the loan approval process," crlf)
    (printout t "usually loan approvals takes several days or weeks of credit analysis" crlf)
    (printout t "to approve. This application automates a process which takes a long time." crlf crlf)
    (printout t "Kindly answer the following questions to start:-" crlf)
    (printout t "How old are you?" crlf)
    (printout t "1.below 25" crlf)
    (printout t "2.26-50" crlf)
    (printout t "3.50-75" crlf)
    (printout t "4.above 75"crlf)
    (printout t "Enter your choice(1/2/3/4):-" crlf crlf)
    (bind ?age (read)) 
    
    (printout t "Are you a male/female?" crlf)
    (printout t "1.Male" crlf)
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
    
    (assert (customer-job (job ?job)))
)

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
		(assert(customer-loan(loan 10000))))
    (if (eq ?loan 2) then 
		(assert(customer-loan(loan 25000))))
    (if (eq ?loan 3) then 
		(assert(customer-loan(loan 50000))))
    (if (eq ?loan 4) then 
		(assert(customer-loan(loan 75000))))
    (if (eq ?loan 5) then 
		(assert(customer-loan(loan 100000))))
    )

; Ask user whether the user has any other sources of income
    
(deffunction ask-oin()
    (printout t "Do you have any other sources of income?" crlf)
    (printout t "1.Yes" crlf)
    (printout t "2.No" crlf)
    (printout t "Enter your choice(1/2):-" crlf crlf)
    (bind ?oin (read))
    
    (assert (customer-oin (oin ?oin)))
    )

; RULE 1
; The application starts here
    
(defrule get-info
=> 
(print-age-gender))

; RULE 2

(defrule age-gender
    (customer-age {age == 1 || age == 2 || age == 3 || age == 4} )
    (customer-gender{gender == 1 || gender == 2})
    =>
    (ask-edu-credit)
    )

; RULE 3

(defrule age-gender-bad-entry
    (customer-age  (age ?a&~1&~2&~3&~4)) 
    =>
    (printout t "INCORRECT INPUT! ENTER AGAIN!" crlf)
    (print-age-gender)
    )

; RULE 4

(defrule age-gender-bad-entry2
    (customer-gender (gender ?g&~1&~2))
    =>
    (printout t "INCORRECT INPUT! ENTER AGAIN!" crlf)
    (print-age-gender)
    )

; RULE 5

(defrule proceed-edu-cred
	(customer-age {age == 1 || age == 2 || age == 3 || age == 4} )
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-cred {cred == 1 || cred == 2 || cred == 3 || cred == 4 || cred == 5})
	=>
	(ask-marital))

; RULE 6

(defrule proceed-edu-cred-bad-entry
	(customer-edu  (edu ?a&~1&~2&~3&~4)) 
    
    =>
    (printout t "INCORRECT INPUT! ENTER AGAIN!" crlf)
    (ask-edu-credit)
    )

; RULE 7

(defrule proceed-edu-cred-bad-entry2
	(customer-cred (cred ?g&~1&~2&~3&~4&~5))
    =>
    (printout t "INCORRECT INPUT! ENTER AGAIN!" crlf)
    (ask-edu-credit)
    )

; RULE 8

(defrule proceed-marital
    (customer-age {age == 1 || age == 2 || age == 3 || age == 4} )
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-cred {cred == 1 || cred == 2 || cred == 3 || cred == 4 || cred == 5})
    (customer-mar {mar == 1 || mar == 2 || mar == 3 || mar == 4} )
    =>
    (ask-job)
    )

; RULE 9

(defrule proceed-marital-bad-entry
    (customer-mar (mar ?m&~1&~2&~3&~4))
    =>
    (printout t "INCORRECT INPUT! ENTER AGAIN!" crlf)
    (ask-marital)
    )

; RULE 10

(defrule proceed-job
    (customer-age {age == 1 || age == 2 || age == 3 || age == 4} )
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-cred {cred == 1 || cred == 2 || cred == 3 || cred == 4 || cred == 5})
    (customer-mar {mar == 1 || mar == 2 || mar == 3 || mar == 4} )
    (customer-job {job == 2})
    =>
    (ask-oin)
    (ask-loan)
    
    )

; RULE 11

(defrule proceed-job-bad-entry
    (customer-job (job ?j&~1&~2))
    =>
    (printout t "INCORRECT INPUT! ENTER AGAIN!" crlf)
    (ask-job)
    )
    
; RULE 12

(defrule proceed-sal
    (customer-age {age == 1 || age == 2 || age == 3 || age == 4} )
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-cred {cred == 1 || cred == 2 || cred == 3 || cred == 4 || cred == 5})
    (customer-mar {mar == 1 || mar == 2 || mar == 3 || mar == 4} )
    (customer-job {job == 1}) ;|| job == 2})
        (customer-sal {sal == 1 || sal == 2 || sal == 3})
        =>
        (printout t "THANK YOU FOR YOUR PATIENCE!" crlf crlf)
        )

; RULE 13

(defrule proceed-sal-bad-entry
    (customer-sal (sal ?s&~1&~2&~3))
    =>
    (printout t "INCORRECT INPUT! ENTER AGAIN!" crlf)
    (ask-sal)
    )

; RULE 14

(defrule proceed-oin
    (customer-age {age == 1 || age == 2 || age == 3 || age == 4} )
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-cred {cred == 1 || cred == 2 || cred == 3 || cred == 4 || cred == 5})
    (customer-mar {mar == 1 || mar == 2 || mar == 3 || mar == 4} )
    (customer-job {job == 2}) ;|| job == 2})
        (customer-oin {oin == 1 || oin == 2})
        =>
        (printout t "THANK YOU FOR YOUR PATIENCE!" crlf crlf)
        )

; RULE 15

(defrule proceed-oin-bad-entry
    (customer-oin (oin ?s&~1&~2))
    =>
    (printout t "INCORRECT INPUT! ENTER AGAIN!" crlf)
    (ask-oin)
    )

; RULE 16

(defrule proceed-loan-bad-entry
    (customer-loan (loan ?l&~10000&~25000&~50000&~75000&~100000))
    =>
    (printout t "INCORRECT INPUT! ENTER AGAIN!" crlf)
    (ask-loan)
    )

; RULE 17

(defrule proceed-job-with-sal
    (customer-age {age == 1 || age == 2 || age == 3 || age == 4} )
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-cred {cred == 1 || cred == 2 || cred == 3 || cred == 4 || cred == 5})
    (customer-mar {mar == 1 || mar == 2 || mar == 3 || mar == 4} )
    (customer-job {job == 1})
    =>
    (ask-sal)
    (ask-loan)
    )

; RULE 18

; CATEGORY 1
; A candidate with an age of below-25 or 25-50,
; Male or Female,
; Level of education High School, Bachelors or Masters,
; Marital Status Single, Married, Divorced or Seperated,
; A credit score of 700-750, 750-800 or Above 800,
; Has a Job,
; With a pay of Below $50,000, $50,000 - $100,000 or Above $100,000

(defrule category1-accept
    (customer-age {age == 1 || age == 2})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 1 || mar == 2 || mar == 3 || mar == 4} )
    (customer-job {job == 1})
    (customer-cred {cred == 3 || cred == 4 || cred == 5})
    (customer-sal {sal == 1 || sal == 2 || sal == 3})
    (customer-loan {loan <= 100000})
    =>
    (printout t "CONGRATS!! YOUR APPROVAL FOR A LOAN HAS BEEN ACCEPTED UNDER CATEGORY 1" crlf)
    (printout t "You are eligible for a Loan upto $100,000" crlf)
    (halt)
    )

; RULE 19

(defrule category1-reject
    (customer-age {age == 1 || age == 2})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 1 || mar == 2 || mar == 3 || mar == 4} )
    (customer-job {job == 1})
    (customer-cred {cred == 3 || cred == 4 || cred == 5})
    (customer-sal {sal == 1 || sal == 2 || sal == 3})
    (customer-loan {loan > 100000})
    =>
    (printout t "We are Sorry to inform you that your approval for a Loan" crlf)
    (printout t "has been REJECTED under CATEGORY 1" crlf)
    (halt)
    )

; RULE 20

; CATEGORY 2
; A candidate with an age of below-25 or 25-50,
; Male or Female,
; Level of education High School, Bachelors or Masters,
; Marital Status Single, Married, Divorced or Seperated,
; A credit score of Below 650, 650-700,
; Has a Job,
; With a pay of Below $50,000, $50,000 - $100,000 or Above $100,000

(defrule category2-accept
    (customer-age {age == 1 || age == 2})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 1 || mar == 2 || mar == 3 || mar == 4} )
    (customer-job {job == 1})
    (customer-cred {cred == 1 || cred == 2})
    (customer-sal {sal == 1 || sal == 2 || sal == 3})
    (customer-loan {loan <= 75000})
    =>
    (printout t "CONGRATS!! YOUR APPROVAL FOR A LOAN HAS BEEN ACCEPTED UNDER CATEGORY 2" crlf)
    (printout t "You are eligible for a Loan upto $75,000" crlf)
    (halt)
    )

; RULE 21

(defrule category2-reject
    (customer-age {age == 1 || age == 2})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 1 || mar == 2 || mar == 3 || mar == 4} )
    (customer-job {job == 1})
    (customer-cred {cred == 1 || cred == 2})
    (customer-sal {sal == 1 || sal == 2 || sal == 3})
    (customer-loan {loan > 75000})
    =>
    (printout t "We are Sorry to inform you that your approval for a Loan" crlf)
    (printout t "has been REJECTED under CATEGORY 2" crlf)
    (halt)
    )

; RULE 22

; CATEGORY 3
; A candidate with an age of 50-75 or Above 75,
; Male or Female,
; Level of education High School, Bachelors or Masters,
; Marital Status Single, Married, Divorced or Seperated,
; A credit score of Below 650, 650-700,
; Has a Job,
; With a pay of Below $50,000, $50,000 - $100,000 or Above $100,000

(defrule category3-accept
    (customer-age {age == 3 || age == 4})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 1 || mar == 2 || mar == 3 || mar == 4} )
    (customer-job {job == 1})
    (customer-cred {cred == 1 || cred == 2})
    (customer-sal {sal == 1 || sal == 2 || sal == 3})
    (customer-loan {loan <= 30000})
    =>
    (printout t "CONGRATS!! YOUR APPROVAL FOR A LOAN HAS BEEN ACCEPTED UNDER CATEGORY 3" crlf)
    (printout t "You are eligible for a Loan upto $30,000" crlf)
    (halt)
    )

; RULE 23

(defrule category3-reject
    (customer-age {age == 3 || age == 4})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 1 || mar == 2 || mar == 3 || mar == 4} )
    (customer-job {job == 1})
    (customer-cred {cred == 1 || cred == 2})
    (customer-sal {sal == 1 || sal == 2 || sal == 3})
    (customer-loan {loan > 30000})
    =>
    (printout t "We are Sorry to inform you that your approval for a Loan" crlf)
    (printout t "has been REJECTED under CATEGORY 3" crlf)
    (halt)
    )

; RULE 24

; CATEGORY 4
; A candidate with an age of 50-75 or Above 75,
; Male or Female,
; Level of education High School, Bachelors or Masters,
; Marital Status Single, Married, Divorced or Seperated,
; A credit score of 700-750, 750-800 or Above 800,
; Has a Job,
; With a pay of Below $50,000, $50,000 - $100,000 or Above &100,000

(defrule category4-accept
    (customer-age {age == 3 || age == 4})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 1 || mar == 2 || mar == 3 || mar == 4} )
    (customer-job {job == 1})
    (customer-cred {cred == 3 || cred == 4 || cred == 5})
    (customer-sal {sal == 1 || sal == 2 || sal == 3})
    (customer-loan {loan <= 50000})
    =>
    (printout t "CONGRATS!! YOUR APPROVAL FOR A LOAN HAS BEEN ACCEPTED UNDER CATEGORY 4" crlf)
    (printout t "You are eligible for a Loan upto $50,000" crlf)
    (halt)
    )

; RULE 25

(defrule category4-reject
    (customer-age {age == 3 || age == 4})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 1 || mar == 2 || mar == 3 || mar == 4} )
    (customer-job {job == 1})
    (customer-cred {cred == 3 || cred == 4 || cred == 5})
    (customer-sal {sal == 1 || sal == 2 || sal == 3})
    (customer-loan {loan > 50000})
    =>
    (printout t "We are Sorry to inform you that your approval for a Loan" crlf)
    (printout t "has been REJECTED under CATEGORY 4" crlf)
    (halt)
    )

; RULE 26

; CATEGORY 5
; A candidate with an age of below-25, 25-50, 50-75 or Above 75,
; Male or Female,
; Level of education High School, Bachelors or Masters,
; Marital Status Single, Divorced or Seperated
; A credit score of Below 650, 650-700,
; Has a No Job,
; Has Other Sources of Income

(defrule category5-accept
    (customer-age {age == 1 || age == 2 || age == 3 || age == 4})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 1 || mar == 3 || mar == 4} )
    (customer-job {job == 2})
    (customer-cred {cred == 1 || cred == 2})
    (customer-oin {oin == 1})
    (customer-loan {loan <= 13000})
    =>
    (printout t "CONGRATS!! YOUR APPROVAL FOR A LOAN HAS BEEN ACCEPTED UNDER CATEGORY 5" crlf)
    (printout t "You are eligible for a Loan upto $13,000" crlf)
    (halt)
    )

; RULE 27

(defrule category5-reject
    (customer-age {age == 1 || age == 2 || age == 3 || age == 4})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 1 || mar == 3 || mar == 4} )
    (customer-job {job == 2})
    (customer-cred {cred == 1 || cred == 2})
    (customer-oin {oin == 1})
    (customer-loan {loan > 13000})
    =>
    (printout t "We are Sorry to inform you that your approval for a Loan" crlf)
    (printout t "has been REJECTED under CATEGORY 5" crlf)
    (halt)
    )

; RULE 28

; CATEGORY 6
; A candidate with an age of below-25, 25-50, 50-75 or Above 75,
; Male or Female,
; Level of education High School, Bachelors or Masters,
; Marital Status Single, Divorced or Seperated
; A credit score of 700-750, 750-800 or Above 800,
; Has a No Job,
; Has Other Sources of Income

(defrule category6-accept
    (customer-age {age == 1 || age == 2 || age == 3 || age == 4})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 1 || mar == 3 || mar == 4} )
    (customer-job {job == 2})
    (customer-cred {cred == 3 || cred == 4 || cred == 5})
    (customer-oin {oin == 1})
    (customer-loan {loan <= 15000})
    =>
    (printout t "CONGRATS!! YOUR APPROVAL FOR A LOAN HAS BEEN ACCEPTED UNDER CATEGORY 6" crlf)
    (printout t "You are eligible for a Loan upto $15,000" crlf)
    (halt)
    )

; RULE 29

(defrule category6-reject
    (customer-age {age == 1 || age == 2 || age == 3 || age == 4})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 1 || mar == 3 || mar == 4} )
    (customer-job {job == 2})
    (customer-cred {cred == 3 || cred == 4 || cred == 5})
    (customer-oin {oin == 1})
    (customer-loan {loan > 15000})
    =>
    (printout t "We are Sorry to inform you that your approval for a Loan" crlf)
    (printout t "has been REJECTED under CATEGORY 6" crlf)
    (halt)
    )

; RULE 30

; CATEGORY 7
; A candidate with an age of below-25, 25-50, 50-75 or Above 75,
; Male or Female,
; Level of education High School, Bachelors or Masters,
; Marital Status Married
; A credit score of Below 650, 650-700,
; Has a No Job,
; Has Other Sources of Income

(defrule category7-accept
    (customer-age {age == 1 || age == 2 || age == 3 || age == 4})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 2} )
    (customer-job {job == 2})
    (customer-cred {cred == 1 || cred == 2})
    (customer-oin {oin == 1})
    (customer-loan {loan <= 5000})
    =>
    (printout t "CONGRATS!! YOUR APPROVAL FOR A LOAN HAS BEEN ACCEPTED UNDER CATEGORY 7" crlf)
    (printout t "You are eligible for a Loan upto $5,000" crlf)
    (halt)
    )

; RULE 31

(defrule category7-reject
    (customer-age {age == 1 || age == 2 || age == 3 || age == 4})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 2} )
    (customer-job {job == 2})
    (customer-cred {cred == 1 || cred == 2})
    (customer-oin {oin == 1})
    (customer-loan {loan > 5000})
    =>
    (printout t "We are Sorry to inform you that your approval for a Loan" crlf)
    (printout t "has been REJECTED under CATEGORY 7" crlf)
    (halt)
    )

; RULE 32

; CATEGORY 8
; A candidate with an age of below-25, 25-50, 50-75 or Above 75,
; Male or Female,
; Level of education High School, Bachelors or Masters,
; Marital Status Married
; A credit score of 700-750, 750-800 or Above 800,
; Has a No Job,
; Has Other Sources of Income

(defrule category8-accept
    (customer-age {age == 1 || age == 2 || age == 3 || age == 4})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 2} )
    (customer-job {job == 2})
    (customer-cred {cred == 3 || cred == 4 || cred == 5})
    (customer-oin {oin == 1})
    (customer-loan {loan <= 10000})
    =>
    (printout t "CONGRATS!! YOUR APPROVAL FOR A LOAN HAS BEEN ACCEPTED UNDER CATEGORY 8" crlf)
    (printout t "You are eligible for a Loan upto $10,000" crlf)
    (halt)
    )

; RULE 33

(defrule category8-reject
    (customer-age {age == 1 || age == 2 || age == 3 || age == 4})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 2} )
    (customer-job {job == 2})
    (customer-cred {cred == 3 || cred == 4 || cred == 5})
    (customer-oin {oin == 1})
    (customer-loan {loan > 10000})
    =>
    (printout t "We are Sorry to inform you that your approval for a Loan" crlf)
    (printout t "has been REJECTED under CATEGORY 8" crlf)
    (halt)
    )
    
; RULE 34

; CATEGORY 8
; A candidate with an age of below-25, 25-50, 50-75 or Above 75,
; Male or Female,
; Level of education High School, Bachelors or Masters,
; Marital Status Married
; A credit score of Below 650, 650-700, 700-750, 750-800 or Above 800,
; Has a No Job,
; Has No Other Sources of Income

(defrule category9-reject
    (customer-age {age == 1 || age == 2 || age == 3 || age == 4})
    (customer-gender{gender == 1 || gender == 2})
    (customer-edu {edu == 1 || edu == 2 || edu == 3})
    (customer-mar {mar == 1 || mar == 2 || mar == 3 || mar == 4} )
    (customer-job {job == 2})
    (customer-cred {cred == 1 || cred == 2 || cred == 3 || cred == 4 || cred == 5})
    (customer-oin {oin == 2})
    =>
    (printout t "We are Sorry to inform you that your approval for a Loan" crlf)
    (printout t "has been REJECTED under CATEGORY 9" crlf)
    (halt)
    )

(reset)
(run)