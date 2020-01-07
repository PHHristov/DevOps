# Start form the latest Ubuntu
FROM ubuntu:latest 
# Export proxy 
RUN export 'HTTP_PROXY=http:\\phristov:password@proxy.visteon.com:80'     && \
export 'HTTPS_PROXY=http:\\phristov:password@proxy.visteon.com :80'       
# Update and upgrade
RUN apt-get update -y                                                          && \
apt-get upgrade -y                                                         

# Installing sudo to emulate normal OS behavior               
RUN apt-get install  sudo                                         

# Install python
RUN apt-get install python3.6 -y

# Install Ansible + prerequisits
RUN apt-get install software-properties-common -y 
RUN apt-get install --reinstall ca-certificates
RUN apt-get update -y
RUN apt-get install ansible -y  
# Ansible is installed  