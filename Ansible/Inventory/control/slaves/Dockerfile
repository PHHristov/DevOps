# Start form the latest Ubuntu
FROM ubuntu:latest 

# Update and upgrade
RUN apt-get update -y                                                          && \
apt-get upgrade -y                                                         

# Installing sudo to emulate normal OS behavior               
RUN apt-get install  sudo                                                      && \
apt-get install net-tools                                                      && \
apt-get install inetutils-ping -y                                              && \           
apt-get install ssh -y                                                         && \ 
apt-get install vim -y
# Export proxy 
RUN export 'HTTP_PROXY=http:\\phristov:password@proxy.visteon.com:80'     && \
export 'HTTPS_PROXY=http:\\phristov:password@proxy.visteon.com :80'       

#start ssh
RUN mkdir /var/run/sshd                                                        && \
chmod 0755 /var/run/sshd                                                       && \
/usr/sbin/sshd                                                                 && \
useradd papimaster

