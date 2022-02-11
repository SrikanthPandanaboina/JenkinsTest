pipeline {
    agent { label 'linux' }
    stages {
        stage ('Validate URL') {
            steps{
                    sh ' ./validateURI.sh '  
            }
        }

        stage ('Validate SSL') {
                when {
                    expression { params.isSecure }
                }
                steps {
                    sh ' ./validateSSL.sh '  
                }
        }
    }
}
