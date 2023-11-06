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
                // Replace with your build commands
                sh 'npm install'
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                // Replace with your test commands
                sh 'npm test'
            }
        }

        stage('Deploy to Docker') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        failure {
            emailext(
                subject: "Pipeline Failed: ${currentBuild.fullDisplayName}",
                body: "The pipeline for ${env.JOB_NAME} has failed.",
                to: 'your-email@example.com'
            )
        }
        success {
            emailext(
                subject: "Pipeline Successful: ${currentBuild.fullDisplayName}",
                body: "The pipeline for ${env.JOB_NAME} has succeeded.",
                to: 'mnithin243@gmail.com'
            )
        }
    }
}
