CREATE TABLE Teacher (
  teacherID VARCHAR(20) PRIMARY KEY,
  UserID VARCHAR(20),
  AcademicDepartment VARCHAR(50),
  TeachingCourse VARCHAR(50),
  WorkingDate DATE,
  Password VARCHAR(50),
  FOREIGN KEY (UserID) REFERENCES Users(userID)
);
INSERT INTO Teacher (teacherID, UserID, AcademicDepartment, TeachingCourse, WorkingDate, Password)
VALUES
  ('t10954', 'u12323', 'Computer Science', 'Python', '2010-08-01', 'password3'),
  ('t95324', 'u34801', 'Database', 'Statistic', '2012-02-15', 'password4');