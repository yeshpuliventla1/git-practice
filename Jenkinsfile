pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Source Downloaded'
            }
        }
        stage('Environment Info') {
            steps {
                sh 'whoami'
                sh 'pwd'
                sh 'ls -ltr'
            }
        }
        stage('Build Validation') {
            steps {
                sh 'chmod +x tests/test.sh'
                sh './tests/test.sh'
            }
        }
    }
}