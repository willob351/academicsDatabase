

/*
DELIMITER //
CREATE FUNCTION passfail(
examgrade DECIMAL(4,2)
)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	DECLARE passed BOOLEAN;
    IF examgrade >= 60 THEN
		SET passed = 1;
	ELSEIF examgrade < 60 THEN
		SET passed = 0;
	END IF;
    RETURN (passed);
END// examgrade
DELIMITER ;

/*
CREATE VIEW `view2` AS
SELECT  m.module_name,
m.mod_id,
m.lecturer_id,
l.lecturer_name
FROM modules m 
RIGHT JOIN
lecturers l ON m.lecturer_id = l.lecturer_id
WHERE year = 2;


CREATE VIEW `showgrades` AS
SELECT g.mod_id,
m.module_name,
g.examgrade,
a.CAgrade
FROM grades g
LEFT JOIN 
modules m ON m.mod_id = g.mod_id
JOIN
assignments a ON m.mod_id = a.module_id;

SELECT module_name
FROM modules
WHERE mod_id IN (SELECT
mod_id
FROM grades
WHERE passfail(examgrade) = 0);

SELECT module_name
FROM modules
WHERE mod_id IN (SELECT
mod_id
FROM grades
WHERE examgrade <60);



DELIMITER //
CREATE PROCEDURE AddModule(
IN mod_id VARCHAR(10),
IN module_name VARCHAR(45),
IN credits INT,
IN lecturer_id INT,
IN grade DECIMAL(4,2),
IN year INT,
IN lecturer_name VARCHAR(45))
BEGIN

INSERT INTO modules (mod_id, module_name, credits, lecturer_id, grade, year)
VALUES (mod_id, module_name, credits, lecturer_id, grade, year);

INSERT INTO lecturers (lecturer_id, lecturer_name)
VALUES (lecturer_id, lecturer_name);

END//

DELIMITER ;



-- CALL AddModule ('BP210', 'Botany & Plant Science', 5, 598756, 65, 1, 'Dr Olivia Stengel');

 -- DELETE FROM modules WHERE mod_id = 'BP210';
 -- DELETE FROM lecturers WHERE lecturer_id = 598756;



CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `showgrades` AS
    SELECT 
        `g`.`mod_id` AS `Module id`,
        `m`.`module_name` AS `Module name`,
        `g`.`examgrade` AS `Exam Grade`,
        `a`.`CAgrade` AS `CA grade`
    FROM
        ((`grades` `g`
        LEFT JOIN `modules` `m` ON ((`m`.`mod_id` = `g`.`mod_id`)))
        JOIN `assignments` `a` ON ((`m`.`mod_id` = `a`.`module_id`)))

*/