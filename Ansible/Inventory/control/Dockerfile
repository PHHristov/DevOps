# Start form the latest Ubuntu
FROM ubuntu:latest 

# Update and upgrade
RUN apt-get update -y                                                          && \
apt-get upgrade -y                                                         



# Installing tools to emulate normal OS behavior               
RUN apt-get install  sudo                                                      && \
apt-get install net-tools                                                      && \
apt-get install inetutils-ping -y                                              && \
apt-get install ssh -y                                                            && \
apt-get install vim -y

# Install python
RUN apt-get install python3.6 -y

# Install Ansible + prerequisits
RUN apt-get install software-properties-common -y                              && \
apt-get install --reinstall ca-certificates                                    && \
apt-get update -y                                                              && \
apt-get install ansible -y                                          
# Ansible is installed  

# Export proxy 
RUN export 'HTTP_PROXY=http:\\phristov:password@proxy.visteon.com:80'     && \
export 'HTTPS_PROXY=http:\\phristov:password@proxy.visteon.com :80'       

#Export Ansible files

COPY ./groups /home
COPY ./ansible.cfg /home
COPY ./hostname.yml /home
COPY ./slaves/loadbalancer.yml /home
COPY ./slaves/database.yml /home
COPY ./slaves/webserver.yml /home
COPY ./control.yml /home
COPY ./restart_service.yml /home

#RUN playbooks
RUN cd /home                                              && \
ansible-playbook database.yml                                              && \
ansible-playbook loadbalancer.yml                                          

#FIND AN ANSIBLE WAY TO INSTAL APACHE2CTL !!!!!
RUN apt-get install apache2 -y

RUN cd /home                                              && \
ansible-playbook webserver.yml                                             

