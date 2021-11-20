FROM databricksruntime/standard:9.x

LABEL maintainer="Adam Scislowicz <adam.scislowicz@gmail.com>"

RUN apt-get clean
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    git \
    libfmt-dev \
    libpython3.8-dev \
    libspdlog-dev \
    ninja-build \
    packaging-dev \
    software-properties-common \
    tmux

RUN apt-get purge -y cmake

RUN mkdir /databricks/python3/include; ln -s /usr/include/python3.8 /databricks/python3/include

RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
RUN yes '' | apt-add-repository -y 'deb https://apt.kitware.com/ubuntu/ bionic main'

RUN yes '' | add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gcc-11 g++-11 cmake

RUN update-alternatives --remove-all cpp
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 110 --slave /usr/bin/g++ g++ /usr/bin/g++-11 --slave /usr/bin/gcov gcov /usr/bin/gcov-11 --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-11 --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-11  --slave /usr/bin/cpp cpp /usr/bin/cpp-11

RUN /databricks/python3/bin/pip3 install \
    check-manifest \
    flake8 \
    pybind11 \
    pytest \
    setuptools \
    setuptools-rust \
    tox

RUN wget -qO - https://sh.rustup.rs | sh -s -- --no-modify-path -y

ENV PATH="/root/.cargo/bin:/databricks/python3/bin:${PATH}"
