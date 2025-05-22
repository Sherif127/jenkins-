pipeline {
    agent any

    stages {
        stage('Create File') {
            steps {
                sh "echo "Hello from Jenkins!" > nti.txt" 
                sh "cat nti.txt"
            }
        }
    }
}
