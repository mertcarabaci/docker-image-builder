FROM jupyter/tensorflow-notebook

# Windows Render related
USER root
RUN apt-get update -y && \ 
    apt-get install -y xvfb && \
    apt-get install -y PyOpenGL

# Optional, needed for some environments
RUN apt-get install -y cmake && \
    apt-get install -y zlib1g zlib1g-dev 

RUN apt update && apt install openssh-server sudo -y
RUN useradd -rm -d /home/dev -s /bin/bash -g root -G sudo -u 1000 dev 
RUN usermod -aG sudo dev
RUN service ssh start && echo 'dev:dev' | chpasswd

USER dev

RUN pip install \
        gym \
        pyvirtualdisplay 

# Needed for some environments
RUN conda install swig
RUN pip install box2d-py atari_py pystan

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]