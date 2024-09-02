#!/bin/bash

distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-docker2
sudo systemctl restart docker

# Add the current user to the docker group
sudo usermod -aG docker $USER

# Apply the new group membership without logging out and back in
newgrp docker

# Verify that you can run docker commands without sudo
docker run hello-world

# Optional: Instructions for the user
echo "Docker is installed and your user has been added to the docker group."
echo "You can now run Docker commands without sudo."
echo "Note: You may need to log out and back in for these changes to take full effect."
