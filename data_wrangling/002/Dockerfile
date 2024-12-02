# Use an appropriate base image
FROM python:3.10

# Install SSH server and required packages
RUN apt-get update && apt-get install -y openssh-server sudo && \
    mkdir /var/run/sshd

# Create a new user with sudo privileges
RUN useradd -rm -d /home/jupyter -s /bin/bash -g root -G sudo -u 1000 jupyter && \
    echo 'jupyter:jupyter' | chpasswd

# Set working directory in the container
WORKDIR /app

# Copy and Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Create a new Jupyter configuration file
ENV JUPYTER_NOTEBOOK_CONFIG="{'NotebookApp': {'password_required': False}}"

# Expose the ports (SSH and Jupyter)
EXPOSE 22 8888

# Start SSH service and Jupyter
CMD service ssh start && jupyter-lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root
