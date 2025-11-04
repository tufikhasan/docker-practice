## Mounts your local project folder into working directory inside the container.

````bash
docker run -it -p 3000:3000 -v <local_dir>:<working_dir>  <image>
docker run -it -p 3000:3000 -v $(pwd):<working_dir>  <image>
````
