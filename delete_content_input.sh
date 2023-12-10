#!/bin/bash
input_dir ="/hdfs/input"
hdfs_output=$(hdfs dfs -ls $input_dir 2>/dev/null)

if [[ -z $hdfs_output]];then
echo "The repertory 'input' don't exist in HDFS."
else 
hdfs dfs -rm -r -skipTrash $input_dir/*
echo "content of repertory 'input' deleted"
fi