variable AWS_REGION{
    type = string
    default = "eu-west-1"
}

variable AMIS{
    type = map(string)
    default = {                                ## check the current AMIs from https://cloud-images.ubuntu.com/locator/ec2/
        eu-west-1 = "ami-008320af74136c628"
        eu-west-2 = "ami-004c1e61ae5d76090"
        us-west-1 = "ami-0a4df59262c92cf19"
    }
}

variable "PROFILE" {
    type = string
    default = "default"
    description = "i have preinstalled AWSCLI and configured the default profile, so from now on we do not need to keep aws secret and access keys, hopefully"
}