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
      sh 'az acr login --name ${ACR_REGISTRY}'
      sh 'docker push ${ACR_REGISTRY}/${ACR_REPOSITORY}:${BUILD_NUMBER}'
}
               }
        }
 stage('Deployment_K8s') {
            steps {
            withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'kubeconfig_aks', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
             sh "sed -i 's/helloworldapp:latest/helloworldapp:${BUILD_NUMBER}/g' deployment_svc.yaml"
             sh "kubectl apply -f deployment_svc.yaml "
}
            
            }
        }
 
 
 
 }
}