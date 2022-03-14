FROM centos:7

RUN yum install unzip  wget   git telnet -y   && \

    # below code installs helm 
    curl -O https://get.helm.sh/helm-v3.8.1-linux-amd64.tar.gz && \
	tar xzvf helm-v3.8.1-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/bin/ && \