create database banking;
use banking;
-- =========================================================
-- STEP 2: CREATE BRANCHES TABLE
-- =========================================================

CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    branch_code VARCHAR(10) UNIQUE NOT NULL,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    pincode VARCHAR(10),
    address VARCHAR(255),
    ifsc_code VARCHAR(20) UNIQUE NOT NULL,
    phone VARCHAR(15),
    manager_name VARCHAR(100),
    opening_date DATE,
    status VARCHAR(20)
);


-- =========================================================
-- STEP 3: CREATE CUSTOMERS TABLE
-- =========================================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_number VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE,
    date_of_birth DATE,
    gender VARCHAR(10),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    customer_since DATE,
    customer_status VARCHAR(20)
);


-- =========================================================
-- STEP 4: CREATE EMPLOYEES TABLE
-- =========================================================

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_code VARCHAR(20) UNIQUE NOT NULL,
    branch_id INT,
    employee_name VARCHAR(100) NOT NULL,
    job_role VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    salary DECIMAL(12,2),
    joining_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (branch_id)
    REFERENCES branches(branch_id)
);


-- =========================================================
-- STEP 5: CREATE ACCOUNTS TABLE
-- =========================================================

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    account_type VARCHAR(30) NOT NULL,
    balance DECIMAL(15,2) DEFAULT 0,
    minimum_balance DECIMAL(15,2) DEFAULT 0,
    opened_date DATE,
    status VARCHAR(20),
    currency VARCHAR(10) DEFAULT 'INR',

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),

    FOREIGN KEY (branch_id)
    REFERENCES branches(branch_id)
);


-- =========================================================
-- STEP 6: CREATE TRANSACTIONS TABLE
-- =========================================================

CREATE TABLE transactions (
    transaction_id BIGINT PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_type VARCHAR(30) NOT NULL,
    transaction_mode VARCHAR(30) NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    transaction_date DATETIME NOT NULL,
    description VARCHAR(255),
    reference_number VARCHAR(50) UNIQUE,
    balance_after DECIMAL(15,2),
    transaction_status VARCHAR(20),
    location VARCHAR(100),

    FOREIGN KEY (account_id)
    REFERENCES accounts(account_id)
);


-- =========================================================
-- STEP 7: CREATE CARDS TABLE
-- =========================================================

CREATE TABLE cards (
    card_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_id INT,
    card_number VARCHAR(20) UNIQUE NOT NULL,
    card_type VARCHAR(20),
    card_network VARCHAR(20),
    issue_date DATE,
    expiry_date DATE,
    status VARCHAR(20),
    credit_limit DECIMAL(15,2),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),

    FOREIGN KEY (account_id)
    REFERENCES accounts(account_id)
);


-- =========================================================
-- STEP 8: CREATE CARD_TRANSACTIONS TABLE
-- =========================================================

CREATE TABLE card_transactions (
    card_transaction_id BIGINT PRIMARY KEY,
    card_id INT NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    merchant_name VARCHAR(100),
    merchant_category VARCHAR(50),
    transaction_date DATETIME,
    city VARCHAR(50),
    transaction_status VARCHAR(20),
    reference_number VARCHAR(50),
    payment_channel VARCHAR(30),

    FOREIGN KEY (card_id)
    REFERENCES cards(card_id)
);


-- =========================================================
-- STEP 9: CREATE BENEFICIARIES TABLE
-- =========================================================

CREATE TABLE beneficiaries (
    beneficiary_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    beneficiary_name VARCHAR(100) NOT NULL,
    account_number VARCHAR(30) NOT NULL,
    bank_name VARCHAR(100),
    ifsc_code VARCHAR(20),
    nickname VARCHAR(50),
    added_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);


-- =========================================================
-- STEP 10: CREATE TRANSFERS TABLE
-- =========================================================

