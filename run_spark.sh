#!/bin/bash
spark_app_dir ="../application_pyspark.py"

spark_app_name="spark"

spark-submit $spark_options --name  "$spark_app_name" $spark_app_dir