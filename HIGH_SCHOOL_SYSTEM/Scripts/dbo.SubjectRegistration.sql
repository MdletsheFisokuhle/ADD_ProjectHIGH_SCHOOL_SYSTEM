CREATE TABLE SubjectRegistration (
    SubjectRegistrationId INT IDENTITY(1,1) PRIMARY KEY,
    StudentId INT NOT NULL,
    ApplicationId INT NOT NULL,
    SubjectName NVARCHAR(100) NOT NULL,
    IsApproved BIT NOT NULL DEFAULT 0, -- 0 = Not Approved, 1 = Approved
    RegistrationDate DATETIME NOT NULL DEFAULT GETDATE(), -- Optional: tracks when registered

    FOREIGN KEY (StudentId) REFERENCES dbo.Students(StudentId),
    FOREIGN KEY (ApplicationId) REFERENCES dbo.Applications(ApplicationId)
);
