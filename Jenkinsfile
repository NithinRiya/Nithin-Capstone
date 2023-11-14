pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'nithinriya/myapp-dev'
        DOCKER_TAG = '1.0'
        DOCKER_CMD = "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
 dev
        DOCKER_HUB_CREDENTIALS = 'dockerhub-credentials' // Replace this with the actual ID

 master
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
 dev

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
 master
            when {
                anyOf { branch 'dev'; branch 'master' }
            }
            steps {
                script {
 dev
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "${DOCKER_CMD}"
                    }
                }
            }
        }

        stage('Push to Registry') {
            when {
                anyOf { branch 'dev'; branch 'master' }
            }
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                        sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    }
                }
            }
        }

        // ... (other stages remain the same)

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
 master
    }
}
