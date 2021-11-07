SELECT id, name FROM Student_teacher_db.dbo.StudentInfo
WHERE CGPA >= 3.5

SELECT Department, avg(cgpa) FROM Student_teacher_db.dbo.StudentInfo group by Department HAVING AVG(CGPA) > 3.5
SELECT Session, avg(cgpa) FROM Student_teacher_db.dbo.StudentInfo group by Session

SELECT "Name"=SUBSTRING(name,1,1)+'. hello' from Student_teacher_db.dbo.StudentInfo
SELECT Name from Student_teacher_db.dbo.StudentInfo where SUBSTRING(name, 1,1) = 'S'

