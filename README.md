# **NODEJS Deploy with ECR & ECS Cluster by R ABDUL JAMAL**

#Requitments

- account fo AWS Console
- aws access_key = "xxxxxxxxxxx"
- aws secret_key = "xxxxxxxxxxxxxx"
- aws CLI with aws configure insert access key id & AWS Secret Access Key [read this turtorial](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)


# Preparation

1. change access_key & secret_key in deployment/provider.tf
2. change repo_url image in deployment/fargate.tf format <ACCOUNT_ID>.dkr.ecr.ap-southeast-1.amazonaws.com/ecr_example_repo:latest

# Setup Deployment

1. clone this repository & install package nodejs

```bash
npm install
```

2. docker setup

```bash
# docker login
ACCOUNT_ID=$(aws sts get-caller-identity | jq -r ".Account") 
aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin "$ACCOUNT_ID.dkr.ecr.ap-southeast-1.amazonaws.com"

# docker build
docker build . -t nodejs-terraform-aws

# docker tag name
docker tag nodejs-terraform-aws:latest $ACCOUNT_ID.dkr.ecr.ap-southeast-1.amazonaws.com/ecr_example_repo:latest  

# docker push image
docker push 918456051637.dkr.ecr.ap-southeast-1.amazonaws.com/ecr_example_repo:latest  
```

3. terraform deploy

```bash

# cd to dir deployment
cd deployment

# init
terraform init

# plan
terraform init

# apply configuration terraform
terraform apply
```

## Fargate is a type of the Elastic Container Service, which has three concepts:

- Clusters: a logical grouping of tasks or services
- Services: where you group tasks and specify how many of each task you want running at a time
- Tasks: defines a specified docker image to use, along with what IAM roles are needed to use it 

It should be pretty easy to map those concepts to the three terraform resource blocks above.

There are quite a few arguments I won't go over in detail here, but they mostly relate to:

- Connecting the service to the VPC we created in network.tf
- Ensuring this is the cheapest possible Fargate instance you can run so you don't spend more than a few cents on your demo app.
- Connecting the task, service, and cluster to each other.
- Giving the web app a public IP Address so you can visit the website you just made.
- Find the public IP Address on the task page in your AWS console, and go to http://public_ip:3000 to view your super scalable hello world application