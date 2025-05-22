pipeline {
    agent any

    stages {
        stage('Create File') {
            steps {
                sh '''
                   echo "Hello from Jenkins!" > nti.txt
                   cat nti.txt
                '''
            }
        }
    }
}
