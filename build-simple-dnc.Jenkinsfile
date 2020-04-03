def dockerImage;

node('docker-ex'){
	stage('SCM'){
		checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/FeynmanFan/JenkinsDocker']]]);
	}
	stage('build'){
		docker.withRegistry('https://index.docker.io/v1/', 'dockerhubcreds'){
			sh 'docker buildx create --name cbbspace' 
			sh 'docker buildx use cbbspace'
			sh 'docker buildx build -t chrisbbehrens/simplednc:jenkinsfile --platform=linux/amd64,linux/arm/v7 - < simplednc.Dockerfile --push'
		}
		
	}
}