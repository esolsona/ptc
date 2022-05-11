FROM jenkins/jenkins:2.332.2-jdk11
USER root
RUN apt-get update && apt-get install -qq -y lsb-release curl sudo kmod iptables maven nodejs npm git 
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

RUN cd /tmp/ \
&& curl -sSL -O https://download.docker.com/linux/static/stable/x86_64/docker-17.06.2-ce.tgz \
&& tar -xvzf  docker-17.06.2-ce.tgz \
&& mkdir -p /usr/local/bin \
&& cp ./docker/* /usr/local/bin \
&& chmod +x /usr/local/bin/dock* \
&& rm -rf /tmp/*

RUN echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN useradd -m docker && sudo usermod -a -G sudo jenkins && sudo usermod -a -G sudo docker
COPY wrapper.sh /usr/local/sbin/wrapper.sh
USER jenkins
ENTRYPOINT /usr/local/sbin/wrapper.sh
