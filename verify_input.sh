#!/bin/bash
input_dir = "/hdfs/input"

hdfs_output = $(hdfs dfs -ls $input_dir)

if [[-z $hdfs_output]];then
echo "No files in the input directory."
else
echo "files in the input directory"
fi