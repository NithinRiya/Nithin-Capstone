pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'nithinriya/myapp-dev'
        DOCKER_TAG = '1.0'
    }

    stages {
        stage('Checkout') {
<<<<<<< HEAD
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Install Node.js and project dependencies
                sh 'npm install'
                // Build your application (e.g., compile TypeScript, bundle assets, etc.)
                sh 'npm run build'
            }
        }

        stage('Build and Push Docker Image') {
            when {
                anyOf {
                    branch 'dev'
                    branch 'master'
                }
            }
            steps {
                script {
                    def branch = env.BRANCH_NAME
                    def tag = branch == 'master' ? 'prod' : 'dev'
                    def dockerImage = "nithinriya/myapp-${tag}:1.0"
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "docker login -u \$DOCKER_USERNAME -p \$DOCKER_PASSWORD"
                        sh "docker build -t ${dockerImage} ."
                        sh "docker push ${dockerImage}"
                    }
                }
=======
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
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                    sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }

        stage('Build and Push to Prod') {
            when {
                branch 'master'
            }
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                    sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
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
>>>>>>> 3ab8bef9187930b9b15b4c85faa07e7ac275a129
            }
        }
    }

<<<<<<< HEAD
    // ... (rest of your Jenkinsfile)
=======
    post {
        always {
            // Clean up or perform any cleanup tasks if needed
        }
    }
>>>>>>> 3ab8bef9187930b9b15b4c85faa07e7ac275a129
}

