FROM rust:1.84.0-bookworm AS builder

# Install dependencies including LLVM 14 first
RUN apt-get update && apt-get install -y \
    clang \
    cmake \
    libssl-dev \
    pkg-config \
    llvm-14 \
    libclang-14-dev

# Set LIBCLANG_PATH after LLVM 14 is installed
ENV LIBCLANG_PATH=/usr/lib/llvm-14/lib

WORKDIR /app
COPY . /app

RUN cargo build --release


FROM debian:bookworm-slim

RUN apt-get update \
    && rm -rf /var/lib/apt/lists/*

COPY --link --from=builder /app/target/release/spiko /usr/local/bin/spiko

ENTRYPOINT ["spiko"]
