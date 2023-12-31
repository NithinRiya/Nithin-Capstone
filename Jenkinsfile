pipeline {
    agent any

    environment {
        DOCKER_IMAGE_DEV = 'nithinriya/myapp-dev'
        DOCKER_IMAGE_PROD = 'nithinriya/myapp-prod'
        DOCKER_TAG = '1.0'
        DOCKER_HUB_CREDENTIALS = 'Nithin10$' // Replace this with the actual ID
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Push to Dev') {
            when {
                expression { env.BRANCH_NAME == 'dev' }
            }
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                        sh "docker build -t ${DOCKER_IMAGE_DEV}:${DOCKER_TAG} ."
                        sh "docker push ${DOCKER_IMAGE_DEV}:${DOCKER_TAG}"
                    }
                }
            }
        }

        stage('Build and Push to Prod') {
            when {
                expression { env.BRANCH_NAME == 'master' }
            }
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                        sh "docker build -t ${DOCKER_IMAGE_PROD}:${DOCKER_TAG} ."
                        sh "docker push ${DOCKER_IMAGE_PROD}:${DOCKER_TAG}"
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Success! Add any success notifications or other post-build actions here."
        }
        failure {
            echo "Failure! Add any failure notifications or other post-build actions here."
        }
    }
}
