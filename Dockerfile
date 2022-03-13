FROM node:lts-alpine
ENV NODE_ENV production
WORKDIR /app
ADD . /app/
RUN npm install --include=dev
RUN chown -R 108:113 /root/.npm
RUN npm run build || :
EXPOSE 4000
USER node
CMD npm start