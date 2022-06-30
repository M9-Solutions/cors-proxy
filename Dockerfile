FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install
RUN mv node_modules ../
COPY . .
EXPOSE 3030
RUN chown -R node /usr/src/app
USER node
CMD ["node", "server"]
