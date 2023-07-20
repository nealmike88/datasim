FROM ubuntu:22.04 AS build

RUN apt update -y && \
    apt-get install -y build-essential \
    gcc \
    make \
    cmake \
    cmake-gui \
    cmake-curses-gui

RUN apt-get install -y libssl-dev 

RUN apt-get install -y doxygen graphviz

WORKDIR /datasim

COPY paho.mqtt.c/ ./paho.mqtt.c/
COPY src/ ./src/
COPY cmake ./cmake/
COPY CMakeLists.txt .

WORKDIR /datasim/paho.mqtt.c

RUN cmake -Bbuild -H. -DPAHO_ENABLE_TESTING=OFF -DPAHO_BUILD_STATIC=ON \
    -DPAHO_WITH_SSL=ON -DPAHO_HIGH_PERFORMANCE=ON \
    && cmake --build build/ --target install && ldconfig

WORKDIR /datasim/build

RUN cmake -DCMAKE_BUILD_TYPE=Release .. -DSENSOR_APP=TRUE \
    && cmake --build . --parallel 8 && ldconfig 


ENTRYPOINT [ "/datasim/build/src/sensors/main" ]
CMD ["1"]

