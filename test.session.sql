-- @block
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);
-- @block
INSERT INTO Users (email, bio, country)
VALUES (
        'hello@world.com',
        'I love meeting new people',
        'US'
    );
-- @block
INSERT INTO Users (email, bio, country)
VALUES ('hello@mars.com', 'I live on Mars', 'NA'),
    ('hello@venus.com', 'I live on Venus', 'NA'),
    ('hello@jupiter.com', 'I live on Jupiter', 'NA');
-- @block limit is 2, offset is 1; how pagination would work
SELECT id,
    bio
FROM Users
WHERE country = 'NA'
ORDER BY id DESC
LIMIT 1, 1;
-- @block
SELECT *
FROM Users
WHERE email LIKE '%venus%';
-- @block
CREATE INDEX email_index on Users(email);
-- @block
CREATE TABLE Rooms(
    id INT AUTO_INCREMENT,
    street VARCHAR(255) NOT NULL,
    owner_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(owner_id) REFERENCES Users(id)
);
-- @block
INSERT INTO Rooms (owner_id, street)
VALUES (2, 'First St'),
    (1, '4th Ave'),
    (3, 'West SQL Ct'),
    (1, '8th Ave'),
    (1, 'Cornflakes Dr');
-- @block
INSERT INTO Users (email, bio, country)
VALUES (
        'some.email.edu',
        'I do not own any properties',
        'US'
    );
-- @block
SELECT Users.id AS user_id, Users.email, Users.bio, Users.country, Rooms.id AS room_id
FROM Users
    LEFT JOIN Rooms ON Rooms.owner_id = Users.id;

-- @block
CREATE TABLE Bookings(
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(room_id) REFERENCES Rooms(id),
    FOREIGN KEY(guest_id) REFERENCES Users(id)
)

-- @block
INSERT INTO Bookings (guest_id, room_id, check_in)
VALUES
        (1,2,'2023-11-25 17:00:00'),
        (2,3,'2023-11-23 17:00:00'),
        (3,1,'2023-11-28 17:00:00');

-- @block
SELECT *
FROM Bookings
INNER JOIN Rooms ON Rooms.id = room_id
-- WHERE guest_id = 1;

-- @block
SELECT * FROM Bookings;
