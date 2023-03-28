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

CREATE TABLE causesofdeath.diseases_countries(
c_id int Not Null,
d_id int Not Null,
PRIMARY KEY (c_id),
FOREIGN KEY (d_id)REFERENCES causesofdeath.diseases(d_id) ON DELETE CASCADE
);

CREATE TABLE causesofdeath.exposuretoforcesofnature_countries(
f_id int Not Null,
c_id int Not Null,
PRIMARY KEY (c_id),
FOREIGN KEY (f_id)REFERENCES causesofdeath.diseases(f_id) ON DELETE CASCADE
);

CREATE TABLE causesofdeath.selfharm_countries(
s_id int Not Null,
c_id int Not Null,
PRIMARY KEY (c_id),
FOREIGN KEY (s_id)REFERENCES causesofdeath.diseases(s_id) ON DELETE CASCADE
);

CREATE TABLE causesofdeath.terrorism_countries(
t_id int Not Null,
c_id int Not Null,
PRIMARY KEY (c_id),
FOREIGN KEY (t_id)REFERENCES causesofdeath.diseases(t_id) ON DELETE CASCADE
);

SELECT*FROM causesofdeath.diseases_countries;
SELECT*FROM causesofdeath.terrorism_countries;
SELECT*FROM causesofdeath.exposuretofocesofnature_countries;
SELECT*FROM causesofdeath.selfharm_countries;

