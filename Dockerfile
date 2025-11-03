# Dockerfile to set up a Node.js environment using Ubuntu base image
FROM ubuntu

# If you don’t press “Y”, the installation stops and waits for user input. But inside Docker, there’s no human to press Y — so it would hang forever.
# "-y" flag: Assume “yes” for all questions during package installation

# Update package list
RUN apt-get update -y
# Install curl
RUN apt-get install -y curl
# Add NodeSource setup script (choose version)
RUN curl -sL https://deb.nodesource.com/setup_22.x | bash -
# Update package list again
RUN apt-get update -y
# Install Node.js and npm
RUN apt-get install -y nodejs

# Copy application files
COPY package.json package.json
COPY package-lock.json package-lock.json
COPY index.js index.js
# Install application dependencies
RUN npm install

# Define the command to run the application
ENTRYPOINT [ "node", "index.js" ]