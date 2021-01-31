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
                docker build -t riyadchowdhury/jenkinsci:ci"$BUILD_NUMBER" .
                docker images -a
                """)
            }
        }

	stage('Docker push') {
            withDockerRegistry([ credentialsId: "babu6junnu", url: "" ]) {
	            bat "docker push riyadchowdhury/jenkinsci:ci"$BUILD_NUMBER""
        }
        }



    }
}
