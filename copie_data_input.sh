#!/bin/bash
data_dir = "/local/data" 
input_dir = "/hdfs/input"

hdfs dfs -put $data_dir/* $input_dir

echo "Les fichiers de données ont été copiés dans le repertoire HDFS d'entrée ."