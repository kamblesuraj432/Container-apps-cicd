# cicd-project
# The steps to build and run the Docker container locally.
---- docker build -t kamblesuraj432/webapp .
     docker login -u kamblesuraj432 -p dckr_pat_mvMwzXSRGgFCiH9YNsPBoZc4zV4
     docker push kamblesuraj432/webapp

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
# How to run the deployment script or commands to deploy the container to the chosen cloud service.
-- aws cli install in vm
- aws configure
- aws ecs create-cluster --cluster-name webapp
- aws ecs create-service \
    --cluster example-cluster \
    --task-definition Test-fargate-EFS \
    --launch-type FARGATE \
    --service-name example-service \
    --desired-count 1 \
    --network-configuration="awsvpcConfiguration={subnets=["subnet-ed7d31b5","subnet-833ef1cb"],securityGroups=["sg-eeb28aa1"],assignPublicIp=ENABLED}"
