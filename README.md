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
  - Above tested the container running well on url http://184.72.123.94:8080/
  
Part 3: Created EKS cluster and AWS ECR
   - Checking the cluster using kubectl get nodes
   - NAME                            STATUS   ROLES    AGE   VERSION
ip-172-31-70-187.ec2.internal   Ready    <none>   34h   v1.22.9-eks-810597c
ip-172-31-86-153.ec2.internal   Ready    <none>   34h   v1.22.9-eks-810597c
    - Push the image to AWS ECR
    - docker tag springbootlatest:latest 464600601937.dkr.ecr.us-east-1.amazonaws.com/ali-assignment-ecr:latest
    - docker push 464600601937.dkr.ecr.us-east-1.amazonaws.com/ali-assignment-ecr:latest

Part 4: Deploy the image on AWS EKS
    - go to kubernetesobject foler
    - kubectl create -f springboot-deployment.yaml
    - kubectl create -f sb-loadbalancer.yaml
    - Tested the application running on EKS using http://ae66fddaee7c8439cb12bdd236bf5630-1527599045.us-east-1.elb.amazonaws.com/
 
Part 5: Created Jenkins pipeline
      - Installed Jenkins on same EC2
      - Created the pipeline with following workflow
       Code commit -->  Code Check out --> Code testing --> Create new image --> Push new image to ECR -- > Deploy new image on EKS --> Curl test the url
