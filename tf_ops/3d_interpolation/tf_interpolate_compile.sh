TF_INC=$(python3 -c 'import tensorflow as tf; print(tf.sysconfig.get_include())')
TF_LIB=$(python3 -c 'import tensorflow as tf; print(tf.sysconfig.get_lib())')

g++ -std=c++11 tf_interpolate.cpp -o tf_interpolate_so.so -shared -fPIC -I$TF_INC -I$TF_INC/external/nsync/public -L$TF_LIB -I/home/ec2-user/src/tensorflow_python3/ -ltensorflow_framework -I/usr/local/cuda-9.0/include -lcudart -L/usr/local/cuda-9.0/lib64/ -O2 -D_GLIBCXX_USE_CXX11_ABI=0
