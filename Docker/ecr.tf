provider "aws" {
    region = var.AWS_REGION
    profile = var.PROFILE
}

// resource "aws_ecr_repository" "cadvisor_repo" {
//     name = "cadvisor_repo"
// }
// 
// resource "aws_ecr_repository" "grafana_repo" {
//     name = "grafana_repo"
// }
// 
// resource "aws_ecr_repository" "jenkins_master_repo" {
//     name = "jenkins_master_repo"
// }
// 
// resource "aws_ecr_repository" "jenkins_slave_repo" {
//     name = "jenkins_slave_repo"
// }
// 
// resource "aws_ecr_repository" "node_exporter_repo" {
//     name = "node_exporter_repo"
// }
// 
// resource "aws_ecr_repository" "prometheus_repo" {
//     name = "prometheus_repo"
// }
// 
// resource "aws_ecr_repository" "jenkins_nginx_repo" {
//     name = "jenkins_nginx_repo"
// }
// 
resource "aws_ecr_repository" "backend" {
    name = "backend"
}

resource "aws_ecr_repository" "frontend" {
    name = "frontend"
}
// 
// output "cadvisor_repo_url" {
//     value = aws_ecr_repository.cadvisor_repo.repository_url 
// }
// 
// output "grafana_repo_url" {
//     value = aws_ecr_repository.grafana_repo.repository_url 
// }
// 
// output "jenkins_master_repo_url" {
//     value = aws_ecr_repository.jenkins_master_repo.repository_url 
// }
// 
// output "jenkins_slave_repo_url" {
//     value = aws_ecr_repository.jenkins_slave_repo.repository_url 
// }
// 
// output "node_exporter_repo_url" {
//     value = aws_ecr_repository.node_exporter_repo.repository_url 
// }
// 
// output "jenkins_nginx_repo_url" {
//     value = aws_ecr_repository.jenkins_nginx_repo.repository_url 
// }
// 
// output "prometheus_repo_url" {
//     value = aws_ecr_repository.prometheus_repo.repository_url 
// }

output "backend" {
    value = aws_ecr_repository.backend.repository_url 
}

output "frontend" {
    value = aws_ecr_repository.frontend.repository_url 
}

