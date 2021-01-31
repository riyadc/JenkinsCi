pipeline {
	environment { 
        registryRepo = "riyadchowdhury/jenkinsci" 
        registryCredentialId = 'dockerhub'
        registryUrl = "https://registry.hub.docker.com"
        dockerImage = '' 
    	}
    
    agent any

    stages {
        stage('Verify branch') {
            steps {
                echo "$GIT_BRANCH"
            }
        }
        
        stage('Docker build') {
            steps {
                script { 
			dockerImage = docker.build registryRepo + ":$BUILD_NUMBER" 
                }
            }
        }

	stage('Push Image to registry') {
	      steps{
	        script{
	          docker.withRegistry( registryUrl, registryCredentialId ) { 
		   	dockerImage.push()
                  }
	        }
      	     }
	}



    }
}
