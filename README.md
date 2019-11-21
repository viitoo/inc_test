# Leeme

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Esta app fue desarrollada para solventar el test de increase, usando el siguiente software:
 - Ruby 2.4 o una version superior
 - Rails 5.1.7
 - Sqlite 3
 - Sidekiq
 - Redis
 - Debian Linux

# Instalar prerequisitos y configurar
Se requiere tener instalado la version de ruby sugerida o una superior , en virtud de que `sidekiq` lo requiere, se sugiere el uso de `RVM` para no afectar los entornos donde se corra la app.

### Instalar redis server
   ```sh 
   sudo apt-get install redis-server
   ```
Para correr la aplicacion es necesario la base de datos SQLite para development o Postgres para produccion, el proceso de instalacion de ambos motores dependera del sistema operativo donde se desee ejecutar la app, por lo tanto no se va explicar el proceso de instalacion de dichos motores.

Que deberias saber:
 El archivo config/secrets.yml contiene las credenciales usadas para la configurar la base de datos en entornos productivos
  ```yml 
  db_host: localhost
  db_name: increase_dev
  db_user: user
  db_password: passsword
   ```

  El archivo config/secrets.yml tiene variables para configurar el endpoint URl  y el token bearer para autenticar con los endpoint de  Increase.
   ```yml 
  endpoint: https://increase-transctions.herokuapp.com/
  bearer: tokenbearer
   ```
   
### Configuracion de la periodicidad del worker
El worker programado esta configurado con el archivo `config/schedule.yml` el cual contiene las instancias de tiempo en las que se quiere  hacer correr al worker
```sh 
retrieve_data_job:
  cron: "*/4 * * * *"
  class: "SyncWorker"
  queue: default
  ```
 Este worker se ejecuta cada  4 min, por lo tanto puede cambiar los intervalos de ejecucion del mismo, si asi lo desea.
### Instalando la base de datos 
- Crear la base de datos: `rails db:create`
- Levantar las migraciones de las tablas: `rails db:migrate`

# Corriendo la aplicacion
La aplicacion fue diseñada con la finalidad de ejecutar un `worker` en el background process, que sirve para sincronizar la informacion con la base de datos, por tanto se necesitara ejecutar dentro de la carpeta del proyecto la aplicacion `sidekiq`, simplemente escribiendo en el prompt 
```sh
$ sidekiq
```
Para ejecutar la aplicacion basta con ejecutar el servidor rails 
```sh
$ rails s 
```
A partir de este momento tendras disponible 2 aplicaciones
- http://localhost:3000, API
- http://localhost:3000/sidekiq ,Backlog para sidekiq donde se puede ver el worker y la cola de procesos usada por el.


### Enpoints de la API


| Endpoint | Funcionalidad | Parametros | 
| ------ | ------ | ------ |
| api/clientes | Listado de toda la informacion de los clientes | no requerido 
| api/cliente/:codigo | Muestra un cliente especifico con toda su informacion | codigo del cliente
| api/transacciones/:codigo | Muestra solo las transacciones por cliente | codigo del cliente
| api/cuenta/:codigo | Muestra lo cobrado/no cobrado  | codigo del cliente


`nota:` no se uso autenticacion, porque no era un requerimiento del test.
