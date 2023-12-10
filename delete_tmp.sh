#!/bin/bash

data_tmp_dir = "hdfs/data_tmp"

hdfs_output = $(hdfs dfs -ls $data_tmp_dir 2>/dev/null)

if [[-z $hdfs_output]];then
echo " the repertory 'data_tmp' don't exist"
else
hdfs dfs -rm -r -skipTrash $data_tmp_dir
echo "the repertory delete"
fi