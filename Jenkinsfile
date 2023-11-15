
stages {
    // ... (existing stages)

    stage('Testing') {
        when {
            branch 'dev'
        }
        steps {
            script {
                // Add steps for running tests (e.g., unit tests, integration tests)
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
                // If this build is the result of a merge from dev to master
                // Add any necessary steps before pushing to production
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
}
