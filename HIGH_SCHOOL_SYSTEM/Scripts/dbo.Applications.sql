CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    IDNumber NVARCHAR(20) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender NVARCHAR(10) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL,
    Address NVARCHAR(200) NOT NULL,
    LastSchoolAttended NVARCHAR(100) NOT NULL,
    LastGradePassed NVARCHAR(20) NOT NULL,
    SubjectsPassed NVARCHAR(MAX) NOT NULL,
    YearCompleted INT NOT NULL,
    ApplicationDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(20) DEFAULT 'Pending' -- Pending/Approved/Rejected
);