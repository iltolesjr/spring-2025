IF OBJECT_ID('Authors', 'U') IS NOT NULL
    DROP TABLE Authors;

IF OBJECT_ID('Books', 'U') IS NOT NULL
    DROP TABLE Books;

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    PublicationYear INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Insert data into Authors table
INSERT INTO Authors
    (AuthorID, FirstName, LastName, BirthDate)
VALUES
    (1, 'Jane', 'Austen', '1775-12-16'),
    (2, 'George', 'Orwell', '1903-06-25'),
    (3, 'J.K.', 'Rowling', '1965-07-31'),
    (4, 'Ernest', 'Hemingway', '1899-07-21'),
    (5, 'Virginia', 'Woolf', '1882-01-25');

-- Insert data into Books table
INSERT INTO Books
    (BookID, Title, AuthorID, PublicationYear, Price)
VALUES
    (1, 'Pride and Prejudice', 1, 1813, 12.99),
    (2, '1984', 2, 1949, 10.99),
    (3, 'Harry Potter and the Philosopher''s Stone', 3, 1997, 15.99),
    (4, 'The Old Man and the Sea', 4, 1952, 11.99),
    (5, 'To the Lighthouse', 5, 1927, 13.99);
GO

CREATE VIEW BookDetails AS 
SELECT
    b.BookID,
    b.Title,
    a.FirstName + ' ' + a.LastName AS AuthorName,
    b.PublicationYear,
    b.Price
FROM
    Books b
JOIN
    Authors a ON b.AuthorID = a.AuthorID;
GO