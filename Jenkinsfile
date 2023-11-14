pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'nithinriya/myapp-dev'
        DOCKER_TAG = '1.0'
        DOCKER_CMD = "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
        DOCKER_HUB_CREDENTIALS = 'dockerhub-credentials' // Replace this with the actual ID
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
    }
}
