## Install ansible
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible --yes

## Install minikube
sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
 && chmod +x minikube
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/kubectl
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
sudo systemctl enable kubelet.service
sudo chown -R ubuntu /usr/local/bin/minikube
sudo usermod -aG docker ubuntu && newgrp docker

## install kubectl
sudo curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/kubectl
chmod 777 ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

## AWS ECR login
export AWS_ACCESS_KEY_ID="AKIA36RLNVBTJVDLNLOG"
export AWS_SECRET_ACCESS_KEY="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"
export AWS_DEFAULT_REGION="eu-west-1"
aws ecr get-login-password --region eu-west-1  | docker login  --username AWS  --password-stdin 821503567974.dkr.ecr.eu-west-1.amazonaws.com/backend
aws ecr get-login-password --region eu-west-1  | docker login  --username AWS  --password-stdin 821503567974.dkr.ecr.eu-west-1.amazonaws.com/frontend


