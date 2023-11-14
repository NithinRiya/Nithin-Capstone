pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'nithinriya/myapp-dev'
        DOCKER_TAG = '1.0'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Push to Dev') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    // Use credentials binding to securely pass Docker Hub credentials
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"
                        sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                        sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    }
                }
            }
        }

        stage('Testing') {
            steps {
                // Add steps for running tests (e.g., unit tests, integration tests)
            }
        }

        stage('Deployment') {
            steps {
                // Add steps for deploying your application to the desired environment
                // For example, you can use a deployment script here
            }
        }

        stage('Build and Push to Prod') {
            when {
                branch 'master'
            }
            steps {
                script {
                    // Use credentials binding to securely pass Docker Hub credentials
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"
                        sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                        sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    }
                }
            }
        }
    }
}
