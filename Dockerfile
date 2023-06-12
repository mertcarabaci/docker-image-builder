FROM continuumio/anaconda3:2020.02
WORKDIR /root

RUN pip install tensorflow==1.14 && pip install protobuf==3.19

RUN git clone -b feature/bug-fixes https://github.com/mertcarabaci/overcoming-catastrophic.git

CMD ["/bin/bash"]
