SELECT * 
FROM hr;

DESCRIBE hr;

CREATE TABLE `hr1` (
  `employee_id` text,
  `first_name` text,
  `last_name` text,
  `birth_date` date DEFAULT NULL,
  `gender` text,
  `race` text,
  `department` text,
  `job_title` text,
  `location` text,
  `hire_date` date DEFAULT NULL,
  `term_date` text,
  `location_city` text,
  `location_state` text,
  `age` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO hr1
SELECT *
FROM hr;

SELECT *
FROM hr1;


SELECT birthdate
FROM hr1;

UPDATE hr1
SET birth_date = CASE
	WHEN birth_date LIKE '%/%'
    THEN DATE_FORMAT(STR_TO_DATE(birth_date, '%m/%d/%Y'), '%Y-%m-%d')
	WHEN birth_date LIKE '%-%'
    THEN DATE_FORMAT(STR_TO_DATE(birth_date, '%m-%d-%Y'), '%Y-%m-%d')
ELSE NULL
END;

ALTER TABLE hr1
MODIFY birth_date DATE;

SELECT * 
FROM hr1;

UPDATE hr1
SET hire_date = CASE
	WHEN hire_date LIKE '%/%'
    THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
	WHEN hire_date LIKE '%-%'
    THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
ELSE NULL
END;

ALTER TABLE hr1
MODIFY hire_date DATE;

UPDATE hr1
SET term_date = DATE(STR_TO_DATE(term_date,'%Y-%m-%d %H:%i:%s UTC'))
WHERE term_date IS NOT NULL AND term_date != '';

UPDATE hr1
SET term_date = '0000-00-00'
WHERE term_date = '';

ALTER TABLE hr1
MODIFY COLUMN term_date DATE;


SELECT term_date
FROM hr1;


SELECT term_date
FROM hr1
GROUP BY 1
ORDER BY 1;

SELECT DISTINCT job_title, location, hire_date
FROM hr1
ORDER BY 1;

SELECT *
FROM hr1;

SELECT DISTINCT location_state
FROM hr1
WHERE term_date IS NOT NULL
ORDER BY 1;


UPDATE hr1
SET job_title = 'Data Coordinator'
WHERE job_title LIKE 'Data Coordiator%';

ALTER TABLE hr1
ADD COLUMN age INT;

-- Changing birthdate to age

UPDATE hr1
SET age = TIMESTAMPDIFF(YEAR, birth_date, CURDATE());

SELECT birth_date, age
FROM hr1
ORDER BY 1;

SELECT *
FROM hr1;
