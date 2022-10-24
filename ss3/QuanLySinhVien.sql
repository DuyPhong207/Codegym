USE ss3_quanlysinhvien;
SELECT * FROM student WHERE StudentName LIKE 'h%';
SELECT * FROM class WHERE month(startDate) = 12;
SELECT * FROM `subject` WHERE Credit BETWEEN 3 AND 5;
SELECT * FROM student;
UPDATE student SET classId = 2 WHERE StudentName = 'Hung';
SELECT student.StudentName, subject.SubName, mark.Mark FROM student, mark, subject
ORDER BY mark.Mark DESC, student.StudentName;