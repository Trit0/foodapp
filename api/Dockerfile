FROM node:16-alpine

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN cp -a /tmp/node_modules /usr/src/app

# Bundle app source
ADD test-backend/api /usr/src/app
RUN npm run build

EXPOSE 8080

CMD [ "npm", "run", "start:prod" ]
