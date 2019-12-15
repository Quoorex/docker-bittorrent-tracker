FROM node:buster-slim

WORKDIR /var/bittorrent-tracker
COPY . .
RUN npm install

EXPOSE 8000

CMD ["npm", "start"]