CREATE TABLE transfers (
    transfer_id BIGINT PRIMARY KEY,
    sender_account_id INT NOT NULL,
    receiver_account_id INT NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    transfer_mode VARCHAR(30),
    transfer_date DATETIME,
    reference_number VARCHAR(50) UNIQUE,
    transfer_status VARCHAR(20),
    remarks VARCHAR(255),

    FOREIGN KEY (sender_account_id)
    REFERENCES accounts(account_id),

    FOREIGN KEY (receiver_account_id)
    REFERENCES accounts(account_id)
);


-- =========================================================
-- STEP 11: INSERT BRANCHES
-- =========================================================

INSERT INTO branches VALUES
(1,'BR001','Hazratganj Branch','Lucknow','Uttar Pradesh','226001',
'Hazratganj Lucknow','BANK000001','9876500001','Rajesh Sharma','2015-01-10','ACTIVE'),

(2,'BR002','Connaught Place Branch','Delhi','Delhi','110001',
'Connaught Place Delhi','BANK000002','9876500002','Amit Verma','2016-03-15','ACTIVE'),

(3,'BR003','Gomti Nagar Branch','Lucknow','Uttar Pradesh','226010',
'Gomti Nagar Lucknow','BANK000003','9876500003','Neha Singh','2018-07-20','ACTIVE'),

(4,'BR004','Andheri Branch','Mumbai','Maharashtra','400001',
'Andheri West Mumbai','BANK000004','9876500004','Vikas Mehta','2014-11-05','ACTIVE'),

(5,'BR005','Banjara Hills Branch','Hyderabad','Telangana','500034',
'Banjara Hills Hyderabad','BANK000005','9876500005','Priya Rao','2019-02-12','ACTIVE');


-- =========================================================
-- STEP 12: INSERT CUSTOMERS
-- =========================================================

INSERT INTO customers VALUES

(1,'CUST001','Rahul','Kumar','rahul@gmail.com','9000000001',
'1998-05-10','Male','Aliganj','Lucknow','Uttar Pradesh','226024',
'2020-01-15','ACTIVE'),

(2,'CUST002','Priya','Sharma','priya@gmail.com','9000000002',
'1997-08-12','Female','Dwarka','Delhi','Delhi','110075',
'2019-03-20','ACTIVE'),

(3,'CUST003','Aman','Verma','aman@gmail.com','9000000003',
'1999-02-18','Male','Sector 62','Noida','Uttar Pradesh','201301',
'2021-06-11','ACTIVE'),

(4,'CUST004','Neha','Singh','neha@gmail.com','9000000004',
'1996-11-25','Female','Gomti Nagar','Lucknow','Uttar Pradesh','226010',
'2018-09-05','ACTIVE'),

(5,'CUST005','Rohit','Gupta','rohit@gmail.com','9000000005',
'1995-04-22','Male','Andheri','Mumbai','Maharashtra','400001',
'2017-04-18','ACTIVE'),

(6,'CUST006','Sneha','Rao','sneha@gmail.com','9000000006',
'2000-01-30','Female','Banjara Hills','Hyderabad','Telangana','500034',
'2022-02-10','ACTIVE'),

(7,'CUST007','Vikas','Mishra','vikas@gmail.com','9000000007',
'1994-09-14','Male','Indira Nagar','Lucknow','Uttar Pradesh','226016',
'2016-05-25','ACTIVE'),

(8,'CUST008','Anjali','Yadav','anjali@gmail.com','9000000008',
'1998-12-01','Female','Rohini','Delhi','Delhi','110085',
'2020-08-19','INACTIVE'),

(9,'CUST009','Karan','Malhotra','karan@gmail.com','9000000009',
'1993-06-17','Male','Andheri East','Mumbai','Maharashtra','400069',
'2015-12-12','ACTIVE'),

(10,'CUST010','Pooja','Shukla','pooja@gmail.com','9000000010',
'1999-10-08','Female','Vasundhara','Ghaziabad','Uttar Pradesh','201012',
'2021-10-15','ACTIVE');


-- =========================================================
-- STEP 13: INSERT EMPLOYEES
-- =========================================================

INSERT INTO employees VALUES

