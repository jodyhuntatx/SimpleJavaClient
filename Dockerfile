FROM ubuntu:16.04

ENV JRE_VERSION 9.0.4

RUN apt-get update && \
    apt-get -y install curl vim wget
RUN mv /etc/vim/vimrc /etc/vim/vimrc.bak

WORKDIR /

# Install Java runtime env - will need to download tarfile to the local directory from:
#     https://www.oracle.com/technetwork/java/javase/downloads/index.html 
#
COPY jre-${JRE_VERSION}_linux-x64_bin.tar.gz / 
RUN  cd / && \
     tar xvf jre-${JRE_VERSION}_linux-x64_bin.tar.gz && \
     rm jre-${JRE_VERSION}_linux-x64_bin.tar.gz && \
     ln -s /jre-${JRE_VERSION}/bin/keytool /usr/local/bin/keytool && \
     ln -s /jre-${JRE_VERSION}/bin/java /usr/local/bin/java

COPY conjur-dev.pem SimpleDemo.jar runTest.sh javademo.config /
