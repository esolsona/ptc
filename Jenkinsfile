node {
	checkout scm
	docker.withRegistry('https://quay.io/','quay.io'){
		def customImage = docker.build("quay.io/cmajo/tomcat8-portic:${BUILD_NUMBER}")
		customImage.push("latest")	
	}	
	//sh "docker image prune --all --force"
	sh docker image prune --force --filter=until="`date -d "7 days ago" +'%Y-%M-%dT00:00:00'`"
}

