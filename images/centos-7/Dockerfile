FROM centos:7
MAINTAINER Andy Henroid "andy.henroid@puppet.com"

RUN rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm && \
    yum update -y && \
    yum install -y puppet-agent

RUN /opt/puppetlabs/bin/puppet module install puppetlabs-inventory

VOLUME ["/opt/puppetlabs", "/var/log/puppetlabs", "/etc/puppetlabs"]

ENV PATH=/opt/puppetlabs/bin:$PATH

CMD ["puppet", "agent", "-t"]
