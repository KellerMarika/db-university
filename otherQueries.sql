SELECT `students`.`name`,
       `students`.`surname`,
       `degrees`.`name` AS `degree_name`
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`;

SELECT * 
FROM `degrees`
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
WHERE `degrees`.`name`= "Corso di Laurea in Informatica";


SELECT * 
FROM `courses`
INNER JOIN `exams` 
ON `courses`.`id` = `exams`.`course_id`
WHERE `courses`.`id`=144;

SELECT `degrees`.*, `departments`.`name` AS `DIPARTIMENTO`
FROM `degrees`
INNER JOIN `departments`
ON `departments`.id = `degrees`.`department_id`
WHERE`degrees`.`name`= "Corso di Laurea in Diritto dell'Economia";

--# Selezionare tutti gli appelli d'esame del Corso di Laurea Magistrale in Fisica del primo anno
SELECT `degrees`.`name` AS `corso di laurea`,
`courses`.`name`AS `materia` ,
`courses`.`year`AS `anno`,
`exams`.*
FROM `degrees`
INNER JOIN `courses`
        ON `courses`.`degree_id`=`degrees`.`id`
INNER JOIN `exams`
        ON `exams`.`course_id`=`courses`.`id`

WHERE `degrees`.`name`= "Corso di Laurea Magistrale in Fisica" 
  AND `courses`.`year` =1

  --# quanti appelli d'esame del Corso di Laurea Magistrale in Fisica del primo anno sono avvenuti al pomeriggio ?

  SELECT COUNT(*)
FROM `degrees`
INNER JOIN `courses`
        ON `courses`.`degree_id`=`degrees`.`id`
INNER JOIN `exams`
        ON `exams`.`course_id`=`courses`.`id`

WHERE `degrees`.`name`= "Corso di Laurea Magistrale in Fisica" 
  AND `courses`.`year` =1
  AND `exams`.`hour`> "14:00:00";


-- concatenazione con tabemma ponte di cui non mostro nulla
  SELECT degrees.name AS `corso di laurea`,
courses.name AS `corso`,
teachers.name as `insegnante`
FROM `degrees`
INNER JOIN `courses`
        ON `courses`.`degree_id`=`degrees`.`id`
        
INNER JOIN `course_teacher`
        ON `course_teacher`.`course_id`=`courses`.`id`

INNER JOIN `teachers`
        ON `course_teacher`.`teacher_id`=`teachers`.`id`
WHERE `degrees`.`name`= "Corso di Laurea in lettere";


--# Selezionare il voto medio di superamento d'esame per ogni corso, con anche i dati
--# del corso di laurea associato, ordinati per media voto decrescente

SELECT `courses`.`id`, `courses`.`name`,
		AVG(`exam_student`.`vote`) as `avg_vote`
FROM `exam_student`
INNER JOIN `exams`
	ON `exam_student`.`exam_id` = `exams`.`id`
INNER JOIN `courses`
	ON `exams`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
	ON `courses`.`degree_id` = `degrees`.`id`
WHERE `exam_student`.`vote` >= 18
GROUP BY `courses`.`id`
ORDER BY `avg_vote` DESC;



SELECT department, SUM(sales) as "Total sales"
FROM order_details
GROUP BY department
HAVING SUM(sales) > 1000;


SELECT `students`.`name` as `student_name`,
       `students`.`surname` as `student_surname`,
       `exam_student`.`student_id`  AS `student_id`,
       `exam_student`.`exam_id` AS `exam_id_par_student`,
       `exam_student`.`vote`AS `students_vote`,
       `exams`.`course_id` AS `course_id`

FROM `students`
INNER JOIN `exam_student`
        ON `exam_student`.`student_id` = `students`.`id` 
INNER JOIN `exams`
        ON `exam_student`.`exam_id` = `exams`.`id`
        
        
GROUP BY `student_id`,
         `exam_id_par_student`,
          `course_id`
         HAVING `students_vote`> 18  
ORDER BY `exam_student`.`student_id` ASC
-----------------------------------------------------------------





SELECT `students`.`name` as `student_name`,
       `students`.`surname` as `student_surname`,
       `exam_student`.`student_id`  AS `student_id`,
       COUNT (`exam_student`.`exam_id`) AS `exam_id_par_student`,
       `exam_student`.`vote`AS `students_vote`,
       `exams`.`course_id` AS `course_id`

FROM `students`
INNER JOIN `exam_student`
        ON `exam_student`.`student_id` = `students`.`id` 
        
INNER JOIN `exams`
        ON `exams`.`id` = `exam_student`.`exam_id` 
        
GROUP BY `student_id`,
          `course_id`
         
ORDER BY `exams`.`course_id` ASC,
         `students`.`id`,
         `exams`.`id`;