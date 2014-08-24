FROM ubuntu:14.04
MAINTAINER Marius Voila (myself@mariusv.com)

## Install tools
RUN apt-get update && \
apt-get install software-properties-common supervisor -y

# add ppa repository
RUN add-apt-repository -y ppa:saltstack/salt

# update and install salt-master & salt-minion
RUN apt-get update
RUN apt-get install -y salt-master salt-minion

# Supervisor configuration
ADD config/supervisor-salt.conf /etc/supervisor/conf.d/salt.conf

#Docker config
EXPOSE 4505
EXPOSE 4506
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
