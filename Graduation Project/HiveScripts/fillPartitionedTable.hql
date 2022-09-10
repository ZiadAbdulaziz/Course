use covid_db;
set hive.exec.dynamic.partition.mode = nonstatic;
set hive.exec.max.dynamic.partitions = 1000;
set hive.exec.max.dynamic.partitions.pernode = 1000;
set mapreduce.map.memory.mb = 4048;

FROM covid_db.covid_staging
INSERT INTO TABLE covid_db.covid_ds_partitioned PARTITION(COUNTRY_NAME)
SELECT *,Country WHERE Country is not null;