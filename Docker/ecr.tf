provider "aws" {
    region = var.AWS_REGION
    profile = var.PROFILE
}

resource "aws_ecr_repository" "docker_repo" {
    name = "docker_repo"
}

output "docker_repo_url" {
    value = aws_ecr_repository.docker_repo.repository_url
}