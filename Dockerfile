FROM keymetrics/pm2:latest-alpine

# Bundle APP files
RUN mkdir /root/app
WORKDIR /root/app
COPY . .

# Install app dependencies
ENV NPM_CONFIG_LOGLEVEL warn
ENV PORT 8000
RUN npm install --production

# Expose the listening port of your app
EXPOSE 8000

# Show current folder structure in logs
RUN ls -al -R

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]
