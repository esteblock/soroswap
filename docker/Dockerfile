FROM ubuntu:20.04

RUN apt update
RUN apt install -y nano
RUN apt install -y curl
#RUN apt install -y mongodb

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rust_install.sh
RUN sh rust_install.sh -y
RUN echo $PATH
ENV PATH="$PATH:/root/.cargo/bin"
# RUN bash -c "source /root/.cargo/bin"
RUN rustup target add wasm32-unknown-unknown
# # This version uses Preview 5. See https://soroban.stellar.org/docs/releases

RUN cargo install --locked --version 0.3.3 soroban-cli
# WORKDIR /
RUN mkdir /workspace
WORKDIR /workspace
