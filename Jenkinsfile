node {
	checkout scm
	docker.withRegistry('https://default-route-openshift-image-registry.apps-crc.testing/portic-devops/','openshift_developer'){
		def customImage = docker.build("tomcat8-portic:${env.BUILD_ID}")
		customImage.push()
	}
}

