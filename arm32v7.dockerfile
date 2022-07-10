FROM alpine AS builder

# Download QEMU, see https://github.com/docker/hub-feedback/issues/1261
ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v4.0.0%2Bbalena2/qemu-4.0.0.balena2-arm.tar.gz
RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1


FROM arm32v7/node:alpine

# Add QEMU
COPY --from=builder qemu-arm-static /usr/bin

WORKDIR /var/bittorrent-tracker
COPY . .
RUN npm ci

EXPOSE 8000

CMD ["npm", "run", "start"]
