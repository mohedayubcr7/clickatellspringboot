# clickatellspringboot
Part 1: Spring boot application created, below are the instructions to use the same
 - MAke sure Maven is installed
 - MAke sure MAVEN_HOME and JAVA_HOME is set
 - go to MyApp
 - Run mvn spring-boot:run


Part 2: Containerize the application
  - Dockerfile code is attached
  - docker build -t springbootdocker .
  - docker run -d -t -i -p 8080:8080 springbootdocker
  - Above tested the container running well
  
Part 3: Created EKS cluster and AWS ECR
   - 
