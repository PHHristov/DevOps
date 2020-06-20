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
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  user_data = "sudo apt-get update -y \n sudo apt install software-properties-common -y \n sudo apt-add-repository --yes --update ppa:ansible/ansible \n sudo apt install ansible -y \n apt-get install git-core"

  tags = {
    Name = "olala_danette"
  }

  provisioner "file" {
    source      = "./files/update.sh"
    destination = "/var/tmp/update.sh"
  }
  
  provisioner "remote-exec" {
    inline = [
      "cd /usr/src/",
      "sudo git clone https://github.com/PHHristov/DevOps.git"

    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    user        = var.instance_username
    private_key = file(var.PATH_TO_PRIVATE_KEY)

  }

}

output "ip" {
  value = aws_instance.web.public_ip
}


