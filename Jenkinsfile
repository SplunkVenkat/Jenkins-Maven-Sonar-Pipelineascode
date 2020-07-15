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
				
			        sh ''' curl -u admin:admin -X POST "http://35.222.131.78:9000/api/projects/create?project=myproject&branch=test&name=myproject-test" '''
				sh ''' curl -u admin:admin -d "projectKey=myproject:test&gateId=3" -X POST "http://35.222.131.78:9000/api/qualitygates/select" '''
				sh ''' curl -u admin:admin -d "projectKey=myproject:test&profileName=test&language=java" -X POST  "http://35.222.131.78:9000/api/qualityprofiles/add_project" ''' 
				sh 'sleep 20'
				sh 'mvn clean install sonar:sonar'
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
