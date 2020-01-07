FROM ubuntu:latest 
RUN export 'HTTP_PROXY=http:\\phristov:MALk0k043@proxy.visteon.com:80'     && \
export 'HTTPS_PROXY=http:\\phristov:MALk0k043@proxy.visteon.com :80'       && \
apt-get update -y                                                          && \
apt-get upgrade -y                                                         && \
echo "===> Installing sudo to emulate normal OS behavior..."               && \
    apt-get install  sudo                                         
RUN apt-get install python3.6 -y
RUN apt-get install software-properties-common -y 
RUN apt-get install --reinstall ca-certificates
RUN apt-get update -y
RUN apt-get install ansible -y    