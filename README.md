## How Docker Layer Caching Works

Docker builds images in layers, and each line in your Dockerfile creates a new layer.
Docker caches these layers so it can reuse them later — saving time during rebuilds.
### Caching Rules
 - If a line hasn’t changed, Docker reuses the cached layer.
 - If a line changes, Docker rebuilds that layer and every layer after it.
 - The more unchanged lines on top, the faster your build!

#### Example: Build From Cache (No Changes)
```bash
Step 1/6 : FROM node
 ---> Using cache
Step 2/6 : COPY package.json package.json
 ---> Using cache
Step 3/6 : COPY package-lock.json package-lock.json
 ---> Using cache
Step 4/6 : RUN npm install
 ---> Using cache
Step 5/6 : COPY index.js index.js
 ---> e91b4a3fddc1
Step 6/6 : ENTRYPOINT ["node", "index.js"]
 ---> Running in 8b7e4b1...
```
Here, Docker reused cached layers for all steps except the last one (COPY `index.js`), because only the application file changed.

#### Example: When a Line Changes
Suppose you changed `index.js` — Docker will reuse all previous layers, but rebuild from that line onward:
```bash
Step 1/6 : FROM node
 ---> Using cache
Step 2/6 : COPY package.json package.json
 ---> Using cache
Step 3/6 : COPY package-lock.json package-lock.json
 ---> Using cache
Step 4/6 : RUN npm install
 ---> Using cache
Step 5/6 : COPY index.js index.js  # This line changed
 ---> e91b4a3fddc1
Step 6/6 : ENTRYPOINT ["node", "index.js"]
 ---> Running in 8b7e4b1...
```
Only the changed line (COPY `index.js`) and those after it are rebuilt.
Everything before stays cached — speeding up the build dramatically.

#### Best Practice: Structure for Caching
To maximize caching benefits, structure your Dockerfile to separate frequently changing files from stable dependencies.
For example, copy and install dependencies first, then copy your application code last. This way, changes to your app code don’t invalidate the cached layers for dependencies.
```bash
# Use official Node.js image as the base image
FROM node

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
