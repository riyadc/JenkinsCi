def app

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
                app = docker build -t riyadchowdhury/jenkinsci:ci"$BUILD_NUMBER" .
                docker images -a
                """)
            }
        }

	stage('Push Image to registry') {
	      steps{
	        script{
	          withDockerRegistry(credentialsId: 'dockerhub', url: 'https://registry.hub.docker.com') {
	            app.push()
	          }
	        }
      	     }
	}



    }
}
