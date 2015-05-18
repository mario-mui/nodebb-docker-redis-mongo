# Pull base image.
FROM ubuntu:14.04

# Install Node.js
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y imagemagick curl ca-certificates &&\
    curl -sL https://deb.nodesource.com/setup_0.12 | bash - &&\
    apt-get install --no-install-recommends -y nodejs && \
		apt-get install -y gcc make build-essential && \
		npm set registry http://registry.npmjs.org && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s -f /usr/bin/nodejs /usr/local/bin/node
#RUN cd /opt && git clone https://github.com/NodeBB/NodeBB.git nodebb
#RUN cd /opt/nodebb && npm install

ADD ./ /opt/nodebb
VOLUME /opt/nodebb

# Define working directory.
WORKDIR /opt/nodebb

EXPOSE 4567

# Define default command.
CMD ["node", "app.js"]
