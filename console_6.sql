-- ALTER TABLE Students
-- ADD CONSTRAINT CK_ItBottle_Students_FIN CHECK (LEN(FIN) = 7)


INSERT INTO GroupsStudents(GroupId, StudentId)
VALUES ((SELECT Id FROM Groups WHERE Name = '5C-5E-4A-8E-BE-F8'),
        (SELECT Id FROM Students WHERE FIN = '0000003'))

UPDATE GroupsStudents -- 8C-F8-E7-84-D9-5E
SET GroupId = (SELECT Id FROM Groups WHERE Name = '8C-F8-E7-84-D9-5E')
WHERE StudentId = (SELECT Id FROM Students WHERE FIN = '0000003')

DELETE GroupsStudents
WHERE StudentId = (SELECT Id FROM Students WHERE FIN = '0000003')




SELECT *
FROM Students AS S
WHERE EXISTS(SELECT Id FROM GroupsStudents AS GS WHERE GS.StudentId = S.Id)

SELECT *
FROM Students AS S
WHERE Id IN(SELECT StudentId FROM GroupsStudents)

-- ALL, SOME|ANY

SELECT *
FROM Students AS S
WHERE Id = SOME(SELECT StudentId FROM GroupsStudents)

SELECT *
FROM Students AS S
WHERE Id = ALL(SELECT StudentId FROM GroupsStudents)


SELECT *
FROM Students
WHERE ID