
--1. Contare quanti iscritti ci sono stati ogni anno

SELECT `enrolment_date`,
COUNT(`enrolment_date`) AS `enrolments_per_year`
FROM `students`
GROUP BY `enrolment_date`  
ORDER BY `students`.`enrolment_date`;


--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT `office_address`,
COUNT(`office_address`) AS `teachers_per_address`
FROM `teachers`
GROUP BY `office_address`  
ORDER BY `teachers_per_address`DESC;


--3. Calcolare la media dei voti di ogni appello d'esame

SELECT `exam_id`, 
AVG(`vote`) as `vote_average`
FROM `exam_student`
GROUP BY `exam_id`
ORDER BY `vote_average` DESC;



--4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT `department_id`,
COUNT(`department_id`) AS `degrees_per_department`
FROM `degrees`
GROUP BY `department_id`  
ORDER BY `degrees_per_department` DESC;