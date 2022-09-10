use covid_db;
set hive.exec.dynamic.partition.mode = nonstatic;
set hive.exec.max.dynamic.partitions = 1000;
set hive.exec.max.dynamic.partitions.pernode = 1000;
set mapreduce.map.memory.mb = 2048;

FROM covid_db.covid_ds_partitioned
INSERT INTO TABLE covid_db.covid_final_output PARTITION(COUNTRY_NAME)
SELECT total_deaths, total_tests, Country WHERE Country is not null;