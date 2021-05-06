FROM rust AS build-env

MAINTAINER yanorei32

RUN git clone https://github.com/yanorei32/rand-bot/ && \
	cd rand-bot && \
	cargo build --release

FROM debian
COPY --from=build-env /rand-bot/target/release/rand-bot /root/app

ENTRYPOINT ["/root/app"]
