-- SELECT author as Автор, COUNT(author) as Различных_книг, SUM(amount) as Количество_экземпляров
-- FROM book
-- GROUP BY author;

-- SELECT author, MIN(price) AS Минимальная_цена, MAX(price) AS Максимальная_цена, AVG(price) AS Средняя_цена 
-- FROM book
-- GROUP BY author;

-- SELECT author, ROUND(price*amount,2) AS Стоимость, ROUND(price*amount*0.18,2) AS НДС, ROUND(price*amount*0.82,2) AS Стоимость_без_НДС
-- FROM book
-- GROUP BY author, price, amount;

-- SELECT author, SUM(price * amount) AS Стоимость, ROUND((SUM(price*amount)/1.18)*0.18,2) AS НДС, ROUND(SUM(price*amount)/1.18,2) AS Стоимость_без_НДС
-- FROM book
-- GROUP BY author;

-- SELECT MIN(price) AS Минимальная_цена, 
--     MAX(price) AS Максимальная_цена, ROUND(AVG(price), 2) AS Средняя_цена 
-- FROM book;

-- SELECT author,
--     MIN(price) AS Минимальная_цена, 
--     MAX(price) AS Максимальная_цена
-- FROM book
-- GROUP BY author
-- HAVING SUM(price * amount) > 5000; 

-- SELECT 
--     ROUND(AVG(price), 2) AS Средняя_цена, 
--     ROUND(SUM(price*amount), 2) AS Стоимость
-- FROM book
-- WHERE amount between 5 and 10; 

-- SELECT author,
--     SUM(price*amount) AS Стоимость
-- FROM book
-- WHERE (title <> 'Идиот') AND (title <> 'Белая гвардия') 
-- GROUP BY author
-- HAVING SUM(price*amount) > 5000
--ORDER BY SUM(price*amount);

-- SELECT title, author, price, amount
-- FROM book
-- WHERE price <= (
--          SELECT AVG(price) 
--          FROM book
--       );

-- SELECT author, title, price
-- FROM book
-- WHERE (price - (SELECT MIN(price) FROM book)) <= 150
-- ORDER BY price 

-- SELECT title, author, amount, price
-- FROM book
-- WHERE author IN (
--         SELECT author 
--         FROM book 
--         GROUP BY author 
--         HAVING SUM(amount) >= 12
--       );
-- 
-- SELECT title, author, amount, price
-- FROM book
-- WHERE SELECT COUNT(amount) FROM book 
--       );

--SELECT book_id FROM book GROUP BY amount having (count(amount) = 1)

-- select author, title, amount from book where amount in (
-- SELECT amount FROM book GROUP BY amount having count(amount) = 1
-- )

-- SELECT author, title, price
-- FROM book
-- WHERE price < ANY (
--         SELECT MIN(price) 
--         FROM book 
--         GROUP BY author 
--       );

--SELECT title, author, amount, (SELECT MAX(amount) from book) - amount AS Заказ from book where amount < (SELECT MAX(amount) from book) 

--SELECT MAX(amount) from book

-- DELETE FROM supply 
-- WHERE title IN (
--         SELECT title
--         FROM book 
--         GROUP BY author HAVING SUM(amount) > 10
--       );
-- 
-- 
-- SELECT * FROM supply;

-- CREATE TABLE ordering AS
-- SELECT author, title, 5 AS amount
-- FROM book
-- WHERE amount < 4;
-- 
-- SELECT * FROM ordering;

-- CREATE TABLE ordering AS
-- SELECT author, title, 
--    (
--     SELECT ROUND(AVG(amount)) 
--     FROM book
--    ) AS amount
-- FROM book
-- WHERE book.amount < (SELECT ROUND(AVG(amount)) FROM book);
-- 
-- SELECT * FROM ordering;

