
CREATE TABLE my_data (
    grp INT,
    value DOUBLE
) 
ROW FORMAT 
DELIMITED FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;

LOAD DATA INPATH 'data/groups.txt' OVERWRITE INTO TABLE my_data;

CREATE TABLE output_means
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/user/hadoop/output_means/'
AS 
SELECT grp, AVG(value) FROM my_data GROUP BY grp;

CREATE TABLE output_variances
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/user/hadoop/output_variances/'
AS 
SELECT grp, VARIANCE(value) FROM my_data GROUP BY grp;

