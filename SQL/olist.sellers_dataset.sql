-- TABLE olist.sellers_dataset

DROP TABLE IF EXISTS olist.sellers_dataset;

CREATE TABLE olist.sellers_dataset (
	seller_id VARCHAR(100),
    seller_zip_code INT,
    seller_city VARCHAR(50),
    seller_state VARCHAR(10)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_sellers_dataset.csv'
INTO TABLE olist.sellers_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT COUNT(*) FROM olist.sellers_dataset;