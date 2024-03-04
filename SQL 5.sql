-- DROP SCHEMA IF EXISTS pdd CASCADE;
-- CREATE SCHEMA IF NOT EXISTS pdd;

-- CREATE TABLE pdd.fine
-- (
--     fine_id        SERIAL PRIMARY KEY,
--     name           VARCHAR(30),
--     number_plate   VARCHAR(6),
--     violation      VARCHAR(50),
--     sum_fine       DECIMAL(8, 2),
--     date_violation DATE,
--     date_payment   DATE
-- );
-- 
-- CREATE TABLE pdd.traffic_violation
-- (
--     violation_id SERIAL PRIMARY KEY,
--     violation    VARCHAR(50),
--     sum_fine     DECIMAL(8, 2)
-- );
-- 
-- INSERT INTO pdd.fine(name, number_plate, violation, sum_fine, date_violation, date_payment)
-- values ('Баранов П.Е.', 'P523BT', 'Превышение скорости(от 40 до 60)', NULL, '2020-02-14', NULL),
--        ('Абрамова К.А.', 'О111AB', 'Проезд на запрещающий сигнал', NULL, '2020-02-23', NULL),
--        ('Яковлев Г.Р.', 'T330TT', 'Проезд на запрещающий сигнал', NULL, '2020-03-03', NULL),
--        ('Баранов П.Е.', 'P523BT', 'Превышение скорости(от 40 до 60)', 500.00, '2020-01-12', '2020-01-17'),
--        ('Абрамова К.А.', 'О111AB', 'Проезд на запрещающий сигнал', 1000.00, '2020-01-14', '2020-02-27'),
--        ('Яковлев Г.Р.', 'T330TT', 'Превышение скорости(от 20 до 40)', 500.00, '2020-01-23', '2020-02-23'),
--        ('Яковлев Г.Р.', 'M701AA', 'Превышение скорости(от 20 до 40)', NULL, '2020-01-12', NULL),
--        ('Колесов С.П.', 'K892AX', 'Превышение скорости(от 20 до 40)', NULL, '2020-02-01', NULL);
-- 
-- INSERT INTO pdd.traffic_violation(violation, sum_fine)
-- VALUES ('Превышение скорости(от 20 до 40)', 500),
--        ('Превышение скорости(от 40 до 60)', 1000),
--        ('Проезд на запрещающий сигнал', 1000);

-- CREATE TABLE pdd.payment
-- (
--     payment_id SERIAL PRIMARY KEY,
--     name           varchar(30)   null,
--     number_plate   varchar(6)    null,
--     violation      varchar(50)   null,
--     date_violation date          null,
--     date_payment   date          null
-- );
-- 
-- INSERT INTO pdd.payment
--     (name, number_plate, violation, date_violation, date_payment)
-- VALUES
-- ('Яковлев Г.Р.', 'М701АА', 'Превышение скорости (от 20 до 40)', '2020-01-12', '2020-01-22'),
-- ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости (от 40 до 60)', '2020-02-14', '2020-03-06'),
-- ('Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', '2020-03-03', '2020-03-23');

-- SELECT * FROM pdd.fine

--update fine f, traffic_violation tv set f.sum_fine = tv.sum_fine where f.sum_fine is null and f.violation = tv.violation

-- SELECT name, number_plate, violation, count(*)
-- FROM fine
-- GROUP BY name, number_plate, violation;

-- SELECT name, number_plate, violation
-- FROM fine 
-- GROUP BY name, number_plate, violation
-- having COUNT(violation) > 1
-- ORDER BY name

-- UPDATE fine, 
--     (
--  SELECT name, number_plate, violation
--  FROM fine 
--  GROUP BY name, number_plate, violation
--  having COUNT(violation) > 1
--  ORDER BY name
--     ) as query_in
-- SET fine.sum_fine = 2 * fine.sum_fine
-- WHERE fine.name = query_in.name AND fine.violation = query_in.violation AND fine.number_plate = query_in.number_plate AND fine.date_payment is null;


-- UPDATE pdd.fine f, pdd.payment p   
-- SET f.date_payment = p.date_payment, f.sum_fine = IF (DATEDIFF(p.date_payment, p.date_violation) < 21, f.sum_fine/2, f.sum_fine)
-- WHERE f.name = p.name AND f.number_plate = p.number_plate AND f.violation = p.violation AND f.date_violation = p.date_violation AND f.date_payment IS NULL;
-- 
-- SELECT * FROM pdd.fine;  /* Чтобы сразу увидеть плоды нашей работы */

--  CREATE TABLE pdd.back_payment AS
--    SELECT "name", number_plate, violation, sum_fine, date_violation
--    FROM pdd.fine
--    WHERE date_payment IS NULL;


SELECT * FROM pdd.fine;

DELETE FROM pdd.fine WHERE date_violation < '2020-02-01'