-- create table trip
-- (
--     trip_id SERIAL PRIMARY KEY ,
--     name varchar(30),
--     city varchar(25),
--     per_diem decimal(8,2),
--     date_first date,
--     date_last date
-- );

-- insert into trip (name,city,per_diem,date_first,date_last) 
-- values
-- ('Баранов П.Е.','Москва',700 , '2020-01-12', '2020-01-17'),
-- ('Абрамова К.А.','Владивосток',450 , '2020-01-14', '2020-01-27'),
-- ('Семенов И.В.','Москва',700 , '2020-01-23', '2020-01-31'),
-- ('Ильиных Г.Р.','Владивосток', 450, '2020-01-12', '2020-02-02'),
-- ('Колесов С.П.','Москва',700 , '2020-02-01', '2020-02-06'),
-- ('Баранов П.Е.','Москва', 700, '2020-02-14', '2020-02-22'),
-- ('Абрамова К.А.','Москва', 700, '2020-02-23', '2020-03-01'),
-- ('Лебедев Т.К.','Москва', 700, '2020-03-03', '2020-03-06'),
-- ('Колесов С.П.','Новосибирск',450 , '2020-02-27', '2020-03-12'),
-- ('Семенов И.В.','Санкт-Петербург',700 , '2020-03-29', '2020-04-05'),
-- ('Абрамова К.А.','Москва',700 , '2020-04-06', '2020-04-14'),
-- ('Баранов П.Е.','Новосибирск',450 , '2020-04-18', '2020-05-04'),
-- ('Лебедев Т.К.','Томск',450 , '2020-05-20', '2020-05-31'),
-- ('Семенов И.В.','Санкт-Петербург',700 , '2020-06-01', '2020-06-03'),
-- ('Абрамова К.А.','Санкт-Петербург', 700, '2020-05-28', '2020-06-04'),
-- ('Федорова А.Ю.','Новосибирск',450 , '2020-05-25', '2020-06-04'),
-- ('Колесов С.П.','Новосибирск', 450, '2020-06-03', '2020-06-12'),
-- ('Федорова А.Ю.','Томск', 450, '2020-06-20', '2020-06-26'),
-- ('Абрамова К.А.','Владивосток', 450, '2020-07-02', '2020-07-13'),
-- ('Баранов П.Е.','Воронеж', 450, '2020-07-19', '2020-07-25');

--select *, MONTHNAME(date_first) from trip;
-- select MONTHNAME(date_first) as Месяц, Count(MONTHNAME(date_first)) AS Количество  from trip group by Месяц ORDER BY Количество DESC, Месяц;
--select name, city, per_diem, date_first, date_last from trip where name like '%а %' order by date_last DESC
 --select DISTINCT name from trip where city='Москва' ORDER BY name ASC
