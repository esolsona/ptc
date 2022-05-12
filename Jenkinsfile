node {
	
	checkout scm
	docker.withRegistry('https://quay.io'){
		def customImage = docker.build("cmajo/portic-devops/tomcat8-portic:latest")
		customImage.push()
	}
	
}

