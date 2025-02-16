pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/xiaosihuangsi/devops-project.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-app:latest .'
            }
        }
        stage('Push to AWS ECR') {
            steps {
                withAWS(credentials: 'aws-credentials', region: 'us-east-1') {
                    sh 'aws ecr get-login-password | docker login --username AWS --password-stdin <your-aws-account>.dkr.ecr.us-east-1.amazonaws.com'
                    sh 'docker tag my-app:latest <your-aws-account>.dkr.ecr.us-east-1.amazonaws.com/my-app:latest'
                    sh 'docker push <your-aws-account>.dkr.ecr.us-east-1.amazonaws.com/my-app:latest'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
