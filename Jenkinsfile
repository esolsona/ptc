node {
	withEnv([
    	"DOCKER_TLS_VERIFY=0",
    	"DOCKER_HOST=tcp://172.17.0.1:2375",
	"DOCKER_TLS_CERTDIR: /certs"
	]) {
	checkout scm
	docker.withRegistry('https://quay.io','quay.io'){
		def customImage = docker.build("cmajo/portic-devops/tomcat8-portic:latest")
		customImage.push()
	}
	}
}

