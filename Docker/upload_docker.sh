if [$1 -eq ""] 
then
echo "Please enter a tag when uploading"
sleep 5
exit 1
fi

# cadvisor=$(terraform output cadvisor_repo_url)
# grafana_repo_url=$(terraform output grafana_repo_url)
# jenkins_master_repo_url=$(terraform output jenkins_master_repo_url)
# jenkins_slave_repo_url=$(terraform output jenkins_slave_repo_url)
# node_exporter_repo_url=$(terraform output node_exporter_repo_url)
# prometheus_repo_url=$(terraform output prometheus_repo_url)
# jenkins_nginx_repo_url=$(terraform output jenkins_nginx_repo_url)

cadvisor=821503567974.dkr.ecr.eu-west-1.amazonaws.com/cadvisor_repo
grafana_repo_url=821503567974.dkr.ecr.eu-west-1.amazonaws.com/grafana_repo
jenkins_master_repo_url=821503567974.dkr.ecr.eu-west-1.amazonaws.com/jenkins_master_repo
jenkins_slave_repo_url=821503567974.dkr.ecr.eu-west-1.amazonaws.com/jenkins_slave_repo
node_exporter_repo_url=821503567974.dkr.ecr.eu-west-1.amazonaws.com/node_exporter_repo
prometheus_repo_url=821503567974.dkr.ecr.eu-west-1.amazonaws.com/prometheus_repo
jenkins_nginx_repo_url=821503567974.dkr.ecr.eu-west-1.amazonaws.com/jenkins_nginx_repo


docker build -t $cadvisor:$1 ./Rito_project/cadvisor
# docker build -t $grafana_repo_url:$1 ./Rito_project/grafana
# docker build -t $jenkins_master_repo_url:$1 ./Rito_project/jenkins_master
# docker build -t $jenkins_slave_repo_url:$1 ./Rito_project/jenkins_slave
# docker build -t $node_exporter_repo_url:$1 ./Rito_project/node_exporter
# docker build -t $prometheus_repo_url:$1 ./Rito_project/prometheus
# # docker build -t $jenkins_nginx_repo_url:$1 ./Rito_project/jenkins_nginx
# 
docker push $cadvisor
# docker push $grafana_repo_url
# docker push $jenkins_master_repo_url
# docker push $jenkins_slave_repo_url
# docker push $node_exporter_repo_url
# docker push $prometheus_repo_url
# # docker push $jenkins_nginx_repo_url

sleep 50
