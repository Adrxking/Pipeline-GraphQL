FROM node:lts-alpine
ENV NODE_ENV production
WORKDIR /app
ADD . .
RUN npm install -g npm@8.5.4
RUN npm install --include=dev
RUN chown -R 108:113 /root/.npm
RUN npm --version
RUN node -v
RUN npm run build
EXPOSE 4000
USER node
CMD npm start