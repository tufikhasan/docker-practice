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