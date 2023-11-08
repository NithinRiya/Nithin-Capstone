pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
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

                    withDockerServer([credentialsId: 'docker-hub-credentials']) {
                        sh "docker build -t ${dockerImage} ."
                        sh "docker push ${dockerImage}"
                    }
                }
            }
        }
    }
}
