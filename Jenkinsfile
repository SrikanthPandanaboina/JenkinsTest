pipeline {
    agent { label 'linux' }
    stages {
        stage ('Validate URL') {
            steps{
                    sh '''
                        echo "Testing URL: $URL"
                        echo $isSecure
                        if [ "$isSecure" = true ]; then
                            response=`curl -o /dev/null -s -w "%{http_code}\n" https://$URL`
                        else
                             response=`curl -o /dev/null -s -w "%{http_code}\n" http://$URL`
                        fi
                        echo "The response code is: $response"
                        if ((response < 200 || response > 400)); then
                             exit 1
                        fi
                    '''  
            }
        }

        stage ('Validate SSL') {
                when {
                    expression { params.isSecure }
                }
                steps {
                    sh '''
                        echo "Testing SSL Certifcate for: $URL"
                        openssl s_client -connect $URL 2> /dev/null | openssl x509 -dates | grep not & sleep 2
                        if true | openssl s_client -connect $URL 2>/dev/null | openssl x509 -noout -checkend 0; then
                          echo "Certificate is not expired"
                        else
                          echo "Certificate is expired"
                          exit 1
                        fi
                    '''  
                }
        }
    }
}
