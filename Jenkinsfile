pipeline {
	environment { 
        registry = "riyadchowdhury/jenkinsci" 
        registryCredential = 'dockerhub' 
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
			dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            }
        }

	stage('Push Image to registry') {
	      steps{
	        script{
	          docker.withRegistry( '', registryCredential ) { 
		   	dockerImage.push()
                  }
	        }
      	     }
	}



    }
}
