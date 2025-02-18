pipeline {
    agent any 

    tools {
        maven "MAVEN"
    }
    
    stages {
        // stage('Checkout') {
        //     steps {
        //         git branch: 'main', url: 'https://github.com/BengeeL/devops-lab2-simplemavenapp.git' 
        //     }
        // }

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
