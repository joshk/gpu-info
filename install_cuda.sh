# http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb

rm cuda-repo-ubuntu1404_7.5-18_amd64.deb

export CUDA_HOME=/usr/local/cuda
export CUDA_ROOT=/usr/local/cuda
export PATH=$PATH:$CUDA_ROOT/bin:$HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_ROOT/lib64

CUDA_PACKAGES="cuda-drivers cuda-core-7.5-18 cuda-cudart-dev-7.5-18 cuda-cufft-dev-7.5-18"

echo "Installing ${CUDA_PACKAGES}"
sudo apt-get install -y ${CUDA_PACKAGES}

# Check if installation is successful by running the next line
nvcc -V
