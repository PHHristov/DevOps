FROM jenkins/jenkins:latest
LABEL mainteiner="pavlin.hristov101@gmail.com"
ENV JAVA_OPTS="-Xmx2048m -Djenkins.install.runSetupWizard=false"
ENV JENKINS_OPTS="--handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"
ENV CASC_JENKINS_CONFIG="/var/jenkins_home/casc_configs"
USER root

RUN mkdir /var/log/jenkins                                               && \
mkdir -p /var/jenkins_home/workspace/seed                                && \
mkdir /var/cache/jenkins                                                 && \
mkdir /var/jenkins_home/casc_configs                                     && \
chown -R jenkins:jenkins /var/log/jenkins                                && \
chown -R jenkins:jenkins /var/cache/jenkins                              && \
chown -R jenkins:jenkins /var/jenkins_home/casc_configs


USER jenkins
COPY ./files/install-plugins.sh /usr/local/bin/install-plugins.sh
COPY ./files/plugins.txt /tmp/plugins.txt
COPY ./files/jenkins.sh /usr/local/bin/jenkins.sh
COPY ./files/jenkins-support /usr/local/bin/jenkins-support
COPY ./files/init.groovy /usr/local/bin/init.groovy
COPY ./files/Jenkins_CaaC.yml /var/jenkins_home/casc_configs/Jenkins_CaaC.yml
COPY ./files/Jenkins_structure.dsl /var/tmp/Jenkins_structure.dsl
RUN /usr/local/bin/install-plugins.sh < /tmp/plugins.txt
