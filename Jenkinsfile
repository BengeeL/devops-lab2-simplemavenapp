pipeline {
    agent any 

    tools {
        maven "MAVEN"
    }
    
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test') {
          steps {
            echo 'test'
          }
        }

        stage('Deploy') {
          steps {
            echo 'deploy'
          }
        }
    }
}
