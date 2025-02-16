pipeline {
    agent any

    environment {
        IMAGE_NAME = "xiaosihuangsi/devops-app"  
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Build') {
            steps {
                echo "Building..."
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Test') {
            steps {
                echo "Testing..."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying..."
                sh 'kubectl set image deployment/devops-app devops-app=$IMAGE_NAME:$IMAGE_TAG'
            }
        }
    }
}
