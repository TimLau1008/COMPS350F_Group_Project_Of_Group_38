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