(1,'EMP001',1,'Ramesh Singh','Manager','ramesh@bank.com',
'9100000001',85000,'2015-01-15','ACTIVE'),

(2,'EMP002',1,'Suresh Yadav','Cashier','suresh@bank.com',
'9100000002',45000,'2018-04-10','ACTIVE'),

(3,'EMP003',2,'Anil Kumar','Manager','anil@bank.com',
'9100000003',90000,'2016-04-20','ACTIVE'),

(4,'EMP004',2,'Kavita Sharma','Clerk','kavita@bank.com',
'9100000004',40000,'2019-05-12','ACTIVE'),

(5,'EMP005',3,'Manoj Verma','Manager','manoj@bank.com',
'9100000005',88000,'2018-08-01','ACTIVE'),

(6,'EMP006',4,'Deepak Mehta','Manager','deepak@bank.com',
'9100000006',95000,'2014-12-01','ACTIVE'),

(7,'EMP007',5,'Sunita Rao','Manager','sunita@bank.com',
'9100000007',87000,'2019-03-01','ACTIVE');


-- =========================================================
-- STEP 14: INSERT ACCOUNTS
-- =========================================================

INSERT INTO accounts VALUES

(101,1,1,'ACC100001','SAVINGS',150000,1000,'2020-01-20','ACTIVE','INR'),

(102,1,1,'ACC100002','CURRENT',75000,5000,'2021-03-10','ACTIVE','INR'),

(103,2,2,'ACC100003','SAVINGS',250000,1000,'2019-03-25','ACTIVE','INR'),

(104,2,2,'ACC100004','FD',500000,0,'2020-05-15','ACTIVE','INR'),

(105,3,1,'ACC100005','SAVINGS',85000,1000,'2021-06-15','ACTIVE','INR'),

(106,4,3,'ACC100006','SAVINGS',180000,1000,'2018-09-10','ACTIVE','INR'),

(107,4,3,'ACC100007','SALARY',95000,0,'2019-01-15','ACTIVE','INR'),

(108,5,4,'ACC100008','CURRENT',120000,5000,'2017-04-20','ACTIVE','INR'),

(109,6,5,'ACC100009','SAVINGS',60000,1000,'2022-02-15','ACTIVE','INR'),

(110,7,1,'ACC100010','SAVINGS',300000,1000,'2016-06-01','ACTIVE','INR'),

(111,8,2,'ACC100011','SAVINGS',45000,1000,'2020-08-25','BLOCKED','INR'),

(112,9,4,'ACC100012','SAVINGS',275000,1000,'2015-12-20','ACTIVE','INR'),

(113,10,3,'ACC100013','SAVINGS',110000,1000,'2021-10-20','ACTIVE','INR');


-- =========================================================
-- STEP 15: INSERT TRANSACTIONS
-- =========================================================

INSERT INTO transactions VALUES

(1001,101,'DEPOSIT','UPI',50000,
'2025-01-05 10:15:00','Salary Deposit','TXN1001',
150000,'SUCCESS','Lucknow'),

(1002,101,'WITHDRAWAL','ATM',10000,
'2025-01-10 14:30:00','ATM Cash Withdrawal','TXN1002',
140000,'SUCCESS','Lucknow'),

(1003,102,'PAYMENT','UPI',15000,
'2025-01-12 11:20:00','Online Payment','TXN1003',
75000,'SUCCESS','Lucknow'),

(1004,103,'DEPOSIT','NEFT',100000,
'2025-01-15 09:10:00','NEFT Deposit','TXN1004',
250000,'SUCCESS','Delhi'),

(1005,104,'DEPOSIT','BRANCH',200000,
'2025-01-18 12:00:00','FD Deposit','TXN1005',
500000,'SUCCESS','Delhi'),

(1006,105,'WITHDRAWAL','ATM',5000,
'2025-01-20 18:10:00','ATM Withdrawal','TXN1006',
85000,'SUCCESS','Lucknow'),

(1007,106,'DEPOSIT','UPI',75000,
'2025-01-22 10:30:00','UPI Deposit','TXN1007',
180000,'SUCCESS','Lucknow'),

