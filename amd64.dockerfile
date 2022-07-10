FROM amd64/node:alpine

WORKDIR /var/bittorrent-tracker
COPY . .
RUN npm ci

EXPOSE 8000

CMD ["npm", "run", "start"]
