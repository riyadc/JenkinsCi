pipeline {
    agent any

    stages {
        stage('Verify branch') {
            steps {
                echo "$GIT_BRANCH"
            }
        }
        
        stage('Run Test') {
            steps {
                sh("""
                docker images -a
                docker build -t jenkins-pipeline .
                docker images -a
                """)
            }
        }

        stage('Docker build') {
            steps {
                sh("""
                docker images -a
                docker build -t jenkins-pipeline .
                docker images -a
                """)
            }
        }




    }
}
