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
# Use ENTRYPOINT when the container will always run that one command (production).
# ENTRYPOINT [ "node", "index.js" ]

# Default command
CMD ["node", "index.js"]