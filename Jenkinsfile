node {
	
	checkout scm
	docker.withRegistry('https://quay.io/','quay.io'){
		def customImage = docker.build("quay.io/cmajo/tomcat8-portic:latest")
		customImage.push()
	}
	
}

