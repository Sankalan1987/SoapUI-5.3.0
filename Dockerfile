FROM openjdk:8-jre-alpine
FROM centos:7
MAINTAINER Sankalan <banerjee.sankalan2@gmail.com>

# SOAP UI Version to download
ENV SOAPUI_VERSION 5.2.1

# Download and unarchive SoapUI
RUN mkdir -p /opt &&\
    curl  http://smartbearsoftware.com/distrib/soapui/5.2.1/SoapUI-5.2.1-linux-bin.tar.gz \
    | gunzip -c - | tar -xf - -C /opt && \
    ln -s /opt/SoapUI

COPY docker-entrypoint.sh /opt/SoapUI/docker-entrypoint.sh
RUN chmod +x /opt/SoapUI/docker-entrypoint.sh

# Set environment
ENV PATH ${PATH}:/opt/SoapUI-5.2.1/bin

WORKDIR /opt/SoapUI

ENTRYPOINT ["docker-entrypoint.sh"]
