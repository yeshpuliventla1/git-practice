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
                sh '''
                whoami
                pwd
                ls -ltr
                '''
            }
        }

        stage('Build Info') {
            steps {
                sh '''
                echo "Build Number: $BUILD_NUMBER" > build_info.txt

                echo "Job Name: $JOB_NAME" >> build_info.txt

                echo "Workspace: $WORKSPACE" >> build_info.txt

                echo "Build Date:" >> build_info.txt

                date >> build_info.txt

                cat build_info.txt
                '''
            }
        }    

        stage('Artifact Creation') {
            steps {
                sh '''
                mkdir -p build

                cp index.html build/
                cp dependencies.html build/
                cp build_info.txt build/

                ls -ltr build
                '''
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