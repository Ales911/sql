-- SELECT name_student, date_attempt, result FROM testing.attempt
--     JOIN testing.student USING(student_id)
-- WHERE subject_id = (SELECT subject_id from testing.subject where name_subject = 'Основы баз данных') 
-- ORDER BY result DESC

-- SELECT name_subject, COUNT(attempt.subject_id) AS Количество, ROUND(AVG(result), 2) AS Среднее FROM testing.subject
--     LEFT JOIN testing.attempt USING(subject_id)
--     GROUP BY name_subject
-- ORDER BY Среднее DESC

-- SELECT attempt_id, student_id, MAX(result) FROM testing.attempt
-- GROUP BY student_id

-- SELECT name_student, result
-- FROM testing.student
--     JOIN testing.attempt USING(student_id)
-- WHERE result = (SELECT MAX(result) FROM testing.attempt)
-- ORDER BY name_student;

-- SELECT name_student, name_subject, COUNT(name_student) AS attempt_count, MAX(date_attempt) - MIN(date_attempt) AS Интервал FROM testing.student
--     JOIN testing.attempt ON testing.attempt.student_id = testing.student.student_id 
--     JOIN testing.subject USING(subject_id)
-- GROUP BY name_student, name_subject 
-- HAVING COUNT(date_attempt) > 1
-- ORDER BY Интервал ASC

-- SELECT name_subject, COUNT(DISTINCT student_id) AS Количество FROM testing.attempt
--     RIGHT JOIN testing.subject USING(subject_id)
-- GROUP BY name_subject
-- ORDER BY Количество DESC, name_subject

-- SELECT question_id, name_question 
-- FROM testing.question 
-- WHERE subject_id = (SELECT subject_id FROM testing.subject WHERE name_subject = 'Основы баз данных')
-- ORDER BY RAND()
-- LIMIT 3

--  SELECT name_question, name_answer, is_correct FROM testing.question 
--       JOIN testing.testing ON testing.testing.question_id =  testing.question.question_id AND testing.testing.attempt_id = 7
--       JOIN testing.answer USING(answer_id)

-- SELECT name_student, name_subject, date_attempt, ROUND(SUM(is_correct)*100/3,2) FROM testing.student
--      JOIN testing.attempt USING(student_id)
--      JOIN testing.subject USING(subject_id)
--      JOIN testing.question USING(subject_id)
--      JOIN testing.answer ON testing.answer.question_id = testing.question.question_id AND is_correct
-- GROUP BY name_student, name_subject, date_attempt
-- ORDER BY name_student, date_attempt DESC

-- SELECT name_student, name_subject, date_attempt, 
--     ROUND(SUM(is_correct)*100/3,2) Результат
-- FROM testing.answer
--     JOIN testing.testing USING(answer_id)
--     JOIN testing.attempt USING(attempt_id)
--     JOIN testing.subject USING(subject_id)
--     JOIN testing.student USING(student_id)
-- GROUP BY 1, 2, 3
-- ORDER BY 1, 3 DESC

-- SELECT name_student, name_subject, date_attempt, 
--     ROUND(SUM(is_correct)*100/3,2) Результат
-- FROM testing.answer
--     JOIN testing.testing USING(answer_id)
--     JOIN testing.attempt USING(attempt_id)
--     JOIN testing.subject USING(subject_id)
--     JOIN testing.student USING(student_id)
-- GROUP BY 1, 2, 3
-- ORDER BY 1, 3 DESC

-- SELECT name_subject, concat(LEFT(name_question, 30), '...'), COUNT(DISTINCT testing.answer.answer_id)
-- FROM testing.testing
--     JOIN testing.attempt USING(attempt_id)
--     JOIN testing.subject USING(subject_id)
--     JOIN testing.question USING(subject_id)
--     JOIN testing.answer ON testing.answer.question_id = testing.question.question_id AND testing.answer.answer_id = testing.testing.answer_id
-- --    JOIN testing.student USING(student_id)
-- GROUP BY 1, 2--, testing.answer.question_id
-- ORDER BY 1

-- select                                                    
--     name_subject,
--     concat(left(name_question,  30), '...'),      # Ограничиваем длину строки + соединяем с троеточием         
--     count(testing.testing.a                   # Считаем количество ответов 
--     round(100 * sum(                 # Подсчитываем % отношение 
-- from subject
--     inner join question              # Соединяем первую таблицу
--     inner join testing               # Соединяем вторую таблицу 
--     inner join answer                # Соединяем третью таблицу
-- group by 1, 2

-- INSERT INTO testing.attempt(student_id, subject_id, date_attempt)
-- VALUES (
--     (SELECT student_id FROM testing.student WHERE name_student = 'Баранов Павел'), 
--     (SELECT subject_id FROM testing.subject WHERE name_subject = 'Основы баз данных'),
--     NOW());

--SET @buy_id = 5;

-- SET @attempt_id_max = SELECT MAX(attempt_id) from testing.attempt;
-- SET @subject_id_max = SELECT subject_id from testing.attempt WHERE attempt_id = @attempt_id_max;
-- 
-- INSERT INTO testing.testing(attempt_id, question_id)
--     SELECT @attempt_id_max, question_id FROM testing.question WHERE subject_id = @subject_id_max ORDER BY RANDOM() LIMIT 3;

-- INSERT INTO testing.testing(attempt_id, question_id)
-- SELECT attempt_id, question_id
-- FROM testing.attempt
--     JOIN testing.question USING(subject_id)
-- WHERE
--     attempt_id = (SELECT MAX(attempt_id) from testing.attempt)
-- ORDER BY RANDOM()
-- LIMIT 3;
-- 
-- UPDATE attempt SET result =
--     (select ROUND(AVG(is_correct)*100) from answer 
--         JOIN testing ON testing.answer_id = answer.answer_id AND testing.attempt_id = 8)
-- WHERE attempt_id = 8;

--SELECT * FROM testing;

 --DELETE FROM attempt where date_attempt < '2020-05-01';
