// Databricks notebook source
case class DeviceIoTData (
  battery_level: Long,
  c02_level: Long,
  cca2: String,
  cca3: String,
  cn: String,
  device_id: Long,
  device_name: String,
  humidity: Long,
  ip: String,
  latitude: Double,
  longitude: Double,
  scale: String,
  temp: Long,
  timestamp: Long
)
val ds = spark.read.json("/databricks-datasets/iot/iot_devices.json").as[DeviceIoTData]

// COMMAND ----------

display(ds)

// COMMAND ----------

val sorted_devices = ds.select($"battery_level",$"c02_level",$"device_name").where($"battery_level" > 5).sort($"battery_level")

// COMMAND ----------

display(sorted_devices)

// COMMAND ----------

ds.createOrReplaceTempView("iot_device_data")

// COMMAND ----------

ds.write.saveAsTable("iot_device_data2")

// COMMAND ----------

ds.write.mode("overwrite").parquet("/tmp/testParquet")

// COMMAND ----------

// MAGIC %python
// MAGIC parquet_directory = spark.read.parquet("/tmp/testParquet/")
// MAGIC display(parquet_directory)

// COMMAND ----------

ds.write.mode("overwrite").parquet("/tmp/testParquet")

// COMMAND ----------

display(dbutils.fs.ls("/tmp/testParquet"))

// COMMAND ----------

spark.sql("show tables").show()

// COMMAND ----------


