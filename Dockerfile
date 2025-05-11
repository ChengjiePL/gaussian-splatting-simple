# 1. Imagen base con CUDA runtime y toolkit
FROM nvidia/cuda:12.9.0-devel-ubuntu22.04

# 2. Instala CUDA toolkit para compilar gsplatcu
# Establece el directorio de trabajo dentro del contenedor

# Instala las dependencias del sistema necesarias

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    zip \
    python3 \
    python3-dev \
    python3-pip \
    libpython3-dev \
    ninja-build \
    git \
    vim \
    build-essential \
    python3-pyqt5 \
    python3-pyqt5.qtwebkit \
    python3-pyqt5.qtopengl \
    libqt5opengl5-dev \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libglu1-mesa \
    freeglut3-dev \
    mesa-utils && \
    rm -rf /var/lib/apt/lists/* \
    && apt-get clean  # Limpia archivos temporales para reducir el tamaño de la imagen

# 3. Directorio de trabajo
WORKDIR /workspace

# 4. Copia sólo lo necesario
COPY requirements.txt train.py forward_gpu.py forward_cpu.py \
     backward_gpu.py backward_cpu.py gaussian_viewer.py ./ 

COPY gsplat/ ./gsplat/
COPY gsplatcu/ ./gsplatcu/
COPY viewer/ ./viewer/
COPY docs/ ./docs/
COPY sh_demo.py ./

# 1. Actualiza pip
RUN pip3 install --no-cache-dir --upgrade pip

# 2. Instala PyTorch primero
RUN pip3 install --no-cache-dir torch

# 3. Instala las dependencias del requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# 4. Instala gsplatcu cuando torch ya esté disponible
# RUN pip3 install --no-cache-dir ./gsplatcu


# 6. Por defecto, abre un shell
ENTRYPOINT ["/bin/bash"]

