FROM node:lts-alpine
ENV NODE_ENV production
WORKDIR /app
ADD . /app/
RUN npm install
RUN chmod 777 -R /app
USER node
EXPOSE 4000
CMD npm start