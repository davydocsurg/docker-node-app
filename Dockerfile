# Build stage
FROM node:18-alpine as build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Production stage
# FROM node:18-alpine as production

# WORKDIR /app

# COPY --from=build /app/dist ./dist
# COPY --from=build /app/node_modules ./node_modules
EXPOSE 8080

CMD ["npm", "run", "dev"]



# # Build stage
# FROM node:18-alpine as build

# # Create app directory
# WORKDIR /app

# # copy package.json and package-lock.json
# COPY package*.json ./

# # Install dependencies
# RUN npm install --frozen-lockfile --production --ignore-scripts


# # Production stage
# FROM node:18-alpine as production

# WORKDIR /app

# # set NODE_ENV to production
# ENV NODE_ENV=production

# # expose port 8080
# EXPOSE 8080

# # run app
# CMD [ "node" , "./build/server.js"]
