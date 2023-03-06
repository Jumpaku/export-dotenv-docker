FROM node
RUN npm install -g dotenv
ENV NODE_PATH=/usr/local/lib/node_modules

COPY . /work
WORKDIR /work
RUN npm install && npm link

WORKDIR /dotenv
ENTRYPOINT ["node", "export-dotenv"]
