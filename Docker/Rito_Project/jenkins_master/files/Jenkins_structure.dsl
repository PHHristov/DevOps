branch = "master"
project = "Banichka_s_bozichka"
repo = "https://github.com/PHHristov/docker-frontend-backend-db"


folder("Daily") { displayName("Daily") }
	folder("Daily/${project}") {}
	pipelineJob("Daily/${project}/build") {
	    displayName("Build")    	   
        definition {
			cpsScm {
				scm {
				  git {
					remote {
					  url("${repo}")
					}
					branches("*/${branch}")                    
					scriptPath("pipeline.jenkinsfile")
					}          
				}
			}
    	}	
	}