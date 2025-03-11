pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'bengeel/lab3'
    }
    tools {
        maven "MAVEN"
        git "GIT"
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/BengeeL/devops-lab2-simplemavenapp.git'
            }
        }
        stage('Build Maven Project') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh '/usr/local/bin/docker login -u "$DOCKER_USER" -p "$DOCKER_PASSWORD"'
                }
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} .'
            }
        }
        stage('Docker Push') {
            steps {
                sh 'docker push ${DOCKER_IMAGE}:${BUILD_NUMBER}'
            }
        }
    }
}
