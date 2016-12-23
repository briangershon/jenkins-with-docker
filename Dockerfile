FROM jenkins:2.19.4

USER root

# Install Docker from official repo
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y apt-utils sudo apt-transport-https ca-certificates gnupg2 && \
    apt-key adv \
       --keyserver hkp://ha.pool.sks-keyservers.net:80 \
       --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    echo deb https://apt.dockerproject.org/repo debian-jessie main > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-engine && \
    usermod -aG docker jenkins && \
    rm -rf /var/lib/apt/lists/*

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins

# Install plugins
RUN /usr/local/bin/install-plugins.sh \
    ant \
    ansible \
    gradle \
    xunit \
    workflow-aggregator \
    docker-workflow \
    build-timeout \
    credentials-binding \
    ssh-agent \
    ssh-slaves \
    timestamper \
    ws-cleanup \
    email-ext \
    github-organization-folder \
    purge-job-history \
    simple-theme-plugin
