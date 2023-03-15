# Build stage
FROM node:18-alpine as build

# Create app directory
WORKDIR /app

# copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --frozen-lockfile --production --ignore-scripts

# build app
RUN npm run build

# Production stage
FROM node:18-alpine as production

WORKDIR /app

# set NODE_ENV to production
ENV NODE_ENV=production

# expose port 8080
EXPOSE 8080

# run app
CMD [ "node" , "./build/server.js"]
