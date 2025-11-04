# Use official Node.js image as the base image
FROM node:alpine

WORKDIR /app

# Copy package files
COPY package*.json .
# Install application dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the app port
EXPOSE 3000

# Define the command to run the application
ENTRYPOINT [ "node", "index.js" ]