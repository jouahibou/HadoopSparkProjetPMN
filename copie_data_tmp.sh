#!/bin/bash

input_dir = "hdfs/input"
data_tmp_dir = "hdfs/data_tmp"

hdfs_output = $(hdfs dfs -ls $data_tmp_dir 2>/dev/null)

if [[-z $hdfs_output]];then
hdfs dfs -mkdir $data_tmp_dir
echo "repertory 'data_tmp' create"
else
echo "Le repertory already excit"
fi