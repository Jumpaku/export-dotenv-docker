FROM node
ENV NODE_PATH=/usr/local/lib/node_modules

RUN npm install -g @jumpaku/export-dotenv

WORKDIR /dotenv
ENTRYPOINT ["export-dotenv"]
