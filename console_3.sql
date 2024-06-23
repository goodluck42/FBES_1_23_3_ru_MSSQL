CREATE TABLE Posts
(
    Id INT IDENTITY,
    [Text] NVARCHAR(500),
    UserId INT,
    CONSTRAINT PK_ItBottle_Posts_Id PRIMARY KEY(Id),
    CONSTRAINT FK_ItBottle_Posts_UserId FOREIGN KEY([UserId]) REFERENCES Users([Id])
)

INSERT INTO Posts
VALUES (N'Sample text', 90)

SELECT U.Id AS UserId, P.Id AS PostId, U.Login, P.Text
FROM Posts AS P, Users AS U
WHERE U.Id = 90


CREATE TABLE Students
(
    Id INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(2048),
    LastName NVARCHAR(2048),
    ---
)

CREATE TABLE GroupsStudents
(
    Id INT PRIMARY KEY IDENTITY,
    GroupId INT,
    StudentId INT,
    CONSTRAINT FK_ItBottle_GroupsStudents_GroupId FOREIGN KEY (GroupId) REFERENCES Groups(Id),
    CONSTRAINT FK_ItBottle_GroupsStudents_StudentId FOREIGN KEY (StudentId) REFERENCES Students(Id),
)

-- insert into Students (FirstName, LastName) values ('Regan', 'Smiths');
-- insert into Students (FirstName, LastName) values ('Reinald', 'Hackly');
-- insert into Students (FirstName, LastName) values ('Chrissy', 'Dahlgren');
-- insert into Students (FirstName, LastName) values ('Tabor', 'Heinish');
-- insert into Students (FirstName, LastName) values ('Melesa', 'Martinie');
-- insert into Students (FirstName, LastName) values ('Joan', 'Hirsthouse');
-- insert into Students (FirstName, LastName) values ('Faulkner', 'Bullant');
-- insert into Students (FirstName, LastName) values ('Godwin', 'Cheesley');
-- insert into Students (FirstName, LastName) values ('Dedra', 'Chalk');
-- insert into Students (FirstName, LastName) values ('Willi', 'Fonteyne');


-- ALTER TABLE Groups
-- ALTER COLUMN [Name] NVARCHAR(64)


insert into Groups (Name) values ('01-35-01-88-F1-E3');
insert into Groups (Name) values ('6D-5F-1D-B1-2A-C1');
insert into Groups (Name) values ('60-3C-83-FC-43-C2');
insert into Groups (Name) values ('2C-38-5D-B2-8A-E5');
insert into Groups (Name) values ('3A-E7-28-97-C7-94');
insert into Groups (Name) values ('A2-DC-DF-D8-6B-1A');
insert into Groups (Name) values ('72-E9-61-DE-5A-50');
insert into Groups (Name) values ('68-4E-5D-CA-81-03');
insert into Groups (Name) values ('8C-F8-E7-84-D9-5E');
insert into Groups (Name) values ('5C-5E-4A-8E-BE-F8');


INSERT INTO GroupsStudents
VALUES (5, 11)


SELECT S.FirstName, G.Name
FROM GroupsStudents
JOIN Groups AS G ON G.Id = GroupsStudents.GroupId
JOIN Students AS S ON S.Id = GroupsStudents.StudentId