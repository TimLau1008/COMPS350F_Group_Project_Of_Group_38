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