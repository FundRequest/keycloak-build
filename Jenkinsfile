pipeline {
    agent any
    environment {
        GITHUB_CREDS = credentials('GITHUB_CRED')
    }
    options {
        disableConcurrentBuilds()
        timeout(time: 15, unit: 'MINUTES')
    }
    stages {
        stage('Docker Build') {
          steps {
            sh 'docker build -t fundrequestio/keycloak:${BRANCH_NAME} .'
          }
        }
        stage('Docker Push') {
          steps {
            withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
              sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
              sh "docker push fundrequestio/keycloak:${BRANCH_NAME} && echo 'pushed'"
            }
          }
        }
    }
}
