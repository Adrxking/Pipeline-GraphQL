pipeline {
    agent {
        docker {
            image 'node:16.14.0'
            args '-p 4000:4000 -u root:root  --name graphql-prisma-graphql'
            reuseNode true
        }
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            environment {
                POSTGRESQL = credentials("GRAPHQLPROJECT-POSTGRESQL-URL")
            }
            steps {
                dir("app/graphql"){
                    sh 'echo "$POSTGRESQL" > .env'
                    sh 'npm install'
                }
            }
        }
        stage('Deliver') {
            steps {
                sh "chmod +x -R ${env.WORKSPACE}/services/scripts"
                sh './services/scripts/deploy.sh'
            }
        }

    }
    post {
        success { 
            slackSend message: "SUCCESS - Build Started - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)"
        }
        failure {
            slackSend message: "ERROR - Build Started - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)"
        }
    }
}