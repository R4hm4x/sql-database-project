CREATE DATABASE assignment3;
USE assignment3;

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    publication_year INT
);

CREATE TABLE Borrowers (
    borrower_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    borrower_id INT,
    borrow_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id)
);

INSERT INTO Books (title, author, genre, publication_year)
VALUES 
('1984', 'George Orwell', 'Dystopian', 1949),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 1925),
('Pride and Prejudice', 'Jane Austen', 'Romance', 1813),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951),
('Moby Dick', 'Herman Melville', 'Adventure', 1851),
('The Hunger Games', 'Suzanne Collins', 'Dystopian', 2008);

INSERT INTO Borrowers (first_name, last_name, email)
VALUES 
('Alice', 'Smith', 'alice@email.com'),
('Bob', 'Johnson', 'bob@email.com'),
('Charlie', 'Brown', 'charlie@email.com'),
('Daisy', 'Miller', 'daisy@email.com'),
('Ethan', 'Davis', 'ethan@email.com'),
('Fiona', 'Wilson', 'fiona@email.com'),
('George', 'Taylor', 'george@email.com'),
('Hannah', 'Anderson', 'hannah@email.com');

INSERT INTO Transactions (book_id, borrower_id, borrow_date)
VALUES 
(1, 1, '2026-03-01'),
(2, 2, '2026-03-02'),
(3, 3, '2026-03-03'),
(4, 4, '2026-03-04'),
(5, 5, '2026-03-05'),
(6, 6, '2026-03-06'),
(7, 7, '2026-03-07'),
(8, 8, '2026-03-08');

SELECT * FROM Borrowers;

SELECT * FROM Books ORDER BY title;

SELECT first_name, last_name, email
FROM Borrowers
ORDER BY last_name;

SELECT * FROM Transactions
ORDER BY borrow_date DESC;

SELECT b.title, br.first_name, t.borrow_date
FROM Transactions t
JOIN Books b ON t.book_id = b.book_id
JOIN Borrowers br ON t.borrower_id = br.borrower_id
ORDER BY t.borrow_date;

SELECT br.first_name, br.last_name, b.title
FROM Borrowers br
JOIN Transactions t ON br.borrower_id = t.borrower_id
JOIN Books b ON t.book_id = b.book_id
ORDER BY br.last_name;

select COUNT(*) as total_books
from books;

select MAX(publication_year) as newest_books
from books;

select COUNT(*) as total_borrowers
from borrowers;

delete from Transactions
where transaction_id = 1;

delimiter //

create procedure getlibrarystats()
begin
    select count(*) as total_books from books;
    select max(publication_year) from books as newest_book_year;
end //

delimiter ;
call getlibrarystats();