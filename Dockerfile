FROM node:lts-alpine
ENV NODE_ENV production
WORKDIR /app
RUN chmod 777 -R /app
ADD . /app/
RUN npm install
EXPOSE 4000
CMD npm start