SET IDENTITY_INSERT Users ON;

INSERT INTO Users(Id, PasswordHash, RegistrationDate, Age, Gender)
VALUES
(
    'Login1', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', SYSDATETIME(), 20, 1
),
(
    'Login2', 'd4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35', '1999-2-25 12:49:32', 19, 0
);

-- SELECT Id, Login, Age, Gender
-- FROM Users
-- WHERE Age >= 20 OR Gender = 1

-- SELECT Id, Login, Age, Gender
-- FROM Users
-- WHERE Login NOT IN ('Jean', 'Rik', 'Delmor')


-- SELECT Id, Login, Age, Gender
-- FROM Users
-- WHERE Age BETWEEN 20 AND 30

-- Weapon_A1
-- Weapon_B2
-- Weapon_B23

-- SELECT Id, Login, Age, Gender
-- FROM Users
-- WHERE Login LIKE 'a%a'

-- SELECT *
-- FROM Users
-- ORDER BY Login
-- OFFSET 20 ROWS
-- FETCH NEXT 5 ROWS ONLY;

SELECT TOP 10 Id, Login -- 4
FROM Users -- 1
WHERE Id <> 3 -- 2
ORDER BY Id -- 3


-- UPDATE Users
-- SET Gender = 3,
--     Login = 'ShalomLogin'
-- WHERE Id = 45

-- DELETE FROM Users
-- WHERE Id = 45

-- TRUNCATE TABLE Users

-- YYYY-MM-DD HH:MI:SS



SELECT CAST(123 AS NVARCHAR(12)) + '_abc'