-- College Library Lending and Fine Management

-- Create Members table
CREATE TABLE Members (
    Member_ID INTEGER PRIMARY KEY,
    Member_Name TEXT NOT NULL
);

-- Create Books table
CREATE TABLE Books (
    Book_ID INTEGER PRIMARY KEY,
    Book_Title TEXT NOT NULL,
    Author TEXT,
    Available INTEGER DEFAULT 1
);

-- Create Loans table
CREATE TABLE Loans (
    Loan_ID INTEGER PRIMARY KEY,
    Member_ID INTEGER,
    Book_ID INTEGER,
    Issue_Date TEXT,
    Due_Date TEXT,
    Return_Date TEXT,
    Fine REAL DEFAULT 0,
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

-- Insert Members
INSERT INTO Members VALUES
(1, 'Anusha'),
(2, 'Rahul'),
(3, 'Priya'),
(4, 'Arun'),
(5, 'Divya');

-- Insert Books
INSERT INTO Books VALUES
(101, 'Database Management System', 'Raghu Ramakrishnan', 1),
(102, 'Python Programming', 'Mark Lutz', 1),
(103, 'Machine Learning', 'Tom Mitchell', 0),
(104, 'Cloud Computing', 'Rajkumar Buyya', 1),
(105, 'Java Programming', 'Herbert Schildt', 0);

-- Insert Loans
INSERT INTO Loans VALUES
(1001, 1, 103, '2026-09-01', '2026-09-10', NULL, 0),
(1002, 2, 105, '2026-09-05', '2026-09-12', NULL, 0),
(1003, 3, 101, '2026-09-15', '2026-09-22', '2026-09-21', 0),
(1004, 1, 102, '2026-09-20', '2026-09-27', NULL, 10),
(1005, 4, 104, '2026-09-25', '2026-10-02', '2026-10-01', 0);

-- Query 1: Display all issued books
SELECT Loan_ID, Member_ID, Book_ID, Issue_Date, Due_Date
FROM Loans;

-- Query 2: Find overdue books
SELECT Loan_ID, Member_ID, Book_ID, Due_Date
FROM Loans
WHERE Return_Date IS NULL
AND Due_Date < date('now');

-- Query 3: Total fine for each member
SELECT Member_ID, SUM(Fine) AS Total_Fine
FROM Loans
GROUP BY Member_ID;

-- Query 4: Frequently borrowed books
SELECT Book_ID, COUNT(*) AS Borrow_Count
FROM Loans
GROUP BY Book_ID
ORDER BY Borrow_Count DESC;

-- Query 5: Books issued each month
SELECT strftime('%Y-%m', Issue_Date) AS Month,
       COUNT(*) AS Books_Issued
FROM Loans
GROUP BY Month
ORDER BY Month;