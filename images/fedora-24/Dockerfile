FROM fedora:24
MAINTAINER Andy Henroid "andy.henroid@puppet.com"

RUN rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-fedora-24.noarch.rpm && \
    dnf update -y && \
    dnf install -y puppet-agent findutils

RUN /opt/puppetlabs/bin/puppet module install puppetlabs-inventory

VOLUME ["/opt/puppetlabs", "/var/log/puppetlabs", "/etc/puppetlabs"]

ENV PATH=/opt/puppetlabs/bin:$PATH

CMD ["puppet", "agent", "-t"]
