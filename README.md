# Simple Java Conjur client

## Application build steps:
 - Download the JRE 9.0.4 tarfile from: 
```
      https://www.oracle.com/technetwork/java/javase/downloads/index.html
```

## To run the example app:
 - Copy Conjur cert to local directory
 - Edit javademo.config with correct values for:
   - CONJUR_CERT_FILE
   - CONJUR_APPLIANCE_URL
   - CONJUR_ACCOUNT
   - CONJUR_AUTHN_LOGIN
   - CONJUR_AUTHN_API_KEY
   - CONJUR_VAR_ID
 - Run 0_build.sh to compile the app and build the Docker container
 - Run container with:
```
      docker run --name javatest javatest:latest /runTest.sh && docker rm javatest
```
   or if you want to run it as a long-running container:
```
      docker run -d --name javatest javatest:latest /bin/sleep infinity
```
   and then exec into the container:
```
      docker exec -it javatest bash
```

## Static function members in DAPJava class:
 - void initJavaKeyStore(file,password) - opens Java key store containing server cert
 - void initConnection(url,account) - sets private members for appliance URL and account 
 - void getHealth() - basic DAP health check
 - String authnLogin(uname,password) - Logs in human user with password, returns user's API key 
 - void authenticate(name,apikey) - authenticates with API key, sets private access token member
 - void setAccessToken(token) - sets private access token member, use with authn-k8s
 - String search(searchstr) - returns json array for variables where id or annotations match searchstr
 - String variableValue(varname) - gets variable value by name using private members
