FROM jenkins/jenkins:lts

USER root
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables
    
RUN curl -sSL https://get.docker.com/ | sh

RUN usermod -aG docker jenkins

CMD update-alternatives --set iptables /usr/sbin/iptables-legacy && dockerd