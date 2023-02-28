FROM node
RUN npm install -g dotenv
ENV NODE_PATH=/usr/local/lib/node_modules

COPY export.js /
WORKDIR /dotenv
ENTRYPOINT ["node", "/export.js"]
