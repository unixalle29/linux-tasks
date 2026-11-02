FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash coreutils findutils grep acl passwd linux-libc-dev \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -g users ivanov \
    && useradd -m -g users petrov \
    && useradd -m -g users student

WORKDIR /lab
COPY --chown=student:users . .
RUN chown student:users /lab
USER student

CMD ["./tasks.sh"]
