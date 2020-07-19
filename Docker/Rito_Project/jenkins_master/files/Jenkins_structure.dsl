branch = "master"
project = "Banichka_s_bozichka"
repo = "https://github.com/PHHristov/docker-frontend-backend-db"

//Daily
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
	pipelineJob("Daily/${project}/test") {
		displayName("Test")    	   
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
	pipelineJob("Daily/${project}/promotion") {
		displayName("Promotion")    	   
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
listView('1. Daily') {
  	recurse(true)
	jobFilters {
      	jobs {
          	name("Daily/${project}")
        }
    	columns {
    	    status()
	        weather()
    	    name()
	        lastSuccess()
    	    lastFailure()
	        lastDuration()
    	    buildButton()
        }
      	status {
        	matchType(MatchType.INCLUDE_MATCHED)
      	}
    }
}