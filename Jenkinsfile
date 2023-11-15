pipeline {
    agent any

    environment {
        DOCKER_IMAGE_DEV = 'nithinriya/myapp-dev'
        DOCKER_IMAGE_PROD = 'nithinriya/myapp-prod'
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
                        sh "docker build -t ${DOCKER_IMAGE_DEV}:${DOCKER_TAG} ."
                        sh "docker push ${DOCKER_IMAGE_DEV}:${DOCKER_TAG}"
                    }
                }
            }
        }

        stage('Testing') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    // Add testing steps here
                    // For example, running unit tests or integration tests
                }
            }
        }

        stage('Deployment to Dev') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    // Add steps for deploying to the development environment
                    // This could be, for example, deploying to a test server
                }
            }
        }

        stage('Merge to Master') {
            when {
                expression { currentBuild.changeSets.any { it.branch == 'origin/dev' } }
            }
            steps {
                script {
                    // Add any necessary steps before pushing to production
                }
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
                        sh "docker build -t ${DOCKER_IMAGE_PROD}:${DOCKER_TAG} ."
                        sh "docker push ${DOCKER_IMAGE_PROD}:${DOCKER_TAG}"
                    }
                }
            }
        }

        stage('Deployment to Prod') {
            when {
                branch 'master'
            }
            steps {
                script {
                    // Add steps for deploying to the production environment
                    // This could be, for example, deploying to a production server
                }
            }
        }

        post {
            success {
                // Add success notifications or other post-build actions
            }
            failure {
                // Add failure notifications or other post-build actions
            }
        }
    }
}
