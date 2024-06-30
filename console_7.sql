-- DDL

-- GO
-- CREATE TABLE Subjects
-- (
--     Id   INT PRIMARY KEY IDENTITY,
--     Name NVARCHAR(64)
-- )
-- GO
-- CREATE TABLE Teachers
-- (
--     Id        INT PRIMARY KEY IDENTITY,
--     FirstName NVARCHAR(128),
--     LastName  NVARCHAR(128)
-- )
--
-- GO
-- CREATE TABLE TeachersSubjects
-- (
--     SubjectId INT,
--     TeacherId INT,
--     CONSTRAINT FK_ItBottle_TeachersSubjects_SubjectId FOREIGN KEY (SubjectId) REFERENCES Subjects (Id),
--     CONSTRAINT FK_ItBottle_TeachersSubjects_TeacherId FOREIGN KEY (TeacherId) REFERENCES Teachers (Id),
-- )
--
-- GO
--
-- ALTER TABLE Teachers
-- ADD IQ SMALLINT

-- INSERT INTO Teachers
-- (FirstName, LastName, IQ)
-- VALUES
-- (
--  'Aleksey', 'Skiba', 1
-- )

---- UNION

-- SELECT COUNT(*)
-- FROM (SELECT FirstName, LastName
--       FROM Students
--       UNION
--       SELECT FirstName, LastName
--       FROM Teachers
--       UNION
--       SELECT Login, 'N/A'
--       FROM Users) AS T
-- WHERE LastName = 'N/A'

---- INTERSECT

-- SELECT FirstName, LastName
-- FROM Teachers
-- INTERSECT
-- SELECT FirstName, LastName
-- FROM Students

-- SELECT CAST(Id AS NVARCHAR(10)) + '_s', FirstName, LastName
-- FROM Students
-- UNION
-- SELECT CAST(Id AS NVARCHAR(10)) + '_t', FirstName, LastName
-- FROM Teachers

-- SELECT *
-- FROM Teachers
-- WHERE FirstName = SOME(SELECT FirstName
--                    FROM Students
--                    UNION
--                    SELECT FirstName
--                    FROM Teachers)

---- EXCEPT

-- SELECT FirstName, LastName
-- FROM Students
-- EXCEPT
-- SELECT FirstName, LastName
-- FROM Teachers


---- UNION ALL

-- SELECT FirstName, LastName
-- FROM Students
-- UNION ALL
-- SELECT FirstName, LastName
-- FROM Teachers

SELECT FirstName, LastName
FROM Students
UNION ALL
SELECT FirstName, LastName
FROM Teachers
ORDER BY FirstName


