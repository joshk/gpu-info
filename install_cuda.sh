set -ex

# http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/
curl -O https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_8.0.61-1_amd64.deb

sudo dpkg -i cuda-repo-ubuntu1404_8.0.61-1_amd64.deb

rm cuda-repo-ubuntu1404_8.0.61-1_amd64.deb

export CUDA_HOME=/usr/local/cuda
export CUDA_ROOT=/usr/local/cuda
export PATH=$PATH:$CUDA_ROOT/bin:$HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_ROOT/lib64

sudo apt-get update -y --allow-unauthenticated
sudo apt-get install -y --allow-unauthenticated cuda-8-0

sudo apt-get install linux-headers-$(uname -r)

sudo nvidia-smi -pm 1
# Check if installation is successful by running the next line
# nvcc -V
