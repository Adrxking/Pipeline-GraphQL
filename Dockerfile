FROM node:lts-alpine
ENV NODE_ENV production
RUN chmod 777 -R /app
USER node
WORKDIR /app
ADD . /app/
RUN npm install
EXPOSE 4000
CMD npm start