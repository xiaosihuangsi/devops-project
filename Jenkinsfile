pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "my-app"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/xiaosihuangsi/devops-project.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    sh 'echo "Building the project..."'
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh 'echo "Running tests..."'
                    sh 'docker run --rm $DOCKER_IMAGE pytest tests/'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'echo "Deploying application..."'
                    sh 'docker-compose up -d'
                }
            }
        }
    }
} 
