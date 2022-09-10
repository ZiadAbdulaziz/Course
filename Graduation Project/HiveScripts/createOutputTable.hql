use covid_db;
CREATE EXTERNAL TABLE IF NOT EXISTS covid_db.covid_final_output 
(
 TOP_DEATH                          STRING,
 TOP_TEST                           STRING
)
PARTITIONED BY (COUNTRY_NAME STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED by '\t'
STORED as TEXTFILE
LOCATION '/user/cloudera/ds/COVID_FINAL_OUTPUT';