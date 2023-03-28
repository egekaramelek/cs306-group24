CREATE DATABASE causesOfDeath;

CREATE TABLE causesofdeath.countries(
      c_code Varchar(50) Not Null,
      c_id int Not Null,
      c_name Varchar(50),
      primary key (c_id)
);

CREATE TABLE causesofdeath.diseases(
      d_code Varchar(50),
      d_id int Not Null,
      d_name Varchar(50),
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
      primary key (d_id)
);

CREATE TABLE causesofdeath.terrorism(
      t_code Varchar(50),
      t_id int Not Null,
      t_name Varchar(50),
      t_year int Not Null,
      t_death double,
      primary key (t_id)
);

CREATE TABLE causesofdeath.exposuretoforcesofnature(
      f_code Varchar(50),
      f_id int Not Null,
      f_name Varchar(50),
      f_year int Not Null,
      f_death double,
      primary key (f_id)
);

CREATE TABLE causesofdeath.selfharm(
      s_name Varchar(50),
      s_code Varchar(50),
      s_id int Not Null,
      s_year int Not Null,
      s_death double,
      primary key (s_id)
);

SELECT *
FROM causesofdeath.countries
JOIN causesofdeath.diseases
ON causesofdeath.countries.c_id = causesofdeath.diseases.d_id;

SELECT *
FROM causesofdeath.countries
JOIN causesofdeath.exposuretoforcesofnature
ON causesofdeath.countries.c_id = causesofdeath.exposuretoforcesofnature.f_id;

SELECT *
FROM causesofdeath.countries
JOIN causesofdeath.selfharm
ON causesofdeath.countries.c_id = causesofdeath.selfharm.s_id;

SELECT *
FROM causesofdeath.countries
JOIN causesofdeath.terrorism
ON causesofdeath.countries.c_id = causesofdeath.terrorism.t_id;

