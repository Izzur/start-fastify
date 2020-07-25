FROM node:12-alpine 

RUN mkdir /home/node/app/ && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY --chown=node:node package*.json ./

USER node

RUN npm install --production && npm cache clean --force --loglevel=error

COPY --chown=node:node app.js .
COPY --chown=node:node plugins ./plugins/
COPY --chown=node:node routes ./routes/

CMD [ "npm", "start"]
