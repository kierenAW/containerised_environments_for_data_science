#!/bin/bash

# Generate SSH host keys if they don't exist
if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
fi
if [ ! -f /etc/ssh/ssh_host_ecdsa_key ]; then
    ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
fi
if [ ! -f /etc/ssh/ssh_host_ed25519_key ]; then
    ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''
fi

# Fix permissions on SSH directory
chown -R zeus:zeus /home/zeus/.ssh
chmod 700 /home/zeus/.ssh

# Create and configure shell rc files
cat > /home/zeus/.bashrc << 'EOL'
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Set default directory
cd /app

# Set some basic shell options
set -o vi
shopt -s checkwinsize
shopt -s histappend

# Set history control and size
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Set prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Some useful aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
EOL

# Set up profile to source bashrc
echo '[[ -f ~/.bashrc ]] && . ~/.bashrc' > /home/zeus/.profile

# Ensure bash is the default shell
chsh -s /bin/bash zeus

# Set proper ownership
chown zeus:zeus /home/zeus/.profile /home/zeus/.bashrc

# Start SSH daemon
/usr/sbin/sshd

# Switch to zeus user and start Jupyter Lab
su -c "jupyter-lab --ip=0.0.0.0 --port=8888 --no-browser --NotebookApp.token='abc123' --NotebookApp.password=''" zeus
