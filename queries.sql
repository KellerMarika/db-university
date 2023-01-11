
--1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT * FROM `students`
WHERE YEAR(`date_of_birth`) =1990
ORDER BY `date_of_birth` ASC;



-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT * FROM `courses` WHERE `cfu` > 10
ORDER BY `cfu`ASC;



--3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT *, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),`date_of_birth`)), '%Y') + 0 AS `age`
FROM `students`
WHERE  DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),`date_of_birth`)), '%Y') + 0  > 30
ORDER BY `date_of_birth`DESC;

--4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT * FROM `courses`
WHERE `period` LIKE "I %"
AND `year`= 1
ORDER BY `name` ASC;

--5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)

/* calcola il pomeriggio dalle 12 bocciato____________________
SELECT * , DATE_FORMAT(`t`.`hour`,'%r') 
AS `day_time` 
FROM `exams` 
AS `t`
WHERE `date`= "2020-06-20"
AND DATE_FORMAT(`t`.`hour`,'%r') LIKE "%PM"
ORDER BY `hour` ASC; 
______________________________________________________________
 */

SELECT *
FROM `exams` 
WHERE `date`= "2020-06-20"
AND HOUR(`hour`) >= "14"
ORDER BY `hour` ASC;

--6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT * FROM `degrees`
WHERE `level` = "magistrale";



--7. Da quanti dipartimenti è composta l'università? (12)

SELECT COUNT(*) 
FROM `departments`;


--8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT COUNT(*) 
FROM `teachers`
WHERE `phone` IS NOT NULL;