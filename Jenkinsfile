pipeline {
    agent any
    tools {
  maven 'maven 3.8.4'
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
        // stage('Deploy') {
        //     steps {
        //         echo 'Deploying....'
        //     }
        // }
    }
}