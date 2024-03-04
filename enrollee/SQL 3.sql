-- SELECT name_enrollee FROM enrollee.program_enrollee
--     JOIN enrollee.enrollee USING(enrollee_id)
--     JOIN enrollee.program ON enrollee.program.program_id = enrollee.program_enrollee.program_id AND name_program = 'Мехатроника и робототехника'
-- ORDER BY name_enrollee

-- SELECT name_program FROM enrollee.program_subject
--     JOIN enrollee.program USING(program_id)
--     JOIN enrollee.subject ON enrollee.subject.subject_id = enrollee.program_subject.subject_id AND name_subject = 'Информатика'
-- ORDER BY name_program DESC

-- SELECT name_subject, COUNT(enrollee_id) AS Количество, MAX(result) AS Максимум, MIN(result) AS Минимум, ROUND(AVG(result), 1) AS Среднее FROM enrollee.enrollee_subject
--     JOIN enrollee.subject USING(subject_id)
-- GROUP BY name_subject
-- ORDER BY name_subject

-- SELECT name_program FROM enrollee.program
--     JOIN enrollee.program_subject USING(program_id)
-- GROUP BY name_program
-- HAVING MIN(min_result) >= 40
-- ORDER BY name_program

--SELECT name_program, plan FROM enrollee.program WHERE plan in (SELECT MAX(plan) FROM enrollee.program)

-- SELECT name_enrollee, IFNULL(SUM(bonus), 0) AS Бонус FROM enrollee.enrollee
--     LEFT JOIN enrollee.enrollee_achievement USING(enrollee_id)
--     LEFT JOIN enrollee.achievement USING(achievement_id)
-- GROUP BY name_enrollee
-- ORDER BY name_enrollee

-- SELECT name_department, name_program, plan, count(enrollee_id) as Количество, round(count(enrollee_id)/plan, 2) as Конкурс FROM enrollee.department
--     LEFT JOIN enrollee.program USING(department_id)
--     LEFT JOIN enrollee.program_enrollee USING(program_id)
-- GROUP BY name_department, name_program, plan
-- ORDER BY Конкурс DESC

-- SELECT name_program FROM enrollee.program
--     JOIN enrollee.program_subject USING(program_id)
--     JOIN enrollee.subject ON subject.subject_id =  program_subject.subject_id AND (name_subject = 'Информатика' OR name_subject = 'Математика')
-- GROUP BY name_program
-- HAVING COUNT(name_program) = 2
-- ORDER BY name_program

-- SELECT name_program, name_enrollee, SUM("result") AS itog FROM enrollee.program 
--      JOIN enrollee.program_subject USING(program_id)
--      JOIN enrollee.program_enrollee USING(program_id)
--      JOIN enrollee.enrollee USING(enrollee_id)
--      JOIN enrollee.enrollee_subject USING(subject_id, enrollee_id)
-- GROUP BY name_program, name_enrollee
-- ORDER BY name_program, itog DESC

-- SELECT name_program, name_enrollee, SUM("result") AS itog FROM enrollee.program_enrollee
--      NATURAL JOIN enrollee.program
--      NATURAL JOIN enrollee.program_subject
--      NATURAL JOIN enrollee.enrollee
--      NATURAL JOIN enrollee.enrollee_subject
-- GROUP BY name_program, name_enrollee
-- ORDER BY name_program, itog DESC

-- INSERT INTO  enrollee.enrollee_subject (enrollee_id, subject_id, result) VALUES (2, 3, 41);

-- CREATE TABLE applicant
-- SELECT program_id, enrollee_id, SUM(result) itog
-- FROM program_enrollee JOIN program_subject USING (program_id)
--                       JOIN enrollee_subject USING (subject_id, enrollee_id)
-- GROUP BY  2, 1
-- ORDER BY 1, 3 DESC;
-- 
-- SELECT * FROM enrollee.applicant;

-- DELETE FROM enrollee.applicant USING enrollee.applicant
--     join enrollee.program_subject using(program_id)
--     join enrollee.enrollee_subject using(subject_id,enrollee_id)
-- where result < min_result;

-- DELETE FROM enrollee.applicant 
-- WHERE (program_id, enrollee_id) IN (
-- SELECT program_id, enrollee_id FROM enrollee.program_enrollee
--       NATURAL JOIN enrollee.program
--       NATURAL JOIN enrollee.program_subject
--       NATURAL JOIN enrollee.enrollee
--       NATURAL JOIN enrollee.enrollee_subject
-- where result < min_result     )

--DELETE FROM enrollee.applicant 
--USING enrollee.applicant
--     join enrollee.program_subject using(program_id)
--     join enrollee.enrollee_subject using(subject_id,enrollee_id)
-- where result < min_result;

--SELECT * FROM enrollee.applicant;

-- UPDATE enrollee.applicant JOIN (
--     SELECT enrollee_id, SUM(bonus) AS Бонус FROM enrollee.enrollee_achievement
--     JOIN enrollee.achievement USING(achievement_id)
--     GROUP BY enrollee_id 
--     ) AS t USING(enrollee_id)
-- SET itog = itog + Бонус;


-- UPDATE enrollee.applicant AS
-- applicant JOIN (SELECT enrollee_id, SUM(add_ball) AS bonus
--                 FROM enrollee_achievement JOIN achievement USING(achievement_id)
--                 GROUP BY enrollee_id) AS enl_bonus
--                 USING(enrollee_id)
-- SET applicant.itog = applicant.itog + enl_bonus.bonus;
-- 
-- SELECT * FROM enrollee.applicant;

-- CREATE TABLE enrollee.applicant_order  AS
--     SELECT program_id, enrollee_id, itog FROM enrollee.applicant
--     ORDER BY program_id, itog DESC;

-- DROP TABLE enrollee.applicant;
 
-- ALTER TABLE enrollee.applicant_order ADD str_id INT;
-- SELECT * FROM enrollee.applicant_order;


-- SELECT *, 
--      if(program_id = @num_pr, @row_num := @row_num + 1, @row_num := 1 AND @num_pr := program_id) AS str_num
-- from applicant_order;

-- SET @num_pr := 0;
-- SET @row_num := 1;
-- 
-- UPDATE applicant_order
-- SET str_id = if(program_id = @num_pr, @row_num := @row_num + 1, @row_num := 1 AND @num_pr := program_id);
-- 
-- SELECT * FROM enrollee.applicant_order;

-- CREATE TABLE enrollee.student  AS
--     SELECT name_program, name_enrollee, itog FROM enrollee.applicant_order
--         JOIN enrollee.program USING(program_id)
--         JOIN enrollee.enrollee USING(enrollee_id)
--     WHERE str_id <= plan
--     ORDER BY name_program, itog DESC;
-- 
-- SELECT * FROM enrollee.student;

-- DROP SCHEMA IF EXISTS stepik CASCADE;
-- CREATE SCHEMA IF NOT EXISTS stepik;

