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