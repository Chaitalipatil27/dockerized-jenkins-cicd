pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Application') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t dockerized-app:latest .'
            }
        }

        stage('Deploy Application') {
            steps {
                sh '''
                    docker stop dockerized-app-container || true
                    docker rm dockerized-app-container || true

                    docker run -d \
                    --name dockerized-app-container \
                    -p 8081:8080 \
                    dockerized-app:latest
                '''
            }
        }
    }

    post {
        success {
            echo 'Application deployed successfully!'
        }

        failure {
            echo 'Pipeline failed!'
        }
    }
}
