pipeline {
    agent any
    tools {
  maven 'maven 3.8.4'
}
environment {
  ACR_REGISTRY = "realproject.azurecr.io"
  ACR_REPOSITORY = "helloworldapp"
  buildNumber = "BUILD_NUMBER"
}
    stages {
        stage('Get_Codes') {
            steps {
                git branch: 'main', credentialsId: 'git_credentials', url: 'https://github.com/Muzammil-2/SIMPLE-REAL-PROJECT-SEP-24.git'
            }
        }
         stage('build_pkg') {
             steps {
                sh 'mvn clean package'
             }
        }
        stage('Build_Docker_Image') {
            steps {
                sh 'docker build -t ${ACR_REGISTRY}/${ACR_REPOSITORY}:${BUILD_NUMBER} .'
            }
        }
     
     stage('Push_Docker_Image') {
            steps {
               withCredentials([usernamePassword(credentialsId: 'acr_key', passwordVariable: 'passwd-id', usernameVariable: 'user-id',url:'https://azurecr.io')]) {
      sh 'docker login -u ${user-id} -p {passwd-id} ${ACR_REGISTRY}'
     sh 'docker push ${ACR_REGISTRY}/${ACR_REPOSITORY}:${BUILD_NUMBER}'
}
               }
        }
 }
}