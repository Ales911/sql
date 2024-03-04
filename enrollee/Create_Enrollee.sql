CREATE SCHEMA IF NOT EXISTS enrollee;

DROP TABLE IF EXISTS enrollee.department;
DROP TABLE IF EXISTS enrollee.subject;
DROP TABLE IF EXISTS enrollee.program;
DROP TABLE IF EXISTS enrollee.enrollee;
DROP TABLE IF EXISTS enrollee.achievement;
DROP TABLE IF EXISTS enrollee.enrollee_achievement;
DROP TABLE IF EXISTS enrollee.program_subject;
DROP TABLE IF EXISTS enrollee.program_enrollee;
DROP TABLE IF EXISTS enrollee.enrollee_subject;

CREATE TABLE enrollee.department (
department_id SERIAL PRIMARY KEY,
name_department VARCHAR(30)
);
INSERT INTO enrollee.department(department_id, name_department)
VALUES (1, 'Инженерная школа'), (2, 'Школа естественных наук');

CREATE TABLE enrollee.subject (
subject_id SERIAL PRIMARY KEY,
name_subject VARCHAR(30)
);
INSERT INTO enrollee.subject (name_subject)
VALUES ('Русский язык'), ('Математика'), ('Физика'), ('Информатика');

CREATE TABLE enrollee.program (
program_id SERIAL PRIMARY KEY,
name_program VARCHAR(50),
department_id INT,
plan INT,
FOREIGN KEY (department_id) REFERENCES enrollee.department(department_id) ON DELETE CASCADE
);

INSERT INTO enrollee.program (name_program, department_id, plan)
VALUES ('Прикладная математика и информатика', 2, 2),
('Математика и компьютерные науки', 2, 1),
('Прикладная механика', 1, 2),
('Мехатроника и робототехника', 1, 3);

CREATE TABLE enrollee.enrollee (
enrollee_id SERIAL PRIMARY KEY,
name_enrollee VARCHAR(50)
);

INSERT INTO enrollee.enrollee (name_enrollee)
VALUES ('Баранов Павел'), ('Абрамова Катя'), ('Семенов Иван'),
('Яковлева Галина'), ('Попов Илья'), ('Степанова Дарья');

CREATE TABLE enrollee.achievement (
achievement_id SERIAL PRIMARY KEY,
name_achievement VARCHAR(30),
bonus INT
);

INSERT INTO enrollee.achievement (name_achievement, bonus)
VALUES ('Золотая медаль', 5), ('Серебряная медаль', 3),
    ('Золотой значок ГТО', 3), ('Серебряный значок ГТО', 1);

CREATE TABLE enrollee.enrollee_achievement (
enrollee_achiev_id SERIAL PRIMARY KEY,
enrollee_id INT,
achievement_id INT,
FOREIGN KEY (enrollee_id) REFERENCES enrollee.enrollee(enrollee_id) ON DELETE CASCADE,
FOREIGN KEY (achievement_id) REFERENCES enrollee.achievement(achievement_id) ON DELETE CASCADE
);

INSERT INTO enrollee.enrollee_achievement (enrollee_id, achievement_id)
VALUES (1, 2), (1, 3), (3, 1), (4, 4), (5, 1),(5, 3);

CREATE TABLE enrollee.program_subject (
program_subject_id SERIAL PRIMARY KEY,
program_id INT,
subject_id INT,
min_result INT,
FOREIGN KEY (program_id) REFERENCES enrollee.program(program_id)  ON DELETE CASCADE,
FOREIGN KEY (subject_id) REFERENCES enrollee.subject(subject_id) ON DELETE CASCADE
);

INSERT INTO enrollee.program_subject (program_id, subject_id, min_result)
VALUES (1, 1, 40),(1, 2, 50), (1, 4, 60), ( 2, 1, 30),
       (2, 2, 50),(2, 4, 60), (3, 1, 30),(3, 2, 45),
       (3, 3, 45),(4, 1, 40), (4, 2, 45), (4, 3, 45);

CREATE TABLE enrollee.program_enrollee (
program_enrollee_id SERIAl PRIMARY KEY,
program_id INT,
enrollee_id INT,
FOREIGN KEY (program_id) REFERENCES enrollee.program(program_id) ON DELETE CASCADE,
FOREIGN KEY (enrollee_id) REFERENCES enrollee.enrollee(enrollee_id) ON DELETE CASCADE
);

INSERT INTO enrollee.program_enrollee (program_id, enrollee_id)
VALUES (3, 1), (4, 1), (1, 1), (2, 2), (1, 2),
       (1, 3), (2, 3), (4, 3), (3, 4), (3, 5),
       (4, 5), (2, 6), (3, 6), (4, 6);

CREATE TABLE enrollee.enrollee_subject (
enrollee_subject_id SERIAL PRIMARY KEY,
enrollee_id INT,
subject_id INT,
result INT,
FOREIGN KEY (enrollee_id) REFERENCES enrollee.enrollee(enrollee_id) ON DELETE CASCADE,
FOREIGN KEY (subject_id) REFERENCES enrollee.subject (subject_id) ON DELETE CASCADE
);


INSERT INTO enrollee.enrollee_subject (enrollee_id, subject_id, result)
VALUES (1, 1, 68), (1, 2, 70), (1, 3, 41), (1, 4, 75), (2, 1, 75), (2, 2, 70),
       (2, 4, 81), (3, 1, 85), (3, 2, 67), (3, 3, 90), (3, 4, 78), (4, 1, 82),
       (4, 2, 86), (4, 3, 70), (5, 1, 65), (5, 2, 67), (5, 3, 60),
       (6, 1, 90), (6, 2, 92), (6, 3, 88), (6, 4, 94);