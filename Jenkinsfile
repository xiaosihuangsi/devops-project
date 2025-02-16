pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'kubectl apply -f ~/DevOps/src/deployment.yaml'
                    sh 'kubectl apply -f ~/DevOps/src/service.yaml'
                }
            }
        }
    }
}
