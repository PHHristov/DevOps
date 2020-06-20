provider "aws" {
  profile = var.PROFILE
  region  = var.AWS_REGION
}

resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "web" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name

  tags = {
    Name = "olala_danette"
  }
  provisioner "file" {
    source      = "./files/update.sh"
    destination = "/var/tmp/update.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /var/tmp/update.sh",
      "chmod -R +x /var/tmp/Rito_project",
      "sudo /var/tmp/update.sh"

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


