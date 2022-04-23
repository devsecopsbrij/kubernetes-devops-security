pipeline {
  agent any

 environment {
    deploymentName = "devsecops"
    containerName = "devsecops-container"
    serviceName = "devsecops-svc"
    imageName = "brijeshk/numeric-app:${GIT_COMMIT}"
    applicationURL = "http://devsecops-demo-brij.westus2.cloudapp.azure.com/"
    applicationURI = "/increment/99"
  }

  stages {
      stage('Build Artifact') {
            steps {
              sh "mvn clean package -DskipTests=true"
              archive 'target/*.jar' 
            }
        }  
         stage('Unit Tests - JUnit and Jacoco') {
      steps {
        sh "mvn test"
      }
      
    }

    stage('Mutation Tests - PIT') {
      steps {
        sh "mvn org.pitest:pitest-maven:mutationCoverage"
      }
      
    }
    
    stage('Docker Build and Push') {
      steps {
        echo "Docker Build and Push"
	   // withDockerRegistry([credentialsId: "docker-hub", url: ""]) {
         // sh 'printenv'
          //sh 'docker build -t brijeshnk/numeric-app:""$GIT_COMMIT"" .'
          //sh 'docker push brijeshnk/numeric-app:""$GIT_COMMIT""'
      //  }
      }
    }

   
  }
}