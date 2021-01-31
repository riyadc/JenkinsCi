pipeline {
    agent any

    stages {
        stage('Verify branch') {
            steps {
                echo "$GIT_BRANCH"
            }
        }
        
        stage('Docker build') {
            steps {
                sh("""
                cd JenkinsCi
                docker build -t jenkins-pipeline .
                docker tag jenkins-pipeline riyadchowdhury/jenkinsci:"$BUILD_NUMBER"
                docker push riyadchowdhury/jenkinsci:"$BUILD_NUMBER"
                docker images -a
                """)
            }
        }




    }
}
