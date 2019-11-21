###Analisis
#####Worker
Este desarrollo fue realizado considerando las restricciones que tenia el API de increase,
por lo cual se considero el uso de una base de datos para modelar cada uno de los registros que contenia el archivo `file.txt`, asi como tambien la informacion brindada por el endpoint de `/clients`.

Por lo cual se tomo la decision de crear un modelo por cada tipo de registro(4) y otro modelo para clientes.
- Cabecera
- Transaccion
- Descuento
- Footer
- Cliente

Con este planteamiento solo necesitaba buscar la forma en que se mantuviera un proceso que se ejecutara en forma de `worker`, para lo cual decidi usar `sidekiq` y que termine configurando para que usara un cron que lo invocara y capturara toda la informacion para ser insertada en al base de datos en sus respectivos modelos.

#####API
El Para el desarrollo de la API, se uso `active model serializer` que brinda la facilidad de trabajar las salidas json de forma mas sencilla e intuitiva, el desarrollo de la API se hizo de manerca convencional sin el uso de versionamiento de API desde los controllers ni las rutas. 

Se crearon 4 endpoints descritos en el `REAME`

##### Mejoras a introducir para proximas versiones
- Integrar un contenedor Docker.
- Versionamiento del API.
- Refactorizar el Worker.
- La estructura de la entrega de datos por parte del API, ya que no se especifico un formato especifico, la informacion expuesta por esta version puede ser ambigua, ya que fue diseñada en base a la perspectiva del desarrollador.