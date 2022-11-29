node{
   
    stage("Git Clone"){

        git branch: 'master', url: 'https://github.com/jsilaparasetti/jenkinsfile-1.git'
    }
   
    stage("Docker build"){
        sh 'docker version'
        sh 'docker build -t jsilaparasetti/app-2-img:latest .'
        sh 'docker image ls'
    }

    withCredentials([string(credentialsId: 'ineeladri', variable: 'PASSWORD')]) {
        sh 'docker login -u ineeladri -p $PASSWORD'
    }

    stage("Pushing Image to Docker Hub"){
     
       sh 'docker push ineeladri/app-2-img:latest'
       }
    post {
always {
sh 'docker logout'
}
}
}
