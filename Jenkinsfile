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

        stage('Deploy to Staging') {
            when {
                expression {
                    // Define conditions to deploy to staging
                    currentBuild.resultIsBetterOrEqualTo('SUCCESS')
                }
            }
            steps {
                // Replace with your deployment commands for staging environment
                sh 'rsync -avz ./dist/ user@staging-server:/var/www/app'
            }
        }

        stage('Deploy to Production') {
            when {
                expression {
                    // Define conditions to deploy to production (e.g., merging to master)
                    branch 'master'
                }
            }
            steps {
                // Replace with your deployment commands for production environment
                sh 'rsync -avz ./dist/ user@production-server:/var/www/app'
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
