CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50),
    Email VARCHAR(100),
    ProfileInfo TEXT
);

CREATE TABLE Messages (
    MessageID INT PRIMARY KEY,
    SenderID INT,
    ReceiverID INT,
    MessageContent TEXT,
    Timestamp DATETIME,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);

CREATE TABLE Services (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(50),
    Price DECIMAL(10, 2)
);

CREATE TABLE UserServices (
    UserID INT,
    ServiceID INT,
    PaymentAmount DECIMAL(10, 2),	
    PaymentDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

-- Task 2: Add 3 Records to Each Table
INSERT INTO Users VALUES (1, 'JohnDoe', 'john.doe@example.com', 'Some profile information about John.');
INSERT INTO Users VALUES (2, 'JaneSmith', 'jane.smith@example.com', 'Some profile information about Jane.');
INSERT INTO Users VALUES (3, 'BobJohnson', 'bob.johnson@example.com', 'Some profile information about Bob.');
INSERT INTO Users VALUES (4, 'abed', 'abed.johnson@example.com', 'Some profile information about Bob.');

INSERT INTO Messages VALUES (1,1, 2, 'Hello Jane!', GETDATE());
INSERT INTO Messages VALUES (2,2, 1, 'Hi John!', GETDATE());
INSERT INTO Messages VALUES (3,3, 1, 'Hey John, how are you?', GETDATE());
INSERT INTO Messages VALUES (4,NULL, NULL, 'Hey John, how are you?', GETDATE());

INSERT INTO Services VALUES (1, 'Premium Messaging', 4.99);
INSERT INTO Services VALUES (2, 'Group Chat', 2.99);
INSERT INTO Services VALUES (3, 'Voice Messages', 3.99);
INSERT INTO Services VALUES (4, 'Voice Messages', 3.99);

INSERT INTO UserServices VALUES (1, 1, 4.99, GETDATE());
INSERT INTO UserServices VALUES (2, 2, 2.99, GETDATE());
INSERT INTO UserServices VALUES (3, 3, 3.99, GETDATE());

--  Update 1 Record from Each Table
UPDATE Users SET ProfileInfo = 'Updated profile information about John.' WHERE UserID = 1;
UPDATE Messages SET MessageContent = 'Updated message content.' WHERE MessageID = 1;
UPDATE Services SET Price = 5.99 WHERE ServiceID = 1;
UPDATE UserServices SET PaymentAmount = 5.99 WHERE UserID = 1;

--  Delete 1 Record from Each Table
DELETE FROM Users WHERE UserID = 4;
DELETE FROM Messages WHERE MessageID = 4;
DELETE FROM Services WHERE ServiceID = 4;
DELETE FROM UserServices WHERE UserID = 2;

--  modify table name
EXEC sp_rename 'Messages', 'ChatMessages';

-- Modify 2 Columns Names with Their Datatypes
ALTER TABLE Users
    ALTER COLUMN Email NVARCHAR(150);

ALTER TABLE UserServices
    ALTER COLUMN PaymentAmount DECIMAL(12, 2);