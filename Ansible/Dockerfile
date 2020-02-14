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
RUN export 'HTTP_PROXY=http:\\phristov:password@proxy.visteon.com:80'     && \
export 'HTTPS_PROXY=http:\\phristov:password@proxy.visteon.com :80'       

#Export Ansible files
<<<<<<< HEAD
COPY ./Inventory/groups /home
COPY ./Inventory/ansible.cfg /home
COPY ./Inventory/hostname.yml /home
=======
COPY ./Inventory/groups /home                                             
COPY ./Inventory/ansible.cfg /home
>>>>>>> 66d9da21ab098e3e3364c07bfca8ea6905ff8f13
