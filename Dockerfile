# Use official Node.js image as the base image
FROM node

# Copy application dependency files first
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
# Install application dependencies
RUN cd /app && npm install

# Copy remaining files
COPY index.js /app/index.js

# Define the command to run the application
ENTRYPOINT [ "node", "/app/index.js" ]