pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds') // ID from Jenkins credentials
        IMAGE_NAME = 'vineeth2505/nodejs-ci-cd-demo'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Vineet7146/nodejs-ci-cd-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-creds') {
                        dockerImage.push("latest")
                    }
                }
            }
        }
    }
}
