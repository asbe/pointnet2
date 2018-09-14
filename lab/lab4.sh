#!/bin/bash
#Assume we are in environment  tensorflow_p36

#Some preliminary setup
ln -fs /home/ubuntu/anaconda3/envs/tensorflow_p36/lib/libstdc++.so.6.0.24 /home/ubuntu/anaconda3/envs/tensorflow_p36/lib/libstdc++.so.6
conda install -y numpy numba scipy pandas
pip install git+https://github.com/daavoo/pyntcloud

cd /home/ubuntu/
mkdir Labs
cd Labs
mkdir Lab4
cd Lab4
wget -o Lab4.ipynb https://www.dropbox.com/s/3yhchifz00ihf3f/Lab4.ipynb

#Code and precompiled C++ Tensorflow Code
git clone https://github.com/asbe/pointnet2.git

fileid="1aVk8wVebyvQBkGSsJ15ciaet9Dj7Sjqz"
filename="classification_log.zip"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}


fileid="1FvLsC7ieMAS7XW6qz-CuZzPc9pn8vm5c"
filename="part_seg_log.zip"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}

fileid="1yk03QHWatpL6S5btQwxclVzeRyK7zEF4"
filename="data.zip"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}

#Ply files
fileid="1fDjjyhbL6tP_oeFCovGiO9OkGuw4yEH9"
filename="ply_data.zip"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}

#SSG and MSG classifier models
fileid="1qowcmHbxR9CbZMbUd1teAcGJFok75FUN"
filename="class_ssg_msg.zip"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}

#One hot segmentation
fileid="11H_SIx5mI6oEiv_Ge-JTj6o91KJ0-BI7"
filename="class_ssg_msg.zip"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}



#Unzipping to the correct folders.
unzip  data.zip -d pointnet2/
unzip classification_log.zip -d pointnet2/classification/
unzip part_seg_log.zip -d pointnet2/part_seg/

cd pointnet2/tf_ops/3d_interpolation/
./tf_interpolate_compile.sh
cd ../sampling/
./tf_sampling_compile.sh
cd ../grouping/
./tf_grouping_compile.sh
cd ../.. /../

#Todo: add the one-hot and multi scale classifier checkpoints to these datafiles
#Todo: Grab the real data
