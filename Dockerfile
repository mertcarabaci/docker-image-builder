FROM continuumio/anaconda3:2020.02

# Add the keys and set permissions
RUN apt-get update && pip install tensorflow=1.14 && pip install protobuf==3.19

RUN echo "root:123" | chpasswd

RUN apt-get install -y git

RUN git clone -b feature/bug-fixes https://github.com/mertcarabaci/overcoming-catastrophic.git

CMD ["/bin/bash"]
