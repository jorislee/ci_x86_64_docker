FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list

# Install any needed packages specified in requirements.txt
RUN apt-get update && \
    apt-get install -y \
    git \
    zip \
    unzip \
    gcc \
    make \
    wget \
    gcc \
    vim \
    python \
    python3 \
    python3-pip \
    python3-pexpect \
    linux-headers-4.15.0-112-generic && \
    apt-get clean

RUN wget https://github.com/Kitware/CMake/releases/download/v3.27.9/cmake-3.27.9.tar.gz \
    && tar -zxvf cmake-3.27.9.tar.gz \
    && cd cmake-3.27.9 && ./bootstrap \
    && make && make install

WORKDIR /home

CMD [ "/bin/bash" ]
