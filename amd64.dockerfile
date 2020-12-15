FROM amd64/node:alpine

WORKDIR /var/bittorrent-tracker
COPY . .
RUN npm i -g pnpm
RUN pnpm install

EXPOSE 8000

CMD ["pnpm", "start"]
