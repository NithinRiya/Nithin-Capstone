pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'nithinriya/myapp-dev'
        DOCKER_TAG = '1.0'
        DOCKER_CMD = "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            when {
                anyOf { branch 'dev'; branch 'master' }
            }
            steps {
                script {
                    sh "${DOCKER_CMD}"
                }
            }
        }

        stage('Push to Registry') {
            when {
                anyOf { branch 'dev'; branch 'master' }
            }
            steps {
                script {
                    sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }

        stage('Testing') {
            steps {
                script {
                    // Add commands for running tests
                }
            }
        }

        stage('Deployment') {
            steps {
                // Add steps for deploying your application to the desired environment
                // For example, you can use a deployment script here
            }
        }

        stage('Cleanup') {
            post {
                always {
                    cleanWs() // Clean workspace
                    sh 'docker system prune -af' // Remove unused Docker resources
                }
            }
        }
    }
}
