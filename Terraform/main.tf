provider "aws" {
  profile = var.PROFILE
  region  = var.AWS_REGION
}

resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

###########################################################################
## Jenkins MASTER #########################################################
###########################################################################

resource "aws_instance" "web" {
  ami                         = var.AMIS[var.AWS_REGION]
  instance_type               = "t2.medium"
  key_name                    = aws_key_pair.mykey.key_name
  associate_public_ip_address = true
  ## VPC Subnet 
  subnet_id = aws_subnet.main-public-1.id
  ## Security Groups
  vpc_security_group_ids = [
      aws_security_group.allow_ssh.id,
      aws_security_group.allow_jenkins.id,
      aws_security_group.allow_grafana.id,
      aws_security_group.allow_prometheus.id,
      aws_security_group.allow_cadvisor.id,
      aws_security_group.allow_node_exporter.id,
      aws_security_group.allow_jenkins_slaves.id,
      aws_security_group.allow_web.id]

  user_data = "sudo apt-get update -y \n apt-get install git-core"

  tags = {
    Name = "Jenkins_Master"
  }

  provisioner "file" {
    source      = "./files/update.sh"
    destination = "/var/tmp/update.sh"
  }

  provisioner "file" {
    source      = "./files/ebsfs.sh"
    destination = "/var/tmp/ebsfs.sh"
  }

  provisioner "file" {
    source      = "./files/agent.jar"
    destination = "/var/tmp/agent.jar"
  }

  provisioner "file" {
    source      = "./files/jenkins_connect.sh"
    destination = "/var/tmp/jenkins_connect.sh"
  }
   
  provisioner "remote-exec" {
    inline = [
      "cd /usr/src/",
      "sudo git clone https://github.com/PHHristov/DevOps.git",
      "sleep 5",
      "sudo chmod -R +x /usr/src/*",
      "cd /usr/src/DevOps/Terraform/files",
      "sleep 5",
      "sudo ./update.sh",
      #"sleep 5",
      #"sudo ./ebsfs.sh",
      "sleep 5",
      "cd /usr/src/DevOps/Ansible",
      "ansible-playbook master.yml",
      "sudo /usr/src/DevOps/Docker/ecr-login.sh",
      "cd /usr/src/DevOps/Docker/Rito_Project/",
      "sudo docker-compose up -d",
      "sudo chmod +x /var/tmp/agent.jar",
      "sudo chmod 777 /var/tmp/jenkins_connect.sh"
      
    ]
  }


  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    user        = var.instance_username
    private_key = file(var.PATH_TO_PRIVATE_KEY)

  }

}

###########################################################################
## Kubernetes MASTER ######################################################
###########################################################################

resource "aws_instance" "Kube" {
  ami                         = var.AMIS[var.AWS_REGION]
  instance_type               = "t2.medium"
  key_name                    = aws_key_pair.mykey.key_name
  associate_public_ip_address = true
  ## VPC Subnet 
  subnet_id = aws_subnet.main-public-1.id
  ## Security Groups
  vpc_security_group_ids = [
      aws_security_group.allow_ssh.id,
      aws_security_group.allow_jenkins.id,
      aws_security_group.allow_grafana.id,
      aws_security_group.allow_prometheus.id,
      aws_security_group.allow_cadvisor.id,
      aws_security_group.allow_node_exporter.id,
      aws_security_group.allow_jenkins_slaves.id,
      aws_security_group.allow_web.id]

  user_data = "sudo apt-get update -y \n apt-get install git-core \n export PATH=/home/ubuntu/.linuxbrew/bin:$PATH"

  tags = {
    Name = "Kubernetes"
  }

  provisioner "file" {
    source      = "./files/k8sUpdate.sh"
    destination = "/var/tmp/k8sUpdate.sh"
  }
  
  provisioner "file" {
    source      = "./files/agent.jar"
    destination = "/var/tmp/agent.jar"
  }

  provisioner "file" {
    source      = "./files/login.sh"
    destination = "/var/tmp/login.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "cd /usr/src/",
      "sudo git clone https://github.com/PHHristov/DevOps.git",
      "sleep 5",
      "sudo chmod -R +x /usr/src/*",
      "cd /usr/src/DevOps/Terraform/files",
      "sleep 5",
      "sudo ./k8sUpdate.sh",
      #"sleep 5",
      #"sudo ./ebsfs.sh",
      "sleep 5",
      "cd /usr/src/DevOps/Ansible",
      "ansible-playbook k8s.yml",
      "sudo chmod +x /var/tmp/agent.jar",
      "sudo chmod +x /var/tmp/login.sh"
    ]
  }


  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    user        = var.instance_username
    private_key = file(var.PATH_TO_PRIVATE_KEY)

  }

}

###########################################################################
## EBS Volume #############################################################
###########################################################################
## 
## resource "aws_ebs_volume" "ebs-volume-1" {
##   availability_zone = "eu-west-1a"
##   size              = "20"
##   type              = "gp2"
##   tags = {
##     Name = "persistant ebs volume"
##   }
## }
## 
## resource "aws_volume_attachment" "ebs-volume-attachment-1" {
##   device_name = "/dev/xvdh"
##   volume_id   = aws_ebs_volume.ebs-volume-1.id
##   instance_id = aws_instance.web.id
## }

###########################################################################
## Output #############################################################
###########################################################################


output "Kube_ip" {
  value = aws_instance.Kube.public_ip
}

output "Jenkins_ip" {
  value = aws_instance.web.public_ip
}





