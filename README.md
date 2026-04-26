[README.md](https://github.com/user-attachments/files/27105815/README.md)
# Library Database System

## 📌 Project Overview

This project is a relational database system designed to manage a library. It tracks books, borrowers, and borrowing transactions. The system allows the library to store, retrieve, and manage data efficiently using SQL.

## Database Structure

The database is made up of three tables:

### 1. Books

Stores information about each book in the library.

- book_id (Primary Key)
- title
- author
- genre
- publication_year

### 2. Borrowers

Stores information about users who borrow books.

- borrower_id (Primary Key)
- first_name
- last_name
- email (Unique)

### 3. Transactions

Links books and borrowers to record borrowing activity.

- transaction_id (Primary Key)
- book_id (Foreign Key)
- borrower_id (Foreign Key)
- borrow_date

## Relationships

- Each transaction links one book to one borrower.
- Foreign keys ensure data integrity between tables.
- A book and borrower must exist before a transaction can be created.

## SQL Features Used

### SELECT Queries

Used to retrieve data from tables and display information.

### JOIN Queries

Used to combine data from multiple tables to show:

- which borrower borrowed which book
- borrowing history

### Aggregate Functions

- COUNT() used to count total books, borrowers, and transactions
- MAX() used to find the newest book by publication year

### Stored Procedure

A stored procedure was created to return overall library statistics such as total books and publication year from books

### DELETE Query

Used to remove records from the Transactions table.

## Purpose of the System

The purpose of this database is to simulate a real-world library system that can:

- Store book information
- Track borrowers
- Record borrowing activity
- Retrieve meaningful insights using SQL queries

## Key Learning Outcomes

- Designing a relational database
- Using primary and foreign keys
- Writing SQL queries (SELECT, JOIN, DELETE)
- Using aggregate and built-in functions
- Creating stored procedures
- Managing data using Git and version control

## Tools Used

- MySQL
- DBeaver
- Git & GitHub
- VS Code
