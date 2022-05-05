node {
	checkout scm
	docker.withRegistry('https://default-route-openshift-image-registry.apps-crc.testing/','portic-image-puller'){
		def customImage = docker.build("portic-devops/tomcat8-portic:${env.BUILD_ID}")
		customImage.push()
	}
}

