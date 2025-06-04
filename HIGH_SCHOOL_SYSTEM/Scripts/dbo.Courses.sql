CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName NVARCHAR(100) NOT NULL, -- e.g., "Mathematics"
    GradeLevel NVARCHAR(20) NOT NULL,  -- e.g., "Grade 10"
    Description NVARCHAR(200)
);