pipeline {
    agent any
    tools {
  maven 'maven 3.8.4'
}
environment {
  ACR_REGISTRY = "azure.io.realproject"
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
                sh 'docker build -t ${ACR_REGISTRY}/${ACR_REPOSITORY}/${BUILD_NUMBER} .'
            }
        }
     
     stage('Push_Docker_Image') {
            steps {
                sh 'docker login ${ACR_REGISTRY}'
                sh 'docker push ${ACR_REGISTRY}/${ACR_REPOSITORY}/${BUILD_NUMBER}'
            }
        }
 }
}