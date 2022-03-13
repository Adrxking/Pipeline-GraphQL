FROM node:14-buster
WORKDIR /app
ADD . /app/
RUN npm install
RUN npm run build
EXPOSE 4000
CMD npm start