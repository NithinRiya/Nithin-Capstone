#!/bin/bash

# Pull the Docker image from your registry (if needed)
# docker pull registry.example.com/myapp-image:1.0

# Check if the container exists and remove it if it does
if docker ps -a | grep -q myapp-container; then
  docker stop myapp-container
  docker rm myapp-container
fi

# Run a new container using the updated image
docker run -d -p 8080:80 --name myapp-container myapp-image:1.0

# You may need to add more options based on your specific requirements (e.g., volumes, environment variables, etc.)
