pipeline {
    agent any
    stages {
        stage('Code Checkout') {
            steps {
                echo 'Checkout'
            }
        }
        stage('Sonar') {
            steps {
                echo 'Sonar Scanner'
               	//def scannerHome = tool 'SonarQube Scanner 3.0'
			    withSonarQubeEnv('nambasonar') {
				sh 'mvn clean install sonar:sonar'
				//sh '''curl -u "1143ecb51a8a91e1cd95a9ef60a05a24279edf74":"" -d "project=Asingle-module-project&branch=$GIT_BRANCH&name=Asingle-module-project-$GIT_BRANCH" $SONAR_URL/api/projects/create'''
			        sh '''curl -X POST   "http://35.222.131.78:9000/api/projects/create?key=myKeylalala&name=myProject" '''
			    }
		    // timeout(time: 1, unit: 'HOURS') {
                    // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
                    // true = set pipeline to UNSTABLE, false = don't
                   // waitForQualityGate abortPipeline: true
           // }
        }
	// stage('Quality Gate') {
        //     steps {
        //        timeout(time: 1, unit: 'HOURS') {
                    // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
                    // true = set pipeline to UNSTABLE, false = don't
        //            waitForQualityGate abortPipeline: true
        //        }
        //    }
        }    
    }
}
