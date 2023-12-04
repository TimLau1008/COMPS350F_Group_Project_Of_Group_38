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