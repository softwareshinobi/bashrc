FROM ubuntu:22.04

##
## Install basic requirements
##

RUN apt-get update && apt-get install -y bash git curl procps net-tools dnsutils && rm -rf /var/lib/apt/lists/*

##
## Copy installer script and execute
##

COPY . .

RUN chmod +x /tmp/install.sh && /tmp/install.sh && rm /tmp/install.sh

# Force interactive login shell for testing
CMD ["/bin/bash", "-l"]
