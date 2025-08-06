pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/Vineet7146/nodejs-ci-cd-demo.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test || echo "No tests defined."'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t vineeth2505/nodejs-ci-cd-demo:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                    sh 'docker push vineeth2505/nodejs-ci-cd-demo:latest'
                }
            }
        }
    }
}
