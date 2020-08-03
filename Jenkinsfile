pipeline {
    agent any
    
     environment {
        sonar = "http://35.222.142.100:9000"
	token = "44070443e101a72e1fb87c8128705d0b6e51b5c1"    
    }
	
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
				
				sh ''' curl -u $token: -X POST ""${sonar}/api/projects/create?"project=project&branch=${GIT_BRANCH#*/}&name=project-${GIT_BRANCH#*/}""" '''
				sh ''' curl -u admin:admin -d "projectKey=project:${GIT_BRANCH#*/}&gateId=3" -X POST ""${sonar}/api/qualitygates/select"" '''
				sh ''' curl -u admin:admin -d "project=project:${GIT_BRANCH#*/}&profileName=test&language=java" -X POST ""${sonar}/api/qualityprofiles/add_project"" ''' 
				sh 'sleep 2'
				sh 'mvn clean install sonar:sonar -Dsonar.projectKey=project:${GIT_BRANCH#*/}'
				sh ''' rm -rf result.txt && curl -u admin:admin "${sonar}/api/qualitygates/project_status?projectKey=project:${GIT_BRANCH#*/}" -o result.txt '''
				sh ''' cat result.txt '''
	                        sh ''' export status=$(cat result.txt | cut -d ':' -f 3 | cut -d ',' -f 1) '''
				sh ''' chmod -R 777 *.sh '''
				sh ''' echo "$status" '''
				sh ''' ./script.sh '''
			    } 
		//     timeout(time: 1, unit: 'HOURS') {
                    // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
                    // true = set pipeline to UNSTABLE, false = don't
           //         waitForQualityGate abortPipeline: true
          //  }
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
