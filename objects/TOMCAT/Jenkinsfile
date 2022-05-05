node {
	checkout scm
	docker.withRegistry('https://default-route-openshift-image-registry.apps-crc.testing/','openshift_developer'){
		def customImage = docker.build("portic-devops/tomcat8-portic:${env.BUILD_ID}")
		customImage.push()
	}
}

