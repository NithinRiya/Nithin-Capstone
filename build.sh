#!/bin/bash

# Build the Docker image for your application
docker build -t myapp-image:1.0 .

# You may need to tag the image for your registry if you're using one
# docker tag myapp-image:1.0 registry.example.com/myapp-image:1.0

# Push the image to a container registry (if needed)
# docker push registry.example.com/myapp-image:1.0

# Clean up unused Docker images and containers
docker system prune -f
