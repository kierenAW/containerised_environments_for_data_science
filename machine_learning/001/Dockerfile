# Use Ubuntu LTS as base image
FROM ubuntu:jammy

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies including bash
RUN apt-get update && apt-get install -y \
    bash \
    openssh-server \
    sudo \
    git \
    curl \
    wget \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Python and development tools
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    cmake \
    ninja-build \
    && ([ ! -e /usr/bin/python ] && ln -s /usr/bin/python3 /usr/bin/python || true) \
    && ([ ! -e /usr/bin/pip ] && ln -s /usr/bin/pip3 /usr/bin/pip || true) \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install additional system dependencies for Python packages
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create required directories
RUN mkdir -p /etc/ssh/auth_principals

# Create a non-root user with limited privileges
ARG USERNAME=zeus
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

# Create user and group with specific UID/GID
RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

# Configure SSH for enhanced security
RUN mkdir -p /var/run/sshd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config \
    && sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config \
    && sed -i 's/#AuthorizedKeysFile/AuthorizedKeysFile/' /etc/ssh/sshd_config \
    && echo "AllowUsers ${USERNAME}" >> /etc/ssh/sshd_config \
    && echo "MaxAuthTries 3" >> /etc/ssh/sshd_config \
    && echo "LoginGraceTime 30" >> /etc/ssh/sshd_config \
    && echo "Protocol 2" >> /etc/ssh/sshd_config \
    && echo "X11Forwarding no" >> /etc/ssh/sshd_config \
    && echo "AllowAgentForwarding no" >> /etc/ssh/sshd_config \
    && echo "AllowTcpForwarding no" >> /etc/ssh/sshd_config \
    && echo "ClientAliveInterval 300" >> /etc/ssh/sshd_config \
    && echo "ClientAliveCountMax 2" >> /etc/ssh/sshd_config \
    && echo "Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr" >> /etc/ssh/sshd_config \
    && echo "MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com" >> /etc/ssh/sshd_config \
    && echo "KexAlgorithms curve25519-sha256@libssh.org,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group14-sha256" >> /etc/ssh/sshd_config

# Configure fail2ban for additional protection
COPY fail2ban-jail.local /etc/fail2ban/jail.local

# Set up SSH directory with correct permissions
RUN mkdir -p /home/${USERNAME}/.ssh \
    && touch /home/${USERNAME}/.ssh/authorized_keys \
    && chmod 700 /home/${USERNAME}/.ssh \
    && chmod 600 /home/${USERNAME}/.ssh/authorized_keys \
    && chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/.ssh \
    && echo "cd /app" >> /home/${USERNAME}/.bashrc \
    && chown ${USERNAME}:${USERNAME} /home/${USERNAME}/.bashrc

# Set working directory
WORKDIR /home/${USERNAME}

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install \
    jupyter \
    jupyterlab

# Add security headers for Jupyter
ENV JUPYTER_CONFIG_DIR=/app/.jupyter
RUN mkdir -p ${JUPYTER_CONFIG_DIR} \
    && echo "c.NotebookApp.tornado_settings = {'headers': {'Content-Security-Policy': \"default-src 'self' 'unsafe-inline' 'unsafe-eval'; img-src 'self' data:\"}}" > ${JUPYTER_CONFIG_DIR}/jupyter_notebook_config.py \
    && chown -R ${USERNAME}:${USERNAME} ${JUPYTER_CONFIG_DIR}

# Expose SSH and Jupyter ports
EXPOSE 22 8888

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
