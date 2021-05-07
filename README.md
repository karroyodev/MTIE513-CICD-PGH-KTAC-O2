# MTIE513-CICD-PGH-KTAC-O2
[Maestría en Tecnologías De Información Empresarial](http://bajio.delasalle.edu.mx/oferta/oferta5.php?n=6&p=21) de la [Universidad de La Salle Bajio](http://bajio.delasalle.edu.mx/) 

Proyecto Final - Modelos de Arquitecturas Orientadas a Servicios 

[![Generic badge](https://img.shields.io/badge/version-1.0.0-blue)](https://shields.io/) 

## Introducción

Crear una solución de inteligencia de negocios con Kibana, la cual nos proporciona la visualización de datos y de búsqueda para los datos indexados en Elasticsearch; que es un motor de analítica y análisis distribuido para todos los tipos de datos, además de poder obtener información de varias fuentes (En este caso MySQL). 

Para procesar los datos y enviarlos a Elasticsearch se utiliza Logstash, que es una tubería (pipeline) del lado del servidor que permite ingestar datos de múltiples fuentes de manera simultánea para enriquecerlos y transformarlos antes de que se indexen en Elasticsearch. 

Toda estos componentes de la infraestructura se creará a través del uso de contenedores. 

- [x] MySQL 
- [x] Logstash 
- [x] Elasticsearch 
- [x] Kibana 

Dashboard de Kibana para la visualización y gestión de datos: 
> kibana.karroyodev.net 

**CONTENIDO** 
1. [ Instalación manual ](#manual)
2. [ Instalación automática ](#automatica)

<a name="manual"></a> 
## Instalación manual 

Crear la infraestructura paso a paso en la máquina: [Documentación de referencia](https://github.com/karroyodev/MTIE513-CICD-PGH-KTAC) 

<a name="automatica"></a> 
## Instalación automática 

1. Iniciar sesión a la máquina mediante SSH con el comando:  

    ``` 
    > docker-machine ssh NOMBREMV 
    ``` 

2. Crear el archivo de ejecución: 

    ``` 
    > vi nombre_archivo.sh
    ``` 

    Copiar el texto que se encuentra en el archivo **setup.sh** de este repositorio si es la primera vez que se van a crear los contenedores. En caso de realizar una actualización, copiar el texto del archivo **upgrade.sh**.