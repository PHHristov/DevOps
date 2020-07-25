project = "Test Project"
repo = "https://github.com/PHHristov/docker-frontend-backend-db"
branch = "master"


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
					scriptPath("k8s.jenkinsfile")
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

// NIghtly 

folder("Nightly") { displayName("Nightly") }
	folder("Nightly/${project}") {}
	pipelineJob("Nightly/${project}/build") {
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
	pipelineJob("Nightly/${project}/test") {
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
	pipelineJob("Nightly/${project}/promotion") {
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
listView('2. Nightly') {
  	recurse(true)
	jobFilters {
      	jobs {
          	name("Nightly/${project}")
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

// Release 

folder("Release") { displayName("Release") }
	folder("Release/${project}") {}
	pipelineJob("Release/${project}/build") {
	    displayName("Build")    	   
        definition {
			cpsScm {
				scm {
				  git {
					remote {
					  url("${repo}")
					}

					branches("*/${branch}")                    
					scriptPath("k8s.jenkinsfile")
					}          
				}
			}
    	}	
	}
	pipelineJob("Release/${project}/test") {
		displayName("Test")    	   
        definition {
			cpsScm {
				scm {
				  git {
					remote {
					  url("${repo}")
					}
					branches("*/${branch}")                    
					scriptPath("k8s.jenkinsfile")
					}          
				}
			}
    	}	
	}
	pipelineJob("Release/${project}/promotion") {
		displayName("Promotion")    	   
        definition {
			cpsScm {
				scm {
				  git {
					remote {
					  url("${repo}")
					}
					branches("*/${branch}")                    
					scriptPath("k8s.jenkinsfile")
					}          
				}
			}
    	}
	}
listView('3. Release') {
  	recurse(true)
	jobFilters {
      	jobs {
          	name("Release/${project}")
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