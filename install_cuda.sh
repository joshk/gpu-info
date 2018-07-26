set -ex

# Add the package repositories
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -

distribution=$(. /etc/os-release;echo $ID$VERSION_ID)

curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update

sudo ldconfig -p | grep nvidia

sudo apt-get remove nvidia-384
sudo apt-get install nvidia-384

# Install nvidia-docker2 and reload the Docker daemon configuration
sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd

echo "Test nvidia-smi with the latest official CUDA image"
docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi
