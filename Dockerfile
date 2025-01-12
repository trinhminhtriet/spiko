FROM rust:1.84.0-bookworm AS builder

WORKDIR /app
COPY . /app

RUN cargo build --release


FROM debian:bookworm-slim

RUN apt-get update \
    && rm -rf /var/lib/apt/lists/*

COPY --link --from=builder /app/target/release/spiko /usr/local/bin/spiko

ENTRYPOINT ["spiko"]
