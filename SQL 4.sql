-- WITH get_count_correct (st_n_c, count_correct) 
--   AS (
--     SELECT step_name, count(*)
--     FROM 
--         step 
--         INNER JOIN step_student USING (step_id)
--     WHERE result = "correct"
--     GROUP BY step_name
--    ),
--   get_count_wrong (st_n_w, count_wrong) 
--   AS (
--     SELECT step_name, count(*)
--     FROM 
--         step 
--         INNER JOIN step_student USING (step_id)
--     WHERE result = "wrong"
--     GROUP BY step_name
--    )  
-- SELECT st_n_c AS Шаг,
--   --    ROUND(count_correct / (count_correct + count_wrong) * 100) AS Успешность
--    CASE
--     WHEN ROUND(count_correct / (count_correct + count_wrong)* 100) IS NULL THEN 100
--     ELSE ROUND(count_correct / (count_correct + count_wrong)* 100)
--     END AS Успешность 
-- FROM  
--     get_count_correct 
--     LEFT JOIN get_count_wrong ON st_n_c = st_n_w
-- UNION
-- SELECT st_n_w AS Шаг,
--   --    ROUND(count_correct / (count_correct + count_wrong) * 100) AS Успешность
--    CASE
--     WHEN ROUND(count_correct / (count_correct + count_wrong)* 100) IS NULL THEN 0
--     ELSE ROUND(count_correct / (count_correct + count_wrong)* 100) 
--     END AS Успешность 
-- FROM  
--     get_count_correct 
--     RIGHT JOIN get_count_wrong ON st_n_c = st_n_w
-- ORDER BY 2 ;
-- 


-- SELECT student_name, count(DISTINCT step_id) AS Kоличество,
-- 
--     ROW_NUMBER() OVER (ORDER BY  count(DISTINCT step_id) DESC) AS Номер,
--     RANK() OVER (ORDER BY  count(DISTINCT step_id) DESC) AS Ранг,
--     DENSE_RANK() OVER (ORDER BY  count(DISTINCT step_id) DESC) AS Рейтинг,
-- 
--     LAG(count(DISTINCT step_id)) OVER (ORDER BY  count(DISTINCT step_id) DESC) - count(DISTINCT step_id) AS Разница
-- 
-- FROM stepik.student INNER JOIN stepik.step_student USING (student_id)
-- WHERE result = 'correct'
-- GROUP BY student_name

--SELECT student_name, step_name, result, to_char(date(to_timestamp(submission_time)),'YYYY-MM-DD')
-- SELECT student_name, step_name, result, to_char(to_timestamp(submission_time),'HH12:MI:SS YYYY-MM-DD') AS Дата_отправки,
-- SEC_TO_TIME(submission_time - LAG(submission_time, 1, submission_time) OVER (ORDER BY submission_time)) AS Разница
-- FROM stepik.student 
-- JOIN stepik.step_student ON stepik.step_student.student_id = stepik.student.student_id AND stepik.step_student.student_id = 61
-- JOIN stepik.step USING (step_id)
-- ORDER BY submission_time


-- with time_to_step(st, step, lesson,time_to_s)
-- as
-- (
--     select student_id,step_id,lesson_name,sum(submission_time - attempt_time) as Время_на_шаг
--     from module 
--     join lesson using(module_id)
--     join step using(lesson_id)
--     join step_student using(step_id)
--     where (submission_time - attempt_time) < 14400
--     group by 1,2,3
--     order by 1,2,3
-- ),
-- time_to_lesson(st,lesson2,time_to_l)
-- as
-- (
--     select st,lesson,sum(time_to_s) as Время_на_урок
--     from time_to_step
--     group by 1,2
--     order by Время_на_урок
-- ),
-- t3(lesson3, average_time)
-- as
-- (
--     select lesson2, ROUND(AVG(time_to_l / 3600), 2)
--     from time_to_lesson
--     group by 1
-- )
-- select ROW_NUMBER() OVER (ORDER BY average_time asc) AS Номер, concat(module_id, '.', lesson_position, ' ', lesson3) AS Урок, average_time AS Среднее_время
-- FROM t3
-- 
--  INNER JOIN lesson ON lesson.lesson_name = t3.lesson_name
--  INNER JOIN step USING (lesson_id)
--  INNER JOIN step_student USING(step_id)
-- GROUP BY  2, 3
-- ORDER BY 3;


-- WITH get_rate_lesson(mod_id, stud, rate) 
-- AS
-- (
--    SELECT module_id, student_name, count(DISTINCT step_id)
--    FROM stepik.student 
--         INNER JOIN stepik.step_student USING(student_id)
--         INNER JOIN stepik.step USING (step_id)
--         INNER JOIN stepik.lesson USING (lesson_id)
--    WHERE result = 'correct'
--    GROUP BY module_id, student_name
-- )
-- SELECT mod_id AS Модуль, stud AS Студент, rate AS Рейтинг,
--     ROW_NUMBER() OVER (PARTITION BY mod_id ORDER BY  rate DESC) AS Номер,
--     RANK() OVER (PARTITION BY mod_id ORDER BY  rate DESC) AS Ранг,
--     DENSE_RANK() OVER (PARTITION BY mod_id ORDER BY  rate DESC) AS Рейтинг  
-- FROM get_rate_lesson 

-- WITH get_rate_lesson(mod_id, les, rate) 
-- AS
-- (
--    SELECT module_id,CONCAT(module_id,'.', lesson_position),count(DISTINCT step_id)
--    FROM stepik.step_student INNER JOIN stepik.step USING (step_id)
--                      INNER JOIN stepik.lesson USING (lesson_id)
--    WHERE result = 'correct'
--    GROUP BY module_id, 2
-- )
-- SELECT mod_id AS Модуль, les AS Урок, rate AS Пройдено_шагов, 
--     MAX(rate) OVER (PARTITION BY mod_id) AS Максимум_по_модулю,
--     MIN(rate) OVER (PARTITION BY mod_id) AS Минимум_по_модулю
-- FROM get_rate_lesson 


WITH get_rate_lesson(mod_id, stud, rate) 
 AS
 (
    SELECT module_id, student_name, count(DISTINCT step_id)
    FROM stepik.student 
         INNER JOIN stepik.step_student USING(student_id)
         INNER JOIN stepik.step USING (step_id)
         INNER JOIN stepik.lesson USING (lesson_id)
    WHERE result = 'correct'
    GROUP BY module_id, student_name                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
 )
 SELECT mod_id AS Модуль, stud AS Студент, rate AS Пройдено_шагов,
--      ROW_NUMBER() OVER (PARTITION BY mod_id ORDER BY  rate DESC) AS Номер,
--      RANK() OVER (PARTITION BY mod_id ORDER BY  rate DESC) AS Ранг,
--      DENSE_RANK() OVER (PARTITION BY mod_id ORDER BY  rate DESC) AS Рейтинг  
--        round((rate/max(rate) over (partition by mod_id))*100,1) as Относительный_рейтинг
         ROUND(100 * rate / MAX(rate) OVER (PARTITION BY mod_id), 1) AS Относительный_рейтинг
 FROM get_rate_lesson 
order by mod_id, Относительный_рейтинг desc, stud
