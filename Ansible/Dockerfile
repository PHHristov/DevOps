# Start form the latest Ubuntu
FROM ubuntu:latest 

# Update and upgrade
RUN apt-get update -y                                                          && \
apt-get upgrade -y                                                         

# Installing sudo to emulate normal OS behavior               
RUN apt-get install  sudo                                                      && \
apt-get install net-tools                                                      && \
apt-get install inetutils-ping -y 

# Install python
RUN apt-get install python3.6 -y

# Install Ansible + prerequisits
RUN apt-get install software-properties-common -y                              && \
apt-get install --reinstall ca-certificates                                    && \
apt-get update -y                                                              && \
apt-get install ansible -y                                          
# Ansible is installed  

# Export proxy 
RUN export 'HTTP_PROXY=http:\\phristov:password@proxy.visteon.com:80'          && \
export 'HTTPS_PROXY=http:\\phristov:password@proxy.visteon.com :80'       

#installing tools
RUN apt-get install vim -y

#revisit when having real targets!!!Install apache with apt-get see what the fuck is the problem with ansible not doing it.
RUN apt-get install apache2 -y                                                &&\
apt-get install libapache2-mod-wsgi -y

#Export Ansible files

COPY ./Inventory/control/groups /home
COPY ./Inventory/control/ansible.cfg /home
COPY ./Inventory/control/hostname.yml /home
COPY ./Inventory/control/slaves/webserver.yml /home
COPY ./Inventory/control/slaves/loadbalancer.yml /home
COPY ./Inventory/control/slaves/database.yml /home

RUN cd /home                                                                   &&\
ansible-playbook database.yml                                                  &&\    
ansible-playbook loadbalancer.yml                                              &&\
ansible-playbook webserver.yml                                              


