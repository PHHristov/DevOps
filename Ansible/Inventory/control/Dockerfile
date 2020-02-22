# Start form the latest Ubuntu
FROM ubuntu:latest 

# Update and upgrade
RUN apt-get update -y                                                          && \
apt-get upgrade -y                                                         

# Installing sudo to emulate normal OS behavior               
RUN apt-get install  sudo                                                      && \
apt-get install net-tools                                                      && \
apt-get install inetutils-ping -y                                              && \
apt-get install ssh -y                                              && \
apt-get install curl -y


# Install Ansible + prerequisits
RUN apt-get install software-properties-common -y                              && \
apt-get install --reinstall ca-certificates                                    && \
apt-get update -y                                                              && \
apt-get install ansible -y                                          
# Ansible is installed  

# Install python
RUN apt-get install python3.6 -y                                               &&\
apt install python3-pip -y

# Export proxy 
RUN export 'HTTP_PROXY=http:\\phristov:password@proxy.visteon.com:80'          && \
export 'HTTPS_PROXY=http:\\phristov:password@proxy.visteon.com :80'       

#installing tools
RUN apt-get install vim -y

#revisit when having real targets!!!Install apache with apt-get see what the fuck is the problem with ansible not doing it.
RUN apt-get install apache2 -y                                                &&\
apt-get install libapache2-mod-wsgi -y

#Export Ansible files

COPY ./groups /home
COPY ./ansible.cfg /home
COPY ./hostname.yml /home
COPY ./slaves/webserver.yml /home
COPY ./slaves/loadbalancer.yml /home
COPY ./slaves/database.yml /home

# Copy demo appllication
COPY ./slaves/demo/ /home/demo

RUN cd /home                                                                   &&\
#ansible-playbook webserver.yml                                              
#ansible-playbook database.yml                                                  &&\    
#ansible-playbook loadbalancer.yml                                              &&\

EXPOSE 80
EXPOSE 22

#start ssh
RUN mkdir /var/run/sshd                                                        && \
chmod 0755 /var/run/sshd                                                       && \
/usr/sbin/sshd                                                                 && \
useradd papimaster

