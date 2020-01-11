FROM alpine AS builder

# Download QEMU, see https://github.com/docker/hub-feedback/issues/1261
ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v3.0.0%2Bresin/qemu-3.0.0+resin-arm.tar.gz
RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1



FROM arm32v6/node

# Add QEMU
COPY --from=builder qemu-arm-static /usr/bin

WORKDIR /var/bittorrent-tracker
COPY . .
RUN npm install

EXPOSE 8000

CMD ["npm", "start"]
