FROM node:lts-alpine
ENV NODE_ENV production
WORKDIR /app
RUN chmod 777 -R /app
USER node
ADD . /app/
RUN npm install
EXPOSE 4000
CMD npm start