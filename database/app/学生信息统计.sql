USE dev_test;

SELECT * FROM dev_test.student;
SELECT * FROM dev_test.student_score;

USE dev_test;
-- 统计每个学生各科成绩+总分+平均分
SELECT (@row_no:=@row_no + 1) AS row_no, a.* FROM
(
    SELECT s.s_id,
           SUM(IF(ss.subject = '语文', ss.score, 0)) AS 语文,
           SUM(IF(ss.subject = '数学', ss.score, 0)) AS 数学,
           SUM(IF(ss.subject = '英语', ss.score, 0)) AS 英语,
           SUM(ss.score) AS total_score,
           SUM(ss.score) / COUNT(*) AS avg_score
    FROM student AS s, student_score AS ss
    WHERE s.s_id = ss.uid
    GROUP BY s.s_id
) AS a, (SELECT @row_no := 0)  AS b
ORDER BY a.total_score DESC;

-- 统计每个学生单科最高成绩
SELECT s.s_id,
       ss1.score
FROM student AS s,
     (SELECT ss.uid,
             MAX(ss.score) AS score
      FROM student_score AS ss
      GROUP BY ss.uid) AS ss1
WHERE s.s_id = ss1.uid;

-- 统计单科成绩最高的学生
SELECT ss1.uid,
       ss2.subject,
       ss2.max_score
FROM student_score AS ss1,
    (SELECT ss.subject,
         MAX(ss.score) AS max_score
     FROM student_score AS ss
     GROUP BY ss.subject) AS ss2
WHERE ss1.subject = ss2.subject
    AND ss1.score = ss2.max_score;

USE dev_test;
-- 各门课程成绩最好的两位学生
SELECT ss1.uid,
       ss1.subject,
       ss1.score
FROM student_score AS ss1
WHERE ss1.uid IN (
    SELECT ss.uid
    FROM student_score AS ss
    WHERE ss1.subject = ss.subject
    ORDER BY ss1.score
    LIMIT 2
)
ORDER BY ss1.subject;

-- 统计各门课程的平均成绩
SELECT ss.subject,
       AVG(ss.score) AS avg_subject_score
FROM student_score AS ss
GROUP BY ss.subject;

-- 统计数学成绩排名
SELECT aa.s_name,
       aa.no
FROM(
    SELECT (@tmp := @tmp + 1) AS no, a.* FROM(
        SELECT ss.uid,
               s.s_name,
               ss.score
        FROM student_score AS ss, student as s
        WHERE ss.subject = '数学'
            AND s.s_id = ss.uid
        ORDER BY ss.score
    ) AS a, (SELECT @tmp := 0) AS b
    ORDER BY a.score DESC
) AS aa
WHERE aa.s_name = '小王';

-- 统计各科目的分数分布
SELECT subject,
(SELECT COUNT(*) FROM student_score WHERE score<60 AND subject=t1.subject) AS 不及格,
(SELECT COUNT(*) FROM student_score WHERE score BETWEEN 60 AND 80 AND subject=t1.subject) AS 良,
(SELECT COUNT(*) FROM student_score WHERE score >80 AND subject=t1.subject) as 优
FROM student_score t1
GROUP BY subject;

-- 查询第 2-3 名记录
SELECT *
FROM student_score AS ss
WHERE ss.subject = '数学'
ORDER BY ss.score DESC
LIMIT 1, 2;

--
SELECT *
FROM student_score AS ss
WHERE ss.subject = '数学'
    AND ss.score <= 90;

SELECT a.uid, a.subject, a.score
FROM student_score as a, (
    SELECT ss.uid
    FROM student_score AS ss
    GROUP BY ss.uid
    HAVING MIN(ss.score) >= 88
      AND COUNT(ss.subject) >= 3
) as b
WHERE a.uid = b.uid;


SELECT ss.uid,
       ss.subject,
       ss.score
FROM student_score AS ss
WHERE AS uid NOT IN(
    SELECT DISTINCT uid
    FROM student_score AS b
    WHERE b.score <= 88
);