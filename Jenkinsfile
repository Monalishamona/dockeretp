pipeline {
    agent any

    stages {
        // Stage 1: Checkout code (removed duplicate checkout)
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Monalishamona/dockeretp.git'
            }
        }

        // Stage 2: Deploy
        stage('Deploy') {
            steps {
                // Choose ONE option below:

                // Option 1: Copy to IIS/Apache on Windows
                bat 'xcopy /Y index.html "C:\\inetpub\\wwwroot\\"'

                // Option 2: Run Python HTTP server (Windows)
                // bat 'start /B python -m http.server 8000'
            }
        }
    }

    post {
        success {
            echo 'Deployed successfully! Access at: http://localhost/index.html (IIS) or http://localhost:8000 (Python server)'
        }
        failure {
            echo 'Deployment failed! Check logs.'
        }
    }
}