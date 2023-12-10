from pyspark.sql import SparkSession
from pyspark.sql.functions import col, concat, lit

# Création de la session Spark
spark = SparkSession.builder \
    .appName("Mon application PySpark") \
    .getOrCreate()

output_csv_full = spark.read.csv("hdfs://localhost:9870/input/output_csv_full.csv", header=True, inferSchema=True)
country_classification = spark.read.csv("hdfs://localhost:9870/input/country_classification.csv", header=True, inferSchema=True)
goods_classification = spark.read.csv("hdfs://localhost:9870/input/goods_classification.csv", header=True, inferSchema=True)
services_classification = spark.read.csv("hdfs://localhost:9870/input/services_classification.csv", header=True, inferSchema=True)


def add_date_column(df):
    df_with_date = df.withColumn("date", concat(lit("01/"), col("time_ref").substr(5, 2), lit("/"), col("time_ref").substr(1, 4)))
    return df_with_date


def add_years_column(df):
    df_with_date_year = df.withColumn("year", col("date").substr(-4, 4))
    return df_with_date_year


output_csv_full = add_date_column(output_csv_full)
output_csv_full = add_years_column(output_csv_full)


output_csv_full.write.csv("hdfs://localhost:9870/output/output_csv_full_with_date_year.csv", header=True)
