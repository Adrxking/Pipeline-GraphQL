FROM node:lts-alpine
ENV NODE_ENV production
WORKDIR /app
ADD . /app/
RUN npm install
RUN chmod 777 -R /app
RUN chmod 777 -R /root/.npm
EXPOSE 4000
CMD npm start