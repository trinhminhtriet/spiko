FROM rust:1.84.0-bookworm AS builder

RUN apt-get update && apt-get install -y clang cmake libssl-dev pkg-config 

ENV LIBCLANG_PATH=/usr/lib/llvm-10/lib

WORKDIR /app
COPY . /app

RUN cargo build --release


FROM debian:bookworm-slim

RUN apt-get update \
    && rm -rf /var/lib/apt/lists/*

COPY --link --from=builder /app/target/release/spiko /usr/local/bin/spiko

ENTRYPOINT ["spiko"]
