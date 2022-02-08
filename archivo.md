# TechTestAF

## Modelos
### Hero
Aquí podríamos haber hecho una clase DAO que parseara tal cual la respuesta del servicio.
Y podríamos haber hecho que el provider no tuviera dos responsabilidades: el
hacer la petición al servicio y el parseo de la respuesta. Como en la mayoría de
proyectos en los que trabajo he optado por simplicar el boilerplate y delegar en
el modelo el parseo con la ayuda de ObjectMapper. A decir verdad la
responsabilidad del parseo recae tanto en el provider como en el modelo, pero es
un compromiso que se suele adquirir.
