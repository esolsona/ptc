node {
	
	checkout scm
	docker.withRegistry('https://quay.io/','quay.io'){
		def customImage = docker.build("portic-devops/tomcat8-portic:latest#cmajo")
		customImage.push()
	}
	
}

