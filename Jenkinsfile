node {
    def commit_id
    stage('Preparation') {
        checkout scm
        sh "git rev-parse --short HEAD > .git/commit-id"
        commit_id = readFile('.git/commit-id').trim()
    }
    stage('docker build/push') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
            def app = docker.build("adrxking/docker-graphql:${commit_id}", '.').push()
        }
    }
    stage('run') {
        withCredentials([string(credentialsId: 'GRAPHQLPROJECT-POSTGRESQL-URL', variable: 'POSTGRESQL')]) {
            def cont = docker.image("adrxking/docker-graphql:${commit_id}")
            cont.pull()
            cont.inside {
                sh 'echo $POSTGRESQL'
                sh 'cd /app'
                sh 'chmod +x -R ./'
                sh 'npm run build'
                sh 'npm start'
            }
        }
    } 
}