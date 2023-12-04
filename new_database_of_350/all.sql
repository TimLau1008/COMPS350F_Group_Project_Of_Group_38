drop database databaseOf350;
create database if not exists databaseOf350 ;
USE databaseOf350;
CREATE TABLE Users (
  userID VARCHAR(20) PRIMARY KEY,
  HKID VARCHAR(20),
  firstName VARCHAR(50),
  lastName VARCHAR(50),
  birthday DATE,
  gender VARCHAR(10),
  userType VARCHAR(20),
  Address VARCHAR(100),
  PhoneNumber VARCHAR(20),
  Email_Address VARCHAR(50),
  Password VARCHAR(50)
);
INSERT INTO Users (userID, HKID, firstName, lastName, birthday, gender, userType, Address, PhoneNumber, Email_Address, Password)
VALUES
  ('u12341', 'A123456(0)', 'John', 'Doe', '1990-01-01', 'Male', 'student', '123 Main St, City', '12345678', 'john@example.com', 'password1'),
  ('u23794', 'B789012(3)', 'Jane', 'Smith', '1992-05-15', 'Female', 'student', '456 Elm St, City', '98765432', 'jane@example.com', 'password2'),
  ('u12323', 'C345678(6)', 'David', 'Johnson', '1985-11-20', 'Male', 'teacher', '789 Oak St, City', '56781234', 'david@example.com', 'password3'),
  ('u34801', 'D901234(9)', 'Emily', 'Brown', '1988-09-10', 'Female', 'teacher', '321 Pine St, City', '43218765', 'emily@example.com', 'password4'),
  ('u12849', 'E567890(2)', 'Michael', 'Wilson', '1980-07-25', 'Male', 'staff', '654 Cedar St, City', '87654321', 'michael@example.com', 'password5'),
  ('u12818', 'F234567(5)', 'Sarah', 'Davis', '1982-03-18', 'Female', 'staff', '987 Willow St, City', '23456789', 'sarah@example.com', 'password6'),
  ('u57384', 'G890123(8)', 'Robert', 'Taylor', '1975-12-05', 'Male', 'admin', '321 Birch St, City', '67891234', 'robert@example.com', 'password7'),
  ('u39103', 'H456789(1)', 'Olivia', 'Martinez', '1978-06-30', 'Female', 'admin', '437 Peak St, City', '27329112', 'olivia@example.com', 'password8');

#Use For Testing Register, need to delete student record first, then delete users record for mutiple testing
#insert into users (userID, HKID, firstName, lastName, birthday, gender, userType, Address, PhoneNumber, Email_Address, Password)
#VALUES('u65985', Null, Null , Null, Null, Null, 'student', Null, Null, Null, Null);
#delete from student where userID = 'u65985';
#delete from users where userID = 'u65985';
#select * from users;
#select * from student;
#Test end

CREATE TABLE Student (
  studID VARCHAR(20) PRIMARY KEY,
  UserID VARCHAR(20),
  degree VARCHAR(50),
  StudiedCourseID INT,
  CGPAResult NUMERIC(3,2),
  status VARCHAR(20),
  FOREIGN KEY (UserID) REFERENCES Users(userID)
);
INSERT INTO Student (studID, UserID, degree, StudiedCourseID, CGPAResult, status)
VALUES
  ('s12427', 'u12341', 'Bachelor of Science', 1, 3.5, 'undergraduate'),
  ('s12378', 'u23794', 'Bachelor of Arts', 2, 3.82, 'graduate');
  
CREATE TABLE Staff (
  staffID VARCHAR(20) PRIMARY KEY,
  UserID VARCHAR(20),
  StaffDepartment VARCHAR(50),
  position VARCHAR(50),
  WorkingDate DATE,
  Password VARCHAR(50),
  FOREIGN KEY (UserID) REFERENCES Users(userID)
);
INSERT INTO Staff (staffID, UserID, StaffDepartment, position, WorkingDate, Password)
VALUES
  ('st12749', 'u12849', 'Cleaning', 'Junior', '2020-01-01', 'password5'),
  ('st13911', 'u12818', 'Finance', 'Senior', '2021-03-15', 'password6');
  
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
  
CREATE TABLE Admin (
  adminID VARCHAR(20) PRIMARY KEY,
  UserID VARCHAR(20),
  AdminDepartment VARCHAR(50),
  position VARCHAR(50),
  Password VARCHAR(50),
  FOREIGN KEY (UserID) REFERENCES Users(userID)
);
INSERT INTO Admin (adminID, UserID, AdminDepartment, position, Password)
VALUES
  ('a14344', 'u57384', 'Administration', 'Senior Administrator', 'password7'),
  ('a55730', 'u39103', 'Administration', 'Junior Administrator', 'password8');

CREATE TABLE course (
  CourseID VARCHAR(20),
  Date VARCHAR(20),
  StartTime VARCHAR(20),
  EndTime VARCHAR(20),
  Room VARCHAR(20),
  SubjectID VARCHAR(20),
  CourseName VARCHAR(255)
);
INSERT INTO course 
VALUES 
('D1324','Fri','17:00','19:00','0302','S8399','Introduction to Programming'),
('D1392','Wed','16:00','18:00','0403','S8399','Data Structures and Algorithms'),
('D2135','Mon','15:00','17:00','0402','S4513','Electrical Circuit Analysis'),
('D2314','Thu','10:00','12:00','0301','S1445','Health Assessment  and Physical Examination'),
('D2388','Wed','11:00','13:00','0302','S4418','Introduction to Psychology'),
('D2482','Tue','13:00','15:00','0302','S9482','Shakespearean Studies'),
('D2888','Fri','14:00','16:00','0301','S1445','Foundation of Nursing Practice'),
('D3472','Tue','10:00','12:00','0303','S1445','Pharmacology for Nurses'),
('D3813','Wed','11:00','13:00','0301','S9482','Modernist Literature'),
('D3828','Thu','14:00','16:00','0402','S4418','Abnormal Psychology'),
('D5325','Fri','14:00','16:00','0302','S4513','Engineering Mechanics'),
('D8238','Mon','15:00','17:00','0403','S9482','Introduction to Engkish Literature'),
('D8239','Wed','16:00','18:00','0402','S8399','Database Management Systems'),
('D9283','Fri','16:00','18:00','0302','S4418','Social Psychology');

CREATE TABLE Facility (
  facilityID VARCHAR(20) PRIMARY KEY,
  facilityName VARCHAR(50),
  facilityTime VARCHAR(50),
  bookedUser VARCHAR(20),
  FOREIGN KEY (bookedUser) REFERENCES Users(userID)
);
INSERT INTO Facility (facilityID, facilityName, facilityTime, bookedUser)
VALUES
  ('f321', 'Library', 'Mon - Fri 9:00 AM - 7:00 PM', 'u12341'),
  ('f642', 'Gymnasium', 'Mon - Sat 8:00 AM - 10:00 PM', 'u12323'),
  ('f764', 'Lab', 'Mon - Fri 9:00 AM - 5:00 PM', NULL),
  ('f680', 'Auditorium', 'Mon - Sun 8:00 AM - 11:00 PM', NULL),
  ('f368', 'Cafeteria', 'Mon - Fri 7:00 AM - 5:00 PM', 'u12341');

CREATE TABLE StudentCourse (
  CourseID VARCHAR(20),
  StudentID VARCHAR(20)
);
INSERT INTO StudentCourse 
VALUES
  ('D2482','s12427'),
  ('D3828','s12427'),
  ('D8238','s12427'),
  ('D1324','s12378'),
  ('D1392','s12378'),
  ('D2135','s12378');