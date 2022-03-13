FROM node:16.14.0
WORKDIR /app
ADD . /app/
RUN npm install
RUN chown -R 777 /app
RUN npm run build
EXPOSE 4000
CMD npm start
