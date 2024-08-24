# Docker Symfony Base
_instalación base para proyecto symfony en contenedores docker_

versión LTS 6.4.*

## Instalación
clonar repositorio y levantar aplicación
```sh
git clone git@github.com:aarocax/docker-symfony-base.git my-new-folder
cd my-new-folder
make build
make start
make symfony-setup
```

Ir al navegador y ver la aplicaión corriendo localhost:8082

detener contenedores:
make stop

levantar contenedores
make start

acceso al contendor de php
make ssh