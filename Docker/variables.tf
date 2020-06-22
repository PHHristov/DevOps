variable "PROFILE" {
  type        = string
  default     = "default"
  description = "i have preinstalled AWSCLI and configured the default profile, so from now on we do not need to keep aws secret and access keys, hopefully"
}

variable "PATH_TO_PUBLIC_KEY" {
  type    = string
  default = "../Terraform/files/mykey"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "../Terraform/files/mykey.pem"
}

variable "AWS_REGION" {
    default = "eu-west-1"
}