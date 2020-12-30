FROM ubuntu:20.04

RUN apt update && apt install -y build-essential && apt install -y manpages-dev && apt install -y vim