--select DISTINCT city from trip
-- select city, COUNT(city) as Количество from trip group by city order by Количество DESC limit 2
-- select name, city, DATEDIFF(date_last, date_first) AS Длительность from trip where city not in ('Москва', 'Санкт-Петербург')
--select name, city, date_first, date_last from trip where MONTH(date_first) = MONTH(date_last)
--select name, city, date_first, per_diem * (DATEDIFF(date_last, date_first) + 1) AS Сумма from trip WHERE MONTH(date_first) IN (2, 3) ORDER BY name, Сумма DESC
--select name, per_diem * (DATEDIFF(date_last, date_first) + 1) AS Сумма from trip 
--select name, per_diem * 3 AS Сумма from trip where name in (select name from trip GROUP BY name HAVING COUNT(name) > 3)
--select name, SUM(per_diem * (DATEDIFF(date_last, date_first) + 1) AS Сумма from trip GROUP BY name HAVING COUNT(name) > 3

-- SELECT title, name_genre, price FROM book 
--     JOIN genre ON genre.genre_id = book.genre_id AND book.amount > 8
--     ORDER BY book.price DESC

-- SELECT name_genre
-- FROM genre LEFT JOIN book
--      ON genre.genre_id = book.genre_id
-- WHERE title IS NULL

-- SELECT name_genre FROM genre 
--     LEFT JOIN book ON genre.genre_id = book.genre_id
--     GROUP BY genre.genre_id
--     HAVING COUNT(book.genre_id) = 0;

-- SELECT name_author, name_genre
-- FROM author, genre;

-- CREATE TABLE city (
--      city_id SERIAL PRIMARY KEY, 
--      name_city VARCHAR(50)
--  );

-- SELECT name_city, name_author, DATE_ADD("2020-01-01", INTERVAL FLOOR(RAND()*(365-1)+1) DAY) as Дата FROM city, author ORDER BY name_city, Дата DESC;

-- SELECT title, name_author, name_genre, price, amount
-- FROM
--     author 
--     INNER JOIN  book ON author.author_id = book.author_id
--     INNER JOIN genre ON genre.genre_id = book.genre_id
-- WHERE price BETWEEN 500 AND 700;

-- SELECT name_genre, title, name_author
-- FROM
--     author 
--     INNER JOIN  book ON author.author_id = book.author_id
--     INNER JOIN genre ON genre.genre_id = book.genre_id
-- WHERE name_genre LIKE '%Роман%' ORDER BY title;

-- SELECT name_author, count(title) AS Количество
-- FROM author 
-- INNER JOIN book on author.author_id = book.author_id
-- GROUP BY name_author
-- ORDER BY name_author;    

-- SELECT name_author, sum(amount) AS Количество
-- FROM 
--     author LEFT JOIN book
--     on author.author_id = book.author_id
-- GROUP BY name_author having (sum(amount) < 10) or (sum(amount) is null )
-- ORDER BY Количество;   

-- SELECT MAX(sum_amount) AS max_sum_amount
-- FROM 
--     (
--      SELECT author_id, SUM(amount) AS sum_amount 
--      FROM book 
--      GROUP BY author_id
--     ) query_in

-- SELECT name_author, SUM(amount) as Количество
-- FROM 
--     author INNER JOIN book
--     on author.author_id = book.author_id
-- GROUP BY name_author

-- SELECT name_author, SUM(amount) as Количество
-- FROM 
--     author INNER JOIN book
--     on author.author_id = book.author_id
-- GROUP BY name_author
-- HAVING SUM(amount) = 
--      (/* вычисляем максимальное из общего количества книг каждого автора */
--       SELECT MAX(sum_amount) AS max_sum_amount
--       FROM 
--           (/* считаем количество книг каждого автора */
--             SELECT author_id, SUM(amount) AS sum_amount 
--             FROM book GROUP BY author_id
--           ) query_in
--       );

-- SELECT name_author FROM book b 
--   INNER JOIN author a ON b.author_id=a.author_id
--   GROUP BY name_author
--   HAVING COUNT(DISTINCT(genre_id))=1

-- SELECT title, name_author, name_genre, price, amount FROM book b 
--   INNER JOIN author a ON b.author_id=a.author_id
--   INNER JOIN genre g ON b.genre_id=g.genre_id
--  GROUP BY a.name_author
--  HAVING COUNT(DISTINCT(genre_id))=1

-- SELECT  title, name_author, name_genre, price, amount 
-- FROM author 
--     INNER JOIN book ON author.author_id = book.author_id
--     INNER JOIN genre ON  book.genre_id = genre.genre_id
-- WHERE genre.genre_id IN
--          (/* выбираем автора, если он пишет книги в самых популярных жанрах*/
--           SELECT query_in_1.genre_id
--           FROM 
--               ( /* выбираем код жанра и количество произведений, относящихся к нему */
--                 SELECT genre_id, SUM(amount) AS sum_amount
--                 FROM book
--                 GROUP BY genre_id
--                )query_in_1
--           INNER JOIN 
--               ( /* выбираем запись, в которой указан код жанр с максимальным количеством книг */
--                 SELECT genre_id, SUM(amount) AS sum_amount
--                 FROM book
--                 GROUP BY genre_id
--                 ORDER BY sum_amount DESC
--                 LIMIT 1
--                ) query_in_2
--           ON query_in_1.sum_amount= query_in_2.sum_amount
--          )
-- ORDER BY title   

-- SELECT title, name_author, author_id /* имя таблицы, из которой берется author_id, указывать не обязательно*/
-- FROM author 
-- INNER JOIN book USING(author_id);

-- SELECT book.title AS Название, author.name_author AS Автор, book.amount + supply.amount AS Количество
-- FROM 
--     author 
--     JOIN book USING (author_id)   
--     JOIN supply ON book.title = supply.title 
--                          and author.name_author = supply.author
-- WHERE book.price = supply.price
-- GROUP BY Название, Автор, Количество

-- UPDATE book 
--      INNER JOIN author ON author.author_id = book.author_id
--      INNER JOIN supply ON book.title = supply.title 
--                          and supply.author = author.name_author
-- SET book.amount = book.amount + supply.amount,
--     book.price = (book.price * book.amount + supply.price * supply.amount)/(book.amount + supply.amount),
--     supply.amount = 0   
-- WHERE book.price != supply.price;

-- INSERT INTO author (name_author) 
--     SELECT supply.author FROM author
--     RIGHT JOIN supply on author.name_author = supply.author
-- WHERE name_author IS Null;

-- insert into book (title, author_id, price, amount)
-- SELECT title, author_id, price, amount
-- FROM 
--     author 
--     INNER JOIN supply ON author.name_author = supply.author
-- WHERE amount <> 0;

-- DELETE FROM author WHERE author_id in (Select author_id from book GROUP BY author_id having SUM(amount) < 20)
-- DELETE FROM genre WHERE genre_id in(select genre_id from book group by genre_id having count(title) < 4);

-- DELETE FROM author 
-- USING author JOIN book USING(author_id)
--              JOIN genre USING(genre_id)
-- WHERE name_genre='Поэзия'     


-- SELECT buy.buy_id, book.title, book.price, buy_book.amount
-- FROM buy_book
-- JOIN book USING(book_id)
-- JOIN buy USING(buy_id)
-- WHERE client_id = (Select client_id from client where name_client = 'Баранов Павел')
-- ORDER BY buy.buy_id, book.title

-- SELECT name_author, title, COUNT(buy_book.amount)
--    FROM book
--    JOIN author USING(author_id)
--    LEFT JOIN buy_book USING(book_id)
-- GROUP BY name_author, title
-- ORDER BY name_author, title

-- SELECT city.name_city, COUNT(buy.buy_id) AS Количество
-- FROM client JOIN buy USING(client_id)
--             JOIN city USING(city_id)
-- GROUP BY city.name_city
-- ORDER BY Количество DESC

--SELECT buy_id, date_step_end FROM buy_step WHERE date_step_end IS NOT NULL AND step_id = 1

-- select buy_id, name_client, sum(book.price*buy_book.amount) as Стоимость
-- from buy_book
-- join buy using(buy_id)
-- JOIN client using(client_id)
-- join book using(book_id)
-- Group BY buy_id,name_client
-- oRDER BY buy_id;

-- SELECT buy_id, name_step
-- FROM step
--     JOIN buy_step ON buy_step.step_id = step.step_id
--         AND date_step_beg IS NOT NULL 
--         AND date_step_end IS NULL
-- ORDER BY buy_id;

-- SELECT buy_step.buy_id, DATEDIFF(date_step_end, date_step_beg) AS Количество_дней, IF (DATEDIFF(date_step_end, date_step_beg) > days_delivery, ABS(days_delivery - DATEDIFF(date_step_end, date_step_beg)), 0) AS Опоздание
-- FROM buy
--     JOIN client USING(client_id)
--     JOIN city USING(city_id)
--     JOIN buy_step ON buy_step.buy_id = buy.buy_id AND date_step_end IS NOT NULL
--     JOIN step ON buy_step.step_id = step.step_id AND step.step_id = 3

-- SELECT DISTINCT name_client
-- FROM buy
--     JOIN client USING(client_id)
--     JOIN buy_book USING(buy_id)
--     JOIN book USING(book_id)
--     JOIN author ON author.author_id = book.author_id AND name_author like 'Достоев%'

-- SELECT name_genre, SUM(buy_book.amount) AS Количество 
-- FROM book
--      JOIN genre USING(genre_id)
--      JOIN buy_book USING(book_id)
-- GROUP BY name_genre
-- having sum(buy_book.amount) = /*Оставляет только те жанры, у которых количество продаж равен максимуму продаж*/
-- (
--  select max(sum_amount) as max_sum_amount /*Находим максимум продаж книг по жанрам*/
--  from
--      ( 
--       select name_genre, sum(buy_book.amount) as sum_amount /*Находим сколько книг продали по жанрам*/
--       from 
--            genre
--            inner join book on genre.genre_id = book.genre_id
--            inner join buy_book on book.book_id = buy_book.book_id
--       group by name_genre
--      ) as query_in
-- )

-- SELECT name_genre, SUM(bb.amount) AS KOL 
-- FROM book 
--     JOIN genre USING (genre_id)
--     JOIN buy_book bb USING (book_id)
-- GROUP BY name_genre
-- HAVING SUM(bb.amount) >= ALL 
--     (SELECT SUM(bb.amount) AS sum_amount
--      FROM book JOIN buy_book bb USING (book_id)
-- GROUP BY genre_id);

-- SELECT name_client
-- FROM 
--     buy_archive
--     INNER JOIN client USING(client_id)
-- UNION ALL
-- SELECT name_client
-- FROM 
--     buy 
--     INNER JOIN client USING(client_id)

-- SELECT buy_id, client_id, book_id, date_payment, amount, price
-- FROM 
--     buy_archive
-- UNION ALL
-- SELECT buy.buy_id, client_id, book_id, date_step_end, buy_book.amount, price
-- FROM 
--     book 
--     INNER JOIN buy_book USING(book_id)
--     INNER JOIN buy USING(buy_id) 
--     INNER JOIN buy_step USING(buy_id)
--     INNER JOIN step USING(step_id)                  
-- WHERE  date_step_end IS NOT Null and name_step = 'Оплата'

-- SELECT TO_CHAR(date_payment, 'YYYY') AS Year, TO_CHAR(date_payment, 'Month') AS Month, SUM(price*amount) AS Сумма
-- FROM buy_archive
-- GROUP BY Year, Month
-- UNION ALL
-- SELECT TO_CHAR(date_step_end, 'YYYY') AS Year, TO_CHAR(date_step_end, 'Month') AS Month, SUM(buy_book.amount*price) 
-- FROM buy_step 
--     JOIN buy_book USING(buy_id)
--     JOIN book USING(book_id)
-- WHERE  date_step_end IS NOT Null and step_id = 1
-- GROUP BY Year, Month
-- ORDER BY Month, Year

-- SELECT title, SUM(amount_tmp) AS Количество, SUM(sum_tmp) AS Сумма FROM 
-- (SELECT title, SUM(buy_book.amount) AS amount_tmp, SUM(price*buy_book.amount) AS sum_tmp FROM book
--     JOIN buy_book USING(book_id)
--     JOIN buy_step ON buy_step.buy_id = buy_book.buy_id and date_step_end IS NOT Null and step_id = 1
-- GROUP BY title
-- UNION ALL
-- SELECT title, SUM(buy_archive.amount) AS amount_tmp, SUM(buy_archive.price*buy_archive.amount) AS sum_tmp
-- FROM book
--     JOIN buy_archive USING(book_id)
-- GROUP BY title) AS query_tmp
-- GROUP BY query_tmp.title
-- ORDER BY Сумма DESC

-- INSERT INTO client (name_client, city_id, email)
-- SELECT 'Попов Илья', city_id, 'popov@test'
-- FROM city
-- WHERE city.name_city = 'Москва';

-- INSERT INTO buy (buy_description, client_id)
-- SELECT 'Связаться со мной по вопросу доставки', client_id
-- FROM client
-- WHERE name_client LIKE 'Попо%';

-- INSERT INTO buy_book (buy_id, book_id, amount)
-- SELECT 5, book_id, 2
-- FROM book 
--     JOIN author ON book.author_id = author.author_id AND author.name_author like 'Пастернак%'
-- where book.title = 'Лирика';
-- 
-- INSERT INTO buy_book (buy_id, book_id, amount)
-- SELECT 5, book_id, 1
-- FROM book 
--     JOIN author ON book.author_id = author.author_id AND author.name_author LIKE 'Булгако%'
-- where book.title LIKE 'Белая %';

--SELECT * FROM buy_book;


--  UPDATE book, (SELECT book_id, amount FROM buy_book where buy_id = 5) AS query_in
--  SET book.amount = book.amount - query_in.amount WHERE book.book_id = query_in.book_id;

-- update book
-- set amount = book.amount - buy_book.amount      --без алиаса вначале
-- from buy_book
-- where buy_book.buy_id = 5 and book.book_id = buy_book.book_id;

-- CREATE TABLE buy_pay AS 
-- SELECT book.title, author.name_author, book.price, buy_book.amount, book.price * buy_book.amount
-- FROM book
--     JOIN author USING(author_id)
--     JOIN buy_book ON book.book_id = buy_book.book_id AND buy_book.buy_id = 5
-- ORDER BY book.title;

-- CREATE TABLE buy_pay AS 
-- SELECT book.title, author.name_author, book.price, buy_book.amount, book.price * buy_book.amount
-- FROM book
--     JOIN author USING(author_id)
--     JOIN buy_book ON book.book_id = buy_book.book_id AND buy_book.buy_id = 5
-- ORDER BY book.title;

-- CREATE TABLE buy_pay AS 
-- SELECT buy_book.buy_id, SUM(buy_book.amount) AS Количество, SUM (book.price * buy_book.amount) AS Итого 
-- FROM book
--     JOIN buy_book ON book.book_id = buy_book.book_id AND buy_book.buy_id = 5;
-- GROUP BY buy_book.buy_id;

--INSERT INTO buy_step (buy_id, step_id) SELECT 5, step_id FROM step;

--UPDATE buy_step SET date_step_beg = '2020-04-12' WHERE buy_id = 5 AND step_id = 1;

-- SET @buy_id = 5, @date_step = '2020-04-13', @step1 = 'Оплата'; @step1 = 'Упаковка';
-- 
-- UPDATE buy_step SET date_step_end = @date_step WHERE buy_id = @buy_id AND step_id = (SELECT step_id from step WHERE name_step = @step1);
-- UPDATE buy_step SET date_step_begin = @date_step WHERE buy_id = @buy_id AND step_id = (SELECT step_id from step WHERE name_step = @step2);
-- 
-- SELECT * FROM buy_step;

-- DROP SCHEMA IF EXISTS testing CASCADE;
-- CREATE SCHEMA IF NOT EXISTS testing;

--SELECT name_student, date_attempt, result FROM attempt
-- SELECT date_attempt, result FROM attempt

-- CREATE TABLE orders (
--     id SERIAL PRIMARY KEY ,
--     date date,
--     medium varchar(30),
--     Conversions int
--  );
-- 
-- insert into orders (date, medium, Conversions) 
-- values
--     ('2020-05-10', 'cpa', 1),
--     ('2020-05-10', 'cpc', 2),
--     ('2020-05-10', 'organic', 1),
--     ('2020-05-11', 'cpa', 1),
--     ('2020-05-11', 'cpc', 3),
--     ('2020-05-11', 'organic', 2),
--     ('2020-05-11', 'direct', 1),
--     ('2020-05-12', 'cpc', 1),
--     ('2020-05-12', 'organic', 2);

-- SELECT date, Medium
-- , Conversions
-- , SUM(Conversions) OVER() AS Sum
-- FROM orders;

--     SELECT 
--       Date
--     , Medium
--     , Conversions
--     , SUM(Conversions) OVER(PARTITION BY Date) AS Sum
--     FROM Orders

--     SELECT 
--       Date
--     , Medium
--     , Conversions
--     , SUM(Conversions) OVER(PARTITION BY Date ORDER BY Medium) AS Sum
--     FROM Orders

--     SELECT 
--       Date
--     , Medium
--     , Conversions
--     , SUM(Conversions) OVER(PARTITION BY Date ORDER BY Conversions ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS Sum 
--     FROM Orders

--     SELECT 
--       Date
--     , Medium
--     , Conversions
--     , SUM(Conversions) OVER(PARTITION BY Date) AS Sum
--     , COUNT(Conversions) OVER(PARTITION BY Date) AS Count
--     , AVG(Conversions) OVER(PARTITION BY Date) AS Avg
--     , MAX(Conversions) OVER(PARTITION BY Date) AS Max
--     , MIN(Conversions) OVER(PARTITION BY Date) AS Min
--     FROM Orders

--     SELECT 
--       Date
--     , Medium
--     , Conversions
--     , ROW_NUMBER() OVER(PARTITION BY Date ORDER BY Conversions) AS Row_number
--     , RANK() OVER(PARTITION BY Date ORDER BY Conversions) AS Rank
--     , DENSE_RANK() OVER(PARTITION BY Date ORDER BY Conversions) AS Dense_Rank 
--     , NTILE(3) OVER(PARTITION BY Date ORDER BY Conversions) AS Ntile
--     FROM Orders

--     SELECT 
--       Date
--     , Medium
--     , Conversions
--     , LAG(Conversions) OVER(PARTITION BY Date ORDER BY Date) AS Lag 
--     , LEAD(Conversions) OVER(PARTITION BY Date ORDER BY Date) AS Lead
--     , FIRST_VALUE(Conversions) OVER(PARTITION BY Date ORDER BY Date) AS First_Value
--     , LAST_VALUE(Conversions) OVER(PARTITION BY Date ORDER BY Date) AS Last_Value
--     FROM Orders



-- CREATE TABLE empsalary (
-- 	depname char (10) NOT NULL,
--         empno int NOT NULL,
--         salary int NOT NULL
-- )
-- ;
-- 
-- 
-- insert into empsalary values('develop', 11, 5200);
-- insert into empsalary values('develop', 7, 4200);
-- insert into empsalary values('develop', 9, 4500);
-- insert into empsalary values('develop', 6, 6000);
-- insert into empsalary values('develop', 10, 5200);
-- insert into empsalary values('personnel', 5, 3500);
-- insert into empsalary values('personnel', 2, 3900);
-- insert into empsalary values('sales', 3, 4800);
-- insert into empsalary values('sales', 1, 5000);
-- insert into empsalary values('sales', 4, 4800);

--select * from empsalary

--SELECT depname, empno, salary, avg(salary) FROM empsalary GROUP BY depname, empno, salary;
-- SELECT depname, empno, salary, avg(salary) OVER (PARTITION BY depname) FROM empsalary;

--SELECT depname, empno, salary, rank() OVER (PARTITION BY depname ORDER BY salary DESC) FROM empsalary;
--SELECT salary, sum(salary) OVER () FROM empsalary;
SELECT salary, sum(salary) OVER (ORDER BY salary) FROM empsalary;
