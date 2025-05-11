# Easy Gaussian Splatting

This repository contains the code for the **Easy Gaussian Splatting** project using Docker containers. The purpose of the project is to facilitate the implementation and execution of Gaussian Splatting algorithms on CUDA-accelerated hardware.

## Prerequisites

1. **Docker**: Ensure that Docker is installed on your system. If you don't have it, follow the official installation instructions at [Docker Installation](https://docs.docker.com/get-docker/).

2. **NVIDIA GPU and Drivers**: The container is designed to use an NVIDIA GPU with CUDA support. To use it, you need to have:
   - A compatible NVIDIA GPU.
   - NVIDIA drivers installed.
   - `nvidia-docker` to run the container with CUDA support. If you don't have `nvidia-docker`, you can follow the installation instructions here: [nvidia-docker installation](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html).

### instalation

```bash
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo tee /usr/share/keyrings/nvidia-container-toolkit.asc > /dev/null
curl -fsSL https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

docker run --rm --gpus all nvidia/cuda:12.1.0-cudnn8-runtime-ubuntu22.04 nvidia-smi

# if it fails

echo $distribution

distribution="ubuntu22.04"

curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo tee /usr/share/keyrings/nvidia-container-toolkit.asc > /dev/null

curl -fsSL https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

docker run --rm --gpus all nvidia/cuda:12.1.0-cudnn8-runtime-ubuntu22.04 nvidia-smi
```

3. **CUDA Toolkit**: The container uses CUDA version 12.1. Ensure that you have the appropriate version of CUDA drivers and runtime installed.

---

## Installation

Follow these steps to set up and run the Docker container with the project:

### 1. **Clone the Repository**

Clone this repository to your local machine:

### 2. **Build the Docker Image**

The project includes a `Dockerfile` that contains all the necessary dependencies to run the code. To build the Docker image, use the following command:

```bash
docker build -t gaussian-splatting-simple .
```

This command will download the necessary base images, install dependencies, and configure the environment.

### 3. **Run the Container**

Once the image is built, you can run the container with the following command:

```bash
docker run --gpus all --rm -it gaussian-splatting-simple

###

docker run --rm -it --gpus all     -e DISPLAY=$DISPLAY     -v /tmp/.X11-unix:/tmp/.X11-unix     chengjiepl/gaussian-splatting-simple:latest
```

**Explanation of the command**:

* `--gpus all`: Tells Docker to use all available GPUs on your machine.
* `--rm`: The container will be automatically removed once it stops.
* `-it`: Runs the container interactively with a terminal.

This command will give you access to an execution environment inside the container where you can run the Python scripts.

---

## Using the Container

### Downaload dependencies

```bash
pip3 install gsplatcu/.
```

### Download dataset

```bash
wget https://repo-sam.inria.fr/fungraph/3d-gaussian-splatting/datasets/input/tandt_db.zip
```

---


## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
