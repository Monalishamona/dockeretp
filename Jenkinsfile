pipeline {
    agent any

    stages {
        // Stage 1: Checkout code from Git
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Monalishamona/dockeretp.git'
            }
        }

        // Stage 2: Build Docker image
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("my-static-site:${env.BUILD_NUMBER}")
                }
            }
        }

        // Stage 3: Deploy (Run container)
        stage('Deploy') {
            steps {
                script {
                    // Stop and remove old container (if running)
                    sh 'docker stop my-static-site || true'
                    sh 'docker rm my-static-site || true'
                    
                    // Run new container
                    docker.run(
                        "my-static-site:${env.BUILD_NUMBER}",
                        "--name my-static-site -p 8081:80 -d"
                    )
                }
            }
        }
    }

    // Post-build actions
    post {
        success {
            echo "Deployed! Access at: http://${env.SERVER_IP}:8081"
            // slackSend channel: '#deployments', message: "SUCCESS: Static site deployed!"
        }
        failure {
            echo 'Deployment failed!'
            // mail to: 'admin@example.com', subject: 'Deployment Failed', body: 'Check Jenkins!'
        }
    }
}