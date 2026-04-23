-- TABLE olist.products_dataset

DROP TABLE IF EXISTS olist.products_dataset;

CREATE TABLE olist.products_dataset (
	product_id VARCHAR(100),
    product_category_name VARCHAR(50),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_products_dataset.csv'
INTO TABLE olist.products_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(product_id, product_category_name, @product_name_length,
 @product_description_length, @product_photos_qty, @product_weight_g, 
 @product_length_cm, @product_height_cm, @product_width_cm)
SET
  product_name_length = NULLIF(@product_name_length, ''),
  product_description_length = NULLIF(@product_description_length, ''),
  product_photos_qty = NULLIF(@product_photos_qty, ''),
  product_weight_g = NULLIF(@product_weight_g, ''),
  product_length_cm = NULLIF(@product_length_cm, ''),
  product_height_cm = NULLIF(@product_height_cm, ''),
  product_width_cm = NULLIF(@product_width_cm, '')
;

SELECT COUNT(*) FROM olist.products_dataset;