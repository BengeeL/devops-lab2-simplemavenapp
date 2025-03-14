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
                git branch: 'main', url: 'https://github.com/BengeeL/devops-lab2-simplemavenapp.git'
                sh 'git pull origin main' // Ensure latest code
            }
        }
        stage('Build Maven Project') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Check User') {
            steps {
                sh 'whoami'
            }
        }
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u "$DOCKER_USER" -p "$DOCKER_PASSWORD"'
                    // sh '/usr/bin/docker build -t ${DOCKER_IMAGE} .'
                    // sh '/usr/bin/docker push ${DOCKER_IMAGE}'
                }
                // withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                //     sh 'echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USER" --password-stdin'
                // }
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE} .'
            }
        }
        stage('Docker Push') {
            steps {
                sh 'docker push ${DOCKER_IMAGE}'
            }
        }
    }
}
