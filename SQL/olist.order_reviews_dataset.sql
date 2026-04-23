-- TABLE olist.order_reviews_dataset

DROP TABLE IF EXISTS olist.order_reviews_dataset;

CREATE TABLE olist.order_reviews_dataset (
	review_id VARCHAR(100),
    order_id VARCHAR(100),
    review_score INT,
    review_comment_title VARCHAR(100),
    review_comment_message VARCHAR(1000),
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_reviews_dataset.csv'
INTO TABLE olist.order_reviews_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SELECT COUNT(*) FROM olist.order_reviews_dataset;