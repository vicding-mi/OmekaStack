# OmekaStack

Omeka S and Classic docker stack with 3 containers: Omeka, db and phpmyadmin. 

### How to build
#### Build Omeka S
```shell
./build.sh
```
The image name is `vicding81/omekas`

#### Build Omeka Classic
```shell
./buildc.sh
```
The image name is `vicding81/omekac`

### How to start the stack
#### Start Omeka S stack
```shell
docker-compose up -d
```

#### Start Omeka Classic stack
```shell
docker-compose -f docker-compose-c.yml up -d
```

### How to stop the stack
  * run `docker-compose down`

