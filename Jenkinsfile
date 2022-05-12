node {
	
	checkout scm
	docker.withRegistry('https://quay.io/cmajo/'){
		def customImage = docker.build("portic-devops/tomcat8-portic:latest")
		customImage.push()
	}
	
}

