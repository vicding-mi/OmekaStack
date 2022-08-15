# OmekaStack

Omeka S docker stack with 3 containers

The `docker file` builds the main omeka s image. 

The `docker-compose` file starts 3 services: mysql, phpmyadmin and omeka. 

Simply `docker compose up -d`. 

### How to build
`docker build -t omekas .`

### How to start the stack
  * Switch the image name of your omeka service in your yml file with the tag name of your omeka
  * run `docker-compose up -d`

### How to stop the stack
  * run `docker-compose down`

