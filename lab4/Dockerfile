FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends bash coreutils grep findutils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /lab
COPY . .

CMD ["./tasks.sh"]
