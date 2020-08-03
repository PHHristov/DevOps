## Connect the machine to Jenkins master (give the IP as argument)
sudo java -jar /var/tmp/agent.jar -jnlpUrl http://$1:8080/computer/MiniKube_Master/slave-agent.jnlp -workDir /var/jenkins &

## Setup docker login to ECR
export AWS_ACCESS_KEY_ID="AKIA36RLNVBTJVDLNLOG"
export AWS_SECRET_ACCESS_KEY="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"
export AWS_DEFAULT_REGION="eu-west-1"
aws ecr get-login-password --region eu-west-1  | docker login  --username AWS  --password-stdin 821503567974.dkr.ecr.eu-west-1.amazonaws.com/backend
aws ecr get-login-password --region eu-west-1  | docker login  --username AWS  --password-stdin 821503567974.dkr.ecr.eu-west-1.amazonaws.com/frontend

## Start minikube and use the docker credentials to create secret
minikube start --driver=docker
kubectl create secret generic regcred \
    --from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson