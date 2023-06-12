FROM continuumio/anaconda3:2020.02
WORKDIR /root

RUN pip install tensorflow==1.14 && pip install protobuf==3.19

RUN git clone -b feature/lfd-term-project https://github.com/CemalettinCelalToy/less-forgetful-nns.git

CMD ["/bin/bash"]
