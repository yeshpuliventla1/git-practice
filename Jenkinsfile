pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Getting code from GitHub'
            }
        }

        stage('Validate Files') {
            steps {
                sh '''
                test -f index.html
                test -f dependencies.html
                '''
            }
        }

        stage('Build Website') {
            steps {
                sh '''
                mkdir -p build

                cp index.html build/
                cp dependencies.html build/

                echo "Build Number: ${BUILD_NUMBER}" > build/build_info.txt
                echo "Job Name: ${JOB_NAME}" >> build/build_info.txt
                date >> build/build_info.txt
                '''
            }
        }

        stage('Verify Build') {
            steps {
                sh '''
                ls -ltr build
                '''
            }
        }
    }

    post {
        success {
            archiveArtifacts artifacts: 'build/*'
        }
    }
}