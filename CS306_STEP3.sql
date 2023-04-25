CREATE DATABASE causesOfDeath;

CREATE TABLE causesofdeath.countries(
      c_name Varchar(50),
      c_code Varchar(50) Not Null,
      c_year INT NOT NULL,
      c_id int Not Null,
      primary key (c_id)
);

CREATE TABLE causesofdeath.diseases(
      d_name Varchar(50),
      d_code Varchar(50) Not Null,
      d_year INT NOT NULL,
   d_meningitis INT NOT NULL,
   d_alzheimers_disease INT NOT NULL,
   d_parkinsons_disease INT NOT NULL,
   d_malaria INT NOT NULL,
   d_maternal_disorders INT NOT NULL,
   d_hiv_aids INT NOT NULL,
   d_tuberculosis INT NOT NULL,
   d_cardiovascular_diseases INT NOT NULL,
   d_diabetes_mellitus INT NOT NULL,
   d_id int Not Null,
      primary key (d_id)
);

CREATE TABLE causesofdeath.terrorism(
      t_name Varchar(50),
      t_code Varchar(50) Not Null,
      t_year INT NOT NULL,
      t_death double,
      t_id int Not Null,
      primary key (t_id)
);

CREATE TABLE causesofdeath.exposuretoforcesofnature(
      f_name Varchar(50),
      f_code Varchar(50) Not Null,
      f_year INT NOT NULL,
      f_death double,
      f_id int Not Null,
      primary key (f_id)
);

CREATE TABLE causesofdeath.selfharm(
      s_name Varchar(50),
      s_code Varchar(50) Not Null,
      s_year INT NOT NULL,
      s_death double,
      s_id int Not Null,
      primary key (s_id)
);

CREATE TABLE causesofdeath.democracy(
      dem_name Varchar(50),
      dem_code Varchar(50) Not Null,
      dem_year INT NOT NULL,
      dem_mean double,
      dem_high double,
      dem_low double,
      dem_id DECIMAL,
      primary key (dem_id)
);


CREATE TABLE causesofdeath.gdp(
      g_name Varchar(50),
      g_code Varchar(50) Not Null,
      g_year INT NOT NULL,
      g_mean double,
      g_id DECIMAL,
      primary key (g_id)
);

#1a)
CREATE VIEW low_disease_death AS
SELECT d_name, d_code, d_year, d_meningitis,d_alzheimers_disease,d_parkinsons_disease,d_malaria,d_maternal_disorders,d_hiv_aids,d_tuberculosis,d_cardiovascular_diseases,d_diabetes_mellitus,d_id
FROM causesofdeath.diseases
WHERE d_meningitis<1500 AND d_alzheimers_disease<5000 AND d_parkinsons_disease<1000 AND d_malaria<0.2 AND d_maternal_disorders<2000 AND d_hiv_aids<1000 AND d_tuberculosis<200000 AND d_cardiovascular_diseases<100000 AND d_diabetes_mellitus<5000;


CREATE VIEW high_nature_death AS
SELECT f_name, f_code, f_year, f_death, f_id
FROM causesofdeath.exposuretoforcesofnature
WHERE f_death>1;


CREATE VIEW high_terrorism_activity AS
SELECT t_name, t_code, t_year, t_death, t_id
FROM causesofdeath.terrorism
WHERE t_death>30;


CREATE VIEW high_selfharm_activity AS
SELECT s_name, s_code, s_year, s_death, s_id
FROM causesofdeath.selfharm
WHERE t_death>10;

USE causesOfDeath;
CREATE VIEW low_democracy AS
SELECT dem_name, dem_code, dem_year, dem_mean, dem_id
FROM causesofdeath.democracy
WHERE dem_mean<0.5;


USE causesOfDeath;
CREATE VIEW high_gdp AS
SELECT g_name, g_code, g_year, g_mean, g_id
FROM causesofdeath.gdp
WHERE g_mean>18381;

#1b) 
SELECT * FROM low_democracy AS ld
UNION
SELECT * FROM high_terrorism_activity AS hta;
SELECT ld.dem_name AS name, ld.dem_code AS code, ld.dem_year AS year, ld.dem_mean AS mean,ld.dem_low AS low, ld.dem_high AS high, ld.dem_id AS id
FROM low_democracy ld
LEFT JOIN
high_terrorism_activity hta ON ld.dem_code = hta.t_code AND ld.dem_year = hta.t_year
WHERE
hta.t_code IS NULL
UNION
SELECT hta.t_name AS name, hta.t_code AS code, hta.t_year AS year, hta.t_death AS death, hta.t_id AS id
FROM low_democracy ld
RIGHT JOIN high_terrorism_activity hta ON ld.dem_code = hta.t_code AND ld.dem_year = hta.t_year
WHERE ld.dem_code IS NULL;

#1c)
SELECT * FROM causesofdeath.countries c
WHERE c.c_year IN (
    SELECT hta.t_year
    FROM high_terrorism_activity hta
    WHERE c.c_code = hta.t_code
);

SELECT * FROM causesofdeath.countries c
WHERE EXISTS (
    SELECT hta.t_year
    FROM high_terrorism_activity hta
    WHERE c.c_code = hta.t_code AND c.c_year = hta.t_year
);

