FROM jenkins/jenkins:latest
LABEL mainteiner="pavlin.hristov101@gmail.com"
ENV JAVA_OPTS="-Xmx2048m -Djenkins.install.runSetupWizard=false"
ENV JENKINS_OPTS="--handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"
USER root
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER jenkins
COPY ./files/install-plugins.sh /usr/local/bin/install-plugins.sh
COPY ./files/plugins.txt /tmp/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /tmp/plugins.txt

