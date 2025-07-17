pipeline {
  agent any

  environment {
    DOCKER_IMAGE = 'leoughhh/jenkins-app'
  }

  tools {
    maven 'maven'
  }

  stages {
    stage('Run Unit Tests') {
      steps {
        sh 'mvn clean test'
      }
    }

    stage('Build App') {
      steps {
        sh 'mvn clean package -DskipTests'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh "docker build -t $DOCKER_IMAGE:$BUILD_NUMBER ."
      }
    }

    stage('Push Docker Image') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker',
          usernameVariable: 'DOCKER_USERNAME',
          passwordVariable: 'DOCKER_PASSWORD')]) {
            sh '''
              echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
              docker push $DOCKER_IMAGE:$BUILD_NUMBER
            '''
        }
      }
    }

    stage('Delete Local Image') {
      steps {
        sh "docker rmi $DOCKER_IMAGE:$BUILD_NUMBER || true"
      }
    }

    stage('Edit deployment.yml') {
      steps {
        sh "sed -i 's|image:.*|image: $DOCKER_IMAGE:$BUILD_NUMBER|' deployment.yml"
      }
    }

    stage('Deploy to K8s Cluster') {
      steps {
        sh "kubectl apply -f deployment.yml"
      }
    }
  }

  post {
    always {
      echo 'Always executed'
    }
    success {
      echo 'Pipeline completed successfully!'
    }
    failure {
      echo 'Pipeline failed!'
    }
  }
}
