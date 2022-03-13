FROM node:16.14.0
ENV NODE_ENV production
WORKDIR /app
ADD . /app/
RUN npm install --include=dev
RUN chmod 777 -R /app
RUN chown -R 108:113 /root/.npm
RUN npm run build
EXPOSE 4000
CMD npm start