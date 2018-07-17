# http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb
rm cuda-repo-ubuntu1404_7.5-18_amd64.deb
echo 'export CUDA_HOME=/usr/local/cuda
export CUDA_ROOT=/usr/local/cuda
export PATH=$PATH:$CUDA_ROOT/bin:$HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_ROOT/lib64
' >> ~/.bashrc

# Let terminal know of the changes to the .bashrc file
source .bashrc

sudo apt-get update 

# y flag just says yes to all prompts
sudo apt-get install -y cuda

# Check if installation is successful by running the next line
# nvcc -V