(1008,107,'WITHDRAWAL','ATM',20000,
'2025-01-25 16:45:00','ATM Withdrawal','TXN1008',
95000,'SUCCESS','Lucknow'),

(1009,108,'PAYMENT','CARDS',30000,
'2025-01-28 13:20:00','Card Payment','TXN1009',
120000,'SUCCESS','Mumbai'),

(1010,109,'DEPOSIT','UPI',25000,
'2025-02-01 09:30:00','UPI Deposit','TXN1010',
60000,'SUCCESS','Hyderabad'),

(1011,110,'DEPOSIT','NEFT',150000,
'2025-02-03 11:10:00','NEFT Deposit','TXN1011',
300000,'SUCCESS','Lucknow'),

(1012,111,'WITHDRAWAL','ATM',5000,
'2025-02-05 15:30:00','ATM Withdrawal','TXN1012',
45000,'SUCCESS','Delhi'),

(1013,112,'DEPOSIT','RTGS',125000,
'2025-02-08 10:00:00','RTGS Deposit','TXN1013',
275000,'SUCCESS','Mumbai'),

(1014,113,'PAYMENT','UPI',10000,
'2025-02-10 12:20:00','UPI Payment','TXN1014',
110000,'SUCCESS','Lucknow'),

(1015,101,'TRANSFER','IMPS',25000,
'2025-02-12 14:10:00','IMPS Transfer','TXN1015',
125000,'SUCCESS','Lucknow'),

(1016,103,'WITHDRAWAL','ATM',15000,
'2025-02-15 17:40:00','ATM Withdrawal','TXN1016',
235000,'SUCCESS','Delhi'),

(1017,106,'PAYMENT','UPI',12000,
'2025-02-18 19:20:00','UPI Payment','TXN1017',
168000,'SUCCESS','Lucknow'),

(1018,110,'WITHDRAWAL','ATM',10000,
'2025-02-20 13:50:00','ATM Withdrawal','TXN1018',
290000,'SUCCESS','Lucknow'),

(1019,112,'TRANSFER','NEFT',50000,
'2025-02-22 10:45:00','NEFT Transfer','TXN1019',
225000,'SUCCESS','Mumbai'),

(1020,104,'INTEREST','BRANCH',15000,
'2025-02-25 09:00:00','FD Interest','TXN1020',
515000,'SUCCESS','Delhi');


-- =========================================================
-- STEP 16: INSERT CARDS
-- =========================================================

INSERT INTO cards VALUES

(1,1,101,'4111111111111111','DEBIT','VISA',
'2020-02-01','2028-02-01','ACTIVE',0),

(2,2,103,'5222222222222222','DEBIT','MASTERCARD',
'2019-04-01','2027-04-01','ACTIVE',0),

(3,4,106,'6333333333333333','DEBIT','RUPAY',
'2018-10-01','2026-10-01','ACTIVE',0),

(4,5,108,'4444444444444444','CREDIT','VISA',
'2019-01-01','2027-01-01','ACTIVE',200000),

(5,7,110,'5555555555555555','DEBIT','MASTERCARD',
'2016-07-01','2026-07-01','ACTIVE',0),

(6,9,112,'6666666666666666','DEBIT','RUPAY',
'2016-01-01','2026-01-01','ACTIVE',0);


-- =========================================================
-- STEP 17: INSERT CARD TRANSACTIONS
-- =========================================================

INSERT INTO card_transactions VALUES

(5001,1,2500,'Amazon','Shopping',
'2025-01-05 13:00:00','Lucknow','SUCCESS',
'CARDTXN001','ONLINE'),

(5002,2,1200,'Swiggy','Food',
'2025-01-08 20:00:00','Delhi','SUCCESS',
'CARDTXN002','ONLINE'),

(5003,3,3500,'Reliance Trends','Shopping',
'2025-01-12 18:00:00','Lucknow','SUCCESS',
'CARDTXN003','POS'),

