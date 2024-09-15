# Docker Symfony Base

_instalación base para proyecto symfony en contenedores docker versión LTS 6.4.*_

## Instalación

clonar repositorio y levantar aplicación

```sh
git  clone  git@github.com:aarocax/docker-symfony-base.git  my-new-folder
cd  my-new-folder
make  build
make  start
make  symfony-setup
```
Ir al navegador y ver la aplicaión corriendo localhost:8082

detener contenedores: make stop
levantar contenedores: make start
acceso al contendor de php: make ssh

DATABASE_URL="postgresql://user:password@dsb0-db:5432/dsb0_database?serverVersion=16&charset=utf8"