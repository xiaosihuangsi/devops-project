pipeline {
    agent any

    environment {
        IMAGE_NAME = "xiaosihuangsi/devops-app"  
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/xiaosihuangsi/devops-project.git' 
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'kubectl set image deployment/devops-app devops-app=$IMAGE_NAME:$IMAGE_TAG'
                }
            }
        }
    }
}
