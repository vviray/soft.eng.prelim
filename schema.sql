CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publication_year INT,
    genre VARCHAR(50),
    available_copies INT
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    contact_number VARCHAR(20),
    join_date DATE
);

CREATE TABLE Borrowings (
    borrowing_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATE,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

CREATE TABLE Fines (
    fine_id INT PRIMARY KEY,
    borrowing_id INT,
    amount DECIMAL(10, 2),
    date_imposed DATE,
    date_paid DATE,
    FOREIGN KEY (borrowing_id) REFERENCES Borrowings(borrowing_id)
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Books (book_id, title, author, publication_year, genre, available_copies)
VALUES
    (1, 'To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction', 5),
    (2, '1984', 'George Orwell', 1949, 'Science Fiction', 3),
    (3, 'Pride and Prejudice', 'Jane Austen', 1813, 'Romance', 2),
    (4, 'The Lord of the Rings', 'J.R.R. Tolkien', 1937, 'Fantasy', 4),
    (5, 'The Alchemist', 'Paulo Coelho', 1988, 'Novel', 6);
    
INSERT INTO Members (member_id, name, address, contact_number, join_date)
VALUES
    (1, 'John Doe', '123 Main St, Lucena City', '09123456789', '2023-01-01'),
    (2, 'Jane Smith', '456 Rizal St, Lucena City', '09223456789', '2023-02-15'),
    (3, 'Michael Johnson', '789 Quezon Ave, Lucena City', '09323456789', '2023-03-20'),
    (4, 'Emily Davis', '101 Mabini St, Lucena City', '09423456789', '2023-04-25'),
    (5, 'David Wilson', '111 Rizal St, Lucena City', '09523456789', '2023-05-30');
    
INSERT INTO Borrowings (borrowing_id, book_id, member_id, borrow_date, due_date, return_date)
VALUES
    (1, 1, 1, '2023-02-01', '2023-02-15', '2023-02-15'),
    (2, 2, 2, '2023-03-05', '2023-03-20', '2023-03-20'),
    (3, 3, 3, '2023-04-10', '2023-04-25', '2023-04-25'),
    (4, 4, 4, '2023-05-15', '2023-05-30', '2023-05-30'),
    (5, 5, 5, '2023-06-20', '2023-07-05', '2023-07-05');
    
INSERT INTO Fines (fine_id, borrowing_id, amount, date_imposed, date_paid)
VALUES
    (1, 2, 5.00, '2023-03-21', '2023-03-25'),
    (2, 3, 10.00, '2023-04-26', '2023-05-01'),
    (3, 4, 15.00, '2023-05-31', '2023-06-05');
    
INSERT INTO Categories (category_id, name)
VALUES
    (1, 'Fiction'),
    (2, 'Non-Fiction'),
    (3, 'Science Fiction'),
    (4, 'Romance'),
    (5, 'Fantasy');
