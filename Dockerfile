# Use upstream debian slim based python image
FROM docker.io/library/python:3.10-slim

# Install system packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y sshpass; \
    apt-get clean && rm -rf /var/lib/apt/lists

# Install ansible core
RUN python3 -m pip --no-cache-dir install --upgrade pip wheel; \
    python3 -m pip --no-cache-dir install ansible-core

# Install ansible collections
RUN ansible-galaxy collection install --no-cache \
        ansible.posix ansible.utils community.general
