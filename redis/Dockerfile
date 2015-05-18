FROM ubuntu:latest
MAINTAINER NodeBB Docker Team <docker-devs@nodebb.org>

# Install base packages
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
		apt-get update && \
		apt-get install redis-server -y

# Create a mountable volume
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Expose ports
EXPOSE 6379

# Define default command.
CMD ["redis-server"]
