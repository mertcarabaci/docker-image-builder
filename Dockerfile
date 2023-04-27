FROM ubuntu:bionic

RUN apt-get -y update
RUN apt-get install openssh-server sudo -y
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 
RUN usermod -aG sudo test
RUN service ssh start
RUN echo 'test:test' | chpasswd

RUN apt-get -y update
RUN apt-get -y install build-essential
RUN apt-get -y install gdb

RUN apt-get -y update
RUN apt-get -y install git

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
