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
insert into users (userID, HKID, firstName, lastName, birthday, gender, userType, Address, PhoneNumber, Email_Address, Password)
VALUES
('u65985', Null, Null , Null, Null, Null, 'student', Null, Null, Null, Null);

delete from student where userID = 'u65985';
delete from users where userID = 'u65985';

select * from users;
select * from student;
#Test end