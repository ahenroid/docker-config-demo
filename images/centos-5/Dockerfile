FROM centos:5
MAINTAINER Andy Henroid "andy.henroid@puppet.com"

RUN yum update -y && \
    yum install -y wget && \
    wget https://yum.puppetlabs.com/puppetlabs-release-pc1-el-5.noarch.rpm && \
    rpm -Uvh puppetlabs-release-pc1-el-5.noarch.rpm && \
    rm puppetlabs-release-pc1-el-5.noarch.rpm && \
    yum install -y puppet-agent

RUN /opt/puppetlabs/bin/puppet module install puppetlabs-inventory

VOLUME ["/opt/puppetlabs", "/var/log/puppetlabs", "/etc/puppetlabs"]

ENV PATH=/opt/puppetlabs/bin:$PATH

CMD ["puppet", "agent", "-t"]
