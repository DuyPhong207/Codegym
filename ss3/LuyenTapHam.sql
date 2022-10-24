USE quanlysinhvien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT * FROM subject
WHERE Credit = (SELECT MAX(Credit) FROM subject);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT * FROM mark
WHERE Mark = (SELECT MAX(Mark) FROM mark);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần.
SELECT *, AVG(Mark) AS 'Điểm trung bình'
FROM student s join mark m ON s.StudentId = m.StudentId
ORDER BY AVG(Mark) DESC;


