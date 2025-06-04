CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    ApplicationID INT FOREIGN KEY REFERENCES Applications(ApplicationID),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    IDNumber NVARCHAR(20) NOT NULL UNIQUE,
    DateOfBirth DATE NOT NULL,
    Gender NVARCHAR(10) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber NVARCHAR(20) NOT NULL,
    Address NVARCHAR(200) NOT NULL,
    EnrollmentDate DATE DEFAULT GETDATE(),
    CurrentGrade NVARCHAR(20), -- e.g., "Grade 10"
    IsActive BIT DEFAULT 1 -- Active/Inactive
);