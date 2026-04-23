-- TABLE olist.product_category_name_translation

DROP TABLE IF EXISTS olist.product_category_name_translation;

CREATE TABLE olist.product_category_name_translation (
	product_category_name VARCHAR(50),
    product_category_name_english VARCHAR(50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/product_category_name_translation.csv'
INTO TABLE product_category_name_translation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT COUNT(*) FROM product_category_name_translation
