FROM ubuntu:latest
USER capsule
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install python3 -y
RUN apt-get install neovim -y
