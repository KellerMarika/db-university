--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT 
`students`.`name` AS `student_name`,
`students`.`surname` AS `student_surname`,
`students`.`date_of_birth` AS `student_birth_date`,
`students`.`fiscal_code` AS `student_fiscal_code`,
`degrees`.`name` AS `degree_name`
FROM `degrees`

INNER JOIN `students`
        ON `students`.`degree_id` = `degrees`.`id` 

WHERE `degrees`.`name` = "Corso di Laurea in Economia"
ORDER BY `student_birth_date`;


--2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT `degrees`.`name` AS `degrees_name`,
`degrees`.`level` AS `degrees_level`,
`departments`.`name` AS `department_name` 
FROM `departments`
INNER JOIN `degrees`
        ON `degrees`.`department_id` = `departments`.`id` 

WHERE `departments`.`name`="Dipartimento di Neuroscienze"
AND `degrees`.`level`="magistrale";


--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `teachers`.`name` AS `teachers_name`,
`teachers`.`surname` AS `teachers_surname`,
`courses`.`name` AS `courses_name` 
FROM `teachers`

INNER JOIN `course_teacher`
        ON `course_teacher`.`teacher_id` = `teachers`.`id`
INNER JOIN `courses`
        ON `course_teacher`.`course_id` = `courses`.`id`       
WHERE `teachers`.`id` =44
ORDER BY `courses`.`name`;

--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT
`students`.`name` AS `student_name`,
`students`.`surname` AS `student_surname`,
`students`.`enrolment_date` AS `student_enrolment_date`,

`degrees`.`name` AS `degrees_name`,
`degrees`.`level` AS `degrees_level`,

`departments`.`name` AS `department_name` 

FROM `students`

INNER JOIN `degrees`
        ON `students`.`degree_id` = `degrees`.`id`
        
INNER JOIN `departments`
        ON `degrees`.`department_id` = `departments`.`id`
        
ORDER BY 
`students`.`surname`,
`students`.`name`;

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT 
`degrees`.`name` AS `degrees_name`,
`courses`.`name` AS `courses_name`,
`teachers`.`surname` as `Teachers_surname`,
`teachers`.`name` as `Teachers_name`

FROM `degrees`
INNER JOIN `courses`
        ON `courses`.`degree_id`=`degrees`.`id`
        
INNER JOIN `course_teacher`
        ON `course_teacher`.`course_id`=`courses`.`id`

INNER JOIN `teachers`
        ON `course_teacher`.`teacher_id`=`teachers`.`id`  
ORDER BY `degrees_name` ASC;

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT
`departments`.`name` AS `departments_name`,
`teachers`.`name` AS `Teachers_name`,
`teachers`.`surname` AS `Teachers_surname`,
`teachers`.`id` AS `Teachers_id`

FROM `degrees`
        
INNER JOIN `courses`
        ON `courses`.`degree_id`=`degrees`.`id`
        
INNER JOIN `course_teacher`
        ON `course_teacher`.`course_id`=`courses`.`id`

INNER JOIN `teachers`
        ON `course_teacher`.`teacher_id`=`teachers`.`id`  
        
INNER JOIN `departments`
        ON `degrees`.`department_id`=`departments`.`id`     
        WHERE `departments`.`name`= "Dipartimento di Matematica"  
GROUP BY `Teachers_id`
ORDER BY 
`teachers`.`surname`,
`teachers`.`name`;


--7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

FROM `exam_student`
INNER JOIN `students`
        ON `exam_student`.`student_id`=`students`.`id`  

GROUP BY `exam_student`.`exam_id`;