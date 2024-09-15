pipeline {
    agent any

    stages {
        stage('Get_Codes') {
            steps {
                git branch: 'main', credentialsId: 'git_credentials', url: 'https://github.com/Muzammil-2/SIMPLE-REAL-PROJECT-SEP-24.git'
            }
        }
        // stage('Test') {
        //     steps {
        //         echo 'Testing..'
        //     }
        // }
        // stage('Deploy') {
        //     steps {
        //         echo 'Deploying....'
        //     }
        // }
    }
}