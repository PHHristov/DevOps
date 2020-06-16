provider "aws" {
    profile       = var.PROFILE
    region        = var.AWS_REGION
}
resource "aws_instance" "web"{
    ami           = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"

    tags = {
        Name      = "test_test"
    }
}