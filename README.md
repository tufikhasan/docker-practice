## Copy all files and directories into the working directory and .dockerignore some files and directories to exclude them from being copied.

````bash
# Use official Node.js image as the base image
FROM node

WORKDIR /app

# Copy package files
COPY package*.json .
# Install application dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Define the command to run the application
ENTRYPOINT [ "node", "index.js" ]
````
