node {
	
	checkout scm
	docker.withRegistry('https://quay.io/','quay.io'){
		def customImage = docker.build("quay.io/cmajo/portic-devops/tomcat8-portic:latest")
		customImage.push()
	}
	
}

