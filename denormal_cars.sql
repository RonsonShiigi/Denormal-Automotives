DROP USER IF EXISTS denormal_user;
DROP DATABASE IF EXISTS denormal_cars;
CREATE USER denormal_user;
CREATE DATABASE denormal_cars WITH OWNER denormal_user;

\i scripts/denormal_data.sql;

\dS;

SELECT DISTINCT make_title from car_models;

SELECT DISTINCT model_title from car_models
WHERE make_code = 'VOLKS';

SELECT DISTINCT make_code, model_code, model_title, year from car_models
WHERE make_code = 'LAM';

SELECT DISTINCT COUNT(car_models) from car_models 
WHERE year BETWEEN 2010 AND 2015;

