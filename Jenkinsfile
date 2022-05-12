node {
	
	checkout scm
	docker.withRegistry('https://quay.io/','quay.io'){
		def customImage = docker.build("quay.io/portic-devops/tomcat8-portic:latest")
		customImage.push()
	}
	
}

