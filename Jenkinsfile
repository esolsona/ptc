node {
	checkout scm
	docker.withRegistry('default-route-openshift-image-registry.apps-crc.testing/portic-devops/','openshift_developer'){
		def customImage = docker.build(default-route-openshift-image-registry.apps-crc.testing/portic-devops/tomcat8-portic")
		customImage.push()
	}
}

