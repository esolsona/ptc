node {
	
	checkout scm
	docker.withRegistry('https://quay.io/','quay.io'){
		def customImage = docker.build("quay.io/cmajo/tomcat8-portic:${BUILD_NUMBER}")
		customImage.push("latest")
		
	}	
	job('example-1') {
    steps {
        shell('docker images')
    }
}

