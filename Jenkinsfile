node {
    def commit_id
    def previous_id
    stage('Preparacion') {
        checkout scm
        sh "git rev-parse --short HEAD > .git/commit-id"
        commit_id = readFile('.git/commit-id').trim()
        sh "if (test ! -f .git/previous-id); then echo '' > .git/previous-id; fi"
        previous_id = readFile('.git/previous-id').trim()
    }
    stage('Build y Push a DockerHub') {
        // Build and push the image
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
            def app = docker.build("adrxking/docker-graphql:${commit_id}", '.').push()
        }
        sh "echo ${commit_id} > .git/previous-id"
        // Delete image
        sh "docker rmi adrxking/docker-graphql:${commit_id}"
    }
    stage('Correr contenedor') {
        withCredentials([string(credentialsId: 'GRAPHQLPROJECT-POSTGRESQL-URL', variable: 'POSTGRESQL')]) {
            def cont = docker.image("adrxking/docker-graphql:${commit_id}")
            // Download image
            cont.pull()
            // Delete container if exists with same name
            sh "docker stop graphql-prisma-graphql || true && docker rm graphql-prisma-graphql || true"
            // Run container
            sh "docker run -d -p 4000:4000 -u root:root --name graphql-prisma-graphql adrxking/docker-graphql:${commit_id}"
            // Delete image
            sh "docker rmi adrxking/docker-graphql:${commit_id}"
            // Run commands inside the container
            sh "docker exec graphql-prisma-graphql bash \"${echo $POSTGRESQL > /app}\""
            sh "docker exec -w /app graphql-prisma-graphql ls -la"
        }
    } 
}