FROM node:16.14.0
WORKDIR /app
ADD . /app/
RUN npm install
RUN npm build
EXPOSE 4000
CMD npm start