# cicd-project
# The steps to build and run the Docker container locally.
1) docker build -t kamblesuraj432/webapp .
2) docker run -d -p 80:80 kamblesuraj432/webapp
3) docker login -u kamblesuraj432 -p dckr_pat_mvMwzXSRGgFCiH9YNsPBoZc4zV4
4) docker push kamblesuraj432/webapp

# How the CI/CD pipeline works and how to trigger it.
name: Docker Image CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3

    - name: Build the Docker image
      run: |
        docker build -t kamblesuraj432/webapp .
        docker login -u kamblesuraj432 -p dckr_pat_mvMwzXSRGgFCiH9YNsPBoZc4zV4
        docker push kamblesuraj432/webapp
![image](https://github.com/kamblesuraj432/cicd-project/assets/140583784/e840794b-a143-4d6e-8122-6abe05c03596)

# docker image in Docker-Hub account
![image](https://github.com/kamblesuraj432/cicd-project/assets/140583784/90f1b099-f512-431b-ac2d-388bf6a69531)


# How to run the deployment script or commands to deploy the container to the chosen cloud service.
-- aws cli install in vm
# Login to aws account using AWS CLI access key & secret key
1) aws configure

# Create ECS Cluster using AWS CLI below commands
1) aws ecs create-cluster --cluster-name webapp
2) aws ecs create-service \
    --cluster webapp \
    --task-definition mytask \
    --launch-type FARGATE \
    --service-name my-service \
    --desired-count 1 \
    --network-configuration="awsvpcConfiguration={subnets=["subnet-06a9279bc535290d6"],securityGroups=["sg-0254257d9cd638b0e"],assignPublicIp=ENABLED}"
   ![image](https://github.com/kamblesuraj432/cicd-project/assets/140583784/b9ca5b6e-79eb-4753-ac34-a9a8c35033cb)
   ![image](https://github.com/kamblesuraj432/cicd-project/assets/140583784/4e63cd49-1032-4c69-bed1-0318c137faf1)
   
   # inside ECS Cluster see container run image below and container public ip 
   ![image](https://github.com/kamblesuraj432/cicd-project/assets/140583784/a11e3577-0e03-4c3f-b721-33c6643d50e3)

   # app run in website see below image
   ![image](https://github.com/kamblesuraj432/cicd-project/assets/140583784/d03fa52d-8589-462b-8bb7-9740422486a2)