(5004,4,5000,'Flipkart','Shopping',
'2025-01-15 15:00:00','Mumbai','SUCCESS',
'CARDTXN004','ONLINE'),

(5005,5,1800,'Dominos','Food',
'2025-01-20 21:00:00','Lucknow','SUCCESS',
'CARDTXN005','POS'),

(5006,6,2200,'Myntra','Shopping',
'2025-01-25 17:00:00','Mumbai','SUCCESS',
'CARDTXN006','ONLINE');


-- =========================================================
-- STEP 18: INSERT BENEFICIARIES
-- =========================================================

INSERT INTO beneficiaries VALUES

(1,1,'Amit Kumar','BEN001','SBI Bank','SBIN000001',
'Friend','2024-01-10','ACTIVE'),

(2,2,'Rahul Verma','BEN002','HDFC Bank','HDFC000001',
'Brother','2024-02-15','ACTIVE'),

(3,3,'Neha Singh','BEN003','ICICI Bank','ICIC000001',
'Friend','2024-03-20','ACTIVE'),

(4,4,'Rohit Gupta','BEN004','Axis Bank','AXIS000001',
'Friend','2024-04-10','ACTIVE'),

(5,5,'Karan Mehta','BEN005','SBI Bank','SBIN000002',
'Business','2024-05-15','ACTIVE');


-- =========================================================
-- STEP 19: INSERT TRANSFERS
-- =========================================================

INSERT INTO transfers VALUES

(1,101,103,25000,'IMPS',
'2025-02-01 10:00:00','TRF001','SUCCESS','Money transfer'),

(2,103,106,40000,'NEFT',
'2025-02-03 11:00:00','TRF002','SUCCESS','Payment'),

(3,106,110,30000,'UPI',
'2025-02-05 12:00:00','TRF003','SUCCESS','Personal transfer'),

(4,110,112,50000,'NEFT',
'2025-02-08 14:00:00','TRF004','SUCCESS','Business payment'),

(5,112,101,20000,'RTGS',
'2025-02-10 15:00:00','TRF005','SUCCESS','Fund transfer');


-- =========================================================
-- =========================================================
-- 28 SQL QUESTIONS
-- =========================================================
-- =========================================================


-- 1. Find all active customers

SELECT *
FROM customers
WHERE customer_status = 'ACTIVE';


-- 2. Find all savings accounts

SELECT *
FROM accounts
WHERE account_type = 'SAVINGS';


-- 3. Find accounts with balance > ₹1 lakh

SELECT *
FROM accounts
WHERE balance > 100000;


-- 4. Find all ATM transactions

SELECT *
FROM transactions
WHERE transaction_mode = 'ATM';


-- 5. Find customers from Delhi

SELECT *
FROM customers
WHERE city = 'Delhi';


-- 6. Total balance by branch

SELECT
    b.branch_name,
    SUM(a.balance) AS total_balance
FROM branches b
JOIN accounts a
ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name;


-- 7. Average balance by account type

SELECT
    account_type,
    AVG(balance) AS average_balance
FROM accounts
GROUP BY account_type;


-- 8. Number of accounts per customer

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    COUNT(a.account_id) AS total_accounts
FROM customers c
LEFT JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, customer_name;


-- 9. Total transaction amount per customer

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(t.amount) AS total_transaction_amount
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
JOIN transactions t
ON a.account_id = t.account_id
GROUP BY c.customer_id, customer_name;


-- 10. Total transactions by mode

SELECT
    transaction_mode,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY transaction_mode;


-- 11. Customer + Account details

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    c.email,
    a.account_number,
    a.account_type,
    a.balance,
    a.status
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id;


-- 12. Customer + Account + Branch

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    a.account_number,
    a.account_type,
    a.balance,
    b.branch_name,
    b.city AS branch_city
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
JOIN branches b
ON a.branch_id = b.branch_id;


-- 13. Customers having cards

SELECT DISTINCT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name
FROM customers c
JOIN cards cd
ON c.customer_id = cd.customer_id;


