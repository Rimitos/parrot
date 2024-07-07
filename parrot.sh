#!/bin/bash

# Pull ParrotOS Docker image
docker pull parrotsec/parrot

# Create and mount Docker volume
docker volume create parrot_data

# Clone the GitHub repository containing the data backup
git clone https://github.com/Rimitos/parrot.git /tmp/repo

# Extract data from the repository
tar -xzvf /tmp/repo/parrot_data.tar.gz -C /var/lib/docker/volumes/parrot_data/_data/

# Run ParrotOS container with mounted volume
docker run -it -v parrot_data:/root parrotsec/parrot /bin/bash
