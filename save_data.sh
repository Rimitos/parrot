#!/bin/bash

# Create a tarball of the Docker volume
docker run --rm -v parrot_data:/volume -v $(pwd):/backup ubuntu tar czvf /backup/parrot_data.tar.gz -C /volume .

# Move the tarball to the repository directory
mv parrot_data.tar.gz /tmp/repo/

# Push the tarball to GitHub
cd /tmp/repo
git add parrot_data.tar.gz
git commit -m "Backup ParrotOS data"
git push origin main
