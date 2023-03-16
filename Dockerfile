# Build stage
FROM node:18-alpine as build

WORKDIR /app

# copy package.json and package-lock.json
COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

CMD ["npm", "run", "dev"]

