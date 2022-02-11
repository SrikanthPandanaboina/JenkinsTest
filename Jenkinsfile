pipeline {
    agent any
    stages {
        stage ('Validate URL') {
            steps{
                    sh ' chmod +x ./validateURI.sh '
                    sh ' ./validateURI.sh '  
            }
        }

        stage ('Validate SSL') {
                when {
                    expression { params.isSecure }
                }
                steps {
                    sh ' chmod +x ./validateSSL.sh '
                    sh ' ./validateSSL.sh '  
                }
        }
    }
}
