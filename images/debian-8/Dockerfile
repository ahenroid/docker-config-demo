FROM debian:8
MAINTAINER Andy Henroid "andy.henroid@puppet.com"

RUN apt-get update && \
    apt-get install -y wget dialog apt-utils && \
    wget https://apt.puppetlabs.com/puppetlabs-release-pc1-jessie.deb && \
    dpkg -i puppetlabs-release-pc1-jessie.deb && \
    rm puppetlabs-release-pc1-jessie.deb && \
    apt-get update && \
    apt-get install --no-install-recommends -y puppet-agent

RUN /opt/puppetlabs/bin/puppet module install puppetlabs-inventory

VOLUME ["/opt/puppetlabs", "/var/log/puppetlabs", "/etc/puppetlabs"]

ENV PATH=/opt/puppetlabs/bin:$PATH

CMD ["puppet", "agent", "-t"]
