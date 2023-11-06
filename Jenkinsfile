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
                sh 'npm install'        // Install project dependencies
                sh 'npm run build'      // Build the application
            }
        }

        stage('Test') {
            steps {
                sh 'npm test'           // Run tests
            }
        }

        stage('Deploy to Staging') {
            when {
                expression {
                    currentBuild.resultIsBetterOrEqualTo('SUCCESS')
                }
            }
            steps {
                script {
                    // Replace with your deployment commands for staging environment
                    sh 'rsync -avz ./dist/ ubuntu@54.165.242.85:/var/www/app'
                }
            }
        }

        stage('Deploy to Production') {
            when {
                expression {
                    branch 'master'     // Deploy when code is merged into the 'master' branch
                }
            }
            steps {
                script {
                    // Replace with your deployment commands for production environment
                    sh 'rsync -avz ./dist/ ubuntu@54.165.242.85:/var/www/app'
                }
            }
        }
    }

    post {
        failure {
            emailext(
                subject: "Pipeline Failed: ${currentBuild.fullDisplayName}",
                body: "The pipeline for ${env.JOB_NAME} has failed.",
                to: 'your-email@example.com'  // Update the email address
            )
        }
        success {
            emailext(
                subject: "Pipeline Successful: ${currentBuild.fullDisplayName}",
                body: "The pipeline for ${env.JOB_NAME} has succeeded.",
                to: 'mnithin243@gmail.com'  // Update the email address
            )
        }
    }
}

