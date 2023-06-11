FROM pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel

RUN apt-key del 7fa2af80 && \
    apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub

# Add the keys and set permissions
RUN apt-get update && apt-get install -y openssh-server && \
    ssh-keygen && mkdir -p /root/.ssh && touch /root/.ssh/authorized_keys && \
    cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys && \
    chmod 600 /root/.ssh/authorized_keys && \
    mkdir -p /var/run/sshd && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN echo "root:123" | chpasswd

RUN pip3 install tensorboardX && \
    apt-get install -y git

RUN git clone https://github.com/thuyngch/Overcoming-Catastrophic-Forgetting.git

ENTRYPOINT env | grep _ >> /etc/environment && service ssh start & /usr/sbin/sshd -D
