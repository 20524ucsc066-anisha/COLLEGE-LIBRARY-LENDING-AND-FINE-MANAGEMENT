# College Library Lending and Fine Management

## Aim

To develop a database system for managing library members, books, book lending, returns, and fines.

## Tables Used

### 1. Members
- Member_ID
- Member_Name

### 2. Books
- Book_ID
- Book_Title
- Author
- Available

### 3. Loans
- Loan_ID
- Member_ID
- Book_ID
- Issue_Date
- Due_Date
- Return_Date
- Fine

## SQL Operations

1. Display all issued books.
2. Identify books that are not returned and are overdue.
3. Calculate the total fine amount for each library member.
4. Identify frequently borrowed books.
5. Calculate the number of books issued in each month.

## Library Operations

### Issue Book
The system checks book availability and creates a loan record.

### Calculate Fine
A fine is calculated for books returned after the due date.

### Return Book
The return date is updated and the book is made available again.

### Pending Fine Report
The system displays the pending fine amount for members.

## Software Used

- GitHub
- GitHub Codespaces
- SQLite
- SQL