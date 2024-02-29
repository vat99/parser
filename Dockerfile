FROM ubuntu:20.04

# Set container as a root user:
USER root

# Copy the gamechanger-data parsing requirements file
COPY requirements.txt .

ENV TZ=US
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y
RUN apt-get install -y automake
RUN apt-get install -y pkg-config
RUN apt-get install -y libsdl-pango-dev
RUN apt-get install -y libicu-dev
RUN apt-get install -y libcairo2-dev
RUN apt-get install bc
RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN apt-get install -y tesseract-ocr

RUN apt-get install -y python3-pip
RUN pip3 install -r requirements.txt --no-deps

COPY src/ .

ENTRYPOINT ["bash"]