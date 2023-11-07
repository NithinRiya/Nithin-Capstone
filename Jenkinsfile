pipeline {
    agent any

    stages {
        stage('Checkout') {
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
            }
        }
    }

    // ... (rest of your Jenkinsfile)
}
