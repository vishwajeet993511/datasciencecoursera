library(httr)
library(XML) 
library(RCurl) 
library(jsonlite)
#Sys.setenv(http_proxy="http://10.3.100.207:8080")

oauth_endpoints("github")
myapp <- oauth_app("courseratest", 
                   key = "8dc2f9228c22df77598c", 
                   secret = "7135a44468f8b061673342bddad09fcfb7817e50")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

req <- GET("https://api.github.com/users/jtleek/repos", 
            config(token = github_token))
stop_for_status(req)
output <- content(req)
jsondata <- fromJSON(toJSON(output))
subset(jsondata, name == "datasharing", select = c(created_at))



