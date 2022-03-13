FROM node:16.14.0
WORKDIR /app
ADD ./graphql /app/
RUN npm install
EXPOSE 4000
CMD npm start