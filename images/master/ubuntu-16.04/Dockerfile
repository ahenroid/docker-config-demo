FROM ubuntu:16.04
MAINTAINER Andy Henroid "andy.henroid@puppet.com"

RUN apt-get update && \
    apt-get install --no-install-recommends -y wget && \
    wget --no-check-certificate https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb && \
    wget --no-check-certificate https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb && \
    dpkg -i puppetlabs-release-pc1-xenial.deb && \
    dpkg -i dumb-init_1.2.0_amd64.deb && \
    rm puppetlabs-release-pc1-xenial.deb && \
    rm dumb-init_1.2.0_amd64.deb && \
    apt-get update && \
    apt-get install --no-install-recommends -y puppetserver && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY cfg/puppetserver /etc/default/
COPY cfg/logback.xml /etc/puppetlabs/puppetserver/
COPY cfg/request-logging.xml /etc/puppetlabs/puppetserver/
RUN /opt/puppetlabs/bin/puppet config set autosign true --section master

EXPOSE 8140

ENV PATH=/opt/puppetlabs/bin:$PATH

CMD ["dumb-init", "/opt/puppetlabs/bin/puppetserver", "foreground"]
