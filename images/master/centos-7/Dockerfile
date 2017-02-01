FROM centos:7
MAINTAINER Andy Henroid "andy.henroid@puppet.com"

RUN rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm && \
    yum update -y && \
    yum install -y which && \
    yum install -y puppetserver

COPY cfg/puppetserver /etc/default/
COPY cfg/logback.xml /etc/puppetlabs/puppetserver/
COPY cfg/request-logging.xml /etc/puppetlabs/puppetserver/
RUN /opt/puppetlabs/bin/puppet config set autosign true --section master

EXPOSE 8140

ADD bin/dumb-init /usr/bin/dumb-init

ENV PATH=/opt/puppetlabs/bin:$PATH

CMD ["dumb-init", "puppetserver", "foreground"]
