## Dockerfile globally set working directory to /app


````bash
# Use official Node.js image as the base image
FROM node

WORKDIR /app

# Copy application dependency files first
COPY package.json package.json
COPY package-lock.json package-lock.json
# Install application dependencies
RUN npm install

# Copy remaining files
COPY index.js index.js

# Define the command to run the application
ENTRYPOINT [ "node", "index.js" ]
````
