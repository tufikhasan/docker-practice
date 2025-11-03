#### Build an image from a Dockerfile.

```bash
  docker build -t <your-set-image-name> <Dockerfile Path>
```
#### Example
```bash
  docker build -t my-first-image .
```
#### Create a container from an image.
```bash
  docker run -it my-first-image
```
#### Create a container from an image with port mapping
```bash
  docker run -it -p 3000:3000 my-first-image
```
#### Create a container from an image with environment variable and port mapping
```bash
  docker run -it -e PORT=4000 -p 4000:4000 my-first-image
```
#### Also pass multiple environment variables and port mapping
```bash
  docker run -it -e PORT=4000 -e NODE_ENV=production -p 4000:4000 -p 3306:3306 my-first-image
```