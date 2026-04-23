-- TABLE olist.geolocation_dataset;

DROP TABLE IF EXISTS olist.geolocation_dataset;

CREATE TABLE olist.geolocation_dataset (
	geolocation_zip_code_prefix INT,
    geolocation_lat DECIMAL(10, 2),
    geolocation_lng DECIMAL(10, 2),
    geolocation_city VARCHAR(50),
    geolocation_state VARCHAR(10)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_geolocation_dataset.csv'
INTO TABLE olist.geolocation_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT COUNT(*) FROM olist.geolocation_dataset;