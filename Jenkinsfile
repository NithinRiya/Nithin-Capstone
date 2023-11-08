pipeline {
    agent any

    environment {
        // Define environment variables for the Docker image
        DOCKER_IMAGE = 'nithinriya/myapp-dev'
        DOCKER_TAG = '1.0'
    }

    stages {
        stage('Build and Push') {
            steps {
                script {
                    // Checkout the code
                    checkout scm

                    // Build and tag the Docker image
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."

                    // Push the Docker image to Docker Hub
                    sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }

        // Add more stages for testing, deployment, etc.
    }
}
