# Use official Node.js image as the base image
FROM node

# Copy application files
COPY package.json package.json
COPY package-lock.json package-lock.json
COPY index.js index.js
# Install application dependencies
RUN npm install

# Define the command to run the application
ENTRYPOINT [ "node", "index.js" ]