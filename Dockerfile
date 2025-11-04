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