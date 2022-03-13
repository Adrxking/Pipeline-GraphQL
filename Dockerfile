FROM node:lts-alpine
ENV NODE_ENV production
WORKDIR /app
ADD . .
RUN npm install --include=dev
RUN chown -R 108:113 /root/.npm
RUN npm run build || :
EXPOSE 4000
USER node
ENTRYPOINT ["/app/deploy.sh"]