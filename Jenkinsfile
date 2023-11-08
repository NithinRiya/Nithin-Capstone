pipeline {
    agent any

    stages {
        stage('Build and Push Docker Image') {
            when {
                expression { currentBuild.changeSets.any { it.branch == 'origin/master' } }
            }
            steps {
                script {
                    def imageName = 'your-image-name'
                    def imageTag = 'latest'
                    def dockerRegistry = 'your-production-registry.com'
                    
                    // Tag the Docker image for production
                    sh "docker tag nithinriya/myapp-dev:1.0 $dockerRegistry/$imageName:$imageTag"
                    
                    // Push the Docker image to the production registry
                    sh "docker push $dockerRegistry/$imageName:$imageTag"
                }
            }
        }
    }
}
