FROM node:lts-alpine
ENV NODE_ENV production
WORKDIR /app
ADD . /app/
RUN npm install
RUN chmod 777 -R /app
RUN chown -R 108:113 /root/.npm
RUN npm run build
EXPOSE 4000
CMD npm start