-- 14. Customers without cards

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name
FROM customers c
LEFT JOIN cards cd
ON c.customer_id = cd.customer_id
WHERE cd.card_id IS NULL;


-- 15. Customers having multiple accounts

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    COUNT(a.account_id) AS total_accounts
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, customer_name
HAVING COUNT(a.account_id) > 1;


-- 16. Above-average balance customers

SELECT DISTINCT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    a.balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
WHERE a.balance >
(
    SELECT AVG(balance)
    FROM accounts
);


-- 17. Second-highest balance

SELECT MAX(balance) AS second_highest_balance
FROM accounts
WHERE balance <
(
    SELECT MAX(balance)
    FROM accounts
);


-- 18. Customers above their branch average

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    a.balance,
    a.branch_id
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
WHERE a.balance >
(
    SELECT AVG(a2.balance)
    FROM accounts a2
    WHERE a2.branch_id = a.branch_id
);


-- 19. Highest transaction customer

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(t.amount) AS total_transaction
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
JOIN transactions t
ON a.account_id = t.account_id
GROUP BY c.customer_id, customer_name
ORDER BY total_transaction DESC
LIMIT 1;


-- 20. Branch with highest total balance

SELECT
    b.branch_id,
    b.branch_name,
    SUM(a.balance) AS total_balance
FROM branches b
JOIN accounts a
ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_balance DESC
LIMIT 1;


-- 21. Customer-wise total balance

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, customer_name;


-- 22. Customer-wise transaction volume

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS transaction_volume
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
JOIN transactions t
ON a.account_id = t.account_id
GROUP BY c.customer_id, customer_name
ORDER BY transaction_volume DESC;


-- 23. Branch-wise average balance

SELECT
    b.branch_id,
    b.branch_name,
    AVG(a.balance) AS average_balance
FROM branches b
JOIN accounts a
ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name;


-- 24. Above-average customers
-- Customer's TOTAL balance > average TOTAL customer balance

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, customer_name
HAVING SUM(a.balance) >
(
    SELECT AVG(customer_total)
    FROM
    (
        SELECT
            customer_id,
            SUM(balance) AS customer_total
        FROM accounts
        GROUP BY customer_id
    ) AS customer_balances
);


-- 25. Top customers per branch
-- Highest balance customer from each branch

SELECT
    b.branch_name,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    a.balance
FROM accounts a
JOIN customers c
ON a.customer_id = c.customer_id
JOIN branches b
ON a.branch_id = b.branch_id
WHERE a.balance =
(
    SELECT MAX(a2.balance)
    FROM accounts a2
    WHERE a2.branch_id = a.branch_id
);


-- 26. Rank customers by balance

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(a.balance) AS total_balance,

    RANK() OVER
    (
        ORDER BY SUM(a.balance) DESC
    ) AS balance_rank

FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, customer_name;


-- 27. Top 3 customers per branch

WITH customer_branch_balance AS
(
    SELECT
        a.branch_id,
        c.customer_id,
        CONCAT(c.first_name,' ',c.last_name) AS customer_name,
        SUM(a.balance) AS total_balance

    FROM accounts a
    JOIN customers c
    ON a.customer_id = c.customer_id

    GROUP BY
        a.branch_id,
        c.customer_id,
        customer_name
),

ranked_customers AS
(
    SELECT
        *,
        DENSE_RANK() OVER
        (
            PARTITION BY branch_id
            ORDER BY total_balance DESC
        ) AS branch_rank

    FROM customer_branch_balance
)

SELECT
    branch_id,
    customer_id,
    customer_name,
    total_balance,
    branch_rank
FROM ranked_customers
WHERE branch_rank <= 3
ORDER BY branch_id, branch_rank;


-- 28. Rank transactions per customer

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    t.transaction_id,
    t.amount,
    t.transaction_mode,
    t.transaction_date,

    RANK() OVER
    (
        PARTITION BY c.customer_id
        ORDER BY t.amount DESC
    ) AS transaction_rank

FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id

JOIN transactions t
ON a.account_id = t.account_id

ORDER BY
    c.customer_id,
    transaction_rank;