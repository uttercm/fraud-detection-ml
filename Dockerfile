FROM ubuntu:22.10

ENV BUILD_PATH /fraud-detection-ml
WORKDIR ${BUILD_PATH}

RUN apt-get update && apt-get install -y python3 python3-pip

ENV ARCHFLAGS -Wno-error=unused-command-line-argument-hard-error-in-future
COPY requirements.txt ${BUILD_PATH}/requirements.txt

RUN pip3 install --upgrade pip
RUN pip3 install -r ${BUILD_PATH}/requirements.txt --use-feature=no-binary-enable-wheel-cache

COPY . ${BUILD_PATH}/

