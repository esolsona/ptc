node {
	checkout scm
	docker.withRegistry('default-route-openshift-image-registry.apps-crc.testing','portic_image_puller'){
		def customImage = docker.build("portic-devops/tomcat8-portic:${env.BUILD_ID}")
		customImage.push()
	}
}

