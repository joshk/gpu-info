set -ex

# http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/
curl -O http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.5-18_amd64.deb

sudo dpkg -i --debug=210 cuda-repo-ubuntu1404_7.5-18_amd64.deb

rm cuda-repo-ubuntu1404_7.5-18_amd64.deb

export CUDA_HOME=/usr/local/cuda
export CUDA_ROOT=/usr/local/cuda
export PATH=$PATH:$CUDA_ROOT/bin:$HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_ROOT/lib64

#sudo apt-get update
sudo apt-get install -y --allow-unauthenticated cuda

nvidia-smi
# Check if installation is successful by running the next line
# nvcc -V