SELECT COUNT(*)
FROM (SELECT * FROM causesofdeath.countries c
        WHERE c.c_year IN (
        SELECT hta.t_year
        FROM high_terrorism_activity hta
        WHERE c.c_code = hta.t_code
    )
) AS in_result;

SELECT COUNT(*)
FROM (
    SELECT *
    FROM causesofdeath.countries c
    WHERE EXISTS (
        SELECT 1
        FROM high_terrorism_activity hta
        WHERE c.c_code = hta.t_code AND c.c_year = hta.t_year
    )
) AS exists_result;

#1d)

#1- Sum and count
SELECT c.c_year,
    COUNT(*) as country_count,
    SUM(d.d_malaria) as total_malaria_deaths
FROM causesofdeath.countries c
JOIN causesofdeath.diseases d ON c.c_code = d.d_code AND c.c_year = d.d_year
GROUP BY c.c_year
HAVING total_malaria_deaths > 1000;

#2- Avg and min
	SELECT c.c_year,
	    AVG(d.d_malaria) as average_malaria_deaths,
	    MIN(d.d_malaria) as min_malaria_deaths
	FROM causesofdeath.countries c
	JOIN causesofdeath.diseases d ON c.c_code = d.d_code AND c.c_year = d.d_year
	GROUP BY c.c_year
	HAVING average_malaria_deaths > 10;
	
#3- Max and count: 

SELECT c.c_year,
    MAX(d.d_malaria) as max_malaria_deaths,
    COUNT(*) as country_count
FROM causesofdeath.countries c
JOIN causesofdeath.diseases d ON c.c_code = d.d_code AND c.c_year = d.d_year
GROUP BY c.c_year
HAVING max_malaria_deaths > 100;

#4- Sum,avg,count,min,max:
	SELECT c.c_year,
	    SUM(d.d_malaria) as total_malaria_deaths,
	    AVG(d.d_malaria) as average_malaria_deaths,
	    COUNT(*) as country_count,
	    MIN(d.d_malaria) as min_malaria_deaths,
	    MAX(d.d_malaria) as max_malaria_deaths
	FROM causesofdeath.countries c
	JOIN causesofdeath.diseases d ON c.c_code = d.d_code AND c.c_year = d.d_year
	GROUP BY c.c_year
	HAVING total_malaria_deaths > 1000 AND average_malaria_deaths > 10;
    
#2)
    SELECT MIN(d_malaria) AS min_malaria, MAX(d_malaria) AS max_malaria
FROM causesofdeath.diseases;

ALTER TABLE causesofdeath.diseases
ADD CONSTRAINT chk_malaria_range CHECK (d_malaria >= 0 AND d_malaria <= 1000000);

INSERT INTO causesofdeath.diseases (d_name, d_code, d_year,d_meningitis, d_alzheimers_disease, d_parkinsons_disease,d_malaria, d_maternal_disorders, d_hiv_aids, d_tuberculosis, d_cardiovascular_diseases, d_diabetes_mellitus, d_id)
VALUES ('Test Country', 'TC', 2022, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 6893);

DELIMITER //
CREATE TRIGGER tr_fix_malaria_value_before_insert
BEFORE INSERT ON causesofdeath.diseases
FOR EACH ROW
BEGIN
    IF NEW.d_malaria < 0 THEN
        SET NEW.d_malaria = 0;
    ELSEIF NEW.d_malaria > 1000 THEN
        SET NEW.d_malaria = 1000;
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_fix_malaria_value_before_update
BEFORE UPDATE ON causesofdeath.diseases
FOR EACH ROW
BEGIN
    IF NEW.d_malaria < 0 THEN
        SET NEW.d_malaria = 0;
    ELSEIF NEW.d_malaria > 1000 THEN
        SET NEW.d_malaria = 1000;
    END IF;
END;
//
DELIMITER ;

INSERT INTO causesofdeath.diseases (d_name, d_code, d_year,d_meningitis, d_alzheimers_disease, d_parkinsons_disease,d_malaria, d_maternal_disorders, d_hiv_aids, d_tuberculosis, d_cardiovascular_diseases, d_diabetes_mellitus, d_id)
VALUES ('Test Country3', 'TCT', 2022, 0, 0, 0, 1500, 0, 0, 0, 0, 0, 6895);

UPDATE causesofdeath.diseases
SET d_malaria = 1500
WHERE d_year = 1990 AND d_code = 'AFG';

#3)
USE causesOfDeath;
DELIMITER //
CREATE PROCEDURE get_disease_data(IN d_code VARCHAR(50))
BEGIN
    SELECT 
        d.d_year,
        d.d_meningitis,
        d.d_malaria
    FROM causesofdeath.diseases d
    JOIN causesofdeath.countries c ON c.c_code = d.d_code AND c.c_year = d.d_year
    WHERE c.c_code = d_code;
END;
//
DELIMITER ;

CALL get_disease_data('USA');
CALL get_disease_data('GBR');

SELECT*FROM causesofdeath.countries;
SELECT*FROM causesofdeath.diseases;
SELECT*FROM causesofdeath.terrorism;
SELECT*FROM causesofdeath.exposuretoforcesofnature;
SELECT*FROM causesofdeath.selfharm;
SELECT*FROM high_terrorism_activity;
SELECT*FROM causesofdeath.democracy;
SELECT*FROM causesofdeath.gdp;
SELECT*FROM low_democracy;
SELECT*FROM high_gdp;
SELECT*FROM low_disease_death