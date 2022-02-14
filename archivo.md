# TechTestAF

## Configuración para la correcta ejecución del proyecto
Para la comunicación con los servicios de la API de Marvel hacen falta dos claves (una privada y otra pública). Para no exponer estas claves en un repositorio público se ha usado un fichero de configuración de Xcode (xcconfig) llamado *Keys.xcconfig* que debe añadirse en la carpeta *Configurations*. 

## Dependencias
Se han usado las siguientes dependencias a través de Cocoapods.
- PromiseKit: Para eliminar las clausuras en la gestión de operaciones asíncronas.
- ObjectMapper: Para la transformación de los resultados en JSON a modelos. Esta dependencia suele ser necesaria y también podría usarse Codable/Decodable para esta función. Normalmente yo suelo utilizarla en mis proyectos por que me parece que su uso es más intuitivo para cualquier desarrollador con menos experiencia que se pueda incorporar la proyecto.
- SnapKit: Para una sintaxis más amigable en la creación de constraints de Autolayout por código.
- SDWebImage: Esta biblioteca es una de las principales junto a KingFisher que se suelen utilizar para la gestión de imágenes. Para este proyecto no aporta demasiadas ventajas pero en proyectos más complejos ofrecen muchas utilidades para la dicha gestión. 
- SwiftLint: También se ha utiizado SwiftLint para el linteado de código instalado con homebrew para no añadirlo como dependencia del proyecto. 

## Arquitectura
Se ha optado por una arquitectura *VIPER* en la que cada módulo se identifica normalmente con una pantalla de la aplicación.
Consta de un modulo *BASE* donde se agrupan las clases base de cada uno de los componentes para centralizar cualquier código compartido entre modulos.
En la carpeta *Providers* se agrupan las clases que van a proveer de contenido a los módulos o que encapsulen componentes/sdks que no queramos exponer directamente a los módulos.
Disponemos además de una carpeta *Configurations* donde se agrupan los ficheros referente a la configuración de entornos y de la app, así como las constantes generales.
En la carpeta *Models* se encuentra los modelos de la aplicación que pueden ser utilizados tanto por los providers como por los módulos. Estos son *struct* sencillos de Swift y usan *ObjectMapper* para el parseo de los resultados en JSON.

## Unit test
Se han realizado pruebas automáticas tanto de las dos vistas *ListHeroesView* y *DetailHeroView* para comprobar la correcta carga e inicialización desde los respectivos *XIB*. Además se han añadido pruebas al presentado y el interactor del módulo *ListHeroes*.

## Assets
Se ha usado un archivo de Assets para definir los temas de colores tanto por defecto como en modo oscuro de la app.

## Literals
Se ha añadido esta carpeta para centralizar cualquier recurso de literales o datos y utilidades asociados a los mismos. En este proyecto se ha añadido una página de la respuesta de los servicios para ser usado en la primeras fases de desarrollo como en las pruebas automáticas.
