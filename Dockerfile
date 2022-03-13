FROM node:lts-alpine
ENV NODE_ENV production
USER node
WORKDIR /app
ADD . /app/
RUN npm install
EXPOSE 4000
CMD npm start