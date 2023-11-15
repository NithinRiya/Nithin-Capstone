pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'nithinriya/myapp-dev'
        DOCKER_TAG = '1.0'
        DOCKER_HUB_CREDENTIALS = 'dockerhub-credentials' // Replace this with the actual ID
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
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
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
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                        sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                        sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    }
                }
            }
        }
    }
}
    
