FROM centos:centos7
LABEL maintainer="pavlin.hristov101@gmail.com"

#Update system
RUN yum update -y                                                                              && \
yum clean all 

# Install required packages
RUN yum install -y git                                                                         && \
yum install -y wget                                                                            && \
yum install -y java-1.8.0-openjdk                                                              && \
yum install -y sudo                                                                            && \
yum clean all

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

ENV JENKINS_HOME /home/${user}

#Jenkins is run with user "jenkins" and uid = 1000
RUN groupadd -g ${gid} ${group}                                                                && \
useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

RUN chown -R ${user}:${user} /home/${user}

# Add the jenkins user to sudoers
RUN echo "${user}    ALL=(ALL)    ALL" >> etc/sudoers

# Set Name Servers
COPY ./files/resolv.conf /etc/resolv.conf