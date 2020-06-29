provider "aws" {
  profile = var.PROFILE
  region  = var.AWS_REGION
}

resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}


resource "aws_instance" "web" {
  ami                         = var.AMIS[var.AWS_REGION]
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.mykey.key_name
  associate_public_ip_address = true
  ## VPC Subnet 
  subnet_id = aws_subnet.main-public-1.id
  ## Security Groups
  vpc_security_group_ids = [aws_security_group.allow_ssh.id,
                            aws_security_group.allow_jenkins.id,
                            aws_security_group.allow_grafana.id,
                            aws_security_group.allow_prometheus.id,
                            aws_security_group.allow_cadvisor.id,
                            aws_security_group.allow_node_exporter.id,
                            ]

  user_data = "sudo apt-get update -y \n apt-get install git-core"

  tags = {
    Name = "olala_danette"
  }

  provisioner "file" {
    source      = "./files/update.sh"
    destination = "/var/tmp/update.sh"
  }

  provisioner "file" {
    source      = "./files/ebsfs.sh"
    destination = "/var/tmp/ebsfs.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "cd /usr/src/",
      "sudo git clone https://github.com/PHHristov/DevOps.git",
      "sleep 5",
      "sudo chmod -R +x /usr/src/*",
      "cd /usr/src/DevOps/Terraform/files",
      "sudo ./update.sh",
      #"sleep 5",
      #"sudo ./ebsfs.sh",
      "sleep 5",
      "cd /usr/src/DevOps/Ansible",
      "ansible-playbook master.yml",
      "cd /usr/src/DevOps/Docker/Rito_Project/",
      "sudo docker-compose up -d"
    ]
  }


  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    user        = var.instance_username
    private_key = file(var.PATH_TO_PRIVATE_KEY)

  }

}


resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "eu-west-1a"
  size              = "20"
  type              = "gp2"
  tags = {
    Name = "persistant ebs volume"
  }
}

resource "aws_volume_attachment" "ebs-volume-attachment-1" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.web.id
}

output "ip" {
  value = aws_instance.web.public_ip
}






