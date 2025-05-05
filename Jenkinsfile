pipeline {
    agent any

    stages {
        // Stage 1: Checkout code
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Monalishamona/dockeretp.git'
            }
        }

        // Stage 2: Deploy to a web server
        stage('Deploy') {
            steps {
                // Option 1: Copy to Nginx/Apache (requires server access)
                sh '''
                    sudo cp index.html /var/www/html/  # For Nginx/Apache
                    sudo systemctl restart nginx       # Reload server
                '''

                // OR Option 2: Run a Python HTTP server (temporary, for testing)
                // sh 'python3 -m http.server 8000 &'  # Runs in background
            }
        }
    }

    post {
        success {
            echo 'Deployed successfully! Access at: http://<your-server-ip>/index.html'
        }
        failure {
            echo 'Deployment failed! Check logs.'
        }
    }
}