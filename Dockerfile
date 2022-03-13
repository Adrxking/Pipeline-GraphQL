FROM node:lts-alpine
WORKDIR /app
ADD . /app/
RUN npm install
EXPOSE 4000
CMD npm start