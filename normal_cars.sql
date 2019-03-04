DROP USER IF EXISTS normal_user;
DROP DATABASE IF EXISTS normal_cars;
DROP TABLE IF EXISTS make;
DROP TABLE IF EXISTS model;
DROP TABLE IF EXISTS year_TABLE;
CREATE USER normal_user;
CREATE DATABASE normal_cars WITH OWNER normal_user;

\i scripts/denormal_data.sql;

-- creates a table with make and model from car_models

CREATE TABLE make (
    ID SERIAL NOT NULL PRIMARY KEY,
    make_code character varying(125) NOT NULL,
    make_title character varying(125) NOT NULL
);

INSERT INTO make(make_code, make_title)
    SELECT DISTINCT make_code, make_title
        FROM car_models
        ORDER BY make_code;
-- SELECT * FROM make;

-- creates a table model with model_code and model_title from car_models and puts in alaphabetical order

CREATE TABLE model (
    ID SERIAL NOT NULL PRIMARY KEY,
    model_code character varying(125) NOT NULL,
    model_title character varying(125) NOT NULL
);

INSERT INTO model(model_code, model_title)
    SELECT DISTINCT model_code, model_title
    FROM car_models
    ORDER BY model_code;

-- SELECT * FROM model;



CREATE TABLE year_TABLE(
    ID SERIAL NOT NULL PRIMARY KEY,
    year INTEGER NOT NULL
);

INSERT INTO year_TABLE(year)
    SELECT DISTINCT year
    FROM car_models
    ORDER BY year;



SELECT * FROM year_TABLE;

-- -- makes a new table make and adds in make_code and make_title from car_models
-- SELECT DISTINCT make_code, make_title
-- INTO make
-- FROM car_models;

-- -- inserts primary key into make
-- ALTER TABLE  make
-- ADD COLUMN id SERIAL PRIMARY KEY;




